#!/bin/bash
echo "Loading from gnome-dconf-settings"
dconf load / < gnome-dconf-settings
echo Done
