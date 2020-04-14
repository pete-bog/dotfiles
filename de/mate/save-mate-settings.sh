#!/bin/bash

out_dir="settings"
mkdir -p $out_dir
to_save="/org/mate/panel/ /org/mate/desktop/interface/ /org/mate/screensaver/ /org/mate/power-manager/ /org/mate/marco/ /org/mate/caja/ /org/mate/terminal/"

for setting in $to_save; do
    dump_to="$out_dir/$(echo $setting | sed 's|/|_|g')"
    dconf dump $setting > $dump_to
    echo "Saved $setting to $dump_to"
done
unset out_dir
unset to_save
unset dump_to
