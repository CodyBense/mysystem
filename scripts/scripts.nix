{ inputs, config, pkgs, ... }:

let
    list-hypr-bindings = import ./list-hypr-bindings.nix { inherit pkgs; };
    start-hyprland = import ./start-hyprland.nix { inherit pkgs; };

in
{
    environment.systemPackages = with pkgs; [
        list-hypr-bindings
        start-hyprland
    ];
}
