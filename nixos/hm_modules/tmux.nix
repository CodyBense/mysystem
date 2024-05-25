{ pkgs, ... }:
{
    programs.tmux = {
        enable = true;
        shell = "${pkgs.zsh}/bin/zsh";
        baseIndex = 1;
        newSession = true;
        prefix = "C-a";
        keyMode = "vi";
        extraConfig = ''
            set -g renumber-windows on
            '';
        plugins = with pkgs; [
            tmuxPlugins.sensible
            {
                plugin = tmuxPlugins.gruvbox;
                extraConfig = ''
                set -g @plugin 'egel/tmux-gruvbox'
                set -g @plugin 'egel/tmux-gruvbox'
                '';
            }
            tmuxPlugins.yank
            tmuxPlugins.resurrect
            tmuxPlugins.continuum
        ];
        sensibleOnTop = true;
    };
}
