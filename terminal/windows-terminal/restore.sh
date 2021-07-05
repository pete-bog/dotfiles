#!/bin/bash
set -e

if [[ -z "$LOCALAPPDATA" ]]; then
    echo "LOCALAPPDATA is not set! Set 'WSLENV=APPDATA/up:LOCALAPPDATA/up' in windows environment vars."
    exit 1
fi

THISDIR="${0%/*}"

echo "Restoring settings.json..."
find $LOCALAPPDATA/Packages/ -maxdepth 1 -name "Microsoft.WindowsTerminal_*" -type d -exec cp -v $THISDIR/settings.json {}/LocalState/ \;

echo "Done."
