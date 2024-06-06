{ pkgs, config, username, host, ... }:
let
    inherit (import ./variables.nix) gitUsername;
in
{
    users.users = {
        "${username}" = {
            homeMode = "755";
            isNormalUser = true;
            descritption = "${gitUsername}";
            extraGroups = [
                "networkmanager"
                "wheel"
                "libvirtd"
                "scanner"
                "lp"
            ];
        shell = pkgs.zsh;
        ingnoreShellProgramCheck = true;
        packages = with pkgs;
        };
    };
}
