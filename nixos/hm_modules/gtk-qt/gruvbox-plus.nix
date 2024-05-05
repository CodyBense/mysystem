{ pkgs }:
let
 link = "https://github.com/SylEleuth/gruvbox-plus-icon-pack/releases/download/v5.3.1/gruvbox-plus-icon-pack-5.3.1.zip";
in

pkgs.stdenv.mkDerivation {
    name = "gruvbox-plus";

    src  = pkgs.fetchurl {
        url = link;
        sha256 = "sha256-3nZN51Mv0MdXC0gkEKbKrVE+91hS3QSCqNPyDE8KJtY=";
    };

    dontUnpack = true;

    installPhase = ''
        mkdir -p $out
        ${pkgs.unzip}/bin/unzip $src -d $out/
        '';
}
