#!/bin/bash
# Refresh the plugins vendored from oh-my-zsh (see custom/plugins/README.md)
set -e
cd "$(dirname "$(realpath "$0")")/custom/plugins"

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
git clone -q --depth 1 https://github.com/ohmyzsh/ohmyzsh.git "$tmp"

cp "$tmp/lib/git.zsh" git-lib/git-lib.plugin.zsh
cp "$tmp/plugins/git/git.plugin.zsh" git/
cp "$tmp/plugins/virtualenv/virtualenv.plugin.zsh" virtualenv/
cp "$tmp/LICENSE.txt" LICENSE.txt

echo "Updated to oh-my-zsh $(git -C "$tmp" rev-parse --short HEAD)"
