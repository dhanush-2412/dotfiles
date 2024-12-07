# Tmux Configuration

Tmux Configuration with custom settings and plugins.

## Setup for Arch Linux

1. **Install tmux**:

   ```bash
   yay -S tmux
   ```

2. **Install Tmux Plugin Manager (tpm)**:

   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```

3. **Create symlinks using stow**:

   ```bash
   stow tmux
   ```

4. **Install plugins**:

   ```bash
   ~/.tmux/plugins/tpm/bin/install_plugins
   ```
