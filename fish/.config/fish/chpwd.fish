# ref: https://github.com/paulirish/dotfiles/blob/master/fish/chpwd.fish
function chpwd --on-variable PWD --description 'handler of changing $PWD'
  if not status --is-command-substitution ; and status --is-interactive
    ls
  end
end
