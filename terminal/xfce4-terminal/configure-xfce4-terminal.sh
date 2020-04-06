#!/bin/bash
CONFIG=~/.config/xfce4/terminal/terminalrc
mkdir -p $(dirname $CONFIG)
rm -f $CONFIG
ln -v -s $PWD/terminalrc $CONFIG
