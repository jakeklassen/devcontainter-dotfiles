#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing dotfiles from $DOTFILES_DIR..."

link() {
  ln -sf "$DOTFILES_DIR/$1" "$HOME/$1"
  echo "  Linked $1"
}

link .zshrc
link .aliases
link .gitconfig

# mise config
mkdir -p "$HOME/.config/mise"
ln -sf "$DOTFILES_DIR/config/mise/config.toml" "$HOME/.config/mise/config.toml"
echo "  Linked .config/mise/config.toml"

# Trust the workspace mise config if it exists
if [ -f /workspace/mise.toml ]; then
  mise trust /workspace/mise.toml
  echo "  Trusted /workspace/mise.toml"
fi

echo "Done!"
