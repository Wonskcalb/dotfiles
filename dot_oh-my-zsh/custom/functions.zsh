function fp() {
	rg -l "$1" \
		| fzf --preview-window=up:70% \
		      --bind=ctrl-f:preview-page-down \
		      --bind=ctrl-b:preview-page-up \
		      --preview "bat --style=numbers {} --color=always | grep --color=always -C 5 $1"
}

function nfp() {
	$EDITOR $(fp $1)
}

function mdr {
    pandoc "$1" -f markdown -t html | lynx -stdin
}

function gcln() {
	git remote prune origin;
	gb | grep gone | sed 's/^+ /  /' | awk '{print $1}' | xargs git branch -D
}

function rlk() {
    git checkout --theirs poetry.lock;
    gust poetry.lock
    gco -- poetry.lock
    poetry lock --no-update
}

function vi() {
    if [ ! -f "Session.vim" ]; then
        touch Session.vim
    fi
    nvim -S
}

function vnew() {
    virtualenv -p $(which python) venv
}
