{ pkgs }:

let
    imgLink = "https://raw.githubusercontent.com/Goxore/dotfiles/50db864d56d49768f1d4d0a8c1bd7a5c74dd629e/home/Wallpapers/gruvbox-mountain-village.png";

    image = pkgs.fetchurl {
        url = imgLink;
        sha256 = "sha256-HrcYriKliK2QN02/2vFK/osFjTT1NamhGKik3tozGU0=";
    };
in

pkgs.stdenv.mkDerivation {
  pname = "sddm-sugar-dark-theme";
  version = "1.2";
  installPhase = ''
    mkdir -p $out/share/sddm/themes
    cp -aR $src $out/share/sddm/themes/sugar-dark
  '';
  src = pkgs.fetchFromGitHub {
    owner = "MarianArlt";
    repo = "sddm-sugar-dark";
    rev = "v${version}";
    sha256 = "0153z1kylbhc9d12nxy9vpn0spxgrhgy36wy37pk6ysq7akaqlvy";
  };
}
