{ config, pkgs, ... }:
{
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
}
