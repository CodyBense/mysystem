{ pkgs, ... }:
{
    programs.kitty = {
        enable = true;
        font = {
            name = "JetBrains Mono";
            package = pkgs.jetbrains-mono;
            size = 10;
        };
        theme = "Gruvbox Material Dark Hard";
        settings = {
            window_padding_width = 25;
            enable_audio_bell = false;
            bold_font = "auto";
            italic_font = "auto";
            bold_italic_font = "auto";
        };
        shellIntegration.enableBashIntegration = true;
    };
}
