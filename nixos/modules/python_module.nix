
{  lib, config, pkgs, ... }:
{
    options = {
        python_module.enable = lib.mkEnableOption "enables python_module";
    };

    config = lib.mkIf config.python_module.enable {
        environment.systemPackages = with pkgs; [
            python3
            python311Packages.mysql-connector
            python311Packages.typer
            python311Packages.inquirer
        ];
    };
}
