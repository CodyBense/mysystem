# { pkgs, ... }:
# {
#     nixpkgs.overlays = [
#     (final: prev: {
#       todo = pkgs.buildGoModule {
#         pname = "todo_go";
#         src = pkgs.fetchFromGitHub {
#           owner = "CodyBense";
#           repo = "todo_go";
#           rev = "0eea65f0c2e36bbd538fe939428583d23fa6921b";
#           sha256 = "10h2crpsfdv3i3jsx64nswnvddap912bnv7rhwfl3pwqysqywrbq";
#         };
#         vendorHash = "sha256-eGXusfaY30Edh/lsu0RIV7W2LdeWmK7liGM3p29mAoI=";
#         nativeCheckInputs = with pkgs; [ less ];
#       };
#     })
#   ];
# }
{ pkgs, lib, ... }:
{
    nixpkgs.overlays = [
        (final: prev: {
         todo = pkgs.buildGoModule rec {
         pname = "todo_go";
         version = "1.4.0";

         src = pkgs.fetchFromGitHub {
         owner = "CodyBense";
         repo = "todo_go";
         rev = "v${version}";
         hash = "sha256-QsS7WtsTt0Y9ZduXlGyIOcp0ECUB2e7WbmMwa28MZnQ=";
         };

         vendorHash = null;

         meta = {
         description = "Simple todo list tracker";
         homepage = "github.com/CodyBense/todo_go";
         license = lib.license.mit;
         maintainers = with lib.maintainers; [ CodyBense ];
         };

         };
        })
    ];
}
