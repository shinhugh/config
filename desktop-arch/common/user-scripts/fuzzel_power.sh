#!/bin/bash

output="$( echo -en "Logout\nShutdown\nRestart" | fuzzel -d -l 3 )"
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
