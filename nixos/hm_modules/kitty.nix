{ pkgs, config, ... }:
{
    programs.kitty = {
        enable = true;
        font = {
            name = "JetBrains Mono";
            package = pkgs.jetbrains-mono;
            size = 10;
        };
        # theme = "Gruvbox Material Dark Hard";
        settings = with config.colorScheme.colors;{
            window_padding_width = 25;
            enable_audio_bell = false;
            bold_font = "auto";
            italic_font = "auto";
            bold_italic_font = "auto";
            background_opacity = "0.7";
            background = "#${base00}";
            foreground = "#${base07}";
            selection_background = "#${base03}";
            selction_foreground = "#${base04}";
            #black
            color0 = "#${base03}";
            color8 = "#${base03}";
            #red
            color1 = "#${base08}";
            color9 = "#${base08}";
            #green
            color2 = "#${base0B}";
            color10 = "#${base0B}";
            #yellow
            color3 = "#${base0A}";
            color11 = "#${base0A}";
            #blue
            color4 = "#${base0D}";
            color12 = "#${base0D}";
            #magenta
            color5 = "#${base0E}";
            color13 = "#${base0E}";
            #cyan
            color6 = "#${base0C}";
            color14 = "#${base0C}";
            #white
            color7 = "#${base05}";
            color15 = "#${base05}";
        };
        shellIntegration.enableBashIntegration = true;
    };
}
