#!/bin/bash

# ========== Dependencies ==========
packages=()

# zsh
packages+=(fzf kitty stow tmux zoxide zsh)
# tmux
packages+=(tmux)

# Install dependencies
yay -S --needed "${packages[@]}"

# ========== Configurations ==========

# zsh
stow zsh
[ "$SHELL" != "$(which zsh)" ] && chsh -s "$(which zsh)"
source "$HOME/.zshrc"

# tmux
load https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
stow tmux
~/.tmux/plugins/tpm/bin/install_plugins
