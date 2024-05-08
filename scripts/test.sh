#!/usr/bin/env bash

DIR=$HOME/mysystem/wallpapers
arr=($DIR/*)
#
# for ((i=0; i<${#arr[@]}; i++)); do
#     echo "${arr[$i]}"
# done

IFS=$'\n'
files="$(fd --search-path '$HOME/mysystem/wallpapers')"
filenames=()
for e in ${arr[@]}; do
    filenames=("${filenames[@]}" ${e##*/}) 
done
choice=$(printf "%s\n" "${filenames[@]}" | rofi -dmenu) 
swww -"img" ${choice}
echo $choice_path
