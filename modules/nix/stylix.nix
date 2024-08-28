{ pkgs, ... }:
{
    stylix = {
        enable = false;
        image = ../../config/wallpapers/latios_latias.jpg;
        polarity = "dark";
        cursor.package = pkgs.bibata-cursors;
        cursor.name = "Bibata-Modern-Ice";
        cursor.size = 24;
        fonts = {
            monospace = {
                package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
                name = "JetBrainsMono Nerd Font Mono";
            };
            sansSerif = {
                package = pkgs.dejavu_fonts;
                name = "Dejavu Sans";
            };
            serif = {
                package = pkgs.dejavu_fonts;
                name = "Dejavu Serif";
            };
            sizes = {
                applications = 12;
                terminal = 15;
                desktop = 10;
                popups = 10;
            };
        };
        opacity = {
            applications = 1.0;
            terminal = 0.75;
            desktop = 1.0;
            popups = 1.0;
        };
    };
}
