function virtualenv_prompt_info(){
    if [[ -z "$VIRTUAL_ENV" ]]; then
        return
    else
        VENV_PARENT_DIR=$(basename $(dirname $VIRTUAL_ENV))
        echo "${VIRTUALENV_PROMPT_PREFIX:=[}${VENV_PARENT_DIR}${VIRTUALENV_PROMPT_SUFFIX:=]}"
    fi
}

function activate_virtual_env() {
    # find a virtual env in this current directory
    VENV_DIR="$(find . -maxdepth 3 -type f -name "activate" | head -n 1)"
    if [[ -z "$VENV_DIR" ]]; then
        printf "No virtualenv found in current directory\n"
    else
        source $VENV_DIR
    fi
}

# disables prompt mangling in virtual_env/bin/activate
export VIRTUAL_ENV_DISABLE_PROMPT=1

# aliases
alias activate='activate_virtual_env'
