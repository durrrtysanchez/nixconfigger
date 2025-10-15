# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # Pick only one of the below networking options.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
    useXkbConfig = true; # use xkb.options in tty.
  };

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    displayManager.startx.enable = true;
    videoDrivers = [ "intel" "modesetting" ];
    libinput.enable = true;
    layout = "us";
    displayManager = {
      defaultSession = "none+i3";
    };
  };

  services.xserver.windowManager.i3.enable = true;

  # Enable sound.
  hardware.pulseaudio.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.cuckboi = {
    isNormalUser = true;
    extraGroups = [ "wheel" "sudo" "video" "sound" "storage" ];
    createHome = true;
    home = "/home/cuckboi";
    shell = "/run/current-system/sw/bin/fish";
    packages = with pkgs; [
      firefox
      tree
      nano
      vim
      wget
      git
      curl
    ];
  };

  # List packages installed in system profile. To search, run:
  $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    curl
    binutils
    pciutils
    coreutils
    feh
    dmenu
    herbstluftwm
    i3
    cwm
    tcsh
    nano
    sudo
    fish

    vscodium
    networkmanager
    rxvt-unicode
    firefox
    cmake
    gcc
    wirelesstools
    ffmpeg
    vlc
    htop
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  #programs
  programs.fish.enable = true;
  programs.firefox.enable = true;
 
 # NIX FINAL SETUP
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "25.05";

}

