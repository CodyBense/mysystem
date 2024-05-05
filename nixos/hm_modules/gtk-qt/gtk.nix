# { config, inputs, pkgs, ... }:
#
# {
# # enable gtk
#     gtk.enable = true;
#
#     gtk.cursorTheme.package = pkgs.bibata-cursors;
#     gtk.cursorTheme.name = "Bibata-Modern-Ice";
#
#     # gtk.theme.package = pkgs.gruvbox-gtk-theme;
#     # gtk.theme.name = "gruvbox-gtk-theme";
#     
#     gtk.theme.package = pkgs.adw-gtk3;
#     gtk.theme.name = "adw-gtk3";
#
#     # gtk.iconTheme.package = gruvboxPlus;
#     # gtk.iconTheme.name = "GruvboxPlus";
#
#     gtk.iconTheme.package = pkgs.gruvbox-dark-icons-gtk;
#     gtk.iconTheme.name = "gruvbox-dark-icons-gtk";
#
# # enable qt
#     qt.enable = true;
#
# # platform theme "gtk" or "gnome"
#     qt.platformTheme = "qtct";
#     # qt.platformTheme = "kde";
#
# # name of the qt theme
#     qt.style.name = "adwaita-dark";
#
# # packages to use
#     qt.style.package = pkgs.adwaita-qt;
# }
