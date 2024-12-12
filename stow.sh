#!/bin/bash

# ========== Dependencies ==========
packages=()

# zsh
packages+=(bat fzf kitty less stow tmux zoxide zsh)
# tmux
packages+=(tmux)
# vscode
packages+=(visual-studio-code-bin)
# kitty
packages+=(kitty)
# kanata
packages+=(kanata)

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

# kitty
stow kitty

# kanata
stow kanata

sudo groupadd uinput
sudo usermod -aG input $USER
sudo usermod -aG uinput $USER

udev_rule='KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"'
udev_file='/etc/udev/rules.d/99-input.rules'
if ! grep -q "$udev_rule" "$udev_file"; then
    sudo bash -c "echo '$udev_rule' >> $udev_file"
fi

sudo udevadm control --reload-rules && sudo udevadm trigger
sudo modprobe uinput

systemctl --user daemon-reload
systemctl --user enable kanata.service
systemctl --user start kanata.service