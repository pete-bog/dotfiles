#!/bin/bash

declare -a fonts=("CascadiaCode.ttf" "SourceCodePro*.ttf" "Meslo LG S*.ttf")

if test "$(uname)" = "Darwin" ; then
    # MacOS
    font_dir="$HOME/Library/Fonts"
else
    # Linux
    font_dir="$HOME/.local/share/fonts"
    mkdir -p $font_dir
fi

# Install each font pattern
for font in "${fonts[@]}"; do
    find . -name "$font" -exec cp -v {} $font_dir \;
done

# Reset font cache on Linux
if which fc-cache >/dev/null 2>&1 ; then
    echo "Resetting font cache, this may take a moment..."
    fc-cache -f "$font_dir"
fi

echo "Fonts installed to $font_dir"
