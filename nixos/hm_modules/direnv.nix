{ lib, config, inputs, pkgs, ... }:
{
    programs.direnv = {
        enable = true;
        enableBashIntegration = true;
    };
}
