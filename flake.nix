{
    description = "My NixOS flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nix-colors.url = "github:misterio77/nix-colors";
        hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    };

    outputs = { nixpkgs, home-manager, ... }@inputs: 
        let
        system = "x86_64-linux";
    host = "laptop";
    username = "codybense";

    pkgs = import nixpkgs {
        inherit system;
        config = {
            allowUnfree = true;
        };
    };
    in
    {

        nixosConfigurations = {
            "${host}" = nixpkgs.lib.nixosSystem {
                specialArgs = { 
                    inherit system;
                    inherit inputs;
                    inherit username;
                    inherit host;
                };
                modules = [
                    ./hosts/${host}/configuration.nix
                        home-manager.nixosModules.home-manager
                        {
                            home-manager.extraSpecailArgs = {
                                inherit username;
                                inherit inputs;
                                inherit host;
                                inherit (inputs.nix-colors.lib-contrib { inherit pkgs; }) gtkThemeFromScheme;
                            };
                            home-manager.useGlobalPkgs = true;
                            home-manager.useUserPackages = true;
                            home-manager.backupFileExtension = "backup";
                            home-manager.users.${username} = import ./hosts/${host}/home.nix;
                        }
                ];
            };
        };
    };
}
