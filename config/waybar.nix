{
  pkgs,
  lib,
  host,
  config,
  ...
}:

let
  betterTransition = "all 0.3s cubic-bezier(.55,-0.68,.48,1.682)";
  inherit (import ../hosts/${host}/variables.nix) clock24h;
in
with lib;
{
  # Configure & Theme Waybar
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    settings = [
      {
        layer = "top";
        position = "top";
        modules-center = [ "hyprland/workspaces" ];
        modules-left = [
          "custom/startmenu"
          "pulseaudio"
          "cpu"
          "memory"
          "idle_inhibitor"
        ];
        modules-right = [
          "custom/hyprbindings"
          "custom/notification"
          "custom/exit"
          "battery"
          "tray"
          "clock"
        ];

        "hyprland/workspaces" = {
          format = "{name}";
          format-icons = {
            default = " ";
            active = " ";
            urgent = " ";
          };
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
        };
        "clock" = {
          format = if clock24h == true then '' {:L%H:%M}'' else '' {:L%I:%M %p}'';
          tooltip = true;
          tooltip-format = "<big>{:%A, %d.%B %Y }</big>\n<tt><small>{calendar}</small></tt>";
        };
        "memory" = {
          interval = 5;
          format = " {}%";
          tooltip = true;
        };
        "cpu" = {
          interval = 5;
          format = " {usage:2}%";
          tooltip = true;
        };
        "network" = {
          format-icons = [
            "󰤯"
            "󰤟"
            "󰤢"
            "󰤥"
            "󰤨"
          ];
          format-ethernet = " {bandwidthDownOctets}";
          format-wifi = "{icon} {signalStrength}%";
          format-disconnected = "󰤮";
          tooltip = false;
        };
        "tray" = {
          spacing = 12;
        };
        "pulseaudio" = {
            format = "{icon} {volume}%";
            format-bluetooth = "{volume}% {icon}";
            format-bluetooth-muted = " {icon}";
            format-muted = "";
            format-source = " {volume}%";
            format-source-muted = "";
            format-icons = {
                headphone = "";
                hands-free = "";
                headset = "";
                phone = "";
                portable = "";
                car = "";
                default = [
                    ""
                    ""
                    ""
                ];
            };
            on-click = "sleep 0.1 && pavucontrol";
        };
        "custom/exit" = {
          tooltip = false;
          format = "";
          on-click = "sleep 0.1 && wlogout";
        };
        "custom/startmenu" = {
          tooltip = false;
          format = "";
          # exec = "rofi -show drun";
          on-click = "sleep 0.1 && wofi";
        };
        "custom/hyprbindings" = {
          tooltip = false;
          format = "󱕴";
          on-click = "sleep 0.1 && list-hypr-bindings";
        };
        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = "";
            deactivated = "";
          };
          tooltip = "true";
        };
        "custom/notification" = {
          tooltip = false;
          format = "{icon} {}";
          format-icons = {
            notification = "<span foreground='red'><sup></sup></span>";
            none = "";
            dnd-notification = "<span foreground='red'><sup></sup></span>";
            dnd-none = "";
            inhibited-notification = "<span foreground='red'><sup></sup></span>";
            inhibited-none = "";
            dnd-inhibited-notification = "<span foreground='red'><sup></sup></span>";
            dnd-inhibited-none = "";
          };
          return-type = "json";
          exec-if = "which swaync-client";
          exec = "swaync-client -swb";
          on-click = "sleep 0.1 && task-waybar";
          escape = true;
        };
        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-plugged = "󱘖 {capacity}%";
          format-icons = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          on-click = "";
          tooltip = false;
        };
      }
    ];
    style = concatStrings [
      ''
        * {
          font-size: 14px;
          border-radius: 0px;
          border: none;
          font-family: JetBrainsMono Nerd Font Mono;
          min-height: 0px;
        }
          window#waybar {
          background-color: #${config.stylix.base16Scheme.base00};
        }
        #workspaces {
          color: #${config.stylix.base16Scheme.base00};
          background: #${config.stylix.base16Scheme.base01};
          margin: 4px 4px;
          padding: 8px 5px;
          border-radius: 16px;
        }
        #workspaces button {
          font-weight: bold;
          padding: 0px 5px;
          margin: 0px 3px;
          border-radius: 16px;
          color: #${config.stylix.base16Scheme.base00};
          background: linear-gradient(45deg, #${config.stylix.base16Scheme.base0E}, #${config.stylix.base16Scheme.base0F}, #${config.stylix.base16Scheme.base0D}, #${config.stylix.base16Scheme.base09});
          background-size: 300% 300%;
          ${
            if waybarAnimations == true then
              ''
                animation: gradient_horizontal 15s ease infinite;
              ''
            else
              ''''
          }
          opacity: 0.5;
          transition: ${betterTransition};
        }
        #workspaces button.active {
          font-weight: bold;
          padding: 0px 5px;
          margin: 0px 3px;
          border-radius: 16px;
          color: #${config.stylix.base16Scheme.base00};
          background: linear-gradient(45deg, #${config.stylix.base16Scheme.base0E}, #${palette.base0F}, #${palette.base0D}, #${palette.base09});
          background-size: 300% 300%;
          ${
            if waybarAnimations == true then
              ''
                animation: gradient_horizontal 15s ease infinite;
              ''
            else
              ''''
          }
          transition: ${betterTransition};
          opacity: 1.0;
          min-width: 40px;
        }
        #workspaces button:hover {
          font-weight: bold;
          border-radius: 16px;
          color: #${config.stylix.base16Scheme.base00};
          background: linear-gradient(45deg, #${config.stylix.base16Scheme.base0E}, #${palette.base0F}, #${palette.base0D}, #${palette.base09});
          background-size: 300% 300%;
          ${
            if waybarAnimations == true then
              ''
                animation: gradient_horizontal 15s ease infinite;
              ''
            else
              ''''
          }
          opacity: 0.8;
          transition: ${betterTransition};
        }
        @keyframes gradient_horizontal {
          0% {
            background-position: 0% 50%;
          }
          50% {
            background-position: 100% 50%;
          }
          100% {
            background-position: 0% 50%;
          }
        }
        @keyframes swiping {
          0% {
            background-position: 0% 200%;
          }
          100% {
            background-position: 200% 200%;
          }
        }
        tooltip {
          background: #${config.stylix.base16Scheme.base00};
          border: 1px solid #${config.stylix.base16Scheme.base0E};
          border-radius: 12px;
        }
        tooltip label {
          color: #${config.stylix.base16Scheme.base07};
        }
        #window, #pulseaudio, #cpu, #memory, #idle_inhibitor {
          font-weight: bold;
          margin: 4px 0px;
          margin-left: 7px;
          padding: 0px 18px;
          color: #${config.stylix.base16Scheme.base05};
          background: #${config.stylix.base16Scheme.base01};
          border-radius: 24px 10px 24px 10px;
        }
        #custom-startmenu {
          color: #${config.stylix.base16Scheme.base0D};
          background: #${config.stylix.base16Scheme.base01};
          font-size: 24px;
          margin: 0px;
          padding: 0px 30px 0px 15px;
          border-radius: 0px 0px 40px 0px;
        }
        #custom-hyprbindings, #network, #custom-themeselector, #battery,
        #custom-notification, #tray, #custom-exit {
          font-weight: bold;
          background: #${config.stylix.base16Scheme.base01};
          color: #${config.stylix.base16Scheme.base05};
          margin: 4px 0px;
          margin-right: 7px;
          border-radius: 10px 24px 10px 24px;
          padding: 0px 18px;
        }
        #clock {
          font-weight: bold;
          color: #${config.stylix.base16Scheme.base00};
          background: linear-gradient(45deg, #${config.stylix.base16Scheme.base0C}, #${palette.base0F}, #${palette.base0B}, #${palette.base08});
          background-size: 300% 300%;
          ${
            if waybarAnimations == true then
              ''
                animation: gradient_horizontal 15s ease infinite;
              ''
            else
              ''''
          }
          margin: 0px;
          padding: 0px 15px 0px 30px;
          border-radius: 0px 0px 0px 40px;
        }
      ''
    ];
  };
}
