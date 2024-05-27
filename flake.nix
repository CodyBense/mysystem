{
    description = "My NixOS flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-mamager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

        stylix.url = "github:danth/stylix";

        spicetify-nix.url = "github:the-argus/spicetify-nix";
    };

    outputs = { nixpkgs, ... }@inputs: 
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
            inherit pkgs;

            extraSpecialArgs = {
                inherit inputs;
                inherit spicetify-nix;
            };

            modules = [
                hyprland.homeManagerModules.default
                {wayland.windowManager.hyprland.enable = true;}
                ./nixos/hm_modules/spicetify.nix
            ];
        };

        nixosConfigurations = {
            laptop = nixpkgs.lib.nixosSystem {
                specialArgs = {
                    inherit inputs;
                    inherit system;
                };

                modules = [
                    ./nixos/configuration.nix
                    inputs.sylix.nixosModules.stylix
                ];
            };
        };
    };
}
