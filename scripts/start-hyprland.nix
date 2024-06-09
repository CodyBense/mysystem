{ pkgs, ... }:

pkgs.writeShellScriptBin "start-hyprland" ''
# initialize wallpaper daemon
swww-daemon &

# set wallpaper
# swww img ~/Pictures/Wallpapers/latios_latias.jpg &

waybar &

nm-applet --indicator &

dunst &
''
