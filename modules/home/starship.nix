{ ... }:

{
    programs.starship = {
        enable = true;
        enableZshIntegration = true;
        settings = {
            "$schema" = "https://starship.rs/config-schema.json";
            format = [
            ];
        };
    };
}
