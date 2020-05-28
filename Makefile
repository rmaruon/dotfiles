ROOT := $(dir $(abspath  $(lastword $(MAKEFILE_LIST))))
DIRNAMES := $(subst /, , $(wildcard */))

.DEFAULT_GOAL := help


init: ## Install Homebrew
	@/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew: ## $ brew bundle
	@/usr/local/bin/brew bundle

mas: ## $ brew bundle --file Brewfile_mas
	@/usr/local/bin/brew bundle --file Brewfile_mas

restore:  ## $ mackup restore
	@/usr/local/bin/mackup restore

stow: ## Create symbolic links
	@/usr/local/bin/stow $(DIRNAMES) --target ~/ --ignore .DS_Store

clean: ## Delete symbolic links
	@/usr/local/bin/stow --delete $(DIRNAMES) --target ~/ --ignore .DS_Store

setup: init brew mas restore stow ## $ make init brew mas restore stow

help:
	@/usr/bin/grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | /usr/bin/awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
