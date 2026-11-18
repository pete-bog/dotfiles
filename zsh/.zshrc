#### Define location of config files ####
_zshrc="$HOME/.zshrc"
ZSH_CUSTOM_DIR="${_zshrc:A:h}/custom"
ZSH_PLUGIN_DIR="$ZSH_CUSTOM_DIR/plugins"
ZSH_THEME_DIR="$ZSH_CUSTOM_DIR/themes"
ZSH_THEME="mytheme"
ZSH_ARGZERO="${ZSH_ARGZERO:-$0}"  # expected by the vendored oh-my-zsh plugins
DEBUG=0

debug_msg() {
    if [[ $DEBUG -gt 0 ]]; then
        printf "$1\n"
    fi
}

#### Environment variables ####
# Path modifications
for d in $HOME/development/*scripts/bin(N); do
    export PATH="$d:$PATH"
done
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/:$PATH"
export PATH="$HOME/development/tools/bin:$PATH"
export PATH="$HOME/development/environment/tools/bin:$PATH"
export PATH="$HOME/development/environment/scripts/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# go
export PATH="$HOME/.local/go/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# vim is default editor
export EDITOR="vim"
# color by default
export CLICOLOR=1
export LANG=en_US.UTF-8

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv >/dev/null; then
    eval "$(pyenv init -)"
fi

# pipenv
export PIPENV_VENV_IN_PROJECT=1
# poetry
export POETRY_VIRTUALENVS_IN_PROJECT=true

# disables prompt mangling in virtual_env/bin/activate
export VIRTUAL_ENV_DISABLE_PROMPT=1

#### Shell options ####
# History
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000
setopt append_history share_history hist_ignore_dups hist_ignore_space

# Bash-like editing and word boundaries
bindkey -e
WORDCHARS=''
bindkey '^[[H' beginning-of-line   # home
bindkey '^[[F' end-of-line         # end
bindkey '^[[3~' delete-char        # delete

# Comments allowed in interactive shell, prompts expand variables
setopt interactive_comments prompt_subst

# Prompt functions from the git-lib plugin run synchronously
zstyle ':omz:alpha:lib:git' async-prompt no

#### Load plugins ####
# Hand-picked, mostly vendored from oh-my-zsh (see custom/plugins/README.md).
# Order matters: git-lib provides the functions the git plugin and theme use.
plugins=(colors git-lib git virtualenv windowtitle)
if [[ "$(uname -s)" == "Darwin" ]]; then
    plugins+=(macos)
fi

for plugin in $plugins; do
    debug_msg "Loading plugin: $plugin"
    fpath=($ZSH_PLUGIN_DIR/$plugin $fpath)
    source $ZSH_PLUGIN_DIR/$plugin/$plugin.plugin.zsh
done

#### Completion ####
# After plugins, so their completions are on fpath
autoload -Uz compinit && compinit -d "$HOME/.zcompdump"
zstyle ':completion:*' menu select

#### Load theme ####
if [[ -f $ZSH_THEME_DIR/$ZSH_THEME.zsh-theme ]]; then
    debug_msg "Loading theme: $ZSH_THEME.zsh-theme"
    source $ZSH_THEME_DIR/$ZSH_THEME.zsh-theme
else
    debug_msg "Using default theme"
    PROMPT=$'%n@%m %~\n» '
fi

#### Load user-defined scripts ####
for f in $ZSH_CUSTOM_DIR/*.zsh; do
    debug_msg "Loading custom script: $f"
    source $f
done

#### Local config ####
if [[ -f $HOME/.zsh_private ]]; then
    source $HOME/.zsh_private
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
