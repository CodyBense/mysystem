{ inputs, config, pkgs, ... }:

let
    list-hypr-bindings = import ./list-hypr-bindings.nix { inherit pkgs; };
    start-hyprland = import ./start-hyprland.nix { inherit pkgs; };
    change-wallpaper = import ./change-wallpaper.nix { inherit pkgs; };
    wallpaper-switcher = import ./wallpaper-switcher.nix { inherit pkgs; };
    rofi-wifi = import ./rofi-wifi.nix { inherit pkgs; };
    theme-changer = import ./theme-changer.nix { inherit pkgs; };
    randomPokemon = importy ./randomPokemon.nix { inherit pkgs; };

in
{
    environment.systemPackages = [
        list-hypr-bindings
        start-hyprland
        change-wallpaper
        wallpaper-switcher
        rofi-wifi
        theme-changer
        randomPokemon
    ];
}
