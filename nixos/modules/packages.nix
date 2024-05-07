{ pkgs, ... }:

{

    environment.systemPackages = with pkgs; [
# programs
## To be labled
        neovim
        vimPlugins.nvim-lspconfig
        lua54Packages.luasnip
        home-manager
        firefox
        spotify
        spicetify-cli
        curl
        nh
        yad

# Utility
        brightnessctl
        networkmanagerapplet
        killall
        direnv
        unzip
        tlp

## Terminal stuff
        tmux
        gh
        fzf
        zoxide
        oh-my-posh

## PDF
# xpdf
        sioyek # viewer

## IMG
        swayimg # from terminal using swayimg command
        feh

## Video
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
##Code
            ];
}
