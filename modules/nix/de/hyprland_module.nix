{ inputs, lib, config, pkgs, ... }:
{
    options = {
        hyprland_module.enable = lib.mkEnableOption "enables hyprland_module";
    };

    config = lib.mkIf config.hyprland_module.enable{
        programs.hyprland = {
            enable = true;
            #nvidiaPatches = true;
            xwayland.enable = true;
            package = inputs.hyprland.packages."${pkgs.system}".hyprland;
        };

        environment.sessionVariables = {
            #WLR_NO_HARDWARE_CURSORS = "1";
            NIXOS_OZONE_WL = "1";
        };

        xdg.portal.enable = true;
        xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
}
