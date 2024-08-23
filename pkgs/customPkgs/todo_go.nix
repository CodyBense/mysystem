{ pkgs, ... }:
{
    nixpkgs.overlays = [
    (final: prev: {
      todo = pkgs.buildGoModule {
        pname = "todo_go";
        src = pkgs.fetchFromGitHub {
          owner = "CodyBense";
          repo = "todo_go";
          rev = "0eea65f0c2e36bbd538fe939428583d23fa6921b";
          sha256 = "10h2crpsfdv3i3jsx64nswnvddap912bnv7rhwfl3pwqysqywrbq";
        };
        vendorHash = "sha256-eGXusfaY30Edh/lsu0RIV7W2LdeWmK7liGM3p29mAoI=";
        nativeCheckInputs = with pkgs; [ less ];
      };
    })
  ];
}
