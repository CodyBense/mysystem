{ pkgs }:

let
    imgLink = "https://github.com/CodyBense/wallpapers/gruvbox-mountain-village.png";

    image = pkgs.fetchurl {
        url = imgLink;
        sha256 = "1wg74qln4k9m58z3lyw30cvk5nchfq0p91ihzli1fmxjw1krv9fa";
    };
in
pkgs.stdenv.mkDerivation {
    name = "sddm-theme";
    src = pkgs.fetchFromGitHub {
        owner = "MarianArlt";
        repo = "sddm-sugar-dark";
        rev = "ceb2c455663429be03ba62d9f898c571650ef7fe";
        sha256 = "0153z1kylbhc9d12nxy9vpn0spxgrhgy36wy37pk6ysq7akaqlvy";
    };
    installPhase = ''
     mkdir -p $out
     cp -R ./* $out/
     cd $out/
     rm Background.jpg
     cp -r ${image} $out/Background.jpg
    '';
}
