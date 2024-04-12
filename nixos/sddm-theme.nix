{ pkgs }:

pkgs.stdenv.mkDerivation {
    name = "sddm-theme";
    src = pkgs.fetchFromGitHub {
        owner = "MariaArlt";
        repo = "sddm-sugar-dark";
        rev = "";
        sha256 = "";
    };
    installPhase = ''
    '';
}
