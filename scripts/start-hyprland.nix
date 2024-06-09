{ pkgs, ... }:

pkgs.writeShellScriptBin "start-hyprland" ''
# initialize wallpaper daemon
pkillall -q swww
sleep .5
swww init

pkillall -q waybar
sleep .5
waybar &

nm-applet --indicator &

pkillall -q swaync
sleep .5
swaync
''
