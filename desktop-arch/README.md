# Desktop running Arch Linux

## Relevant paths

```
/
|
+-  etc/
|   |
|   +-  inputrc
|   |     Configurations for programs that use GNU readline
|   |
|   +-  fonts/
|       |
|       +-  local.conf
|       |     Configurations for fonts
|       |
|       +-  conf.d/
|             Enabled system presets for fonts
|
+-  usr/
|   |
|   +-  local/
|       |
|       +-  share/
|       |   |
|       |   +-  fonts/
|       |       |
|       |       +-  otf/
|       |       |     OpenType fonts
|       |       |
|       |       +-  ttf/
|       |             TrueType fonts
|       |
|       +-  bin/
|             Custom scripts and programs executable by all users
|             On PATH by default
|             Many scripts here function like global aliases, simply running
|             existing commands with common options, accessible by all users
|             Scripts that do user-specific tasks and pull from user-specific
|             configurations should go in the user's home directory instead
|             (e.g. /home/polyrei/scripts/)
|
+-  root/
|   | Home directory for root user
|   | Everything inside here applies only to the root user
|   |
|   +-  .bash_profile
|   |     Bash script that is run once on login
|   |     Sets environment variables
|   |
|   +-  .bashrc
|   |     Bash script that is run at the start of every new Bash instance
|   |     Configures interactive Bash instances
|   |
|   +-  .config/
|         Configurations for programs
|
+-  home/
    |
    +-  polyrei/
        | Personal home directory
        | Everything inside here applies only to the user polyrei
        |
        +-  .bash_profile
        |     Bash script that is run once on login
        |     Sets environment variables
        |     Starts graphical session
        |
        +-  .bashrc
        |     Bash script that is run at the start of every new Bash instance
        |     Configures interactive Bash instances
        |
        +-  .config/
        |     Configurations for programs
        |
        +-  scripts/
              Personal scripts
```
