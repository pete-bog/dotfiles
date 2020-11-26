green="$(tput setaf 2)"
blue="$(tput setaf 4)"
magenta="$(tput setaf 5)"
cyan="$(tput setaf 6)"
reset_color="$(tput sgr0)"

export GIT_PROMPT_PREFIX="("
export GIT_PROMPT_SUFFIX=")"
export GIT_PROMPT_DIRTY=" ✗"
export GIT_PROMPT_CLEAN=" ✔"

export VIRTUALENV_PROMPT_PREFIX="["
export VIRTUALENV_PROMPT_SUFFIX="] "

function prompt_command() {
    PS1="${cyan}$(virtualenv_prompt_info)${green}\u@\h ${blue}\w ${magenta}$(git_prompt_info)${reset_color}\n» "
}

PROMPT_COMMAND="prompt_command"
