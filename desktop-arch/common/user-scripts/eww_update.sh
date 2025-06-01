#!/bin/bash

# ------------------------------------------------------------------------------

update_time() {
  while [ true ]
  do
    eww update hour=$(date +%H)
    eww update minute=$(date +%M)
    eww update date=$(date +%-m/%-d)
    sleep 0.05s
  done
}

# ------------------------------------------------------------------------------

update_workspaces() {
  eww update workspace_1=active
  eww update workspace_6=active
  socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE\
/.socket2.sock \
  | stdbuf -o0 grep -E "^(workspace|createworkspace|destroyworkspace)>>" \
  | while read -r line
  do
    local event_type=${line%%>>*}
    local event_args=${line#*>>}
    case $event_type in
      "workspace")
        if (( $event_args < 6 ))
        then
          local alive_workspaces=$(hyprctl workspaces | grep "^workspace ID " \
          | grep "DP-1" | sed -E "s/^workspace ID ([0-9]+).*/\1/")
          for i in {1..5}
          do
            if (( $event_args == i ))
            then
              eww update workspace_$i=active
            else
              if [[ $alive_workspaces == *$i* ]]
              then
                eww update workspace_$i=inactive
              else
                eww update workspace_$i=
              fi
            fi
          done
        else
          local alive_workspaces=$(hyprctl workspaces | grep "^workspace ID " \
          | grep "DP-2" | sed -E "s/^workspace ID ([0-9]+).*/\1/")
          for i in {6..10}
          do
            if (( $event_args == i ))
            then
              eww update workspace_$i=active
            else
              if [[ $alive_workspaces == *$i* ]]
              then
                eww update workspace_$i=inactive
              else
                eww update workspace_$i=
              fi
            fi
          done
        fi
        ;;
      "createworkspace")
        eww update workspace_$event_args=inactive
        ;;
      "destroyworkspace")
        eww update workspace_$event_args=
        ;;
    esac
  done
}

# ------------------------------------------------------------------------------

update_network_connectivity() {
  while [ true ]
  do
    if [ $(nmcli -f connectivity g | sed "2q;d") = "full" ]
    then
      eww update network_connectivity=true
    else
      eww update network_connectivity=false
    fi
    if (( $(nmcli connection show --active | grep -i "vpn" -c) == 0 ))
    then
      eww update vpn_connectivity=false
    else
      eww update vpn_connectivity=true
    fi
    sleep 1s
  done
}

# ------------------------------------------------------------------------------

update_audio_volume() {
  while [ true ]
  do
    local wpctl_output=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ 2>/dev/null)
    if (( $(echo "$wpctl_output" | grep "MUTED" | wc -l) > 0 ))
    then
      eww update audio_volume=0
    else
      eww update audio_volume=$(echo "$wpctl_output" \
      | sed -E "s/^Volume: ([0-9])\.([0-9][0-9]).*/\1\2/" \
      | sed -E "s/^0*(.+)$/\1/")
    fi
    sleep 0.03s
  done
}

# ------------------------------------------------------------------------------

update_time &
update_workspaces &
update_network_connectivity &
update_audio_volume &
wait
