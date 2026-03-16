# Basics
export LANG=en_US.UTF-8

# Prefs
export EDITOR="nvim"

# Git variables
export GIT_SSH=$(which ssh)
export GIT_EDITOR=$EDITOR

# Use ipdb breakpoints in python
export PYTHONBREAKPOINT="ipdb.set_trace"
export PIP_REQUIRE_VIRTUALENV=true

# Make FZF use rg by default
export FZF_DEFAULT_COMMAND='rg --files'

# Add binaries installed by Go to the path
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Bat(cat) theme
export BAT_THEME="1337"
