if [[ "$PLATFORM" == "Darwin" ]]; then
    # Place all macOS specifics below here
    export LSCOLORS=ExFxBxDxCxegedabagacad

    # Disable the 'macOS now uses zsh' warning
    export BASH_SILENCE_DEPRECATION_WARNING=1

    alias code="/Applications/*Code.app/Contents/Resources/app/bin/code"

    alias vmlist="find $HOME/Virtual\ Machines.localized -name *.vmx -type f -exec realpath {} \;"
    alias vmrun="/Applications/VMware\ Fusion.app/Contents/Library/vmrun"
fi
