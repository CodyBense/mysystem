{ ... }:
{
    virtualisation.docker.enable = true;
    users.users.codybense.extraGroups = [ "docker" ];
}
