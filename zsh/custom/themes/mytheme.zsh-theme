PROMPT='%{$fg[cyan]%}$(virtualenv_prompt_info)%{$fg[green]%}%n@%m %{$fg[blue]%}%~ $(git_prompt_info)$(git_remote_status)%{$reset_color%}
» '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE=" %{$fg[yellow]%}↑"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE=" %{$fg[cyan]%}↓"
ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE=" %{$fg[yellow]%}↑%{$fg[cyan]%}↓"

ZSH_THEME_VIRTUALENV_PREFIX="["
ZSH_THEME_VIRTUALENV_SUFFIX="] "
