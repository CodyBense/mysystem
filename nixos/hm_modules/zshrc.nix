{ ... }:
{
    programs.zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;

        initExtra = ''
            eval "$(zoxide init zsh)"
            eval "$(direnv hook zsh)"
            randomPokemon
            '';

        initExtraFirst = ''
            HISTFILE=~/.histfile
            HISTSIZE=1000
            SAVEHIST=1000
        '';

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

        oh-my-zsh = {
            enable = true;
            theme = "half-life";
        };
    };

}
