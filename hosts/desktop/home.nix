# PROGRAMS to get to dotfile configuration control
{ config, pkgs, inputs, username, host, gtkThemeFromScheme, ... }:
let
    palette = config.colorScheme.palette;
    inherit (import ./variables.nix)
        gitUsername
        gitEmail
        theme
        ;
in
{
    # Home Manager settings
    home.username = "${username}";
    home.homeDirectory = "/home/${username}";
    home.stateVersion = "23.11"; # Please read the comment before changing.

    # Set the Colorscheme
    colorScheme = inputs.nix-colors.colorSchemes."${theme}";

    # Import Program Configurations
    imports = [
        inputs.nix-colors.homeManagerModules.default
        inputs.hyprland.homeManagerModules.default
        ../../config/hyprland.nix
        ../../config/waybar.nix
        ../../config/wlogout.nix
        ../../config/swaync.nix
        ../../modules/home/gtk-qt/default.nix
        ../../modules/home/git.nix
        ../../modules/home/kitty.nix
        ../../modules/home/starship.nix
        ../../modules/home/zshrc.nix
        ../../modules/home/firefox.nix
        ../../modules/home/fzf.nix
        ../../modules/home/direnv.nix
        ../../modules/home/lf.nix
        ../../modules/home/tmux.nix
        ../../modules/home/hyprlock.nix
        ../../modules/home/wofi.nix
    ];

    # Define Settings For Xresources
    xresources.properties = {
        "Xcursor.size" = 24;
    };

    # Place Files Inside Home Directory
    home.file."Pictures/Wallpapers" = {
        source = ../../config/wallpapers;
        recursive = true;
    };

    home.file.".config/wlogout/icons" = {
        source = ../../config/wlogout;
        recursive = true;
    };

    home.file.".base16-themes".source = ../../config/base16-themes;
    home.file.".emoji".source = ../../config/emoji;
    home.file.".config/starship.toml".source = ../../config/starship.toml;

    # Scripts
    home.packages = [
        (import ../../scripts/randomPokemon.nix {inherit pkgs;})
        (import ../../scripts/start-hyprland.nix {inherit pkgs;})
        (import ../../scripts/change-wallpaper.nix {inherit pkgs;})
        (import ../../scripts/list-hypr-bindings.nix {inherit pkgs;})
        (import ../../scripts/rofi-launch.nix {inherit pkgs;})
        (import ../../scripts/rofi-wifi.nix {inherit pkgs;})
        (import ../../scripts/wallpaper-switcher.nix {
            inherit pkgs;
            inherit username;
        })
        (import ../../scripts/themechange.nix {
            inherit pkgs;
            inherit host;
            inherit username;
        })
        (import ../../scripts/theme-selector.nix {inherit pkgs;})
        (import ../../scripts/task-waybar.nix {inherit pkgs;})
        (import ../../scripts/emojipicker.nix {inherit pkgs;})
    ];

# Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
