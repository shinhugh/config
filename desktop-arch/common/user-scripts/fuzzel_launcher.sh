#!/bin/bash

output="$( echo -en "\
Kitty\n\
Code\n\
Discord\n\
Fcitx5 Config\n\
Firefox\n\
Firefox Private\n\
Font Manager\n\
Gimp\n\
Google Drive\n\
Google Home\n\
Google Keep\n\
Google Photos\n\
Monkeytype\n\
Network Manager\n\
Ranger\n\
SoundCloud\n\
Twitch\n\
YouTube\n\
YouTube Music" \
| fuzzel -d -l 1 )"
if [ "$output" = "Kitty" ]
then
  exec kitty
elif [ "$output" = "Code" ]
then
  exec code
elif [ "$output" = "Discord" ]
then
  exec discord
elif [ "$output" = "Fcitx5 Config" ]
then
  exec fcitx5-configtool
elif [ "$output" = "Firefox" ]
then
  exec firefox
elif [ "$output" = "Firefox Private" ]
then
  exec firefox -private-window
elif [ "$output" = "Font Manager" ]
then
  exec font-manager
elif [ "$output" = "Gimp" ]
then
  exec gimp
elif [ "$output" = "Google Drive" ]
then
  exec firefox -P "kiosk" -new-window --kiosk https://drive.google.com/
elif [ "$output" = "Google Home" ]
then
  exec firefox -P "kiosk" -new-window --kiosk https://home.google.com/
elif [ "$output" = "Google Keep" ]
then
  exec firefox -P "kiosk" -new-window --kiosk https://keep.google.com/
elif [ "$output" = "Google Photos" ]
then
  exec firefox -P "kiosk" -new-window --kiosk https://photos.google.com/
elif [ "$output" = "Monkeytype" ]
then
  exec firefox -P "kiosk" -new-window --kiosk https://monkeytype.com/
elif [ "$output" = "Network Manager" ]
then
  exec kitty nmtui
elif [ "$output" = "Ranger" ]
then
  exec kitty ranger
elif [ "$output" = "SoundCloud" ]
then
  exec firefox -P "kiosk" -new-window --kiosk https://soundcloud.com/you/likes
elif [ "$output" = "Twitch" ]
then
  exec firefox -P "kiosk" -new-window --kiosk https://twitch.tv/
elif [ "$output" = "YouTube" ]
then
  exec firefox -P "kiosk" -new-window --kiosk https://youtube.com/
elif [ "$output" = "YouTube Music" ]
then
  exec firefox -P "kiosk" -new-window --kiosk https://music.youtube.com/library/songs
fi
