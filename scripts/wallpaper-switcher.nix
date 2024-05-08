# { pkgs, ... }:
#
# pkgs.writeShellScriptBin "wallpaper-switcher" ''
# #!/bin/bash
#
# # WALLPAPERS PATH
# DIR=$HOME/mysystem/wallpapers
#
# # Transition config (type swww img --help for more settings
# FPS=30
# TYPE="simple"
# DURATION=3
#
# # rofi window config (in %)
# WIDTH=20
# HEIGHT=30
#
# SWWW_PARAMS="--transition-fps $FPS --transition-type $TYPE --transition-duration $DURATION"
#
#
# PICS=($(ls ''${DIR} | grep -e ".jpg$" -e ".jpeg$" -e ".png$" -e ".gif$"))
#
# RANDOM_PIC=''${PICS[ $RANDOM % ''${#PICS[@]} ]}
# RANDOM_PIC_NAME="''${#PICS[@]}. random"
#
#
# # WOFI STYLES
# CONFIG="$HOME/.config/rofi/config.rasi"
# # STYLE="$HOME/.config/rofi/style.css"
# # COLORS="$HOME/.config/rofi/colors"
#
# # to check if swaybg is running
#
# if [[ $(pidof swaybg) ]]; then
#   pkill swaybg
# fi
#
# ## Wofi Command
# rofi_command="rofi --show dmenu \
# 			--prompt choose...
# 			--conf $CONFIG --style $STYLE --color $COLORS \
# 			--width=$WIDTH% --height=$HEIGHT% \
# 			--cache-file=/dev/null \
# 			--hide-scroll --no-actions \
# 			--matching=fuzzy"
#
# menu(){
#     # Here we are looping in the PICS array that is composed of all images in the $DIR
#     # folder 
#     for i in ''${!PICS[@]}; do
#         # keeping the .gif to make sue you know it is animated
#         if [[ -z $(echo ''${PICS[$i]} | grep .gif$) ]]; then
#             printf "$i. $(echo ''${PICS[$i]} | cut -d. -f1)\n" # n°. <name_of_file_without_identifier>
#         else
#             printf "$i. ''${PICS[$i]}\n"
#         fi
#     done
#
#     printf "$RANDOM_PIC_NAME"
# }
#
# swww query || swww-daemon
#
# main() {
#     choice=$(menu | ''${rofi_command})
#
#     # no choice case
#     if [[ -z $choice ]]; then return; fi
#
#     # random choice case
#     if [ "$choice" = "$RANDOM_PIC_NAME" ]; then
#         swww img ''${DIR}/''${RANDOM_PIC} $SWWW_PARAMS
#         return
#     fi
#     
#     pic_index=$(echo $choice | cut -d. -f1)
#     swww img ''${DIR}/''${PICS[$pic_index]} $SWWW_PARAMS
# }
#
# # Check if rofi is already running
# if pidof rofi >/dev/null; then
#     killall rofi
#     exit 0
# else
#     main
# fi
#
# # Uncomment to launch something if a choice was made 
# # if [[ -n "$choice" ]]; then
#     # Restart Waybar
# # fi   
# ''
{ pkgs, ... }:

pkgs.writeShellScriptBin "wallpaper-switcher" ''
wallpaperDir=$HOME/mysystem/wallpapers
TIMEOUT=720
  TRANSITION1="--transition-type wave --transition-angle 120 --transition-step 30"
  TRANSITION2="--transition-type wipe --transition-angle 30 --transition-step 30"
  TRANSITION3="--transition-type center --transition-step 30"
  TRANSITION4="--transition-type outer --transition-pos 0.3,0.8 --transition-step 30"
  TRANSITION5="--transition-type wipe --transition-angle 270 --transition-step 30"
  WALLPAPER=$(find ''${wallpaperDir} -name '*' | awk '!/.git/' | tail -n +2 | shuf -n 1)
  PREVIOUS=$WALLPAPER
  if [ -d ''${wallpaperDir} ]; then
    num_files=$(ls -1 ''${wallpaperDir} | wc -l)

    if [ $num_files -lt 1 ]; then
      notify-send -t 9000 "The wallpaper folder is expected to have more than 1 image. Exiting Wallsetter."
      exit
    else
      cd ''${wallpaperDir}
      fi
    fi
  while true;
  do
    if [ "$WALLPAPER" == "$PREVIOUS" ]; then
      WALLPAPER=$(find ''${wallpaperDir} -name '*' | awk '!/.git/' | tail -n +2 | shuf -n 1)
    else
      PREVIOUS=$WALLPAPER
      NUM=$(shuf -e 1 2 3 4 5 -n 1)
      case $NUM in
        1)
          TRANSITION=$TRANSITION1
        ;;
        2)
          TRANSITION=$TRANSITION2
        ;;
        3)
          TRANSITION=$TRANSITION3
        ;;
        4)
          TRANSITION=$TRANSITION4
        ;;
        5)
          TRANSITION=$TRANSITION5
        ;;
      esac
      ''${pkgs.swww}/bin/swww img "$WALLPAPER" $TRANSITION
      sleep $TIMEOUT
    fi
  done
''
