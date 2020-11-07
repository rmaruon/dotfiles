#!/usr/bin/env fish

# fish
set fish_greeting
fish_update_completions

# fisher
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

fisher install decors/fish-ghq
fisher install jethrokuan/fzf
fisher install jethrokuan/z
fisher install oh-my-fish/theme-bobthefish
