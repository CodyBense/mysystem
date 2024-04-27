# /PROGRAMS to get to dotfile configuration control
{ config, pkgs, ... }:

let 
gruvboxPlus = import ./gruvbox-plus.nix { inherit pkgs; };
in
{
# Home Manager needs a bit of information about you and the paths it should
# manage.
    home.username = "codybense";
    home.homeDirectory = "/home/codybense";

# This value determines the Home Manager release that your configuration is
# compatible with. This helps avoid breakage when a new Home Manager release
# introduces backwards incompatible changes.
#
# You should not change this value, even if you update Home Manager. If you do
# want to update the value, then make sure to first check the Home Manager
# release notes.
    home.stateVersion = "23.11"; # Please read the comment before changing.

# The home.packages option allows you to install Nix packages into your
# environment.
        home.packages = [
# # Adds the 'hello' command to your environment. It prints a friendly
# # "Hello, world!" when run.
# pkgs.hello

# # It is sometimes useful to fine-tune packages, for example, by applying
# # overrides. You can do that directly here, just don't forget the
# # parentheses. Maybe you want to install Nerd Fonts with a limited number of
# # fonts?
# (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

# # You can also create simple shell scripts directly inside your
# # configuration. For example, this adds a command 'my-hello' to your
# # environment:
# (pkgs.writeShellScriptBin "my-hello" ''
#   echo "Hello, ${config.home.username}!"
# '')
        ];

# Home Manager is pretty good at managing dotfiles. The primary way to manage
# plain files is through 'home.file'.
    home.file = {
# # Building this configuration will create a copy of 'dotfiles/screenrc' in
# # the Nix store. Activating the configuration will then make '~/.screenrc' a
# # symlink to the Nix store copy.
# ".screenrc".source = dotfiles/screenrc;

# # You can also set the file content immediately.
# ".gradle/gradle.properties".text = ''
#   org.gradle.console=verbose
#   org.gradle.daemon.idletimeout=3600000
# '';
        ".icons/bibata-cursors".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Ice";
    };

# Home Manager can also manage your environment variables through
# 'home.sessionVariables'. If you don't want to manage your shell through Home
# Manager then you have to manually source 'hm-session-vars.sh' located at
# either
#
#  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
#
# or
#
#  /etc/profiles/per-user/codybense/etc/profile.d/hm-session-vars.sh
#
    home.sessionVariables = {
# EDITOR = "emacs";
    };

# Let Home Manager install and manage itself.
    programs.home-manager.enable = true;


# PROGRAMS
## kitty
    programs.kitty = {
        enable = true;
        font = {
            name = "JetBrains Mono";
            package = pkgs.jetbrains-mono;
            size = 9;
        };
        theme = "Gruvbox Material Dark Hard";
        settings = {
            window_padding_width = 25;
            enable_audio_bell = false;
# bold_font = auto;
# italic_font = auto;
# bold_italic_font = auto;
        };
    };

## git
    programs.git = {
        enable = true;
        userName = "CodyBense";
        userEmail = "codybense@gmail.com";
        aliases = {
            a = "add";
            pu = "push";
            co = "checkout";
            cm = "commit";
        };
    };

## bachrc
    programs.bash = {
        enable = true;
        enableCompletion = true;
        shellAliases = {
            c = "clear";
            v = "nvim";
            sv = "sudo nvim";
            ll = "ls -l";
            la = "ls -a";
            ".." = "cd ..";
            "2." = "cd ../..";
            "3." = "cd ../../..";
            "4." = "cd ../../../..";
            py = "python3";
            pm = "./pm_cli.sh";
        };
        bashrcExtra = ''
            eval "$(zoxide init bash)"
            eval "$(direnv hook bash)"
        '';
    };

## fzf
    programs.fzf = {
        enable = true;
        enableBashIntegration = true;
    };

## oh-my-posh
    programs.oh-my-posh = {
        enable = true;
        enableBashIntegration = true;
        useTheme = "gruvbox";
    };

## hyprland
# wayland.windowManager.hyprland = {
#     enable = true;
#     settings = {
#         monitor = ",preferred,auto,auto";
#         "exec-once" = "bash ~/.config/hypr/start.sh";
#         "$terminal" = "kitty";
#         "$fileManager" = "dolphin";
#         "$menu" = "rofi -show drun -show-items";
#         "$browser" = "firefox";
#
#
#         env = [
#             "XCURSOR_SIZE,24"
#             "QT_QPA_PLATFORMTHEME,qt5ct" # change to qt6ct if you have that
#             "PATH,$PATH:$scrPath"
#             "XDG_CURRENT_DESKTOP,Hyprland"
#             "XDG_SESSION_TYPE,wayland"
#             "XDG_SESSION_DESKTOP,Hyprland"
#             "QT_QPA_PLATFORM,wayland"
#             "QT_QPA_PLATFORMTHEME,qt6ct"
#             "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
#             "QT_AUTO_SCREEN_SCALE_FACTOR,1"
#             "MOZ_ENABLE_WAYLAND,1"
#             "GDK_SCALE,1"
#         ];
#     };
# };

# Need to convert to the above block
    home.file.".config/hypr/hyprland.conf".text = ''

# █▀▄▀█ █▀█ █▄░█ █ ▀█▀ █▀█ █▀█
# █░▀░█ █▄█ █░▀█ █ ░█░ █▄█ █▀▄
        monitor=,preferred,auto,auto

# █▀ █▀█ █░█ █▀█ █▀▀ █▀▀
# ▄█ █▄█ █▄█ █▀▄ █▄▄ ██▄
# Source a file (multi-file configs)
# source = ~/.config/hypr/myColors.conf
        $scrPath = $HOME/mysystem/scripts

# Set programs that you use
        $terminal = kitty
        $fileManager = dolphin
        $menu = rofi -show drun -show-items
        $browser = firefox

# █░░ ▄▀█ █░█ █▄░█ █▀▀ █░█
# █▄▄ █▀█ █▄█ █░▀█ █▄▄ █▀█
        exec-once = bash $scrPath/start.sh

# █▀▀ █▄░█ █░█
# ██▄ █░▀█ ▀▄▀
# Some default env vars.
        env = XCURSOR_SIZE,24
        env = QT_QPA_PLATFORMTHEME,qt5ct # change to qt6ct if you have that
        env = PATH,$PATH:$scrPath
        env = XDG_CURRENT_DESKTOP,Hyprland
        env = XDG_SESSION_TYPE,wayland
        env = XDG_SESSION_DESKTOP,Hyprland
        env = QT_QPA_PLATFORM,wayland
        env = QT_QPA_PLATFORMTHEME,qt5ct
        env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
        env = QT_AUTO_SCREEN_SCALE_FACTOR,1
        env = MOZ_ENABLE_WAYLAND,1
        env = GDK_SCALE,1

# █ █▄░█ █▀█ █░█ ▀█▀
# █ █░▀█ █▀▀ █▄█ ░█░
# For all categories, see https://wiki.hyprland.org/Configuring/Variables/
        input {
            kb_layout = us
                kb_variant =
                kb_model =
                kb_options =
                kb_rules =

                follow_mouse = 2

                touchpad {
                    natural_scroll = no
                }

            sensitivity = 0 # -1.0 to 1.0, 0 means no modification.
        }

    device {
        name = epic-mouse-v1
            sensitivity = -0.5
    }

    gestures {
# See https://wiki.hyprland.org/Configuring/Variables/ for more
        workspace_swipe = true
            workspace_swipe_fingers = 3
    }

    general {
        gaps_in = 3
            gaps_out = 8
            border_size = 2
            col.active_border = rgb(98971a) rgb(ebdbb2) 45deg
            col.inactive_border = rgb(282828) rgb(ebdbb2) 45deg
            layout = dwindle
            allow_tearing = true
            resize_on_border = true
    }

    group {
        col.border_active = rgb(98971a) rgb(ebdbb2) 45deg
            col.border_inactive = rgb(282828) rgb(ebdbb2) 45deg
            col.border_locked_active = rgb(98971a) rgb(ebdbb2) 45deg
            col.border_locked_inactive = rgba(b4befecc) rgba(6c7086cc) 45deg
    }

    decoration {
        rounding = 10
            drop_shadow = false

            dim_special = 0.3

            blur {
                enabled = yes
                    size = 6
                    passes = 3
                    new_optimizations = on
                    ignore_opacity = on
                    xray = false
                    special = true
            }
    }

    layerrule = blur,waybar

# ▄▀█ █▄░█ █ █▀▄▀█ ▄▀█ ▀█▀ █ █▀█ █▄░█
# █▀█ █░▀█ █ █░▀░█ █▀█ ░█░ █ █▄█ █░▀█
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
                animation = borderangle, 1, 30, liner, loop
                animation = fade, 1, 10, default
                animation = workspaces, 1, 5, wind
        }

