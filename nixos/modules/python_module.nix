
{  lib, config, pkgs, ... }:
{
    enviroment.systemPackages = with pkgs; [
    python3
    python311Packages.mysql-connector
    python311Packages.typer
    python311Packages.inquirer
    ];
    # options = {
    #     python_module.enable = lib.mkEnableOption "enables python_module";
    # };
    #
    # config = lib.mkIf config.python_module.enable {
    #     enviroment.systemPackages = with pkgs; [
    #         python3
    #         python311Packages.mysql-connector
    #         python311Packages.typer
    #         python311Packages.inquirer
    #     ];
    # };
}
