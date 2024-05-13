#!/usr/bin/env bash
pokemon=("gengar" "latios" "charizard" "typhlosion")

size=${#pokemon[@]}
index=$(($RANDOM % $size))

pokeget ${pokemon[$index]}
