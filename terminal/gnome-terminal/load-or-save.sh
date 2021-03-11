#!/bin/bash
set -e

SAVE_FILE=settings.dconf

if [[ -z "$1" ]]; then
    echo "Usage: $0 [load/save]"
    echo "Please supply a load/save argument"
    exit 1
fi

if [[ "$1" == "save" ]]; then
    dconf dump /org/gnome/terminal/ > $SAVE_FILE
    echo "Done. Saved to $SAVE_FILE."
elif [[ "$1" == "load" ]]; then
    if [[ -f "$SAVE_FILE" ]]; then
        dconf load /org/gnome/terminal/ < $SAVE_FILE
        echo "Done. Loaded settings from $SAVE_FILE."
    else
        echo "Can't find ./$SAVE_FILE to load from, exiting."
        exit 1
    fi
else
    echo "Unrecognised argument '$1', expected either 'load' or 'save'"
    exit 1
fi
