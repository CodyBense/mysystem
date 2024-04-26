
{ lib, ... }: {
    imports = [
        ./python_module.nix
    ];

    python_module.enable = lib.mkDefault true;
}
