{ pkgs, ... }:

{
    # stylix.image =  ../../../wallpapers/ign_wifu.png;
    stylix.image = nil;
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
