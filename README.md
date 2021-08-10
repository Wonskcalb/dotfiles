# Dotfiles

## Packages required

- [`chezmoi`](https://github.com/twpayne/dotfiles)
- [`bitwarden-cli`](https://github.com/bitwarden/cli) to fetch secrets from bitwarden
- [`age`](https://github.com/FiloSottile/age) for file encryption
- git
- ssh (for git)


## Usage

### Archlinux/Manjaro

```bash
yay -S chezmoi bitwarden-cli age
# I'm too lazy to copy paste the session hash
eval $(bw login <email> | grep export | tail -c +3)
chezmoi init Wonskcalb/dotfiles
chezmoi apply
```
