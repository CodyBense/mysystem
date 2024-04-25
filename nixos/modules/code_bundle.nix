
{ pkgs, lib, ... }: {
    imports = [
        ./python_module.nix
        # ./nvidia_module.nix
    ];

    python.enable = lib.mkDefault true;
    # nvidia_module.enable = lib.mkDefault false;
}
