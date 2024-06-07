{ pkgs, ... }:

pkgs.writeShellScriptBin "theme-changer" ''
DIR=$HOME/mysystem/nixos/colors/color_schemes
arr=($DIR/*)
# arr=ls -1 | sed -e 's/\.nix$//'
themes=()

for e in ''${arr[@]}; do
    themes=("''${themes[@]}" ''${e##*/}) 
done

choice=$(printf "%s\n" "''${themes[@]}" | rofi -dmenu) 
echo ''${choice}
ln -s -r -f ~/mysystem/nixos/colors/color_schemes/''${choice} ~/mysystem/nixos/colors/colors.nix 

echo "ZSe45rdx##" | sudo -S nixos-rebuild switch --flake ~/mysystem
''

# pkgs.writeShellScriptBin "theme-changer" ''
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
# ''
