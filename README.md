# Dotfiles Repository

A repository for managing and deploying personal configuration files using GNU Stow.

## Setup for Arch Linux

1. **Install [yay](https://aur.archlinux.org/packages/yay): An AUR helper**:

   ```bash
   pacman -S --needed git base-devel
   git clone https://aur.archlinux.org/yay.git
   cd yay
   makepkg -si
   ```

2. **Clone the repository**:

   ```bash
   git clone https://github.com/dhanush-2412/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

3. **Run the script**:

   ```bash
   ./stow.sh
   ```

## Available Configs

- **zsh**: Zsh shell configuration files
- **tmux**: Tmux terminal multiplexer configuration files