# █░░ ▄▀█ █▄█ █▀█ █░█ ▀█▀ █▀
# █▄▄ █▀█ ░█░ █▄█ █▄█ ░█░ ▄█
    dwindle {
# See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
            preserve_split = yes # you probably want this
    }

    master {
# See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
        new_is_master = true
    }

# █▀▄▀█ █ █▀ █▀▀
# █░▀░█ █ ▄█ █▄▄

    misc {
# See https://wiki.hyprland.org/Configuring/Variables/ for more
        vrr = 0
            disable_hyprland_logo = true
            disable_splash_rendering = true
            force_default_wallpaper = 0 # Set to 0 or 1 to disable the anime mascot wallpapers
    }

    xwayland {
        force_zero_scaling = true
    }


# █░█░█ █ █▄░█ █▀▄ █▀█ █░█░█   █▀█ █░█ █░░ █▀▀ █▀
# ▀▄▀▄▀ █ █░▀█ █▄▀ █▄█ ▀▄▀▄▀   █▀▄ █▄█ █▄▄ ██▄ ▄█
windowrulev2 = suppressevent maximize, class:.* # You'll probably like this.
windowrulev2 = opacity 0.90 0.90,class:^(firefox)$
windowrulev2 = opacity 0.90 0.90,class:^(Brave-browser)$
windowrulev2 = opacity 0.80 0.80,class:^(Steam)$
windowrulev2 = opacity 0.80 0.80,class:^(steam)$
windowrulev2 = opacity 0.80 0.80,class:^(steamwebhelper)$
windowrulev2 = opacity 0.80 0.80,class:^(Spotify)$
windowrulev2 = opacity 0.80 0.80,initialTitle:^(Spotify Free)$
windowrulev2 = opacity 0.80 0.80,class:^(code-oss)$
windowrulev2 = opacity 0.80 0.80,class:^(Code)$
windowrulev2 = opacity 0.80 0.80,class:^(code-url-handler)$
windowrulev2 = opacity 0.80 0.80,class:^(kitty)$
windowrulev2 = opacity 0.80 0.80,class:^(org.kde.dolphin)$
windowrulev2 = opacity 0.80 0.80,class:^(org.kde.ark)$
windowrulev2 = opacity 0.80 0.80,class:^(nwg-look)$
windowrulev2 = opacity 0.80 0.80,class:^(qt5ct)$
windowrulev2 = opacity 0.80 0.80,class:^(qt6ct)$
windowrulev2 = opacity 0.80 0.80,class:^(kvantummanager)$

