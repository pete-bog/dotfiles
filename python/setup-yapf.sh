#!/bin/bash
mkdir -p ~/.config/yapf
rm -f ~/.config/yapf/style
ln -v -s $PWD/style ~/.config/yapf/style
