{  pkgs, ... }:
{
    todo = pkgs.buildGoApplication rec {
        goPackagePath = "github.com/CodyBense/todo_go";

        src = pkgs.fetchFromGitHub {
            onwer = "CodyBense";
            repo = "todo_go";
            hash = "";
        };
        vendorHash = "";

        goDeps = ./todo_go.nix;
    };
}
