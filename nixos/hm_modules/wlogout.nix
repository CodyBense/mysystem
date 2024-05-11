{ config, ... }:

{
    programs.wlogout = {
        enable = true;
        layout = [
           {
               label = "lock";
               action = "hyprlock";
               text = "Lock (L)";
               keybind = "l";
           }

           {
               label = "reboot";
               action = "systemctl reboot";
               text = "Reboot (R)";
               keybind = "r";
           }

           {
               label = "shutdown";
               action = "systemctl poweroff";
               text = "Shutdown (S)";
               keybind = "s";
           }

           {
               label = "logout";
               action = "hyprclt dispatch exit 0";
               text = "Logout (E)";
               keybind = "e";
           }

           {
               label = "suspend";
               action = "swaylock -f --grace 0; systemctl suspend -i";
               text = "Suspend (Z)";
               keybind = "z";
           }
        ];

        style = with config.colorScheme.colors;''
            window {
                font-family: BlexMono Nerd Font;
                font-size: 13pt;
                color: #${base00}; /* text */
                background-color: rgba(40, 40, 40, 0.76);
            }

            button {
                background-repeat: no-repeat;
                background-position: center;
                background-size: 50%;
                border-style: solid;
                border-radius: 4px;
                border-width: 2px;
                border-color: #${base00};
                background-color: #${base00};
                margin: 10px;
                transition:
                    box-shadow 0.3s ease-in-out,
                    background-color 0.3s ease-in-out;
            }

            button:hover {
                background-color: #${base0B};
                color: #${base09};
            }

            button:focus {
                background-color: #${base00};
                color: #${base08};
            }

            #lock {
                background-image: image(url("$HOME/mysystem/nixos/hm_modules/assets/wlogout/lock.png"));
            }
            #lock:focus {
                background-image: image(url("$HOME/mysystem/nixos/hm_modules/assets/wlogout/lock-hover.png"));
            }
            #lock:hover {
                background-image: image(url("$HOME/mysystem/nixos/hm_modules/assets/wlogout/lock-hover.png"));
            }

            #logout {
                background-image: image(url("$HOME/mysystem/nixos/hm_modules/assets/wlogout/logout.png"));
            }
            #logout:focus {
                background-image: image(url("$HOME/mysystem/nixos/hm_modules/assets/wlogout/logout-hover.png"));
            }
            #logout:hover {
                background-image: image(url("$HOME/mysystem/nixos/hm_modules/assets/wlogout/logout-hover.png"));
            }

            #suspend {
                background-image: image(url("$HOME/mysystem/nixos/hm_modules/assets/wlogout/sleep.png"));
            }
            #suspend:focus {
                background-image: image(url("$HOME/mysystem/nixos/hm_modules/assets/wlogout/sleep-hover.png"));
            }
            #suspend:hover {
                background-image: image(url("$HOME/mysystem/nixos/hm_modules/assets/wlogout/sleep-hover.png"));
            }

            #shutdown {
                background-image: image(url("$HOME/mysystem/nixos/hm_modules/assets/wlogout/power.png"));
            }
            #shutdown:focus {
                background-image: image(url("$HOME/mysystem/nixos/hm_modules/assets/wlogout/power-hover.png"));
            }
            #shutdown:hover {
                background-image: image(url("$HOME/mysystem/nixos/hm_modules/assets/wlogout/power-hover.png"));
            }

            #reboot {
                background-image: image(url("$HOME/mysystem/nixos/hm_modules/assets/wlogout/restart.png"));
            }
            #reboot:focus {
                background-image: image(url("$HOME/mysystem/nixos/hm_modules/assets/wlogout/restart-hover.png"));
            }
            #reboot:hover {
                background-image: image(url("$HOME/mysystem/nixos/hm_modules/assets/wlogout/restart-hover.png"));
            }
        '';
    };
}
