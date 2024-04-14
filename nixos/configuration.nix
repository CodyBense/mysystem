# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./systems/laptop/hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];

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

  networking.hostName = "cody-laptop"; # Define your hostname.
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

  # Configure keymap in X11
  services.xserver = {
    # sddm theme
    enable = true;
    displayManager = {
        sddm.enable = true;
        sddm.theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
    };
    layout = "us";
    xkbVariant = "";
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

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  	# programs
  	neovim
	git
	home-manager
	firefox
	networkmanagerapplet
    killall

    curl

    # fonts, icons, and cursors
    nerdfonts
    font-awesome
    jetbrains-mono
    cascadia-code
    maple-mono-NF
    mononoki
    noto-fonts-cjk-sans

    material-design-icons

    bibata-cursors
    # bibata-extra-cursors

    # File manager
    dolphin

	# Hyprland stuff
	## bar
	waybar
	## notifiations
	dunst
	libnotify
	## wallpaper
	swww
	## terminal
	kitty
	## app launcher
	rofi-wayland
    ## login screen
    sddm

    # GTK
    gtk2
    gtk3
    gtk4

    # QT
    qt5ct
    qt6ct
    gsettings-qt

    ## needed for sddm theme
    libsForQt5.qt5.qtquickcontrols2
    libsForQt5.qt5.qtgraphicaleffects
  ];

  # Fonts
  fonts.packages = with pkgs; [
    font-awesome
    jetbrains-mono
    cascadia-code
    maple-mono-NF
    mononoki
    noto-fonts-cjk-sans
  ];

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


  # Nvidia stuff , move to module style
  #hardware.opengl = {
  #	enable = true;
  #	driSupport = true;
  #	driSupport32Bit = true;
  #};

  # Load nvidia drivers
  #services.xserver.videoDrivers = ["nvidia"];

  #hardware.nvidia = {
  #	modesetting.enable = true;

#	powerManagement.enable = true;

#	powerManagement.finegrained = false;

#	open = false;

#	nvidiaSettings = true;

#	package = config.boot.kernelPackages.nvidiaPackages.stable;
#  };

  # Hyprland
  programs.hyprland = {
   enable = true;
   #nvidiaPatches = true;
   xwayland.enable = true;
   # package = inputs.hyprland.packages."${pkgs.system?}".hyprland;
  };

  environment.sessionVariables = {
  # WLR_NO_HARDWARE_CURSORS = "1";
   NIXOS_OZONE_WL = "1";
  };

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
}