windowrulev2 = opacity 0.90 0.90,class:^(com.github.rafostar.Clapper)$ #Clapper-Gtk
windowrulev2 = opacity 0.80 0.80,class:^(com.github.tchx84.Flatseal)$ #Flatseal-Gtk
windowrulev2 = opacity 0.80 0.80,class:^(hu.kramo.Cartridges)$ #Cartridges-Gtk
windowrulev2 = opacity 0.80 0.80,class:^(com.obsproject.Studio)$ #Obs-Qt
windowrulev2 = opacity 0.80 0.80,class:^(gnome-boxes)$ #Boxes-Gtk
windowrulev2 = opacity 0.80 0.80,class:^(discord)$ #Discord-Electron
windowrulev2 = opacity 0.80 0.80,class:^(WebCord)$ #WebCord-Electron
windowrulev2 = opacity 0.80 0.80,class:^(ArmCord)$ #ArmCord-Electron
windowrulev2 = opacity 0.80 0.80,class:^(app.drey.Warp)$ #Warp-Gtk
windowrulev2 = opacity 0.80 0.80,class:^(net.davidotek.pupgui2)$ #ProtonUp-Qt
windowrulev2 = opacity 0.80 0.80,class:^(yad)$ #Protontricks-Gtk
windowrulev2 = opacity 0.80 0.80,class:^(Signal)$ #Signal-Gtk
windowrulev2 = opacity 0.80 0.80,class:^(io.github.alainm23.planify)$ #planify-Gtk
windowrulev2 = opacity 0.80 0.80,class:^(io.gitlab.theevilskeleton.Upscaler)$ #Upscaler-Gtk
windowrulev2 = opacity 0.80 0.80,class:^(com.github.unrud.VideoDownloader)$ #VideoDownloader-Gtk

windowrulev2 = opacity 0.80 0.70,class:^(pavucontrol)$
windowrulev2 = opacity 0.80 0.70,class:^(blueman-manager)$
windowrulev2 = opacity 0.80 0.70,class:^(nm-applet)$
windowrulev2 = opacity 0.80 0.70,class:^(nm-connection-editor)$
windowrulev2 = opacity 0.80 0.70,class:^(org.kde.polkit-kde-authentication-agent-1)$

windowrulev2 = float,class:^(org.kde.dolphin)$,title:^(Progress Dialog — Dolphin)$
windowrulev2 = float,class:^(org.kde.dolphin)$,title:^(Copying — Dolphin)$
windowrulev2 = float,title:^(Picture-in-Picture)$
windowrulev2 = float,class:^(firefox)$,title:^(Library)$
windowrulev2 = float,class:^(vlc)$
windowrulev2 = float,class:^(kvantummanager)$
windowrulev2 = float,class:^(qt5ct)$
windowrulev2 = float,class:^(qt6ct)$
windowrulev2 = float,class:^(nwg-look)$
windowrulev2 = float,class:^(org.kde.ark)$
windowrulev2 = float,class:^(Signal)$ #Signal-Gtk
windowrulev2 = float,class:^(com.github.rafostar.Clapper)$ #Clapper-Gtk
windowrulev2 = float,class:^(app.drey.Warp)$ #Warp-Gtk
windowrulev2 = float,class:^(net.davidotek.pupgui2)$ #ProtonUp-Qt
windowrulev2 = float,class:^(yad)$ #Protontricks-Gtk
windowrulev2 = float,class:^(eog)$ #Imageviewer-Gtk
windowrulev2 = float,class:^(io.github.alainm23.planify)$ #planify-Gtk
windowrulev2 = float,class:^(io.gitlab.theevilskeleton.Upscaler)$ #Upscaler-Gtk
windowrulev2 = float,class:^(com.github.unrud.VideoDownloader)$ #VideoDownloader-Gkk
windowrulev2 = float,class:^(pavucontrol)$
windowrulev2 = float,class:^(blueman-manager)$
windowrulev2 = float,class:^(nm-applet)$
windowrulev2 = float,class:^(nm-connection-editor)$
windowrulev2 = float,class:^(org.kde.polkit-kde-authentication-agent-1)$
windowrulev2 = opacity 0.80 0.80,class:^(org.freedesktop.impl.portal.desktop.gtk)$
windowrulev2 = opacity 0.80 0.80,class:^(org.freedesktop.impl.portal.desktop.hyprland)$



