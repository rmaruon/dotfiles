FILEPATH := macos/Makefile
DIRNAMES := fish git mackup tmux vim zsh

.DEFAULT_GOAL := help


restore: ## $ mackup restore
	@/usr/local/bin/mackup restore

stow: ## Create symbolic links
	@/usr/local/bin/stow $(DIRNAMES) --target ~/ --ignore .DS_Store

clean: ## Delete symbolic links
	@/usr/local/bin/stow --delete $(DIRNAMES) --target ~/ --ignore .DS_Store

help:
	@/usr/bin/grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(FILEPATH) | /usr/bin/awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
