{ inputs, lib, config, pkgs, ...}:
{
    options = {
        nividia_mudule.enable = lib.mkEnableOption "enables nvidia_module"; 
    };

    config = lib.mkIf config.nvidia_module.enable{
        hardware.opengl = {
            enable = true;
            driSupport = true;
            driSupport32Bith = true;
        };

        # Load nvidia driver
        services.xserver.videoDirvers = ["nvidia"];

        hardware.nvidia = {
            modesetting.enable = true;
            powerManagement.enable = true;
            powerManagement.finegrained = false;
            open = false;
            nvidiaSettings = true;
            package = config.boot.kernelPackages.stable;
        };
    };
}
