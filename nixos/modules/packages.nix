{ pkgs, ... }:

{

    imports = [
        # ./customPackages.nix
    ];

    environment.systemPackages = with pkgs; [
# Programs
        firefox
        spotify
        ncspot
        # spicetify-cli
        desmume
        pokeget-rs

# Neovim
        neovim
        vimPlugins.nvim-lspconfig
        lua54Packages.luasnip

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

# Terminal stuff
        tmux
        gh
        fzf
        zoxide
        oh-my-posh
        oh-my-zsh

# PDF
# xpdf
        sioyek # viewer

# IMG
        swayimg # from terminal using swayimg command
        feh

# Video
        vlc

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
# bibata-extra-cursors

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
        dunst
        libnotify
## wallpaper
        swww
        hyprpaper
## terminal
        kitty
## app launcher
        rofi-wayland
## login screen
        sddm
## Lock
        swaylock-effects
        hyprlock
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
        libsForQt5.qt5.qtquickcontrols   
        libsForQt5.qt5.qtquickcontrols2   
        libsForQt5.qt5.qtgraphicaleffects
            ];
}
