# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, host, inputs, username, options, ... }:

{
    imports =[ # Include the results of the hardware scan.
        ./hardware-configuration.nix
        inputs.home-manager.nixosModules.home-manager
        ./modules/de_bundle.nix
        ./modules/code_bundle.nix
        ./modules/packages.nix
        ./../scripts/scripts.nix
        ./sddm-theme/default.nix
        ];

    environment.sessionVariables = {
        FLAKE = "/home/codybense/mysystem";
    };

    environment.variables.EDITOR = "nvim";


    virtualisation.docker.enable = true;
    virtualisation.docker.enableOnBoot = true;

# Module selection
    nvidia_module.enable = 
    if (host == "desktop")
        then true
        else false;

# programs.npm.enable = true;

# Shell
programs.zsh.enable = true;
users.defaultUserShell = pkgs.zsh;


# Home manager
    home-manager = {
        extraSpecialArgs = { inherit inputs; };
        users = {
            codybense = import ./home.nix;
        };
    };

# Enable the flake feature and the accompying nix command-line tool
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

# Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    networking.hostName = "${hostName}";
# networking.hostName = "cody-laptop"; # Define your hostname.
# networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

# Configure network proxy if necessary
# networking.proxy.default = "http://user:password@proxy:port/";
# networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

# Enable networking
    networking.networkmanager.enable = true;

# Set your time zone.
    time.timeZone = "America/New_York";

# Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";

    i18n.extraLocaleSettings = {
        LC_ADDRESS = "en_US.UTF-8";
        LC_IDENTIFICATION = "en_US.UTF-8";
        LC_MEASUREMENT = "en_US.UTF-8";
        LC_MONETARY = "en_US.UTF-8";
        LC_NAME = "en_US.UTF-8";
        LC_NUMERIC = "en_US.UTF-8";
        LC_PAPER = "en_US.UTF-8";
        LC_TELEPHONE = "en_US.UTF-8";
        LC_TIME = "en_US.UTF-8";
    };


# Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.codybense = {
        isNormalUser = true;
        description = "CodyBense";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [];
    };

# Enable sound with pipewire
    sound.enable = true;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
        jack.enable = true;
    };

# Swaylock
    security.pam.services.swaylock = {};

# Allow unfree packages
    nixpkgs.config.allowUnfree = true;


# Fonts
    fonts.packages = with pkgs; [
        font-awesome
        jetbrains-mono
        cascadia-code
        maple-mono-NF
        mononoki
        noto-fonts-cjk-sans
    ];

    services.tlp.enable = true;

# Some programs need SUID wrappers, can be configured further or are
# started in user sessions.
# programs.mtr.enable = true;
# programs.gnupg.agent = {
#   enable = true;
#   enableSSHSupport = true;
# };

# List services that you want to enable:

# Enable the OpenSSH daemon.
    services.openssh.enable = true;

# Open ports in the firewall.
# networking.firewall.allowedTCPPorts = [ ... ];
# networking.firewall.allowedUDPPorts = [ ... ];
# Or disable the firewall altogether.
# networking.firewall.enable = false;

# This value determines the NixOS release from which the default
# settings for stateful data, like file locations and database versions
# on your system were taken. It‘s perfectly fine and recommended to leave
# this value at the release version of the first install of this system.
# Before changing this value read the documentation for this option
# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    system.stateVersion = "23.11"; # Did you read the comment?
}
