{ pkgs, lib, ... }:
{
    nixpkgs.overlays = [
        (final: prev: {
         todo = pkgs.buildGoModule rec {
         pname = "todo_go";
         version = "1.4.1";

         src = pkgs.fetchFromGitHub {
         owner = "CodyBense";
         repo = "todo_go";
         rev = "v${version}";
         hash = "sha256-Irh9K2Ui9ZEHhJQeoK55TZHrn1jHtwhDbrnZLSzYI2o=";
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
