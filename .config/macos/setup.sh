#!/usr/bin/env bash

cd `dirname $0`

/usr/bin/env bash system_preferences.sh

# install homebrew
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# brew bundle
/usr/bin/env bash brew_budle.sh
/usr/local/bin/brew bundle --file Brewfile_mas

# fish
/usr/local/bin/fish ../fish.fish
