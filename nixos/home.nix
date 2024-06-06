# PROGRAMS to get to dotfile configuration control
{ config, inputs, pkgs, ... }:
let
    palette = config.colorScheme.palette;
    inherit (import ./variables.nix)
        theme
        ;
in

{
# import home-manager modules
    imports = [
         # inputs.nix-colors.homeManagerModules.default
         ./hm_modules/firefox.nix
         ./hm_modules/kitty.nix
         ./hm_modules/git.nix
         # ./hm_modules/bashrc.nix
         # ./hm_modules/oh-my-posh.nix
         ./hm_modules/fzf.nix
         ./hm_modules/direnv.nix
         ./hm_modules/hyprland.nix
         ./hm_modules/waybar.nix
         ./hm_modules/hyprlock.nix
         ./hm_modules/gtk-qt/default.nix
         ./hm_modules/lf.nix
         ./hm_modules/wlogout.nix
         ./hm_modules/zshrc.nix
         # ./hm_modules/starship.nix
         # ./hm_modules/spicetify.nix
         ./hm_modules/tmux.nix
         ./colors/colors.nix
    ];

    home.username = "codybense";
    home.homeDirectory = "/home/codybense";

    home.stateVersion = "23.11"; # Please read the comment before changing.

# The home.packages option allows you to install Nix packages into your
# environment.
        home.packages = [
        ];

    # colorScheme = inputs.nix-colors.colorSchemes."${theme}";

# Home Manager is pretty good at managing dotfiles. The primary way to manage
# plain files is through 'home.file'.
    home.file = {
        ".icons/bibata-cursors".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Ice";
        ".base16-theme".source = ./colors/base16-themes;
    };

    home.sessionVariables = {
    };


# Let Home Manager install and manage itself.
    programs.home-manager.enable = true;
}
