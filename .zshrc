# PATH
export PATH="/usr/local/bin:$HOME/.local/bin:$PATH"

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Better completion
autoload -Uz compinit && compinit -u

# Load aliases
[ -f ~/.aliases ] && source ~/.aliases

# fzf
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh

# Load local overrides (not committed to repo)
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# Starship prompt
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi

# mise
if command -v mise &>/dev/null; then
  eval "$(mise activate zsh)"
elif [ -f "$HOME/.local/bin/mise" ]; then
  eval "$($HOME/.local/bin/mise activate zsh)"
fi
