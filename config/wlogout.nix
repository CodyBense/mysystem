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

        syle = ''
            * {
                font-family: "JetBrainsMono NF", FontAwesome, sans-seriff;
                background-image: none;
                transitions: 20ms;
            }
            window {
                background-color: rgba(12, 12, 12, 0.1)
            }
            button {
                color: #${palette.base05};
                font-size:20px;
                background-repeat: no-repeat;
                background-position: center;
                background-size: 25%;
                border-style: solid;
                background-color: rgba(12, 12, 12, 0.3);
                border: 3px solid #${palette.base05};
                box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            }
            button:focus,
            button:active,
            button:hover {
              color: #${palette.base0E};
              background-color: rgba(12, 12, 12, 0.5);
              border: 3px solid #${palette.base0E};
            }
            #logout {
              margin: 10px;
              border-radius: 20px;
              background-image: image(url("icons/logout.png"));
            }
            #suspend {
              margin: 10px;
              border-radius: 20px;
              background-image: image(url("icons/suspend.png"));
            }
            #shutdown {
              margin: 10px;
              border-radius: 20px;
              background-image: image(url("icons/shutdown.png"));
            }
            #reboot {
              margin: 10px;
              border-radius: 20px;
              background-image: image(url("icons/reboot.png"));
            }
            #lock {
              margin: 10px;
              border-radius: 20px;
              background-image: image(url("icons/lock.png"));
            }
            #hibernate {
              margin: 10px;
              border-radius: 20px;
              background-image: image(url("icons/hibernate.png"));
            }
        '';

        # style = ''
        #     window {
        #         font-family: BlexMono Nerd Font;
        #         font-size: 13pt;
        #         color: #${palette.base00}; /* text */
        #         background-color: rgba(40, 40, 40, 0.76);
        #     }
        #
        #     button {
        #         background-repeat: no-repeat;
        #         background-position: center;
        #         background-size: 50%;
        #         border-style: solid;
        #         border-radius: 4px;
        #         border-width: 2px;
        #         border-color: #${palette.base00};
        #         background-color: #${palette.base00};
        #         margin: 10px;
        #         transition:
        #             box-shadow 0.3s ease-in-out,
        #             background-color 0.3s ease-in-out;
        #     }
        #
        #     button:hover {
        #         background-color: #${palette.base0B};
        #         color: #${palette.base09};
        #     }
        #
        #     button:focus {
        #         background-color: #${palette.base08};
        #         color: #${palette.base09};
        #     }
        #
        #     #lock {
        #         background-image: image(url("/home/codybense/mysystem/config/wlogout/lock.png"));
        #     }
        #     #lock:focus {
        #         background-image: image(url("/home/codybense/mysystem/config/wlogout/lock-hover.png"));
        #     }
        #     #lock:hover {
        #         background-image: image(url("/home/codybense/mysystem/config/wlogout/lock-hover.png"));
        #     }
        #
        #     #logout {
        #         background-image: image(url("/home/codybense/mysystem/config/wlogout/logout.png"));
        #     }
        #     #logout:focus {
        #         background-image: image(url("/home/codybense/mysystem/config/wlogout/logout-hover.png"));
        #     }
        #     #logout:hover {
        #         background-image: image(url("/home/codybense/mysystem/config/wlogout/logout-hover.png"));
        #     }
        #
        #     #suspend {
        #         background-image: image(url("/home/codybense/mysystem/config/wlogout/sleep.png"));
        #     }
        #     #suspend:focus {
        #         background-image: image(url("/home/codybense/mysystem/config/wlogout/sleep-hover.png"));
        #     }
        #     #suspend:hover {
        #         background-image: image(url("/home/codybense/mysystem/config/wlogout/sleep-hover.png"));
        #     }
        #
        #     #shutdown {
        #         background-image: image(url("/home/codybense/mysystem/config/wlogout/power.png"));
        #     }
        #     #shutdown:focus {
        #         background-image: image(url("/home/codybense/mysystem/config/wlogout/power-hover.png"));
        #     }
        #     #shutdown:hover {
        #         background-image: image(url("/home/codybense/mysystem/config/wlogout/power-hover.png"));
        #     }
        #
        #     #reboot {
        #         background-image: image(url("/home/codybense/mysystem/config/wlogout/restart.png"));
        #     }
        #     #reboot:focus {
        #         background-image: image(url("/home/codybense/mysystem/config/wlogout/restart-hover.png"));
        #     }
        #     #reboot:hover {
        #         background-image: image(url("/home/codybense/mysystem/config/wlogout/restart-hover.png"));
        #     }
        # '';
    };
}
