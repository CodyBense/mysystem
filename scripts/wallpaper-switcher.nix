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
wall_dir="${HOME}/mysystem/wallpapers"
cacheDir="${HOME}/.cache/jp/${theme}"
rofi_command="rofi -x11 -dmenu -theme ${HOME}/.config/rofi/wallSelect.rasi -theme-str ${rofi_override}"

# Create cache dir if not exists
if [ ! -d "${cacheDir}" ] ; then
        mkdir -p "${cacheDir}"
    fi


physical_monitor_size=13
monitor_res=$(hyprctl monitors |grep -A2 Monitor |head -n 2 |awk '{print $1}' | grep -oE '^[0-9]+')
dotsperinch=$(echo "scale=2; $monitor_res / $physical_monitor_size" | bc | xargs printf "%.0f")
monitor_res=$(( $monitor_res * $physical_monitor_size / $dotsperinch ))

rofi_override="element-icon{size:${monitor_res}px;border-radius:0px;}"

# Convert images in directory and save to cache dir
for imagen in "$wall_dir"/*.{jpg,jpeg,png,webp}; do
	if [ -f "$imagen" ]; then
		nombre_archivo=$(basename "$imagen")
			if [ ! -f "${cacheDir}/${nombre_archivo}" ] ; then
				convert -strip "$imagen" -thumbnail 500x500^ -gravity center -extent 500x500 "${cacheDir}/${nombre_archivo}"
			fi
    fi
done

# Select a picture with rofi
wall_selection=$(find "${wall_dir}"  -maxdepth 1  -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) -exec basename {} \; | sort | while read -r A ; do  echo -en "$A\x00icon\x1f""${cacheDir}"/"$A\n" ; done | $rofi_command)

# Set the wallpaper
[[ -n "$wall_selection" ]] || exit 1
swww img ${wall_dir}/${wall_selection}

exit 0
''
