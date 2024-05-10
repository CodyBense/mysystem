{ ... }:
{
    programs.git = {
        enable = true;
        userName = "CodyBense";
        userEmail = "codybense@gmail.com";
        aliases = {
            a = "add";
            pu = "push";
            co = "checkout";
            cm = "commit";
        };
    };
}
