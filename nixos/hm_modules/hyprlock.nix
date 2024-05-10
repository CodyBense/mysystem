{ ... }:
{
    home.file.".config/hypr/hyprlock.conf".text = ''
        background {
            path = ~/mysystem/wallpapers/latios_latias.jpg
                color = rgba(40, 40, 40, 0.6)

                blur_passes = 3
                blur_size = 1
        }

        image {
            path = ~/mysystem/wallpapers/latios_latias.jpg
                rounding = -1
                border_size = 2
                border_color = rgba(80, 73, 69, 1)
        }

        input-field {
            size = 200 30
                outline_thickness = 2
                dots_size = 0.3
                dots_center = true
                font_family = JetBrains Mono Nerd Font Mono Semibold
                outer_color = rgba(102, 92, 84, 1)
                inner_color = rgba(60, 56, 54, 1)
                font_color = rgba(189, 174, 147, 1)
                fade_on_empty = false
                placeholder_text = 
                check_color = rgb(215, 153, 33)
                fail_color = rgb(204, 36, 29)
                fail_text = <i><b>Wrong password</b></i>
        }

        label {
            text = $TIME
                text_align = center
                color = rgba(189, 174, 147, 1)
                font_size = 45
                font_family = JetBrains Mono Nerd Font Mono Semibold

                position = 0, 80
                halign = center
                valign = center
        }
    '';
}
