{ pkgs, ... }:
{
    programs.zsh = {
        enable = true;
        shellAliases = {
            c = "clear";
            v = "nvim";
            sv = "sudo nvim";
            ll = "ls -l";
            la = "ls -a";
            ".." = "cd ..";
            "2." = "cd ../..";
            "3." = "cd ../../..";
            "4." = "cd ../../../..";
            py = "python3";
            pm = "~/Code/password_manager_cli/result/bin/pm_cli.py";
        };
        envExtra = ''
            eval "$(zoxide init zsh)"
            eval "$(direnv hook zsh)"
            randomPokemon
        '';
    };

}
