{ pkgs, ... }:
{
    programs.tmux = {
        enable = true;
        shell = "${pkgs.zsh}/bin/zsh";
        baseIndex = 1;
        newSession = true;
        plugins = with pkgs; [
            tmuxPlugins.sensible
        ];
        sensibleOnTop = true;
    };
}
