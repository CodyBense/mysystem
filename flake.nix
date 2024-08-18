{
    description = "My NixOS flake";

    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        nix-colors.url = "github:misterio77/nix-colors";
        stylix.url = "github:danth/stylix";
        hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
        hyprland-plugins = {
            url = "github:hyprwm/hyprland-plugins";
            inputs.hyprland.follows = "hyprland";
        };
        # hy3 = {
        #     url = "github:outfoxxed/hy3";
        #     inputs.hyprland.follows = "hyprland";
        # };
        spicetify-nix.url = "github:the-argus/spicetify-nix";
    };

    outputs = { nixpkgs, home-manager, spicetify-nix, ... }@inputs: 
    let
        system = "x86_64-linux";
        host = "nixos";
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
                    inputs.stylix.nixosModules.stylix
                    home-manager.nixosModules.home-manager
                    {
                        home-manager.extraSpecialArgs = {
                            inherit username;
                            inherit inputs;
                            inherit host;
                            inherit (inputs.nix-colors.lib-contrib { inherit pkgs; }) gtkThemeFromScheme;
                            inherit spicetify-nix;
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
