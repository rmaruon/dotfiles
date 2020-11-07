alias c="code"
alias C="pbcopy"
alias cl="clear"
alias e="explorer.exe"
alias f='open -a Finder ./'
alias g="git"
alias i="invoke"
alias o="open"
alias pe="pipenv"
alias t="tig"
alias where="which -a"

function mkcd
    mkdir $argv
    cd $argv
end
