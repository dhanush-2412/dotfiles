# Kanata Configuration

Kanata Configuration with custom settings and plugins.

## Setup for Arch Linux

1. **Install kanata**:

   ```bash
   yay -S kanata
   ```

2. **Create symlinks using stow**:

   ```bash
   stow kanata
   ```

3. **If the uinput group does not exist, create a new group**:

   ```bash
   sudo groupadd uinput
   ```

4. **Add your user to the input and the uinput group**:

   ```bash
   sudo usermod -aG input $USER
   sudo usermod -aG uinput $USER
   ```

   Make sure that it's effective by running `groups`. You might have to logout and login.

5. **Make sure the uinput device file has the right permissions**:

   Create a new file: `/etc/udev/rules.d/99-input.rules` and insert the following in the code

   ```bash
   KERNEL=="uinput", MODE="0660", GROUP="uinput", OPTIONS+="static_node=uinput"
   ```

   Machine reboot or run this to reload

   ```bash
   sudo udevadm control --reload-rules && sudo udevadm trigger
   ```

6. **Make sure the uinput drivers are loaded**:
   You may need to run this command whenever you start kanata for the first time:

   ```
   sudo modprobe uinput
   ```

7. **To enable a systemd daemon service**:

   ```bash
   systemctl --user daemon-reload
   systemctl --user enable kanata.service
   systemctl --user start kanata.service
   ```
