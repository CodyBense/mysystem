{ pkgs, ... }:

pkgs.writeShellScriptBin "randomPokemon" ''
pokemon=("gengar" "latios" "charizard" "typhlosion")

size=''${#pokemon[@]}
index=''$(($RANDOM % $size))

pokeget --hide-name ''${pokemon[$index]}
''
