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
abbr gcz     "git cz"
abbr gf      "git fetch"
abbr gpl     "git pull"
abbr gps     "git push"
abbr grm     "git rm --cached"
abbr gs      "git status --short"
abbr gsm     "git switch master"
abbr gst     "git stash"

# docker
abbr d     "docker"
abbr dc    "docker container"
abbr dcls  "docker container ls"
abbr dcom  "docker-compose"
abbr dex   "docker exec"
abbr di    "docker image"
abbr dils  "docker image ls"
abbr dn    "docker network"
abbr dnls  "docker network ls"
abbr dpull "docker pull"
abbr drun  "docker run"
abbr dv    "docker volume"
abbr dvls  "docker volume ls"

function mkcd
    mkdir $argv
    cd $argv
end
