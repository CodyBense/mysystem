{ lib, config, inputs, pkgs, ... }:

{
    wayland.windowManager.hyprland = {
        enable = true;
        settings = {
            monitor = ",preferred,auto,auto";
            "exec-once" = "bash ~/config/hypr/start.sh";
            "$terminal" = "kitty";
            "$fileManager" = "dolphin";
            "$menu" = "rofi -show drun -show-items";
            "$browser" = "firefox";

            env = [
                "XCURSOR_SIZE,24"
                "QT_QPA_PLATFORTHEME,qt5ct"
            ];
        };
    };
}
