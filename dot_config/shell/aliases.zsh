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
alias gd='git diff'
alias gdc='git diff --cached'
alias gcb='git checkout -b'
alias gcbm='f() { git fetch; git switch -c $1 origin/HEAD --no-track; }; f'
alias gcoh='gco origin/HEAD'
alias glu='git log -U --'
alias glus='git log -U -S'
alias gpsup='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias grom='git rebase origin/HEAD'
alias groma='git rebase -i --autosquash origin/HEAD'
alias grso='git remote show origin'
alias gust='git unstage'

# virtualenv aliases because long commands are too long (need of course virtualenv)
alias vsrc="source venv/bin/activate"

# File navigation/preview stuff
alias diff='nvim -d' # Open nvim in diff mode
alias grepit="rg -g '!*.{css,map,min.*}' -g'!*i18n*'"
alias cat="bat -pp"

# Docker related aliases
alias dc='docker compose'
alias dk='docker'
alias dkp='dk ps'
alias dkpa='dk ps -a'
alias dkk='docker stop $(docker ps -q)'
alias dcup='docker compose up'
alias dcupd='docker compose up -d'
alias dcupdb='docker compose up -d --build'
alias dcl='docker compose logs'
alias dclf='docker compose logs -F'
alias dcdn='docker compose down'

# Make kubectl bearable to write
alias k='kubectl'

# Make uv better
alias uvs="uv sync"
