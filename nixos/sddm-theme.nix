{ pkgs }:

let
imgLink = "https://github.com/CodyBense/sddm-wallpapers/blob/main/gruvbox-mountain-village.png";

image = pkgs.fetchurl {
    url = imgLink;
    # sha256 = "sha256-6vbgW4zCXZJRrK2Cqg+sSx1+LS2nX7U14/IwdvWx1cY=";
    # sha256 = "sha256-HrcYriKliK2QN02/2vFK/osFjTT1NamhGKik3tozGU0=";
    # sha256 = "19gdk6jwl51zs1w4y55nw6cklb3pn47v2rz3xjvn2qnawdk9xaga";
    sha256 = "sha256-6vbgW4zCXZJRrK2Cqg+sSx1+LS2nX7U14/IwdvWx1cY=";

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
