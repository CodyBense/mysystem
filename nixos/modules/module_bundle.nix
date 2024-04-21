{ pkgs, lib, ... }: {
    imports = [
        ./hyprland_module.nix
        ./nvidia_module.nix
    ];

    hyprland_module.enable = lib.mkDefault true;
    nvidia_module.enable = lib.mkDefault false;
}
