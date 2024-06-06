{ config,... }:
let
    palette = config.colorScheme.palette;
in
{
    programs.waybar = {
        enable = true;
        settings = {
            mainBar = {
                height = 28;
                layer = "top";
                position = "top";
                reload_style_on_changes = "true";

                modules-left = ["custom/launcher" "clock" "clock#date"];
                modules-center = ["hyprland/workspaces"];
                modules-right = ["custom/keybindings" "pulseaudio" "network" "battery" "custom/powermenu"];

                "hyprland/workspaces" = {
                    format = "{icon}";
                    disable-scroll = true;
                    all-outputs = true;
                    on-click = "activate";
                    format-icons = {
                        "1" = "I";
                        "2" = "II";
                        "3" = "III";
                        "4" = "IV";
                        "5" = "V";
                        "6" = "VI";
                        "7" = "VII";
                        "8" = "VIII";
                        "9" = "IX";
                        "10" = "X";
                    };
                };

                "custom/launcher" = {
                    interval = "once";
                    format = "";
# "on-click" = "pkill rofi || rofi --show drun --term=kitty --width=20% --height=50% --columns 1 -I";
                    on-click = "pkill rofi || rofi -show drun -show-items";
                    tooltip = false;
                };

                "custom/keybindings" = {
                    tooltip = false;
                    format = "";
                    on-click = "sleep 0.01 && list-hypr-bindings";
                };

                "clock" = {
                    format = " {:%H:%M}";
                };

                "clock#date" = {
                    format = " {:%A, %B %d, %Y}";
                };

                "network" = {
                    format-wifi = " {signalStrength}%";
                    format-ethernet = " {signalStrength}%";
                    format-disconnected = "󰤭";
                    on-click = "rofi-wifi";
                };


                "tray" = {
                    icon-size = 18;
                    rotate = 0;
                    spacing = 5;
                };


                "battery" = {
                    bat = "BAT0";
                    adapter = "ADP0";
                    interval = 60;
                    states = {
                        warning = 30;
                        critical = 15;
                    };
                    max-length = 10;
                    format = "{icon} {capacity}%";
                    format-warning = "{icon} {capacity}%";
                    format-critical = "{icon} {capacity}%";
                    format-charging = " {capacity}%";
                    format-plugged = " {capacity}%";
                    format-alt = "{icon} {capacity}%";
                    format-full = " 100%";
                    format-icons = ["" "" "" ""];
                };

                "pulseaudio" = {
                    format = "{icon} {volume}%";
                    format-bluetooth = "{icon}  {volume}%";
                    format-bluetooth-muted = "婢  muted";
                    format-muted = "婢 muted";
                    format-icons = {
                        headphone = "";
                        hands-free = "";
                        headset = "";
                        phone = "";
                        portable = "";
                        car = "";
                        default = [""  ""  ""];
                    };
                };

                "custom/powermenu" = {
                    format = ""; # on-click = "pkill wofi || sh .config/wofi/scripts/powermenu.sh 'everforest-light' '--height=17% -o $MAIN_DISPLAY'";
                    on-click = "wlogout";
                    tooltip = false;
                };
            };
            };

        style =  ''
            @import "../waybar/colors/gruv-box.css";

            * {
                border: none;
                font-family: JetBrainsMono Nerd Font, FontAwesome;
                font-size: 11px;
                font-weight: bold;
                min-height: 0;
            }

            window#waybar {
                background-color: #${palette.base00};
                color: #${palette.base06};
            }

            #clock,
            #custom-launcher,
            #clock-date,
            #workspaces,
            #pulseaudio,
            #network,
            #battery,
            #workspaces,
            #custom-keybindings,
            #custom-powermenu {
                color: #${palette.base05};
                background: #${palette.base01};
                padding: 0 0.6em;
                margin-right: 4px; 
                margin-left: 2px;
                margin-top: 4px;
                margin-bottom: 4px;
                border-radius: 0px;
            }



            #workspaces button.active {
                color: #${palette.base06};
                background: #${palette.base03};
            }

            #custom-launcher {
                background-color: #${palette.base0B};
                color: #${palette.base00};

                margin-left: 15px;
                padding-left: 20px;
                padding-right: 21px;
            }

            #custom-powermenu {
                background-color: #${palette.base08};
                color: #${palette.base00};

                margin-right: 15px;
                padding-left: 20px;
                padding-right: 23px;
            }
        '';
    };
}
