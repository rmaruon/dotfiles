abbr c "code"
abbr C "pbcopy"
abbr cl "clear"
abbr e "explorer.exe"
abbr f 'open -a Finder ./'
abbr g "git"
abbr o "open"
abbr t "tig"
abbr where "which -a"

function mkcd
    mkdir $argv
    cd $argv
end
