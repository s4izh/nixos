{ config, pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    firefox
    alacritty
    discord
    dmenu
    w3m
    pavucontrol
    zathura
    feh
    fzf
    redshift
    networkmanagerapplet
    gnome.gnome-calculator
    xclip
    maim
    sshfs
    unzip
    zip
    cowsay
    gcc
    nodejs
    libtool
    cmake
    cargo
    cargo-watch
    rustup
    rust-analyzer
    bacon
  ];


  services.xserver = {
    layout = "es";
    xkbVariant = "";
    xkbOptions = "caps:escape";
    libinput = {
        enable = true;
        mouse = {
          accelProfile = "flat";
          middleEmulation = false;
        };
        touchpad = {
          accelProfile = "flat";
          naturalScrolling = true;
        };
      };
  };

  programs.npm.enable = true;
  programs.thunar.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  fonts.fontconfig = {
    defaultFonts = {
      #sansSerif = [ "Liberation Mono" ];
      #serif = [ "Liberation Mono" ];
      monospace = [ "Liberation Mono" ];
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?
}