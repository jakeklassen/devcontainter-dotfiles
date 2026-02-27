# dotfiles

Personal dotfiles for dev containers (and general Linux use).

## What's included

- **zsh** as the default shell
- **Starship** prompt (git-branch aware, cross-shell)
- Shell aliases (`ll`, `..`, etc.)
- Git aliases (`gs`, `gc`, `gco`, etc.)
- Sensible `.gitconfig` defaults

## Install

```bash
bash install.sh
```

The script will:
1. Symlink all dotfiles into `~`
2. Install `zsh` if not present (via apt)
3. Install [Starship](https://starship.rs) if not present
4. Set `zsh` as the default shell

## VS Code Dev Containers

Add to your VS Code `settings.json`:

```json
"dotfiles.repository": "jakeklassen/dotfiles",
"dotfiles.targetPath": "~/dotfiles",
"dotfiles.installCommand": "bash install.sh"
```

Or in `devcontainer.json`:

```json
{
  "dotfiles": {
    "repository": "jakeklassen/dotfiles",
    "targetPath": "~/dotfiles",
    "installCommand": "bash install.sh"
  }
}
```

## Local overrides

Any machine/container-specific config can go in `~/.zshrc.local` — it's sourced at the end of `.zshrc` and is gitignored by default.