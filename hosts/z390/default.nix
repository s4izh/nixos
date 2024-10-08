# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  inputs,
  config,
  pkgs,
  ...
}:
let
  modules = ../../modules;
in
{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./configuration.nix
    "${modules}/base.nix"
    "${modules}/desktop.nix"
    "${modules}/dwm.nix"
    "${modules}/gaming.nix"
    "${modules}/virtualisation.nix"
    "${modules}/android.nix"
    # "${modules}/i3.nix"
    inputs.home-manager.nixosModules.home-manager
  ];

  home-manager = {
    extraSpecialArgs = {
      inherit inputs;
    };
    users = {
      sergio = import ../../home/sergio/home.nix;
    };
  };

  system.stateVersion = "23.05";
}
