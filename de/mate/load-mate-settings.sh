#!/bin/bash
for file in $(ls settings); do
    setting=$(echo $file | sed 's|_|/|g')
    echo "Loading $file to $setting"
    dconf load $setting < settings/$file
done
