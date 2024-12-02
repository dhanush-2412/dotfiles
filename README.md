# Dotfiles Repository

A minimalist repository for managing and deploying personal configuration files using GNU Stow.

## Setup

1. **Install [yay](https://aur.archlinux.org/packages/yay): An AUR helper**:
   ```bash
   pacman -S --needed git base-devel
   git clone https://aur.archlinux.org/yay.git
   cd yay
   makepkg -si
   ```

2. **Install Dependencies**:
   ```bash
   yay -S fzf kitty stow tree zellij zoxide zsh
   ```

4. **Change the default shell**:
   ```bash
   chsh -s $(which zsh)
   ```

4. **Clone the repository**:
   ```bash
   git clone https://github.com/dhanush-2412/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

5. **Stow configurations**:
   Navigate to the `.dotfiles` directory and use `stow` to create symlinks for the desired configuration. For example:
   ```bash
   stow bash
   stow vim
   stow git 
   ```