# █░░ ▄▀█ █▄█ █▀▀ █▀█   █▀█ █░█ █░░ █▀▀ █▀
# █▄▄ █▀█ ░█░ ██▄ █▀▄   █▀▄ █▄█ █▄▄ ██▄ ▄█


layerrule = blur,rofi
layerrule = ignorezero,rofi
layerrule = blur,notifications
layerrule = ignorezero,notifications
layerrule = blur,swaync-notification-window
layerrule = ignorezero,swaync-notification-window
layerrule = blur,swaync-control-center
layerrule = ignorezero,swaync-control-center
layerrule = blur,logout_dialog

# █▄▀ █▀▀ █▄█ █▄▄ █ █▄░█ █▀▄ █ █▄░█ █▀▀ █▀
# █░█ ██▄ ░█░ █▄█ █ █░▀█ █▄▀ █ █░▀█ █▄█ ▄█

# See https://wiki.hyprland.org/Configuring/Keywords/ for more
$mainMod = SUPER

# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
bind = $mainMod, T, exec, $terminal
bind = $mainMod, Q, killactive, 
bind = $mainMod, DELETE, exit, 
bind = $mainMod, E, exec, $fileManager
bind = $mainMod, V, togglefloating, 
bind = $mainMod, A, exec, $menu
bind = $mainMod, P, pseudo, # dwindle
bind = $mainMod, F, exec, $browser
bind = $mainMod, M, exec, spotify
bind = $mainMod, BACKSPACE, exec, $scrPath/logout_launch.sh
bind = $mainMod ALT, L, exec, swaylock

# Move focus with mainMod + vim motions
bind = $mainMod, H, movefocus, l
bind = $mainMod, L, movefocus, r
bind = $mainMod, K, movefocus, u
bind = $mainMod, J, movefocus, d

# Move focused window with mainMod + Shift + vim motions
bind = $mainMod SHIFT, H, movewindow, l
bind = $mainMod SHIFT, L, movewindow, r
bind = $mainMod SHIFT, K, movewindow, u
bind = $mainMod SHIFT, J, movewindow, d

# Resize focused window with mainMod + CTRL + vim motions
bind = $mainMod CTRL, H, resizeactive, -30 0
bind = $mainMod CTRL, L, resizeactive, 30 0
bind = $mainMod CTRL, J, resizeactive, 0 -30
bind = $mainMod CTRL, K, resizeactive, 0 30


# Switch workspaces with mainMod + [0-9]
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           bind = $mainMod, 2, workspace, 2
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

# Move active window to a workspace silently with mainMod + CTRL + [0-9]
bind = $mainMod CTRL, 1, movetoworkspacesilent, 1
bind = $mainMod CTRL, 2, movetoworkspacesilent, 2
bind = $mainMod CTRL, 3, movetoworkspacesilent, 3
bind = $mainMod CTRL, 4, movetoworkspacesilent, 4
bind = $mainMod CTRL, 5, movetoworkspacesilent, 5
bind = $mainMod CTRL, 6, movetoworkspacesilent, 6
bind = $mainMod CTRL, 7, movetoworkspacesilent, 7
bind = $mainMod CTRL, 8, movetoworkspacesilent, 8
bind = $mainMod CTRL, 9, movetoworkspacesilent, 9
bind = $mainMod CTRL, 0, movetoworkspacesilent, 10

# Example special workspace (scratchpad)
bind = $mainMod, S, togglespecialworkspace, magic
bind = $mainMod SHIFT, S, movetoworkspace, special:magic

# Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

# Volume control
bind = , XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
bind = , XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
bind = , XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

# Brightness control
bind = , XF86MonBrightnessDown, exec, brightnessctl set 5%-
bind = , XF86MonBrightnessUp, exec, brightnessctl set +5%

#█▀▀ █░█ █▀█ █▀ █▀█ █▀█
#█▄▄ █▄█ █▀▄ ▄█ █▄█ █▀▄
exec = hyprctl setcursor Bibata-Modern-Ice 20
exec = gsettings set org.gnome.desktop.interface cursor-theme 'Bibata-Modern-Ice'
exec = gsettings set org.gnome.desktop.interface cursor-size 20
'';

