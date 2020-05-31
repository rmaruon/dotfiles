ROOT := $(dir $(abspath  $(lastword $(MAKEFILE_LIST))))
DIRNAMES := $(subst /, , $(wildcard */))

.DEFAULT_GOAL := help


init: ## init
	# system preference
	@/usr/bin/env bash macos.sh
	# homebrew
	@xcode-select --install
	@/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	@brew doctor

brew: ## $ brew bundle
	@/usr/local/bin/brew bundle

mas: ## $ brew bundle --file Brewfile_mas
	@/usr/local/bin/brew bundle --file Brewfile_mas

setup: init brew mas ## $ make init brew mas


restore: ## $ mackup restore
	@/usr/local/bin/mackup restore

stow: ## Create symbolic links
	@/usr/local/bin/stow $(DIRNAMES) --target ~/ --ignore .DS_Store

clean: ## Delete symbolic links
	@/usr/local/bin/stow --delete $(DIRNAMES) --target ~/ --ignore .DS_Store


help:
	@/usr/bin/grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | /usr/bin/awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
