# Prefs
export EDITOR="nvim"

# Git variables
export GIT_SSH=$(which ssh)
export GIT_EDITOR=nvim

# Installed gems
export PATH="$HOME/.gem/ruby/2.6.0/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# Pipenv configuration
PIPENV_VENV_IN_PROJECT=1

# Use ipdb breakpoints in python
export PYTHONBREAKPOINT="ipdb.set_trace"


# Make FZF use rg by default
export FZF_DEFAULT_COMMAND='rg --files'
