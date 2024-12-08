#!/bin/bash

# ========== Dependencies ==========
packages=()

# zsh
packages+=(fzf kitty stow tmux zoxide zsh)
# tmux
packages+=(tmux)
# vscode
packages+=(visual-studio-code-bin)

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

# vscode
extensions=(
    "catppuccin.catppuccin-vsc"
    "eamodio.gitlens"
    "esbenp.prettier-vscode"
    "github.copilot-chat"
    "github.copilot"
    "ms-python.vscode-pylance"
    "pkief.material-icon-theme"
)
for extension in "${extensions[@]}"; do
    code --install-extension "$extension"
done

stow vscode
