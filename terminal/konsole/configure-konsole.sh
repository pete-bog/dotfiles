#!/bin/bash
KDIR=~/.local/share/konsole

PROFILE=OneDarkDark.profile
COLORS=onedarkdark.colorscheme
KONSOLERC=konsolerc

mkdir -p $KDIR
rm -f $KDIR/$PROFILE ~/.config/$KONSOLERC $KDIR/$COLORS
ln -v -s $PWD/$COLORS $KDIR/
ln -v -s $PWD/$PROFILE $KDIR/
ln -v -s $PWD/$KONSOLERC ~/.config/

