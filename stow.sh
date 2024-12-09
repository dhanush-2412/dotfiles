#!/bin/bash

# ========== Dependencies ==========
packages=()

# zsh
packages+=(fzf kitty stow tmux zoxide zsh)
# tmux
packages+=(tmux)
# vscode
packages+=(visual-studio-code-bin)
# kitty
packages+=(kitty)
# kanata
packages+=(kanata)

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
installed_extensions=$(code --list-extensions)
for extension in "${extensions[@]}"; do
    [[ $installed_extensions =~ $extension ]] && continue
    code --install-extension "$extension"
done

stow vscode

# kitty
stow kitty

# kanata
stow kanata

getent group uinput >/dev/null || sudo groupadd uinput

user_groups=$(groups $USER)
[[ $user_groups =~ input ]] || sudo usermod -aG input $USER
[[ $user_groups =~ uinput ]] || sudo usermod -aG uinput $USER

udev_rule='KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"'
udev_file='/etc/udev/rules.d/99-input.rules'
if ! grep -q "$udev_rule" "$udev_file"; then
    sudo bash -c "echo '$udev_rule' >> $udev_file"
    sudo udevadm control --reload-rules && sudo udevadm trigger
    sudo modprobe uinput
fi

if ! systemctl --user is-enabled kanata.service >/dev/null 2>&1; then
    systemctl --user daemon-reload
    systemctl --user enable kanata.service
    systemctl --user start kanata.service
fi
