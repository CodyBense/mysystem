# /PROGRAMS to get to dotfile configuration control
{ config, inputs, pkgs, ... }:

let 
gruvboxPlus = import ./hm_modules/gruvbox-plus.nix { inherit pkgs; };
in
{
# import home-manager modules
    imports = [
         ./hm_modules/firefox.nix
    ];
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
            pm = "~/Code/password_manager_cli/result/bin/pm_cli.py";
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
bind = $mainMod, SPACE, exec, $menu
bind = $mainMod, P, pseudo, # dwindle
bind = $mainMod, F, exec, $browser
bind = $mainMod, M, exec, spotify
bind = $mainMod, BACKSPACE, exec, $scrPath/logout_launch.sh
# bind = $mainMod ALT, L, exec, swaylock
bind = $mainMod ALT, L, exec, hyprlock

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
# programs.swaylock = {
#     enable = true;
#     package = pkgs.swaylock-effects;
#     settings = {
#         indicator=true;
#         ignore-empty-password=true;
#         indicator-thickness=15;
#         indicator-radius=150;
#         image="~/mysystem/wallpapers/gruvbox-mountian-village.png";
#         clock=true;
#         effect-blur="7x5";
#         effect-vignettee="0.5:0.5";
#         ring-color="98971a";
#         key-hl-color="cc241d";
#         line-color="00000000";
#         inside-color="00000088";
#         inside-clear-color="00000088";
#         text-color="d79921";
#         text-clear-color="daa520";
#         ring-clear-color="890051";
#         separator-color="00000000";
#         grace="0";
#         fade-in="0.5";
#         font="Caskaydia Cove Nerd Font Mono";
#     };
# };

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
