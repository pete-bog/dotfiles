PROMPT_VENV='%{$fg[cyan]%}$(virtualenv_prompt_info)'
PROMPT_USERNAME='%{$fg[green]%}%n@%m'
PROMPT_CWD='%{$fg[blue]%}%~'
PROMPT_GIT='%{$fg[magenta]%}$(git_prompt_info)'
PROMPT_RESET='%{$reset_color%}'
PROMPT="
$PROMPT_VENV $PROMPT_USERNAME $PROMPT_CWD $PROMPT_GIT $PROMPT_RESET
» "

PROMPT='%{$fg[cyan]%}$(virtualenv_prompt_info)%{$fg[green]%}%n@%m %{$fg[blue]%}%~ %{$fg[magenta]%}$(git_prompt_info) %{$reset_color%}
» '

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_DIRTY=" ✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"

ZSH_THEME_VIRTUALENV_PREFIX="["
ZSH_THEME_VIRTUALENV_SUFFIX="]"