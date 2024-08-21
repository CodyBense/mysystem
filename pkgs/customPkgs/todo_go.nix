{ ... }:
{
    nixpkgs.overlays = [
    (final: prev: {
      todo = pkgs.buildGoModule rec {
        pname = "todo_go";
        version = "2.1.0";
        src = pkgs.fetchFromGitHub {
          owner = "CodyBense";
          repo = "todo_go";
          rev = "v${version}";
          sha256 = "sha256-CojP1a19b2zKfUMp+wN7FFs+SzSoc8sYqKvXTg4RnOA=";
        };
        vendorHash = "sha256-KO8cbkqdAkGkNrqBh3wIWaQyvf9hqrKjXWbElpQzMpg=";
        nativeCheckInputs = with pkgs; [ less ];
      };
    })
  ];
}
