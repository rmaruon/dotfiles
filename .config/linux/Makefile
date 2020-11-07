FILEPATH := .config/linux/Makefile
DIRNAMES := fish git tmux vim zsh

.DEFAULT_GOAL := help

setup:  ## setup
	@/usr/bin/env bash .config/linux/setup.sh

stow: ## Create symbolic links
	@/usr/bin/stow $(DIRNAMES) --target ~/

clean: ## Delete symbolic links
	@/usr/bin/stow --delete $(DIRNAMES) --target ~/

help:
	@/usr/bin/grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(FILEPATH) | /usr/bin/awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
