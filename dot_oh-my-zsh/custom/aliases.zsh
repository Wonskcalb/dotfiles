####################################################
# Here is all the aliases for some user friendlyness
####################################################

# Folder manipulation
alias md='mkdir -p'
alias rd=rmdir

# Quick config edition
alias awconfig='$EDITOR ~/.config/awesome'

# Path manipulation
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

alias ..='cd ..'
alias .2='cd ../..'
alias .3='cd ../../..'

alias d='dirs -v | head -10'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

# List directory contents
alias l='ls -Fh'
alias ll='ls -lFh'
alias la='ls -lFAh'
alias t='tree -L 2'

# Enable some colors for people
alias grep='grep --color'

# Drop some unused git aliases
unset gcl

# Git aliases to (pretend to) be more productive
alias gba='git branch -av'
alias gb='git branch -v'
alias gbg='gb | rg gone'
alias gbm='git branch --merged -v'
alias gbnm='git branch --no-merged -v'
alias gbr='git branch --remote -v'
alias grom='git rebase origin/master'
alias gcb='git checkout -b'
alias gco='git checkout'
alias gcob='git checkout origin/$(git rev-parse --abbrev-ref HEAD)' # Checkout origin copy of the current branch
alias glu='git log -U --'
alias glus='git log -U -S'
alias gpo='git push --force origin HEAD:' # Push to origin branch when in detached head
alias gpsup='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias gust='git unstage'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify -m "--wip-- [skip ci]"'
alias gcbm='f() { git fetch; git switch -c $1 origin/master --no-track; }; f'
alias grso='git remote show origin'

# virtualenv aliases because long commands are too long (need of course virtualenv)
alias vsrc="source venv/bin/activate"

# File navigation/preview stuff
alias v='nvim -R' # Open in read only alias
alias diff='nvim -d' # Open nvim in diff mode
alias grepit="rg -g '!*.{css,map,min.*}' -g'!*i18n*'"
alias cat="bat -pp"
