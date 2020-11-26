if [[ "$PLATFORM" == "Darwin" ]]; then
    # Place all macOS specifics below here
    export LSCOLORS=ExFxBxDxCxegedabagacad
    
    # Disable the 'macOS now uses zsh' warning
    export BASH_SILENCE_DEPRECATION_WARNING=1
fi
