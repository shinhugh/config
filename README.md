# Device and program configurations

Personal configurations for my OS environments and programs

## File structure of project

The location of a program's configurations is determined by whether they depend
on the device and whether they depend on the theme. For example, Vim's
configurations remain constant regardless of what device Vim is running on and
what theme the device is using (because colors are determined by the terminal),
whereas Hyprland's configurations will greatly vary according to both the device
and the desired theme.

The first directory in the path refers to the target device, and the second
directory in the path refers to the target theme. The path is as such:

```
<device>/<theme>/
```

Configurations that are device-agnostic reside in `common/<theme>/`.

Configurations that are theme-agnostic reside in `<device>/common/`.

Configurations that are both device- and theme-agnostic reside in
`common/common/`.

```
config/
|
+-  common/
|   | Configurations common across devices
|   |
|   +-  common/
|   |   | Configurations common across themes (and common across devices)
|   |   |
|   |   +-  fonts/
|   |   |     Fonts
|   |   |
|   |   +-  code/
|   |   |     Configurations for Visual Studio Code
|   |   |
|   |   +-  git/
|   |   |     Configurations for Git
|   |   |
|   |   +-  ranger/
|   |   |     Configurations for Ranger
|   |   |
|   |   +-  vim/
|   |         Configurations for Vim
|   |
|   +-  nord/
|   |   | Configurations specific to the Nord theme (but common across devices)
|   |   |
|   |   +-  firefox/
|   |         Configurations for Firefox
|   |
|   +-  ...
|         Configurations specific to other themes (but common across devices)
|         Structurally equivalent to nord/ above
|
+-  desktop-arch/
|   | Configurations specific to my desktop device running Arch Linux
|   |
|   +-  common/
|   |   | Configurations common across themes (but specific to the device)
|   |   |
|   |   +-  system-scripts/
|   |   |     Scripts shared by all users
|   |   |     Should be copied to /usr/local/bin/
|   |   |
|   |   +-  user-scripts/
|   |   |     Scripts that do user-specific tasks and pull from user-specific
|   |   |     configurations
|   |   |     Should be copied to somewhere inside user's home directory
|   |   |
|   |   +-  font-config/
|   |   |     Configurations for font matching
|   |   |
|   |   +-  bash/
|   |   |     Configurations for Bash
|   |   |
|   |   +-  fastfetch/
|   |   |     Configurations for Fastfetch
|   |   |
|   |   +-  hyprpaper/
|   |   |     Configurations for Hyprpaper
|   |   |
|   |   +-  logiops/
|   |   |     Configurations for Logiops
|   |   |
|   |   +-  uwsm/
|   |   |     Configurations for Universal Wayland Session Manager
|   |   |
|   |   +-  xdg-user-dirs-update/
|   |         Configurations for XDG user directories
|   |
|   +-  nord/
|   |   | Configurations specific to the Nord theme (and specific to the device)
|   |   |
|   |   +-  user-scripts/
|   |   |     Scripts that do user-specific tasks and pull from user-specific
|   |   |     configurations
|   |   |     Should be copied to somewhere inside user's home directory
|   |   |
|   |   +-  wallpapers/
|   |   |     Wallpapers
|   |   |
|   |   +-  eww/
|   |   |     Configurations for Eww
|   |   |
|   |   +-  fuzzel/
|   |   |     Configurations for Fuzzel
|   |   |
|   |   +-  hyprland/
|   |   |     Configurations for Hyprland
|   |   |
|   |   +-  kitty/
|   |   |     Configurations for Kitty
|   |   |
|   |   +-  xresources/
|   |         Visual configurations for various applications
|   |
|   +-  ...
|         Configurations specific to other themes (and specific to the device)
|         Structurally equivalent to nord/ above
|
+-  ...
      Configurations specific to other devices
```

## File structure of device

Refer to the `README.md` in the directory for the target device.
