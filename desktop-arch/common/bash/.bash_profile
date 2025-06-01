#
# ~/.bash_profile
#

# Environment variables
export RANGER_LOAD_DEFAULT_RC=false

[[ -f ~/.bashrc ]] && . ~/.bashrc

if uwsm check may-start; then
  exec uwsm start hyprland-uwsm.desktop
fi
