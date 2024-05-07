{ pkgs, ... }:

pkgs.writeShellScriptBin "start-hyprland" ''
# initialize wallpaper daemon
swww-daemon &

# set wallpaper
# swww img ~/mysystem/wallpapers/latios_latias.jpg &

waybar &

dunst
''
