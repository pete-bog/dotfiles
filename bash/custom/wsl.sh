if [[ "$WSL" == "true" ]]; then
    if [[ -z "$APPDATA" ]]; then
        echo "APPDATA is not set! Set 'WSLENV=APPDATA/up:LOCALAPPDATA/up' in windows environment vars."
    fi
fi