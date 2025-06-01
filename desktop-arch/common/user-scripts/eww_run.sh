#!/bin/bash

eww daemon
eww open main

exec wrap ~/scripts/eww_update.sh
