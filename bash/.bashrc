#!/bin/bash

#### Define location of config files ####
BASH_CUSTOM_DIR="$(dirname $(realpath $HOME/.bashrc))/custom"
BASH_PLUGIN_DIR="$BASH_CUSTOM_DIR/plugins"
BASH_THEME_DIR="$BASH_CUSTOM_DIR/themes"
DEBUG=0

function debug_msg() {
    if [[ $DEBUG -gt 0 ]]; then
        printf "$1\n"
    fi
}

#### Environment variables ####
# Path modifications
export PATH="$HOME/development/environment/*scripts/bin:$PATH"
export PATH="$HOME/development/environment/tools/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/go/bin:$PATH"

# vim is default editor
export EDITOR="vim"
# color by default
export CLICOLOR=1

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if [[ ! -z "$(which pyenv)" ]]; then
    eval "$(pyenv init --path)"
fi

# pipenv
export PIPENV_VENV_IN_PROJECT=1
# poetry
export POETRY_VIRTUALENVS_IN_PROJECT=true

BASH_THEME="mytheme"




#### Load plugins #####
for plugin in $BASH_PLUGIN_DIR/*.plugin.sh; do
    debug_msg "Loading plugin: $plugin"
    source $plugin
done

#### Load theme ####
if [[ -f $BASH_THEME_DIR/$BASH_THEME.theme.sh ]]; then
    debug_msg "Loading theme: $BASH_THEME.theme.sh"
    source $BASH_THEME_DIR/$BASH_THEME.theme.sh
else
    debug_msg "Using default theme"
    # Default PS1 to basic config if nothing provided
    export PS1="\u@\h \w \n»"
fi

#### Load user-defined scripts ####
for f in $BASH_CUSTOM_DIR/*.sh; do
    debug_msg "Loading custom script: $f"
    source $f
done

### Load in local bash config
if [[ -f $HOME/.bash_private ]]; then
    source $HOME/.bash_private
fi
