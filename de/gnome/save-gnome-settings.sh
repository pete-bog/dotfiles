#!/bin/bash

dump_to=gnome-dconf-settings
to_save="/org/gnome/desktop/wm/keybindings/ /org/gnome/desktop/wm/preferences/ /org/gnome/desktop/interface/ /org/gnome/desktop/input-sources/ /org/gnome/nautilus/preferences/ /org/gnome/shell/"

echo "" > $dump_to

for setting in $to_save; do
    echo "Saving $setting to $dump_to"
    # save the setting, replacing the leading and trailing '/' with square brackets
    echo "$(echo $setting | sed 's|^/|\[|g' | sed 's|/$|\]|g')" >> $dump_to
    dconf dump $setting | tail -n +2 >> $dump_to
    echo "" >> $dump_to
done
unset to_save
unset dump_to
