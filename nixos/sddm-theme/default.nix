{ pkgs, ...} :

{
    services.xserver = {
# sddm theme
        enable = true;
        displayManager = {
            sddm = {
                enable = true;
                theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
                wayland.enable = true;
            };
        };
# layout = "us";
# xkbVariant = "";
        xkb = {
            layout = "us";
            variant = "";
        };
    };
}
