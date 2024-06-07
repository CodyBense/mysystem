{ pkgs, config, ... }:
let
    palette = config.colorScheme.palette;
    inherit (import ./variables.nix)
    theme;
in
{
    # programs.kitty = {
    #     enable = true;
    #     shellIntegration.enableBashIntegration = true;
    #     shellIntegration.enableZshIntegration = true;
    #     font = {
    #         name = "JetBrains Mono";
    #         package = pkgs.jetbrains-mono;
    #         size = 10;
    #     };
    #     # theme = "Gruvbox Material Dark Hard";
    #     settings = with config.colorScheme.colors;{
    #     # setting = with config.stylix.base16Scheme; {
    #         window_padding_width = 25;
    #         enable_audio_bell = false;
    #         bold_font = "auto";
    #         italic_font = "auto";
    #         bold_italic_font = "auto";
    #         background_opacity = "0.7";
    #         background = "#${base00}";
    #         foreground = "#${base07}";
    #         selection_background = "#${base03}";
    #         selction_foreground = "#${base04}";
    #         #black
    #         color0 = "#${base03}";
    #         color8 = "#${base03}";
    #         #red
    #         color1 = "#${base08}";
    #         color9 = "#${base08}";
    #         #green
    #         color2 = "#${base0B}";
    #         color10 = "#${base0B}";
    #         #yellow
    #         color3 = "#${base0A}";
    #         color11 = "#${base0A}";
    #         #blue
    #         color4 = "#${base0D}";
    #         color12 = "#${base0D}";
    #         #magenta
    #         color5 = "#${base0E}";
    #         color13 = "#${base0E}";
    #         #cyan
    #         color6 = "#${base0C}";
    #         color14 = "#${base0C}";
    #         #white
    #         color7 = "#${base05}";
    #         color15 = "#${base05}";
    #
    #         mark1_foreground = "#${base03}";
    #         mark2_foreground = "#${base03}";
    #         mark3_foreground = "#${base03}";
    #
    #         mark1_background = "#98d3cb";
    #         mark2_background = "#f2dcd3";
    #         mark3_background = "#f274bc";
    #     };
    # };
    programs.kitty = {
        enable = true;
        shellIntegration.enableZshIntegration = true;
        font = {
            name = "JetBrainsMono Nerd Font";
            package = pkgs.jetbrains-mono;
            size = 16;
        };
        settings = {
            scrollback_lines = 2000;
            wheel_scroll_min_lines = 1;
            window_padding_width = 4;
            confirm_os_window_close = 0;
            background_opacity = "0.9";
            enable_audio_bell = false;
        };
        extraConfig = ''
        foreground #${palette.base05}
        background #${palette.base00}
        color0  #${palette.base03}
        color1  #${palette.base08}
        color2  #${palette.base0B}
        color3  #${palette.base09}
        color4  #${palette.base0D}
        color5  #${palette.base0E}
        color6  #${palette.base0C}
        color7  #${palette.base06}
        color8  #${palette.base04}
        color9  #${palette.base08}
        color10 #${palette.base0B}
        color11 #${palette.base0A}
        color12 #${palette.base0C}
        color13 #${palette.base0E}
        color14 #${palette.base0C}
        color15 #${palette.base07}
        color16 #${palette.base00}
        color17 #${palette.base0F}
        color18 #${palette.base0B}
        color19 #${palette.base09}
        color20 #${palette.base0D}
        color21 #${palette.base0E}
        color22 #${palette.base0C}
        color23 #${palette.base06}
        cursor  #${palette.base07}
        cursor_text_color #${palette.base00}
        selection_foreground #${palette.base01}
        selection_background #${palette.base0D}
        url_color #${palette.base0C}
        active_border_color #${palette.base04}
        inactive_border_color #${palette.base00}
        bell_border_color #${palette.base03}
        tab_bar_style fade
        tab_fade 1
        active_tab_foreground   #${palette.base04}
        active_tab_background   #${palette.base00}
        active_tab_font_style   bold
        inactive_tab_foreground #${palette.base07}
        inactive_tab_background #${palette.base08}
        inactive_tab_font_style bold
        tab_bar_background #${palette.base00}
      '';
    };
}
