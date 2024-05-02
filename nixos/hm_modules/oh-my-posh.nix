{ lib, config, inputs, pkgs, ... }:
{
    programs.oh-my-posh = {
        enable = true;
        enableBashIntegration = true;
        useTheme = "gruvbox";
    };
}
