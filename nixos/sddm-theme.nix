{ pkgs }:

let
    imgLink = "https://github.com/CodyBense/wallpapers/gruvbox-mountain-village.png";

    image = pkgs.fetchurl {
        url = imgLink;
        sha256 = "sha256-HrcYriKliK2QN02/2vFK/osFjTT1NamhGKik3tozGU0=";
    };
in
pkgs.stdenv.mkDerivation {
    name = "sddm-theme";
    src = pkgs.fetchFromGitHub {
        owner = "MarianArlt";
        repo = "sddm-sugar-dark";
        rev = "ceb2c455663429be03ba62d9f898c571650ef7fe";
        sha256 = "sha256-SVorwMlHJlQkgxGtNMAGr//ozT6rt6gQ5RFA2cy3nZI=";
    };
    installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    cd $out/
    rm Background.jpg
    cp -r ${image} $out/Background.jpg
    '';
}
