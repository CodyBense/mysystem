# /PROGRAMS to get to dotfile configuration control
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
# Home Manager needs a bit of information about you and the paths it should
# manage.
    home.username = "codybense";
    home.homeDirectory = "/home/codybense";

# This value determines the Home Manager release that your configuration is
# compatible with. This helps avoid breakage when a new Home Manager release
# introduces backwards incompatible changes.
#
# You should not change this value, even if you update Home Manager. If you do
# want to update the value, then make sure to first check the Home Manager
# release notes.
    home.stateVersion = "23.11"; # Please read the comment before changing.

# The home.packages option allows you to install Nix packages into your
# environment.
        home.packages = [
# # Adds the 'hello' command to your environment. It prints a friendly
# # "Hello, world!" when run.
# pkgs.hello

# # It is sometimes useful to fine-tune packages, for example, by applying
# # overrides. You can do that directly here, just don't forget the
# # parentheses. Maybe you want to install Nerd Fonts with a limited number of
# # fonts?
# (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

# # You can also create simple shell scripts directly inside your
# # configuration. For example, this adds a command 'my-hello' to your
# # environment:
# (pkgs.writeShellScriptBin "my-hello" ''
#   echo "Hello, ${config.home.username}!"
# '')
        ];

# Home Manager is pretty good at managing dotfiles. The primary way to manage
# plain files is through 'home.file'.
    home.file = {
# # Building this configuration will create a copy of 'dotfiles/screenrc' in
# # the Nix store. Activating the configuration will then make '~/.screenrc' a
# # symlink to the Nix store copy.
# ".screenrc".source = dotfiles/screenrc;

# # You can also set the file content immediately.
# ".gradle/gradle.properties".text = ''
#   org.gradle.console=verbose
#   org.gradle.daemon.idletimeout=3600000
# '';
        ".icons/bibata-cursors".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Ice";
    };

# Home Manager can also manage your environment variables through
# 'home.sessionVariables'. If you don't want to manage your shell through Home
# Manager then you have to manually source 'hm-session-vars.sh' located at
# either
#
#  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  /etc/profiles/per-user/codybense/etc/profile.d/hm-session-vars.sh
#
    home.sessionVariables = {
# EDITOR = "emacs";
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
