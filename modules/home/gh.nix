{ pkgs, ... }:

{
    porgrams.gh = {
        enable = true;
        settings = {
            git_protocol = "ssh";
        };
    };
}
