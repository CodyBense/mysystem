{ inputs, config, pkgs, ... }:

let
    list-hypr-bindings = import ./../scripts/list-hypr-bindings.nix { inherit pkgs; };
in
{
    environment.systemPackages = with pkgs; [
        list-hypr-bindings
    ];
}
