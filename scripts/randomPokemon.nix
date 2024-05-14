{ pkgs, ... }:

pkgs.writeShellScriptBin "randomPokemon" ''
pokemon=("gengar" "latios" "charizard" "typhlosion" "emboar" "hydreigon" "garchomp" "infernape" "salamence" "flygon" "mudkip" "scizor" "dragonite" "snorlax")

size=''${#pokemon[@]}
index=''$(($RANDOM % $size))

pokeget --hide-name ''${pokemon[$index]}
''
