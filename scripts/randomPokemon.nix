{ pkgs, ... }:

pkgs.writeShellScriptBin "randomPokemon" ''
pokemon=("gengar" "latios" "charizard" "typhlosion")

size=''${#pokemon[@]}
index=''$(($RANDOM % $size))

pokeget ''${pokemon[$index]}
''
