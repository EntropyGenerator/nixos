{ config, pkgs, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/hardware/main

    ../../modules/software/system
    ../../modules/software/system/steam.nix
    ../../modules/software/desktop/kde.nix
  ];

  networking.hostName = lib.mkForce "smw700";

}