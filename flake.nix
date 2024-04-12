{
  description = "My NixOS flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
    	url = "github:nix-community/home-manager";
	inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

  };

  outputs = { self, nixpkgs, home-manager, hyprland, ... }@inputs: 
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

    homeConfigurations."codybense@cody-desktop" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;

        modules = [
            hyprland.homeManagerModules.default
            {wayland.windowManager.hyprland.enable = true;}
        ];
    };

  	nixosConfigurations = {
		cody-desktop = nixpkgs.lib.nixosSystem {
			specialArgs = { inherit inputs system; };


			modules = [
				./nixos/configuration.nix
			];
		};
	};
  };
}
