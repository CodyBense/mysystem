DIR=$HOME/mysystem/nixos/colors/color_schemes
arr=($DIR/*)
# arr=ls -1 | sed -e 's/\.nix$//'
themes=()

for e in ${arr[@]}; do
    themes=("${themes[@]}" ${e##*/}) 
done

choice=$(printf "%s\n" "${themes[@]}" | rofi -dmenu) 
echo ${choice}
ln -s -r -f ~/mysystem/nixos/colors/color_schemes/${choice}.nix ~/mysystem/nixos/colors/colors.nix 

# echo "ZSe45rdx##" | sudo -S nixos-rebuild switch --flake ~/mysystem
