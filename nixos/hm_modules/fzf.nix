{ lib, config, inputs, pkgs, ... }:
{
    programs.fzf = {
        enable = true;
        enableBashIntegration = true;
    };
}
