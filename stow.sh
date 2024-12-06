#!/bin/bash

# ========== Dependencies ==========
packages=()

# zsh
packages+=(fzf kitty stow tmux zoxide zsh)

# Install dependencies
yay -S --needed "${packages[@]}"

# ========== Configurations ==========

# zsh
stow zsh
[ "$SHELL" != "$(which zsh)" ] && chsh -s "$(which zsh)"
source "$HOME/.zshrc"
