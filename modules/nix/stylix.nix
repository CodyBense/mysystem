{ pkgs, config, lib, ... }:
{
    stylix.enable = true;
    stylix.autoEnable = true;

    stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
    stylix.image = ../../Wallpapers/latios_latias.jpg;

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
        terminal = 0.75;
        desktop = 1.0;
        popups = 1.0;
    };

    stylix.polarity = "dark";

    # Override settings
    home-manager.users.codybense.programs.wofi.style = lib.mkForce "*{ font-family: JetBrainsMono Nerd Font Mono,monospace; font-weight: bold;}";
    wayland.windowManager.hyprland.settings.general."col.active_border" =
        lib.mkForce "rgb(${config.stylix.base16Scheme.base0B})";
    # wayland.windowManager.hyprland.settings.general."col.active_border" =
    #     lib.mkForce "rgb(${config.stylix.base16Scheme.base0B})";
    # wayland.windowManager.hyprland.settings.general."col.active_border" =
    #     lib.mkForce "rgb(${config.stylix.base16Scheme.base0B}) rgb(${config.stylix.base16Scheme.base06} 45deg";
    # wayland.windowManager.hyprland.settings.general."col.inactive_border" =
    #     lib.nkForce "rgb(${config.stylix.base16Scheme.base00}) rbg(${config.stylix.base16Scheme.base06}) 45deg";
    # wayland.windowManager.hyprland.settings.group."col.border_active" =
    #     lib.mkForce "rgb(${config.stylix.base16Scheme.base0B}) rgb(${config.stylix.base16Scheme.base06} 45deg";
    # wayland.windowManager.hyprland.settings.group."col.border_inactive" =
    #     lib.nkForce "rgb(${config.stylix.base16Scheme.base00}) rbg(${config.stylix.base16Scheme.base06}) 45deg";
    # wayland.windowManager.hyprland.settings.group."col.border_locked_active" =
    #     lib.mkForce "rgb(${config.stylix.base16Scheme.base0B}) rgb(${config.stylix.base16Scheme.base06} 45deg";
    # wayland.windowManager.hyprland.settings.group."col.border_locked_inactive" =
    #     lib.mkForce "rgb(b4befecc) rgb(6c7086cc) 45deg";
}
