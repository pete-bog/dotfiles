wsl_open() {
    if [[ -d $1 ]]; then
        explorer.exe $1
    else
        xdg-open $1
    fi
}

if [[ "$WSL" == "true" ]]; then
    if [[ -z "$APPDATA" ]]; then
        echo "APPDATA is not set! Set 'WSLENV=APPDATA/up:LOCALAPPDATA/up' in windows environment vars."
    fi

    alias open="wsl_open"

fi
