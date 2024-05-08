{ pkgs, ... }:

pkgs.writeShellScriptBin "wallpaper-switcher" ''
DIR=$HOME/mysystem/wallpapers/
arr=(''${DIR}/*)

''
