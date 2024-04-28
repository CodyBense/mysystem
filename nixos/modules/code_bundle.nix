
{  lib, ... }: {
    imports = [
        ./python_module.nix
        ./rust_module.nix
        ./go_module.nix
    ];

    python_module.enable = lib.mkDefault true;
    rust_module.enable = lib.mkDefault true;
    go_module.enable = lib.mkDefault true;
}
