#!/usr/bin/env bash
kitty -e pkexec echo $HOME
kitty -e pkexec nixos-rebuild switch --flake /home/codybense/mysystem
