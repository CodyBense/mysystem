{ pkgs, config, lib, inputs, stylix, ... }:

let
    terminal = "kitty";
in
# with lib;

{
    wayland.windowManager.hyprland = {
        enable = true;
        xwayland.enable = true;
        systemd.enable = true;
        extraConfig = 
            let
                modifier = "SUPER";
                browser = "brave";
                username = "codybense";
                extraMonitorSettings = "";
            in
            lib.concatStrings [
                ''
                    env = NIXOS_OZONE_WL, 1
                    env = NIXPKGS_ALLOW_UNFREE, 1
                    env = XDG_CURRENT_DESKTOP, Hyprland
                    env = XDG_SESSION_TYPE, wayland
                    env = XDG_SESSION_DESKTOP, Hyprland
                    env = GDK_BACKEND, wayland, x11
                    env = CLUTTER_BACKEND, wayland
                    env = QT_QPA_PLATFORM=wayland;xcb
                    env = QT_WAYLAND_DISABLE_WINDOWDECORATION, 1
                    env = QT_AUTO_SCREEN_SCALE_FACTOR, 1
                    env = SDL_VIDEODRIVER, x11
                    env = MOZ_ENABLE_WAYLAND, 1

                    exec-once = dbus-update-activation-environment --systemd --all
                    exec-once = systemctl --user import-environment QT_QPA_PLATFORMTHEME WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
                    exec-once = killall -q swww;sleep .5 && swww init
                    exec-once = killall -q waybar;sleep .5 && waybar
                    exec-once = killall -q swaync;sleep .5 && swaync
                    exec-once = nm-applet --indicator
                    exec-once = lxqt-policykit-agent
                    exec-once = sleep 1.5 && swww img /home/${username}/Pictures/Wallpapers/beautifulmountainscape.jpg
                    monitor=,preferred,auto,1
                    ${extraMonitorSettings}

                    general {
                        allow_tearing = true
                        border_size = 2
                        col.active_border = rgb(${config.stylix.base16Scheme.base0B}) rgb(${config.stylix.base16Scheme.base06}) 45deg 
                        col.inactive_border = rgb(${config.stylix.base16Scheme.base00}) rgb(${config.stylix.base16Scheme.base06}) 45deg
                        gaps_in = 6
                        gaps_out = 8
                        layout = dwindle
                        resize_on_border = true
                    }

                    input {
                        kb_layout = us
                        kb_options = grp:alt_shift_toggle
                        kb_options = caps:super
                        follow_mouse = 1
                        touchpad {
                            natural_scroll = false
                            disable_while_typing = true
                            scroll_factor = 0.8
                        }
                        sensitivity = 0
                    }

                    windowrule = noborder,^(wofi)$
                    windowrule = center,^(wofi)$
                    windowrule = center,^(steam)$
                    windowrule = float, nm-connection-editor|blueman-manager
                    windowrule = float, swayimg|vlc|Viewnior|pavycontrol
                    windowrule = float, nwg-lock|qt5ct|mpv
                    windowrule = float, zoom
                    windowrulev2 = stayfocused, title:^()$,class:^(steam)$
                    windowrulev2 = minsize 1 1, title:^()$,class:^(steam)$
                    windowrulev2 = opacity 0.9 0.7, class:^(Brave)$
                    windowrulev2 = opacity 0.9 0.7, class:^(thunar)$

                    gestures {
                        workspace_swipe = true
                        workspace_swipe_fingers = 3
                    }

                    misc {
                        initial_workspace_tracking = 0
                        mouse_move_enables_dpms = true
                        key_press_enables_dpms = false
                    }

                    animations {
                        enabled = yes
                        bezier = wind, 0.05, 0.9, 0.1, 1.05
                        bezier = winIn, 0.1, 1.1, 0.1, 1.1
                        bezier = winOut, 0.3, -0.3, 0, 1
                        bezier = liner, 1, 1, 1, 1
                        animation = windows, 1, 6, wind, slide
                        animation = windowsIn, 1, 6, winIn, slide
                        animation = windowsOut, 1, 5, winOut, slide
                        animation = windowsMove, 1, 5, wind, slide
                        animation = border, 1, 1, liner
                        animation = fade, 1, 10, default
                        animation = workspaces, 1, 5, wind
                    }

                    decoration {
                        blur {
                            enabled = true
                                ignore_opacity = off
                                new_optimizations = on
                                passes = 3
                                size = 5
                                special = true
                                xray = false
                        }
                        dim_special = 0.3
                        drop_shadow = false
                        rounding = 10
                        shadow_range = 4
                        shadow_render_power = 3
                        col.shadow = rgba(1a1a1aee)
                    }

                    device {
                        name = epic-mouse-v1
                        sensitivity = -0.5
                    }

                    dwindle {
                        no_gaps_when_only = 1
                        preserve_split = true
                        pseudotile = true
                    }

                    bind = ${modifier}, T, exec, ${terminal}
                    bind = ${modifier}, Space, exec, rofi-launcher
                    bind = ${modifier}SHIFT, W, exec, web-search
                    bind = ${modifier}ALT, W, exec, wallsetter
                    bind = ${modifier}, F, exec, ${browser}
                    bind = ${modifier}, PERIOD, exec, emojipicker
                    bind = ${modifier}, E, exec, thunar
                    bind = ${modifier}, M, exec, spotify
                    bind = ${modifier}, Q, killactive,
                    bind = ${modifier}, DELETE, exit, 
                    bind = ${modifier}, V, togglefloating,
                    bind = ${modifier} SHIFT, V, fullscreen
                    bind = ${modifier}, P, pseudo,
                    bind = ${modifier}, BACKSPACE, exec, wlogout
                    bind = ${modifier} ALT, L, exec, hyprlock
                    bind = ${modifier}, H, movefocus, l
                    bind = ${modifier}, L, movefocus, r
                    bind = ${modifier}, K, movefocus, u
                    bind = ${modifier}, J, movefocus, d
                    bind = ${modifier}SHIFT, H, movewindow, l
                    bind = ${modifier}SHIFT, L, movewindow, r
                    bind = ${modifier}SHIFT, K, movewindow, u
                    bind = ${modifier}SHIFT, J, movewindow, d
                    bind = ${modifier}CTRL, H, resizeactive, -30 0
                    bind = ${modifier}CTRL, L, resizeactive, 30 0
                    bind = ${modifier}CTRL, K, resizeactive, 0 -30
                    bind = ${modifier}CTRL, J, resizeactive, 0 30
                    bind = ${modifier}, 1, workspace, 1
                    bind = ${modifier}, 2, workspace, 2
                    bind = ${modifier}, 3, workspace, 3
                    bind = ${modifier}, 4, workspace, 4
                    bind = ${modifier}, 5, workspace, 5
                    bind = ${modifier}, 6, workspace, 6
                    bind = ${modifier}, 7, workspace, 7
                    bind = ${modifier}, 8, workspace, 8
                    bind = ${modifier}, 9, workspace, 9
                    bind = ${modifier}, 0, workspace, 10
                    bind = ${modifier}SHIFT, 1, movetoworkspace, 1
                    bind = ${modifier}SHIFT, 2, movetoworkspace, 2
                    bind = ${modifier}SHIFT, 3, movetoworkspace, 3
                    bind = ${modifier}SHIFT, 4, movetoworkspace, 4
                    bind = ${modifier}SHIFT, 5, movetoworkspace, 5
                    bind = ${modifier}SHIFT, 6, movetoworkspace, 6
                    bind = ${modifier}SHIFT, 7, movetoworkspace, 7
                    bind = ${modifier}SHIFT, 8, movetoworkspace, 8
                    bind = ${modifier}SHIFT, 9, movetoworkspace, 9
                    bind = ${modifier}SHIFT, 0, movetoworkspace, 10
                    bind = ${modifier}CTRL, 1, movetoworkspacesilent, 1
                    bind = ${modifier}CTRL, 2, movetoworkspacesilent, 2
                    bind = ${modifier}CTRL, 3, movetoworkspacesilent, 3
                    bind = ${modifier}CTRL, 4, movetoworkspacesilent, 4
                    bind = ${modifier}CTRL, 5, movetoworkspacesilent, 5
                    bind = ${modifier}CTRL, 6, movetoworkspacesilent, 6
                    bind = ${modifier}CTRL, 7, movetoworkspacesilent, 7
                    bind = ${modifier}CTRL, 8, movetoworkspacesilent, 8
                    bind = ${modifier}CTRL, 9, movetoworkspacesilent, 9
                    bind = ${modifier}CTRL, 0, movetoworkspacesilent, 10
                    bind = ${modifier}, S, togglespecialworkspace, magic
                    bind = ${modifier}SHIFT, S, movetoworkspace, special:magic
                    bind = ${modifier}SHIFT, I, togglesplit
                    bind = ${modifier}, mouse_down, workspace, e+1
                    bind = ${modifier}, mouse_up, workspace, e-1
                    bind = , XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
                    bind = , XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%- 
                    bind = , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
                    bind = , XF86MonBrightnessDown, exec, brightnessctl set 5%-
                    bind = , XF86MonBrightnessUp, exec, brightnessctl set +5%

                    bindm = ${modifier}, mouse:272, movewindow
                    bindm = ${modifier}, mouse:273, resizewondow
                ''
            ];
    };
}
