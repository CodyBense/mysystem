{ pkgs, ... }:
{
    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themse/gruvbux-dark-soft.yaml";
    stylix.image = "~/Pictures/Wallpapers/latios_latias.jpg";

    stylix.cursor.package = pkgs.bibata-cursors;
    stylix.cursor.name = "Bibata-Modern-Ice";

    stylix.fonts = {
        monospace = {
            package = pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];};
            name = "JetBrainsMono Nerd Fonts";
        };
        sansSerif = {
            package = pkgs.dejavu_fonts;
            name = "Dejavu Sans";
        };
        serif = {
            package = pkgs.dejavu_fonts;
            name = "Dejavu Serif";
        };
    };

    stylix.fonts.sizes = {
        applications = 12;
        terminal = 15;
        desktop = 10;
        popups = 10;
    };

    stylix.opacity = {
        applications = 1.0;
        terminal = 1.0;
        desktop = 1.0;
        popups = 1.0;
    };

    stylix.polarity = "dark";
}
