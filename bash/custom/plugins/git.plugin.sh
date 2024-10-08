#!/usr/bin/env bash

# Slightly modified version of oh-my-bash's git plugin from:
# https://github.com/ohmybash/oh-my-bash/blob/master/plugins/git/git.plugin.sh

#
# Functions
#

function git_prompt_info() {
    local ref
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref=$(git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$(git_remote_status)$GIT_PROMPT_SUFFIX"
}

# Checks if working tree is dirty
function parse_git_dirty() {
    local STATUS=''
    local FLAGS
    FLAGS=('--porcelain')
    # post git 1.7.2
    FLAGS+=( '--ignore-submodules=dirty' )
    if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]; then
        FLAGS+=( '--untracked-files=no' )
    fi
    STATUS=$(git status "${FLAGS[@]}" 2> /dev/null | tail -n1)
    if [[ -n $STATUS ]]; then
        echo "$GIT_PROMPT_DIRTY"
    else
        echo "$GIT_PROMPT_CLEAN"
    fi
}

# Gets the difference between the local and remote branches
function git_remote_status() {
    local ahead behind git_remote_status local_branch upstream_branch
    # Check we are on a branch, if not then take no further action
    if [[ -z "$(git_current_branch)" ]]; then
        return
    fi
    local_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
    if [[ -n "$local_branch" ]] && [[ "$local_branch" != "HEAD" ]]; then
        local upstream_branch=$(git rev-parse --abbrev-ref "@{upstream}" 2> /dev/null)
        # If we get back what we put in, then that means the upstream branch was not found.  (This was observed on git 1.7.10.4 on Ubuntu)
        [[ "$upstream_branch" = "@{upstream}" ]] && upstream_branch=''
        # If the branch is not tracking a specific remote branch, then assume we are tracking origin/[this_branch_name]
        [[ -z "$upstream_branch" ]] && upstream_branch="origin/$local_branch"
        if [[ -n "$upstream_branch" ]]; then
            ahead=$(git rev-list --left-right ${local_branch}...${upstream_branch} 2> /dev/null | grep -c '^<')
            behind=$(git rev-list --left-right ${local_branch}...${upstream_branch} 2> /dev/null | grep -c '^>')
            
            if [[ $ahead -eq 0 ]] && [[ $behind -eq 0 ]]; then
                git_remote_status="$GIT_PROMPT_EQUAL_REMOTE"
            else
                # one of ahead or beind is >0
                if [[ $ahead -gt 0 ]]; then
                    git_remote_status="${GIT_PROMPT_AHEAD_REMOTE}${ahead}"
                fi
                if [[ $behind -gt 0 ]]; then
                    git_remote_status="${git_remote_status}${GIT_PROMPT_BEHIND_REMOTE}${behind}"
                fi
            fi
            echo "$git_remote_status"
        fi
    fi
}

