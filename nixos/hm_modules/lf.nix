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
            mkdir = "\${{
                     printf \"Directory name: \"
                     read ans
                     mkdir $ans}}";
            mkfile = "\${{
                     printf \"File name: \"
                     read ans
                     $EDITOR $ans}}";
            unarchive = "\${{
                        case \"$f\" in
                            *.zip) unzip \"$f\" ;;
                            *.rar) unrar x \"$f\" ;;
                            *.tar.gz) tar -xzvf \"$f\" ;;
                            *.tar.bz2) tar -xjvf \"$f\" ;;
                            *.tar) tar -xvf \"$f\" ;;
                            *.7z) 7z e \"$f\" ;;
                        *) echo \"Unsupported format\" ;;
                        esac}}";
            # trash = "\${{
            #         files=$(printf \"$fx\" | tr '\n' ';')
            #         while [\"$files\"]; do
            #             file=\"$\"{files%%;*}
            #
            #             trashy put ""$\"(basename \"$\"file\")\"\"
            #         ";
        };
        keybindings = {
            # c = null;
            # d = null;
            m = null;
            mf = "mkfile";
            md = "mkdir";
        };
    };
}
