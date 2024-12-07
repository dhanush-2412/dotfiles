#!/bin/bash

# ========== Dependencies ==========
packages=()

# zsh
packages+=(fzf kitty stow tmux zoxide zsh)
# tmux
packages+=(tmux)

# Install dependencies
if ! yay -Q "${packages[@]}" >/dev/null; then
    yay -S --needed "${packages[@]}"
fi

# ========== Configurations ==========

# zsh
stow zsh
[ "$SHELL" != "$(which zsh)" ] && chsh -s "$(which zsh)"
zsh "$HOME/.zshrc"

# tmux
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
stow tmux
~/.tmux/plugins/tpm/scripts/install_plugins.sh