# Outputs the name of the current branch
# Usage example: git pull origin $(git_current_branch)
# Using '--quiet' with 'symbolic-ref' will not cause a fatal error (128) if
# it's not a symbolic ref, but in a Git repo.
function git_current_branch() {
    local ref
    ref=$(git symbolic-ref --quiet HEAD 2> /dev/null)
    local ret=$?
    if [[ $ret != 0 ]]; then
        [[ $ret == 128 ]] && return  # no git repo.
        ref=$(git rev-parse --short HEAD 2> /dev/null) || return
    fi
    echo ${ref#refs/heads/}
}


# The name of the current branch
# Back-compatibility wrapper for when this function was defined here in
# the plugin, before being pulled in to core lib/git.zsh as git_current_branch()
# to fix the core -> git plugin dependency.
function current_branch() {
    git_current_branch
}
# The list of remotes
function current_repository() {
    if ! git rev-parse --is-inside-work-tree &> /dev/null; then
        return
    fi
    echo $(git remote -v | cut -d':' -f 2)
}
# Pretty log messages
function _git_log_prettily(){
    if ! [ -z $1 ]; then
        git log --pretty=$1
    fi
}
# Warn if the current branch is a WIP
function work_in_progress() {
    if $(git log -n 1 2>/dev/null | grep -q -c "\-\-wip\-\-"); then
        echo "WIP!!"
    fi
}

#
# Aliases
# (sorted alphabetically)
#

alias g='git'

alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gau='git add --update'

alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbda='git branch --no-color --merged | command grep -vE "^(\*|\s*(master|develop|dev)\s*$)" | command xargs -n 1 git branch -d'
alias gbl='git blame -b -w'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'
alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'

alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gcn!='git commit -v --no-edit --amend'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gcan!='git commit -v -a --no-edit --amend'
alias gcans!='git commit -v -a -s --no-edit --amend'
alias gcam='git commit -a -m'
alias gcsm='git commit -s -m'
alias gcb='git checkout -b'
alias gcf='git config --list'
alias gcl='git clone --recursive'
alias gclean='git clean -fd'
alias gpristine='git reset --hard && git clean -dfx'
alias gcm='git checkout master'
alias gcd='git checkout develop'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gcount='git shortlog -sn'
#compdef _git gcount complete -F _git gcount
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gcps='git cherry-pick -s'
alias gcs='git commit -S'

alias gd='git diff'
alias gdca='git diff --cached'
alias gdct='git describe --tags `git rev-list --tags --max-count=1`'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gdw='git diff --word-diff'

gdv() {
    git diff -w "$@" | view -
}
#compdef _git gdv=git-diff

alias gf='git fetch'
alias gfa='git fetch --all --prune'
alias gfo='git fetch origin'

gfg() {
    git ls-files | grep "$@"
}
#compdef _grep gfg

alias gg='git gui citool'
alias gga='git gui citool --amend'

ggf() {
    [[ "$#" != 1 ]] && local b="$(git_current_branch)"
    git push --force origin "${b:=$1}"
}
#compdef _git ggf=git-checkout

ggl() {
    if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
        git pull origin "${*}"
    else
        [[ "$#" == 0 ]] && local b="$(git_current_branch)"
        git pull origin "${b:=$1}"
    fi
}
#compdef _git ggl=git-checkout

ggp() {
    if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
        git push origin "${*}"
    else
        [[ "$#" == 0 ]] && local b="$(git_current_branch)"
        git push origin "${b:=$1}"
    fi
}
#compdef _git ggp=git-checkout

ggpnp() {
    if [[ "$#" == 0 ]]; then
        ggl && ggp
    else
        ggl "${*}" && ggp "${*}"
    fi
}
#compdef _git ggpnp=git-checkout

ggu() {
    [[ "$#" != 1 ]] && local b="$(git_current_branch)"
    git pull --rebase origin "${b:=$1}"
}
#compdef _git ggu=git-checkout

alias ggpur='ggu'
#compdef _git ggpur=git-checkout

alias ggpull='git pull origin $(git_current_branch)'
#compdef _git ggpull=git-checkout

alias ggpush='git push origin $(git_current_branch)'
#compdef _git ggpush=git-checkout

alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
alias gpsup='git push --set-upstream origin $(git_current_branch)'

alias ghh='git help'

alias gignore='git update-index --assume-unchanged'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
alias git-svn-dcommit-push='git svn dcommit && git push github master:svntrunk'
#compdef _git git-svn-dcommit-push=git

alias gk='\gitk --all --branches'
#compdef _git gk='gitk'
alias gke='\gitk --all $(git log -g --pretty=%h)'
#compdef _git gke='gitk'

alias gl='git pull'
alias glg='git log --stat'
alias glgp='git log --stat -p'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glo='git log --oneline --decorate'
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias glola="git log --graph --pretty='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all"
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glp="_git_log_prettily"
#compdef _git glp=git-log

alias gm='git merge'
alias gmom='git merge origin/master'
alias gmt='git mergetool --no-prompt'
alias gmtvim='git mergetool --no-prompt --tool=vimdiff'
alias gmum='git merge upstream/master'

alias gp='git push'
alias gpd='git push --dry-run'
alias gpoat='git push origin --all && git push origin --tags'
#compdef _git gpoat=git-push
alias gpu='git push upstream'
alias gpv='git push -v'

alias gr='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase -i'
alias grbm='git rebase master'
alias grbs='git rebase --skip'
alias grh='git reset HEAD'
alias grhh='git reset HEAD --hard'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grset='git remote set-url'
alias grt='cd $(git rev-parse --show-toplevel || echo ".")'
alias gru='git reset --'
alias grup='git remote update'
alias grv='git remote -v'

alias gsb='git status -sb'
alias gsd='git svn dcommit'
alias gsi='git submodule init'
alias gsps='git show --pretty=short --show-signature'
alias gsr='git svn rebase'
alias gss='git status -s'
alias gst='git status'
alias gsta='git stash save'
alias gstaa='git stash apply'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --text'
alias gsu='git submodule update'

alias gts='git tag -s'
alias gtv='git tag | sort -V'

alias gunignore='git update-index --no-assume-unchanged'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias gup='git pull --rebase'
alias gupv='git pull --rebase -v'
alias glum='git pull upstream master'

alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "--wip-- [skip ci]"'
