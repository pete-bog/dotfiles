#!/bin/bash
set -e

if [[ -z "$LOCALAPPDATA" ]]; then
    echo "LOCALAPPDATA is not set! Set 'WSLENV=APPDATA/up:LOCALAPPDATA/up' in windows environment vars."
    exit 1
fi

THISDIR="$(dirname $0)"

echo "Backing up settings.json..."
find $LOCALAPPDATA/Packages/ -maxdepth 1 -name "Microsoft.WindowsTerminal_*" -type d -exec cp -v {}/LocalState/settings.json $THISDIR/ \;

echo "Done."
