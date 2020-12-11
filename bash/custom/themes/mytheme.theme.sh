GIT_PROMPT_PREFIX="${fg_magenta}"
GIT_PROMPT_SUFFIX=""
GIT_PROMPT_DIRTY="${fg_yellow}*"
GIT_PROMPT_CLEAN="" 
GIT_PROMPT_AHEAD_REMOTE=" ${fg_yellow}↑"
GIT_PROMPT_BEHIND_REMOTE=" ${fg_cyan}↓"

VIRTUALENV_PROMPT_PREFIX="["
VIRTUALENV_PROMPT_SUFFIX="] "

function prompt_command() {
    PS1="${fg_cyan}$(virtualenv_prompt_info)${fg_green}\u@\h ${fg_blue}\w $(git_prompt_info)${reset_color}\n» "
}

PROMPT_COMMAND="prompt_command"
