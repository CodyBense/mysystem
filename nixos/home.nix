# PROGRAMS to get to dotfile configuration control
{ config, inputs, pkgs, ... }:

let 
gruvboxPlus = import ./hm_modules/gruvbox-plus.nix { inherit pkgs; };
in
{
# import home-manager modules
    imports = [
         inputs.nix-colors.homeManagerModules.default
         ./hm_modules/firefox.nix
         ./hm_modules/kitty.nix
         ./hm_modules/git.nix
         ./hm_modules/bashrc.nix
         ./hm_modules/fzf.nix
         ./hm_modules/fzf.nix
         ./hm_modules/oh-my-posh.nix
         ./hm_modules/direnv.nix
         ./hm_modules/hyprland.nix
         ./hm_modules/waybar.nix
         ./hm_modules/hyprlock.nix
    ];

    home.username = "codybense";
    home.homeDirectory = "/home/codybense";

    home.stateVersion = "23.11"; # Please read the comment before changing.

# The home.packages option allows you to install Nix packages into your
# environment.
        home.packages = [
        ];

# Home Manager is pretty good at managing dotfiles. The primary way to manage
# plain files is through 'home.file'.
    home.file = {
        ".icons/bibata-cursors".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Ice";
    };

    home.sessionVariables = {
    };

    colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-medium;

# Let Home Manager install and manage itself.
    programs.home-manager.enable = true;


# PROGRAMS
## swaylock
# programs.swaylock = {
#     enable = true;
#     package = pkgs.swaylock-effects;
#     settings = {
#         indicator=true;
#         ignore-empty-password=true;
#         indicator-thickness=15;
#         indicator-radius=150;
#         image="~/mysystem/wallpapers/gruvbox-mountian-village.png";
#         clock=true;
#         effect-blur="7x5";
#         effect-vignettee="0.5:0.5";
#         ring-color="98971a";
#         key-hl-color="cc241d";
#         line-color="00000000";
#         inside-color="00000088";
#         inside-clear-color="00000088";
#         text-color="d79921";
#         text-clear-color="daa520";
#         ring-clear-color="890051";
#         separator-color="00000000";
#         grace="0";
#         fade-in="0.5";
#         font="Caskaydia Cove Nerd Font Mono";
#     };
# };


# enable gtk
    gtk.enable = true;

    gtk.cursorTheme.package = pkgs.bibata-cursors;
    gtk.cursorTheme.name = "Bibata-Modern-Ice";

    # gtk.theme.package = pkgs.gruvbox-gtk-theme;
    # gtk.theme.name = "gruvbox-gtk-theme";
    
    gtk.theme.package = pkgs.adw-gtk3;
    gtk.theme.name = "adw-gtk3";

    # gtk.iconTheme.package = gruvboxPlus;
    # gtk.iconTheme.name = "GruvboxPlus";

    gtk.iconTheme.package = pkgs.gruvbox-dark-icons-gtk;
    gtk.iconTheme.name = "gruvbox-dark-icons-gtk";

# enable qt
    qt.enable = true;

# platform theme "gtk" or "gnome"
    qt.platformTheme = "qtct";
    # qt.platformTheme = "kde";

# name of the qt theme
    qt.style.name = "adwaita-dark";

# packages to use
    qt.style.package = pkgs.adwaita-qt;
}
