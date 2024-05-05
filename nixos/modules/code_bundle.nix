
{  lib, ... }: {
    imports = [
        ./code/python_module.nix
        ./code/rust_module.nix
        ./code/go_module.nix
    ];

    python_module.enable = lib.mkDefault true;
    rust_module.enable = lib.mkDefault true;
    go_module.enable = lib.mkDefault true;
}
