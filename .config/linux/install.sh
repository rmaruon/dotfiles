#!/usr/bin/env bash

sudo apt update
sudo apt upgrade

sudo apt install build-essential
sudo apt install curl
sudo apt install ffmpeg
sudo apt install fzf
sudo apt install git
sudo apt install jq
sudo apt install nkf
sudo apt install stow
sudo apt install tig
sudo apt install tree
sudo apt install zsh

# fish
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt install fish

# go
sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt update
sudo apt install golang-go

go get github.com/motemen/ghq
