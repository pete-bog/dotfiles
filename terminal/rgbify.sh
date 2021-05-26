#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Translate all hex color values in a supplied file to rgb."
    echo "Usage: $0 FILEPATH"
    exit 1
fi

tmp=$(mktemp)
cp $1 $tmp

hexvals=$(grep -oP "#[0-9A-Za-z]{6}" $tmp | sort | uniq)
for hexval in $hexvals; do
    rgbval=$(python3 -c 'import sys; x=sys.argv[1].lstrip("#"); print("rgb({}, {}, {})".format(*[int(x[i:i+2], 16) for i in range(0, 6, 2)]))' $hexval)
    sed -i "s/$hexval/$rgbval/g" $tmp
done

cat $tmp
rm $tmp
