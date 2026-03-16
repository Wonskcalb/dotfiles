function fp() {
  rg --line-number \
     --no-heading \
     --color=always \
     --smart-case "$@" \
  | fzf -d ':' \
        -n 2.. \
        --ansi \
        --no-sort \
        --bind=ctrl-f:preview-page-down \
        --bind=ctrl-b:preview-page-up \
        --preview-window 'up:70%:+{2}' \
        --preview 'bat --style=numbers --color=always --highlight-line {2} {1}'

	# rg -l -F '$1' \
	# 	| fzf --preview-window=up:70% \
	# 	      --bind=ctrl-f:preview-page-down \
	# 	      --bind=ctrl-b:preview-page-up \
	# 	      --preview "bat --style=numbers {} --color=always | grep --color=always -C 5 '$1'"
}

function nfp() {
  out=$(fp $1)

  $EDITOR $(echo $out | awk -v q='"' -F: '{printf "%s -c" q ":%s" q,$1,$2}')
}

function mdr {
    pandoc "$1" -f markdown -t html | lynx -stdin
}

function gbal {
  gba --list "*$1*"
}

function gcln() {
	git remote prune origin;
	gb -vv | grep gone | sed 's/^+ /  /' | awk '{print $1}' | xargs git branch -D
}

function rlk() {
    git checkout --theirs uv.lock;
    gust uv.lock
    gco -- uv.lock
    uv lock
}

function vi() {
    if [ ! -f "Session.vim" ]; then
        touch Session.vim
    fi
    lvim -S
}

function vnew() {
    virtualenv -p $(which python) venv
}

function difflocks() {
    git show origin/${1:=HEAD}:./Pipfile.lock |  jq '[.default | to_entries[] | {"key": .key, "value": .value.version}] | from_entries' > .old_lock
    cat Pipfile.lock |  jq '[.default | to_entries[] | {"key": .key, "value": .value.version}] | from_entries' > .new_lock

    git --no-pager diff --no-index .old_lock .new_lock | bat -

    rm .old_lock .new_lock
}

function fd() {                
    root=$(git rev-parse --show-toplevel)
    if [ -n "$root" ]; then
        pushd "$root" 1>/dev/null
        preview="git diff $@ --color=always -- {-1}"
        git diff $* --name-only | fzf -m --ansi --preview $preview --bind "enter:execute(git difftool {} < /dev/tty)" --preview-window "right:60%"
        popd 1>/dev/null
    fi  
}
