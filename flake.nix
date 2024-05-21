{
    description = "My NixOS flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        # hyprland.url = "github:hyprwm/Hyprland";
        hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

        nix-colors.url = "github:misterio77/nix-colors";

        stylix.url = "github:danth/stylix";

        spicetify-nix.url = "github:the-argus/spicetify-nix";
    };

    outputs = { self, nixpkgs, home-manager, hyprland, spicetify-nix, ... }@inputs: 
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
            # pkgs = nixpkgs.legacyPackages.${system};
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
                    inherit inputs system;
                };


                modules = [
                    ./nixos/configuration.nix
                    inputs.stylix.nixosModules.stylix
                ];
            };
        };
    };
}
