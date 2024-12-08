# VSCode Configuration

VSCode configuration with useful extensions, settings and keybindings.

## Setup for Arch Linux

1. **Install VSCode**:

   ```bash
   yay -S visual-studio-code-bin
   ```

2. **Install recommended extensions**:

   ```bash
   code --install-extension catppuccin.catppuccin-vsc
   code --install-extension eamodio.gitlens
   code --install-extension esbenp.prettier-vscode
   code --install-extension github.copilot
   code --install-extension github.copilot-chat
   code --install-extension ms-python.vscode-pylance
   code --install-extension pkief.material-icon-theme
   ```

3. **Create symlinks using stow**:

   ```bash
   stow vscode
   ```
