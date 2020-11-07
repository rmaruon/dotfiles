#!/usr/bin/env bash

cd `dirname $0`

/usr/local/bin/brew update
/usr/local/bin/brew bundle --file Brewfile