## waybar
# programs.waybar = {
#     enable = true;
# };

## swaylock
programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;
    settings = {
        indicator=true;
        ignore-empty-password=true;
        indicator-thickness=15;
        indicator-radius=150;
        image="~/mysystem/wallpapers/gruvbox-mountian-village.png";
        clock=true;
        effect-blur="7x5";
        effect-vignettee="0.5:0.5";
        ring-color="98971a";
        key-hl-color="cc241d";
        line-color="00000000";
        inside-color="00000088";
        inside-clear-color="00000088";
        text-color="d79921";
        text-clear-color="daa520";
        ring-clear-color="890051";
        separator-color="00000000";
        grace="0";
        fade-in="0.5";
        font="Caskaydia Cove Nerd Font Mono";
    };
};

programs.firefox = {
    enable = true;
    profiles.default = {
        settings = {
            "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };

        userChrome = ''
            /*---+---+---+---+---+---+
              | G | L | O | B | A | L |
              +---+---+---+---+---+---*/


            :root {

                /*  Global Border Radius
                 *  applied to ALL UI elements
                 */ --uc-border-radius: 0px;


                /*  The distance the Statuspanel floats
                 *  away from the window border
                 *  0 places directly in the corner
                 */ --uc-status-panel-spacing: 12px;

            }


        /* remove window control buttons */
        .titlebar-buttonbox-container { display: none !important; }


#pageActionButton { display: none !important; }

#PanelUI-menu-button { padding: 0px !important; }
#PanelUI-menu-button .toolbarbutton-icon { width: 1px !important; }
#PanelUI-menu-button .toolbarbutton-badge-stack { padding: 0px !important; }





        /*---+---+---+---+---+---+---+
          | T | O | O | L | B | A | R |
          +---+---+---+---+---+---+---*/


        /*  Position of the Personal Toolbar
         *  possible values:
         *  0 – toolbar on top
         *  4 – toolbar on bottom
         */
        :root {
            --uc-toolbar-position: 0;
        }

        /*  Darken the Personal Toolbar by X amount
         *  where X = 1 means pure black
         *  and X = 0 means no darkening at all
         */
        @media (prefers-color-scheme: dark) { :root {
            --uc-darken-toolbar: 0.2;
        }} @media (prefers-color-scheme: light) { :root {
            --uc-darken-toolbar: 0;
        }}




        /*---+---+---+---+---+---+---+
          | U | R | L | — | B | A | R |
          +---+---+---+---+---+---+---*/


        :root {

            /*  Width of the URL Bar for the Oneline layout
             *  If enabled the max-width is applied on focus
             *  otherwise the URL Bar will always be it's min-width
             */ --uc-urlbar-min-width: 35vw;
            --uc-urlbar-max-width: 35vw;

            /*  Position of the URL Bar
             *  possible values:
             *  1 – tabs on the right
             *  3 – tabs on the left
             */ --uc-urlbar-position: 1;

            /*  Firefox can be a little wonky with the vertical
             *  URL Bar placement. Change this variable to adapt
             *  to this when necessary.
             */ --uc-urlbar-top-spacing: 1px;

        }


        /* Disable the Navigation Buttons */
#back-button,
#forward-button { display: none !important; }

        /* Disables the Tracking Protection Shield */
        /* #tracking-protection-icon-container { display: none !important; } */

        /* Encryption and Permissions icons */
        /* Only hides permission items */
#identity-permission-box { display: none !important; }
        /* Hides encryption AND permission items */
        /* #identity-box { display: none !important } */

        /* Hide everything BUT the zoom indicator within the URL Bar */
        /* #page-action-buttons > :not(#urlbar-zoom-button) { display: none !important; } */

        /* Hide the »Go«-arrow in the URL Bar */
#urlbar-go-button { display: none !important; }

        /* Hides the Extensions Menu Icon */
#unified-extensions-button { display: none !important; }





        /*---+---+---+---+---+---+---+
          | T | A | B | — | B | A | R |
          +---+---+---+---+---+---+---*/


        :root {

            /*  Allow tabs to have dynamic widths based on
             *  the Tab Bars maximum width
             */ --uc-active-tab-width:   clamp(100px, 30vw, 300px);
            --uc-inactive-tab-width: clamp(100px, 20vw, 200px);


            /*  Enable this to always show the Tab Close button
             *  possible values:
             *  show: -moz-inline-block
             *  hide: none
             */ --show-tab-close-button: none;

            /*  Enable this to only show the Tab Close button on tab hover
             *  possible values:
             *  show: -moz-inline-block
             *  hide: none
             */ --show-tab-close-button-hover: none;

            /*  Hide the all Tabs button from the Tab Bar
             *  possible values:
             *  show: -moz-box
             *  hide: none
             */ --uc-show-all-tabs-button: none;


            /*  Left and Right "dip" of the container indicator
             *  0px equals tab width
             *  higer values make the indicator smaller
             */ --container-tabs-indicator-margin: 10px;

            /*  Amount of Glow to add to the container indicator
             *  Setting it to 0 disables the Glow
             */ --uc-identity-glow: 0 1px 10px 1px;

        }


        /* Hide the secondary Tab Label
         * e.g. playing indicator (the text, not the icon) */
        .tab-secondary-label { display: none !important; }

        /*---+---+---+---+---+---+---+
          | C | O | L | O | U | R | S |
          +---+---+---+---+---+---+---*/


        @media (prefers-color-scheme: dark) { :root {

            /* These colours are (mainly) used by the
               Container Tabs Plugin */
            --uc-identity-colour-blue:      #7ED6DF;
            --uc-identity-colour-turquoise: #55E6C1;
            --uc-identity-colour-green:     #B8E994;
            --uc-identity-colour-yellow:    #F7D794;
            --uc-identity-colour-orange:    #F19066;
            --uc-identity-colour-red:       #FC5C65;
            --uc-identity-colour-pink:      #F78FB3;
            --uc-identity-colour-purple:    #786FA6;

            /*  Cascades main Colour Scheme */
            --uc-base-colour:               #1E2021;
            --uc-highlight-colour:          #191B1C;
            --uc-inverted-colour:           #FAFAFC;
            --uc-muted-colour:              #AAAAAC;
            --uc-accent-colour:             var(--uc-identity-colour-purple);

        }}


        @media (prefers-color-scheme: light) { :root {

            /* These colours are (mainly) used by the
               Container Tabs Plugin */
            --uc-identity-colour-blue:      #1D65F5;
            --uc-identity-colour-turquoise: #209FB5;
            --uc-identity-colour-green:     #40A02B;
            --uc-identity-colour-yellow:    #E49320;
            --uc-identity-colour-orange:    #FE640B;
            --uc-identity-colour-red:       #FC5C65;
            --uc-identity-colour-pink:      #EC83D0;
            --uc-identity-colour-purple:    #822FEE;

            /*  Cascades main Colour Scheme */
            --uc-base-colour:               #FAFAFC;
            --uc-highlight-colour:          #DADADC;
            --uc-inverted-colour:           #1E2021;
            --uc-muted-colour:              #191B1C;
            --uc-accent-colour:             var(--uc-identity-colour-purple);

        }}






        /* Down here I'm just reassigning variables based on the colours set above.
           Feel free to play around with these but there is no editing necessary below this line. c:
         */

        :root {

            --lwt-frame: var(--uc-base-colour) !important;
            --lwt-accent-color: var(--lwt-frame) !important;
            --lwt-text-color: var(--uc-inverted-colour) !important;

            --toolbar-field-color: var(--uc-inverted-colour) !important;

            --toolbar-field-focus-color: var(--uc-inverted-colour) !important;
            --toolbar-field-focus-background-color: var(--uc-highlight-colour) !important;
            --toolbar-field-focus-border-color: transparent !important;

            --toolbar-field-background-color: var(--lwt-frame) !important;
            --lwt-toolbar-field-highlight: var(--uc-inverted-colour) !important;
            --lwt-toolbar-field-highlight-text: var(--uc-highlight-colour) !important;
            --urlbar-popup-url-color: var(--uc-accent-colour) !important;

            --lwt-tab-text: var(--lwt-text-colour) !important;

            --lwt-selected-tab-background-color: var(--uc-highlight-colour) !important;

            --toolbar-bgcolor: var(--lwt-frame) !important;
            --toolbar-color: var(--lwt-text-color) !important;
            --toolbarseparator-color: var(--uc-accent-colour) !important;
            --toolbarbutton-hover-background: var(--uc-highlight-colour) !important;
            --toolbarbutton-active-background: var(--toolbarbutton-hover-background) !important;

            --lwt-sidebar-background-color: var(--lwt-frame) !important;
            --sidebar-background-color: var(--lwt-sidebar-background-color) !important;

            --urlbar-box-bgcolor: var(--uc-highlight-colour) !important;
            --urlbar-box-text-color: var(--uc-muted-colour) !important;
            --urlbar-box-hover-bgcolor: var(--uc-highlight-colour) !important;
            --urlbar-box-hover-text-color: var(--uc-inverted-colour) !important;
            --urlbar-box-focus-bgcolor: var(--uc-highlight-colour) !important;

        }



        .identity-color-blue      { --identity-tab-color: var(--uc-identity-colour-blue)      !important; --identity-icon-color: var(--uc-identity-colour-blue)      !important;  }
        .identity-color-turquoise { --identity-tab-color: var(--uc-identity-colour-turquoise) !important; --identity-icon-color: var(--uc-identity-colour-turquoise) !important; }
        .identity-color-green     { --identity-tab-color: var(--uc-identity-colour-green)     !important; --identity-icon-color: var(--uc-identity-colour-green)     !important; }
        .identity-color-yellow    { --identity-tab-color: var(--uc-identity-colour-yellow)    !important; --identity-icon-color: var(--uc-identity-colour-yellow)    !important; }
        .identity-color-orange    { --identity-tab-color: var(--uc-identity-colour-orange)    !important; --identity-icon-color: var(--uc-identity-colour-orange)    !important; }
        .identity-color-red       { --identity-tab-color: var(--uc-identity-colour-red)       !important; --identity-icon-color: var(--uc-identity-colour-red)       !important; }
        .identity-color-pink      { --identity-tab-color: var(--uc-identity-colour-pink)      !important; --identity-icon-color: var(--uc-identity-colour-pink)      !important; }
        .identity-color-purple    { --identity-tab-color: var(--uc-identity-colour-purple)    !important; --identity-icon-color: var(--uc-identity-colour-purple)    !important; }

        :root {

            --toolbarbutton-border-radius: var(--uc-border-radius) !important;
            --tab-border-radius: var(--uc-border-radius) !important;
            --arrowpanel-border-radius: var(--uc-border-radius) !important;

        }





#main-window,
#toolbar-menubar,
#TabsToolbar,
#navigator-toolbox,
#sidebar-box,
#nav-bar { box-shadow: none !important; }


#main-window,
#toolbar-menubar,
#TabsToolbar,
#PersonalToolbar,
#navigator-toolbox,
#sidebar-box,
#nav-bar { border: none !important; }


        /* remove "padding" left and right from tabs */
        .titlebar-spacer { display: none !important; }

        /* fix Shield Icon padding */
#urlbar-input-container[pageproxystate="valid"]
        > #tracking-protection-icon-container
            > #tracking-protection-icon-box
            > #tracking-protection-icon {
                padding-bottom: 1px;
            }





#PersonalToolbar {

padding: 6px !important;
         box-shadow: inset 0 0 50vh rgba(0, 0, 0, var(--uc-darken-toolbar)) !important;;

}





#statuspanel #statuspanel-label {

border: none !important;
        border-radius: var(--uc-border-radius) !important;

}

