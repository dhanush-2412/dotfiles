#!/bin/bash

# ========== Dependencies ==========
packages=()

# zsh
packages+=(fzf kitty stow tmux zoxide zsh)

# Install dependencies
if ! yay -Q "${packages[@]}" >/dev/null; then
    yay -S --needed "${packages[@]}"
fi

# ========== Configurations ==========

# zsh
stow zsh
[ "$SHELL" != "$(which zsh)" ] && chsh -s "$(which zsh)"
zsh "$HOME/.zshrc"
