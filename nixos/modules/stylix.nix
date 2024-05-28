{ pkgs, ... }:

{
    stylix.image =  /home/codybense/mysystem/wallpapers/ign_waifu.png;
    stylix.polarity = "dark";
    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    stylix.cursor.package = pkgs.bibata-cursors;
    stylix.cursor.name = "Bibata-Modern-Ice";

    stylix.fonts = {
        monospace = {
            package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
            name = "JetBrainsMono Nerd Font Mono";
        };
        sansSerif = {
            package = pkgs.dejavu_fonts;
            name = "DejaVu Sans";
        };
        serif = {
            package = pkgs.dejavu_fonts;
            name = "DejaVu Serif";
        };
    };
}
