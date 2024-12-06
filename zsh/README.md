# Zsh Configuration

Zsh Configuration with [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) and the [Powerlevel10k](https://github.com/romkatv/powerlevel10k) theme.

## Setup for Arch Linux

1. **Install all dependencies**:

   ```bash
   yay -S fzf kitty stow tmux zoxide zsh
   ```

2. **Create symlinks using stow**:

   ```bash
   stow zsh
   ```

3. **Change the default shell to zsh**:

   ```bash
   chsh -s $(which zsh)
   ```
