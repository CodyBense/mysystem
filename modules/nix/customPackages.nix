{ pkgs, ... }:
let
    pokemon-colorscripts = import (
        pkgs.fetchFromGitLab {
            owner = "phoneybadger";
            repo = "pokemon-colorscripts";
            rev = "0483c85b93362637bdd0632056ff986c07f30868";
            sha256 = "1c5pi7y87ng6qa3k287fq66spdl3ynckvxf86srd9fy2h4ljlgdf";
        }
    );
in
{

    environment.systemPackages = [
        pokemon-colorscripts
    ];
}
