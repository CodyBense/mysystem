{ pkgs, ... }:

pkgs.writeShellScriptBin "change-wallpaper" ''
#!/usr/bin/env bash

DIR=$HOME/Pictures/Wallpapers/
PICS=($(ls ''${DIR}))

RANDOMPICS=''${PICS[ $RANDOM % ''${#PICS[@]} ]}

if [[ ''$(pidof swaybg) ]]; then
  pkill swaybg
fi

swww query || swww-daemon

#change-wallpaper using swww
swww img ''${DIR}/''${RANDOMPICS} --transition-fps 30 --transition-type any --transition-duration 3 --resize crop
''
