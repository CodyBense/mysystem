{ pkgs, lib, spicetify-nix, ... }:
let
  spicePkgs = spicetify-nix.packages.${pkgs.system}.default;
in
{
  # allow spotify to be installed if you don't have unfree enabled already
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "spotify"
  ];

  # import the flake's module for your system
  imports = [ spicetify-nix.homeManagerModule ];

  # configure spicetify :)
  programs.spicetify =
    {
      enable = true;
      theme = spicePkgs.themes.Onepunch;

      enabledExtensions = with spicePkgs.extensions; [
        fullAppDisplay
        keyboardShortcut
        bookmark
        loopyLoop
        popupLyrics
        shuffle
        powerBar
        playlistIcons
        playlistIntersection
        skipStats
        songStats
        history
        fullScreen
        historyShortcut
        ];
    };
}
