{
    description = "My NixOS flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        hyprland.url = "github:hyprwm/Hyprland";

        nix-colors.url = "github:misterio77/nix-colors";

        stylix.url = "github:danth/stylix";

    };

    outputs = { self, nixpkgs, home-manager, hyprland, stylix, ... }@inputs: 
        let
        system = "x86_64-linux";

    pkgs = import nixpkgs {
        inherit system;

        config = {
            allowUnfree = true;
        };
    };
    in
    {

        homeConfigurations."codybense@laptop" = home-manager.lib.homeManagerConfiguration {
            pkgs = nixpkgs.legacyPackages.${system};

            modules = [
                hyprland.homeManagerModules.default
                {wayland.windowManager.hyprland.enable = true;}
            ];
        };

        nixosConfigurations = {
            laptop = nixpkgs.lib.nixosSystem {
                specialArgs = { inherit inputs system; };


                modules = [
                    ./nixos/configuration.nix
                    stylix.nixosModules.stylix
                ];
            };
        };
    };
}
