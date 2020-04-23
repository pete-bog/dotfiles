#!/bin/bash

dump_to=mate-dconf-settings
to_save="/org/mate/panel/ /org/mate/desktop/interface/ /org/mate/screensaver/ /org/mate/power-manager/ /org/mate/marco/ /org/mate/caja/ /org/mate/terminal/"

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
