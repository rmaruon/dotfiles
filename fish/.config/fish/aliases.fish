# `fish` holds the abbr, so erase abbr
for s in (abbr --list); abbr --erase $s; end

abbr c "code"
abbr C "pbcopy"
abbr cl "clear"
abbr e "explorer.exe"
abbr f 'open -a Finder ./'
abbr o "open"
abbr t "tig"
abbr where "which -a"

# git
abbr g       "git"
abbr gb      "git branch --all"
abbr gbd     "git branch -d"
abbr gcam    "git commit --amend --no-edit"
abbr gcancel "git reset --soft HEAD~"
abbr gcob    "git checkout -b"
abbr gf      "git fetch"
abbr gpl     "git pull"
abbr gps     "git push"
abbr grm     "git rm --cached"
abbr gs      "git status --short"
abbr gsm     "git switch master"
abbr gst     "git stash"

function mkcd
    mkdir $argv
    cd $argv
end
