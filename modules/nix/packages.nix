{ pkgs, ... }:
let
    sugar = pkgs.callPackage ../../pkgs/sddm-sugar-dark.nix { };
    tokyo-night = pkgs.libsForQt5.callPackage ../../pkgs/sddm-tokyo-night.nix { };
in
{

    environment.systemPackages = with pkgs; [
# Programs
        spotify
        desmume
        pokeget-rs
        obsidian
        docker
        brave
        # kicad
        qmk
        arduino-ide
        mysql

# Neovim
        neovim
        vimPlugins.nvim-lspconfig
        lua54Packages.luasnip
        lazygit

# Utility
        home-manager
        brightnessctl
        networkmanagerapplet
        killall
        direnv
        unzip
        tlp
        dmenu
        curl
        nh
        yad
        fastfetch
        trashy
        pandoc
        wl-clipboard-rs
        pavucontrol
        swaynotificationcenter
        wakeonlan
        ripgrep
# Terminal stuff
        tmux
        gh
        fzf
        zoxide
        oh-my-posh
        oh-my-zsh
        imagemagick
        tree
# Office Suite
        onlyoffice-bin
# PDF
        sioyek # viewer
        zathura
        okular
# IMG
        swayimg # from terminal using swayimg command
        feh
# Video
        vlc
        mpv
# fonts, icons, and cursors
        nerdfonts
        font-awesome
        jetbrains-mono
        cascadia-code
        maple-mono-NF
        mononoki
        noto-fonts-cjk-sans
        material-design-icons
        bibata-cursors
# File manager
        dolphin
        lf
        xfce.thunar
## thunar plugins
        xfce.thunar-archive-plugin
# Hyprland stuff
## Color stuff
        pywal # unsupported
## eww
        eww
## bar
        waybar
## notifiations
        libnotify
## wallpaper
        swww
        hyprpaper
## app launcher
        rofi-wayland
## login screen
        sddm
## Lock
        swaylock-effects
        hyprlock
### Idle thingy
        hypridle
## Logout
        wlogout
# GTK
        gtk2
        gtk3
        gtk4
# QT
        qt5ct
        qt6ct
        gsettings-qt
## needed for sddm theme
        sugar.sddm-sugar-dark
        tokyo-night
        libsForQt5.qt5.qtquickcontrols   
        libsForQt5.qt5.qtquickcontrols2   
        libsForQt5.qt5.qtgraphicaleffects
# Code
        node2nix
    ];
}
