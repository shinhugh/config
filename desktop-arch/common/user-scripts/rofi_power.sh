#!/bin/bash

output="$( echo -en "Logout\nShutdown\nRestart" | rofi -dmenu -i -l 3 -p ">" )"
if [ "$output" = "Logout" ]
then
  exec uwsm stop
elif [ "$output" = "Shutdown" ]
then
  exec sudo systemctl poweroff
elif [ "$output" = "Restart" ]
then
  exec sudo systemctl reboot
fi
