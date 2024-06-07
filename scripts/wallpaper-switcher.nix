{ pkgs, username, ... }:

pkgs.writeShellScriptBin "wallpaper-switcher" ''
DIR=/home/${username}/Pictures/Wallpapers
arr=($DIR/*)
filenames=()
for e in ''${arr[@]}; do
    filenames=("''${filenames[@]}" ''${e##*/}) 
done
choice=$(printf "%s\n" "''${filenames[@]}" | rofi -dmenu) 
${pkgs.swww} img ''${DIR}/''${choice} --transition-fps 30 --transition-type any --transition-duration 3 --resize crop

# WALLPAPER=$(find /home/${username}/Pictures/Wallpapers -name '*' | awk '!/.git/' | tail -n +2 | shuf -n 1)
#   PREVIOUS=$WALLPAPER
#   if [ "$WALLPAPER" == "$PREVIOUS" ]; then
#       WALLPAPER=$(find /home/${username}/Pictures/Wallpapers -name '*' | awk '!/.git/' | tail -n +2 | shuf -n 1)
#   fi
#   if [ -d /home/${username}/Pictures/Wallpapers ]; then
#     num_files=$(ls -1 /home/${username}/Pictures/Wallpapers | wc -l)
#
#     if [ $num_files -lt 1 ]; then
#       notify-send -t 9000 "The wallpaper folder is expected to have more than 1 image. Exiting Wallsetter."
#       exit
#     fi
#
#     ${pkgs.swww}/bin/swww img "$WALLPAPER" --transition-type random
#   fi
''
