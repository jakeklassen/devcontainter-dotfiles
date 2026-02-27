#!/usr/bin/env bash
set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing dotfiles from $DOTFILES_DIR..."

link() {
  ln -sf "$DOTFILES_DIR/$1" "$HOME/$1"
  echo "  Linked $1"
}

# Link dotfiles
link .zshrc
link .aliases
link .gitconfig

# Install zsh if not present
if ! command -v zsh &>/dev/null; then
  echo "Installing zsh..."
  apt-get update -qq && apt-get install -y -qq zsh
fi

# Install Starship
if ! command -v starship &>/dev/null; then
  echo "Installing Starship..."
  curl -fsSL https://starship.rs/install.sh | sh -s -- --yes
fi

# Set zsh as default shell for current user
if [ "$(basename "$SHELL")" != "zsh" ]; then
  echo "Setting zsh as default shell..."
  chsh -s "$(which zsh)" 2>/dev/null || echo "  (Could not chsh, you may need to set zsh manually)"
fi

echo "Done!"
