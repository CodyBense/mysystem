{ ... }:
{
    programs.lf = {
        enable = true;
        settings = {
            hidden = true;
            ignorecase = true;
            icons = true;
            sixel = true;
            rulerfmt = "%d  |%a  |%p  |\033[7;31m %m \033[0m  |\033[7;33m %c \033[0m  |\033[7;35m %s \033[0m  |\033[7;34m %f \033[0m  |%i/%t";
        };
        commands = {
            mkdir = "\"$\"{{printf \"Directory name: \"
                     read ans
                     mkdir $ans}}";
        };
        cmdKeybindings = {
            md = mkdir;
        };
    };
}
