# Device and program configurations

Personal configurations for my OS environments and programs

## File structure of project

The location of a program's configurations is determined by whether they depend
on the device and whether they depend on the theme.

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
|   |   +-  <Program name>/
|   |         Configurations for program
|   |
|   +-  nord/
|   |   | Configurations specific to the Nord theme (but common across devices)
|   |   |
|   |   +-  <Program name>/
|   |         Configurations for program
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
|   |   +-  <Program name>/
|   |         Configurations for program
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
|   |   +-  <Program name>/
|   |         Configurations for program
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
