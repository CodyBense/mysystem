{ config, lib, pkgs, ... }:
let
    palette = config.colorScheme.palette;
in
{
    programs.wlogout = {
        enable = true;
        layout = [
           {
               label = "lock";
               action = "sleep 1; hyprlock";
               text = "Lock (L)";
               keybind = "l";
           }

           {
               label = "reboot";
               action = "sleep 1; systemctl reboot";
               text = "Reboot (R)";
               keybind = "r";
           }

           {
               label = "shutdown";
               action = "sleep 1; systemctl poweroff";
               text = "Shutdown (S)";
               keybind = "s";
           }

           {
               label = "logout";
               action = "sleep 1; hyprclt dispatch exit";
               text = "Logout (E)";
               keybind = "e";
           }

           {
               label = "suspend";
               action = "sleep 1; systemctl suspend";
               text = "Suspend (Z)";
               keybind = "z";
           }

           {
               label = "hibernate";
               action = "sleep 1; systemctl hibernate";
               text = "Hibernate (H)";
               keybind = "h";
           }
        ];

        style = ''
            window {
                font-family: BlexMono Nerd Font;
                font-size: 13pt;
                color: #${palette.base00}; /* text */
                background-color: rgba(40, 40, 40, 0.76);
            }

            button {
                background-repeat: no-repeat;
                background-position: center;
                background-size: 50%;
                border-style: solid;
                border-radius: 4px;
                border-width: 2px;
                border-color: #${palette.base00};
                background-color: #${palette.base00};
                margin: 10px;
                transition:
                    box-shadow 0.3s ease-in-out,
                    background-color 0.3s ease-in-out;
            }

            button:hover {
                background-color: #${palette.base0B};
                color: #${palette.base09};
            }

            button:focus {
                background-color: #${palette.base08};
                color: #${palette.base09};
            }

            #lock {
                background-image: image(url("/home/codybense/mysystem/config/wlogout/lock.png"));
            }
            #logout {
                background-image: image(url("/home/codybense/mysystem/config/wlogout/logout.png"));
            }
            #suspend {
                background-image: image(url("/home/codybense/mysystem/config/wlogout/suspend.png"));
            }
            #shutdown {
                background-image: image(url("/home/codybense/mysystem/config/wlogout/power.png"));
            }
            #reboot {
                background-image: image(url("/home/codybense/mysystem/config/wlogout/restart.png"));
            }
            #hibernate {
                background-image: image(url("/home/codybense/.config/wlogout/icons/hibernate.png"));
            }
        '';
    };
}
