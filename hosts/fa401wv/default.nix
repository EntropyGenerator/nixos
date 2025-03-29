{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/hardware/main
    ../../modules/hardware/fa401wv

    ../../modules/software/system
    ../../modules/software/desktop

    ../../user/home-manager
  ];

}