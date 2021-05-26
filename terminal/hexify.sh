#!/bin/bash

if [[ -z "$1" ]]; then
    echo "Translate all rgb color values in a supplied file to hex."
    echo "Usage: $0 FILEPATH"
    exit 1
fi

tmp=$(mktemp)
cp $1 $tmp

IFS=$'\n'
rgbtuple=$(grep -oP "rgb\(([0-9]{1,3},? ?){3}\)" $tmp | sort | uniq)
for rgbval in $rgbtuple; do
    hexval=$(python3 -c 'import sys; s=sys.argv[1].replace("rgb", "").lstrip("(").rstrip(")"); print("#{:02X}{:02X}{:02X}".format(*[int(x) for x in s.split(",")]))' $rgbval)
    sed -i "s/$rgbval/$hexval/g" $tmp
done
unset IFS

cat $tmp
rm $tmp
