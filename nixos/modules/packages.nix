{ pkgs, ... }:

{

    environment.systemPackages = with pkgs; [
# programs
        neovim
        vimPlugins.nvim-lspconfig
        lua54Packages.luasnip
        home-manager
        firefox
        networkmanagerapplet
        killall
        fzf
        zoxide
        oh-my-posh
        spotify
        spicetify-cli
        curl
        brightnessctl
        direnv
        wlogout
        unzip
        nh
        yad
        pywal
        eww

## Terminal stuff
        tmux
        gh

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
## Swaylock
        swaylock-effects
        hyprlock
## Wlogout
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
