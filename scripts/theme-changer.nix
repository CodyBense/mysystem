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
#   if [[ ! $@ ]];then
#     echo "No Theme Given"
#   else
#     replacement="$1"
#     sed -i "/^\s*theme[[:space:]]*=[[:space:]]*\"/s/\"\(.*\)\"/\"$replacement\"/" /home/${username}/mysystem/nixos/variables.nix
#     kitty -e pkexec nixos-rebuild switch --flake /home/${username}/mysystem
#   fi
# ''
