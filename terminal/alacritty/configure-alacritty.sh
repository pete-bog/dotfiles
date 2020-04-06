#!/bin/bash
CONFIG=~/.config/alacritty/alacritty.yml
mkdir -p $(dirname $CONFIG)
rm -f $CONFIG
ln -v -s $PWD/$(basename $CONFIG) $CONFIG
