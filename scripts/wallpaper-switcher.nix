{ pkgs, ... }:

pkgs.writeShellScriptBin "wallpaper-switcher" ''
DIR=$HOME/mysystem/wallpapers
arr=($DIR/*)
filenames=()
for e in ''${arr[@]}; do
    filenames=("''${filenames[@]}" ''${e##*/}) 
done
choice=$(printf "%s\n" "''${filenames[@]}" | rofi -dmenu) 
swww img ''${DIR}/''${choice} --transition-type any --transition-duration 3 --resize
''
