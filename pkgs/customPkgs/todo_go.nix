{ buildGoApplication, fetchFromGitHub, ... }:
{
    todo = buildGoApplication rec {
        goPackagePath = "github.com/CodyBense/todo_go";

        src = fetchFromGitHub {
            onwer = "CodyBense";
            repo = "todo_go";
            hash = "";
        };
        vendorHash = "";

        goDeps = ./todo_go.nix;
    };
}