@media (min-width: 1000px) {


#navigator-toolbox { display: flex; flex-wrap: wrap; flex-direction: row; }


#nav-bar {

order: var(--uc-urlbar-position);
width: var(--uc-urlbar-min-width);

}

#nav-bar #urlbar-container { min-width: 0px !important; width: auto !important; }


#titlebar {

order: 2;
width: calc(100vw - var(--uc-urlbar-min-width) - 1px);

}


#PersonalToolbar {

order: var(--uc-toolbar-position);
width: 100%;

}


#navigator-toolbox:focus-within #nav-bar { width: var(--uc-urlbar-max-width); }
#navigator-toolbox:focus-within #titlebar { width: calc(100vw - var(--uc-urlbar-max-width) - 1px); }


}

#statuspanel #statuspanel-label { margin: 0 0 var(--uc-status-panel-spacing) var(--uc-status-panel-spacing) !important; }

#navigator-toolbox:not(:-moz-lwtheme) { background: var(--toolbar-field-background-color) !important; }



#nav-bar {

    padding-block-start: 0px !important;

border:     none !important;
            box-shadow: none !important;
background: transparent !important;

}


#urlbar,
#urlbar * {

    padding-block-start: var(--uc-urlbar-top-spacing) !important;

outline: none !important;
         box-shadow: none !important;

}


