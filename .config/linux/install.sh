#!/usr/bin/env bash

sudo apt update
sudo apt upgrade -y

sudo apt install -y build-essential
sudo apt install -y curl
sudo apt install -y ffmpeg
sudo apt install -y fzf
sudo apt install -y git
sudo apt install -y jq
sudo apt install -y nkf
sudo apt install -y stow
sudo apt install -y tig
sudo apt install -y tree
sudo apt install -y zsh

# fish
sudo apt-add-repository -y ppa:fish-shell/release-3
sudo apt update
sudo apt install -y fish

# go
sudo add-apt-repository -y ppa:longsleep/golang-backports
sudo apt update
sudo apt install -y golang-go

go get github.com/x-motemen/ghq

# node
curl -L https://git.io/n-install | bash

npm install -g commitizen
npm install -g cz-conventional-changelog-ja
