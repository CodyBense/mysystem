{ inputs, ... }:

{
    imports = [
        inputs.nix-colors.homeManagerModules.default
    ];

    colorScheme = inputs.nix-colors.colorScheme.gruvbox-dark-medium;
}
