#!/usr/bin/env bash

cd `dirname $0`

# fish
set fish_greeting
fish_update_completions

# fisher
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

fisher add decors/fish-ghq
fisher add jethrokuan/fzf
fisher add jethrokuan/z
fisher add oh-my-fish/theme-bobthefish
