{ config, pkgs, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/hardware/main
    ../../modules/hardware/fa401wv

    ../../modules/software/system
    ../../modules/software/system/dev.nix
    ../../modules/software/system/steam.nix
    ../../modules/software/system/utils.nix
    ../../modules/software/desktop/hyprland.nix
  ];
  networking.hostName = lib.mkForce "tx";
}