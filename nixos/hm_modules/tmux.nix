{ pkgs, ... }:
{
    programs.tmux = {
        enable = true;
        shell = "${pkgs.zsh}/bin/zsh";
        baseIndex = 1;
        newSession = true;
        plugins = with pkgs; [
            tmuxPlugins.sensible
            {
                plugin = tmuxPlugins.gruvbox;
                extraConfig = ''
                set -g @plugin 'egel/tmux-gruvbox'
                set -g @plugin 'egel/tmux-gruvbox'
                '';
            }
        ];
        sensibleOnTop = true;
    };
}