#urlbar-background { border: transparent !important; }

#urlbar[focused='true']
> #urlbar-background,
#urlbar:not([open])
    > #urlbar-background { background: var(--toolbar-field-background-color) !important; }


#urlbar[open]
    > #urlbar-background { background: var(--toolbar-field-background-color) !important; }


    .urlbarView-row:hover
    > .urlbarView-row-inner,
    .urlbarView-row[selected]
    > .urlbarView-row-inner { background: var(--toolbar-field-focus-background-color) !important; }


    .urlbar-icon, #urlbar-go-button { margin: auto; }
    .urlbar-page-action { padding: 0 inherit !important; }
    .urlbar-page-action .urlbar-icon { margin-top: 6px !important; }

    /* remove gap after pinned tabs */
#tabbrowser-tabs[haspinnedtabs]:not([positionpinnedtabs])
    > #tabbrowser-arrowscrollbox
    > .tabbrowser-tab:nth-child(1 of :not([pinned], [hidden])) { margin-inline-start: 0 !important; }


    /* Hides the list-all-tabs button*/
#alltabs-button { display: var(--uc-show-all-tabs-button) !important; }


    /* remove tab shadow */
    .tabbrowser-tab
    >.tab-stack
    > .tab-background { box-shadow: none !important;  }


    /* multi tab selection */
