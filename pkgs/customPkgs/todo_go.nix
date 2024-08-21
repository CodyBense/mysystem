{ buildGoMdoule, fetchFromGitHub, ... }:
{
    todo = buildGoModule rec {
        goPackagePath = "github.com/CodyBense/todo_go";

        src = fetchFromGitHub {
            onwer = "CodyBense";
            repo = "todo_go";
            hash = "";
        };

        goDeps = ./todo_go.nix;
    };
}
