eval "$(mise activate zsh)"

export DYLD_FALLBACK_LIBRARY_PATH="/opt/homebrew/lib:$DYLD_FALLBACK_LIBRARY_PATH"
export DYLD_LIBRARY_PATH="/opt/homebrew/lib:$DYLD_LIBRARY_PATH"

function dev-changes() {
  # Detect OS + pick clipboard tool
  copy_to_clipboard() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
      pbcopy
    elif command -v xclip >/dev/null 2>&1; then
      xclip -selection clipboard
    else
      echo "No clipboard tool found (need xclip on Linux)" >&2
      exit 1
    fi
  }

  branch() {
    today=$(date +%Y.%m.%d)

    git branch -r --format="%(refname:short)" |
      grep -E '^origin/release-[0-9]{4}\.[0-9]{2}\.[0-9]{2}$' |
      sed 's#origin/##' |
      awk -v today="$today" -F'release-' '$2 < today { print $0 }' |
      sort -t- -k2,2r |
      head -n 1
  }

  out=$(git log origin/$(branch)..origin/dev --name-only -- apps/{buyable,core_data})
  echo "$out"
  printf "%s" "$out" | copy_to_clipboard
}


function prod-changes() {
  # Detect OS + pick clipboard tool
  copy_to_clipboard() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
      pbcopy
    elif command -v xclip >/dev/null 2>&1; then
      xclip -selection clipboard
    else
      echo "No clipboard tool found (need xclip on Linux)" >&2
      exit 1
    fi
  }

  branch() {
    today=$(date +%Y.%m.%d)

    git branch -r --format="%(refname:short)" |
      grep -E '^origin/release-[0-9]{4}\.[0-9]{2}\.[0-9]{2}$' |
      sed 's#origin/##' |
      awk -v today="$today" -F'release-' '$2 < today { print $0 }' |
      sort -t- -k2,2r |
      head -n 1
  }

  out=$(git log origin/dev..origin/$(branch) --name-only -- apps/{buyable,core_data})
  echo "$out"
  printf "%s" "$out" | copy_to_clipboard
}
