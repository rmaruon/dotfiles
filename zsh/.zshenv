# PATH
typeset -U PATH  # 重複を許さない

PATH="/bin:\
$HOME/local/bin:\
$HOME/.gem/ruby/*/bin:\
$HOME/.rbenv/bin:\
/opt/local/bin:\
/usr/local/bin:\
/usr/texbin:\
/usr/sbin/:\
$HOME/bin/:\
/usr/bin"
export PATH

# node_modules
export NODE_PATH=/usr/local/lib/node_modules/

# go path
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

# python default encoding
export PYTHONIOENCODING=utf-8

# pyenv
if which pyenv > /dev/null; then
  eval "$(pyenv init -)";
fi

# rbenv
if which rbenv > /dev/null; then
  eval "$(rbenv init -)";
fi

# plenv
if which plenv > /dev/null; then
  eval "$(plenv init -)";
fi

# less grep
export LESS='-R'
export LESSOPEN='|lessfilter %s'
export GREP_OPTIONS='--binary-files=without-match'