#tabbrowser-tabs:not([noshadowfortests]) .tabbrowser-tab:is([multiselected])
    > .tab-stack
    > .tab-background:-moz-lwtheme { outline-color: var(--toolbarseparator-color) !important; }





    /* tab close button options */
    .tabbrowser-tab:not([pinned]) .tab-close-button { display: var(--show-tab-close-button) !important; }
    .tabbrowser-tab:not([pinned]):hover .tab-close-button { display: var(--show-tab-close-button-hover) !important }





    /* adaptive tab width */
    .tabbrowser-tab[selected][fadein]:not([pinned]) { max-width: var(--uc-active-tab-width) !important; }
    .tabbrowser-tab[fadein]:not([selected]):not([pinned]) { max-width: var(--uc-inactive-tab-width) !important; }





    /* container tabs indicator */
    .tabbrowser-tab[usercontextid]
    > .tab-stack
    > .tab-background
    > .tab-context-line {

margin: -1px var(--container-tabs-indicator-margin) 0 var(--container-tabs-indicator-margin) !important;
height: 1px !important;

        box-shadow: var(--uc-identity-glow) var(--identity-tab-color) !important;

    }





/* show favicon when media is playing but tab is hovered */
.tab-icon-image:not([pinned]) { opacity: 1 !important; }


/* Makes the speaker icon to always appear if the tab is playing (not only on hover) */
.tab-icon-overlay:not([crashed]),
    .tab-icon-overlay[pinned][crashed][selected] {

top: 5px !important;
     z-index: 1 !important;

padding: 1.5px !important;
         inset-inline-end: -8px !important;
width: 16px !important; height: 16px !important;

       border-radius: 10px !important;

    }


/* style and position speaker icon */
.tab-icon-overlay:not([sharing], [crashed]):is([soundplaying], [muted], [activemedia-blocked]) {

stroke: transparent !important;
background: transparent !important;
opacity: 1 !important; fill-opacity: 0.8 !important;

color: currentColor !important;

stroke: var(--toolbar-bgcolor) !important;
        background-color: var(--toolbar-bgcolor) !important;

}


/* change the colours of the speaker icon on active tab to match tab colours */
.tabbrowser-tab[selected] .tab-icon-overlay:not([sharing], [crashed]):is([soundplaying], [muted], [activemedia-blocked]) {

stroke: var(--toolbar-bgcolor) !important;
        background-color: var(--toolbar-bgcolor) !important;

}


.tab-icon-overlay:not([pinned], [sharing], [crashed]):is([soundplaying], [muted], [activemedia-blocked]) { margin-inline-end: 9.5px !important; }


.tabbrowser-tab:not([image]) .tab-icon-overlay:not([pinned], [sharing], [crashed]) {

top: 0 !important;

padding: 0 !important;
         margin-inline-end: 5.5px !important;
         inset-inline-end: 0 !important;

}


.tab-icon-overlay:not([crashed])[soundplaying]:hover,
    .tab-icon-overlay:not([crashed])[muted]:hover,
    .tab-icon-overlay:not([crashed])[activemedia-blocked]:hover {

color: currentColor !important;
stroke: var(--toolbar-color) !important;
        background-color: var(--toolbar-color) !important;
        fill-opacity: 0.95 !important;

    }


.tabbrowser-tab[selected] .tab-icon-overlay:not([crashed])[soundplaying]:hover,
    .tabbrowser-tab[selected] .tab-icon-overlay:not([crashed])[muted]:hover,
    .tabbrowser-tab[selected] .tab-icon-overlay:not([crashed])[activemedia-blocked]:hover {

color: currentColor !important;
stroke: var(--toolbar-color) !important;
        background-color: var(--toolbar-color) !important;
        fill-opacity: 0.95 !important;

    }


/* speaker icon colour fix */
#TabsToolbar .tab-icon-overlay:not([crashed])[soundplaying],
#TabsToolbar .tab-icon-overlay:not([crashed])[muted],
#TabsToolbar .tab-icon-overlay:not([crashed])[activemedia-blocked] { color: var(--toolbar-color) !important; }


/* speaker icon colour fix on hover */
#TabsToolbar .tab-icon-overlay:not([crashed])[soundplaying]:hover,
#TabsToolbar .tab-icon-overlay:not([crashed])[muted]:hover,
#TabsToolbar .tab-icon-overlay:not([crashed])[activemedia-blocked]:hover { color: var(--toolbar-bgcolor) !important; }

/* selected tab colour fix*/
.tabbrowser-tab[selected] .tab-content {
    background-color: var(--uc-highlight-colour) !important;
}
        '';
    };
};

programs.direnv = {
    enable = true;
    enableBashIntegration = true;
};

# enable gtk
    gtk.enable = true;

    gtk.cursorTheme.package = pkgs.bibata-cursors;
    gtk.cursorTheme.name = "Bibata-Modern-Ice";

    gtk.theme.package = pkgs.gruvbox-gtk-theme;
    gtk.theme.name = "gruvbox-gtk";

# gtk.iconTheme.package = gruvboxPlus;
# gtk.iconTheme.name = "GruvboxPlus";
    gtk.iconTheme.package = pkgs.gruvbox-dark-icons-gtk;
    gtk.iconTheme.name = "Grvbox-dark-icon";

# enable qt
    qt.enable = true;

# platform theme "gtk" or "gnome"
    qt.platformTheme = "gtk";

# name of the qt theme
    qt.style.name = "Adwaita-Dark";

# packages to use
    qt.style.package = pkgs.adwaita-qt;
}
