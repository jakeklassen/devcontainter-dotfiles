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

echo "Done!"
