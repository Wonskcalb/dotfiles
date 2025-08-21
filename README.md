# Dotfiles

## Packages required

- [`chezmoi`](https://github.com/twpayne/dotfiles)
- [`bitwarden-cli`](https://github.com/bitwarden/cli) to fetch secrets from bitwarden
- git
- ssh (for git)


## Notes

- The bitwarden-cli will be automatically installed by chezmoi.
- This works exclusively (of course) with my own vault. You cannot copy/paste this setup for your computers

## Installation

| platform | steps                                             |
| -------- | ------------------------------------------------- |
| MacOS    | `brew install chezmoi`                            |
| Manjaro  | `yay -S chezmoi`                                  |


## Usage

```bash
export BW_SESSION=$(bw unlock --raw)
chezmoi init Wonskcalb/dotfiles
chezmoi apply
```
