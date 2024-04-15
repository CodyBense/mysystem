{ config, pkgs, ... }:

let 
 gruvboxPlus = import ./gruvbox-plus.nix { inherit pkgs; };
in
{
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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.git = {
 	enable = true;
	userName = "codybense";
	userEmail = "codybense@gmail.com";
	aliases = {
		pu = "push";
		co = "checkout";
		cm = "commit";
	};
 };

 programs.bash = {
     enable = true;
     shellAliases = {
         c = "clear";
         v = "nvim";
         sv = "sudo nvim";
         ll = "ls -l";
         ".." = "cd ..";
         "2." = "cd ../..";
         "3." = "cd ../../..";
         "4." = "cd ../../../..";
     };
 };

 programs.oh-my-posh = {
     enable = true;
     enableBashIntegration = true;
     useTheme = "gruvbox";
 };

 # wayland.windowManager.hyprland = {
 #     enable = true;
 #     settings = {
 #      "$mod" = "SUPER";
 #      bind = 
 #       [
 #        "$mod, F, exec, firefox"
 #        "$mod, T, exec, kitty"
	# "$mod, Q, kill"
 #       ]
 #       ++ (
 #        builtins.concatLists (builtins.genList (
 #        x: let
 #         ws = let
 #          c = (x + 1) / 10;
 #        in
 #         builtins.toString (x + 1 - (c * 10));
 #        in [
 #         "$mod, ${ws}, workspaces, ${toString (x + 1)}"
 #        ]
 #        )
 #        10)
 #       );
 #     };
 # };

 # enable gtk
 gtk.enable = true;

 gtk.cursorTheme.package = pkgs.bibata-cursors;
 gtk.cursorTheme.name = "Bibata-Modern-Ice";

 gtk.theme.package = pkgs.adw-gtk3;
 gtk.theme.name = "adw-gtk3";

 gtk.iconTheme.package = gruvboxPlus;
 gtk.iconTheme.name = "GruvboxPlus";

 # enable qt
 qt.enable = true;

 # platform theme "gtk" or "gnome"
 qt.platformTheme = "gtk";

 # name of the qt theme
 qt.style.name = "adwaita-dark";

 # packages to use
 qt.style.package = pkgs.adwaita-qt;
}
