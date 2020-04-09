#!/bin/bash

out_dir="settings"
mkdir -p $out_dir
to_save="/org/gnome/desktop/wm/ /org/gnome/desktop/interface/ /org/gnome/desktop/input-sources/ /org/gnome/nautilus/preferences/ /org/gnome/shell/"

for setting in $to_save; do
    dump_to="$out_dir/$(echo $setting | sed 's|/|_|g')"
    dconf dump $setting > $dump_to
    echo "Saved $setting to $dump_to"
done
unset out_dir
unset to_save
unset dump_to
