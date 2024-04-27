{ pkgs }:

let
imgLink = "https://github.com/CodyBense/sddm-wallpapers/blob/main/gruvbox-mountain-village.png";

image = pkgs.fetchurl {
    url = imgLink;
    # sha256 = "sha256-O0aIzBRPyfrkp1YWRyST62UqZY1KE8L8NXn1OxY5f+8=";
    sha256 = "sha256-eT9dv3nymcCsbyp2S7pQ6KbwZuex/YuXo9r+YuAWQ9Q=";
    # sha256 = "180smfqpazclh2f1yx87bmpl58w25fbji0rrngyjhwkvikjpp51l";
    # sha256 = "1b05qhfhh8bvza1yrgfbw1sxpg142h99p8pckh0ps0qfpk4m8czz";
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
