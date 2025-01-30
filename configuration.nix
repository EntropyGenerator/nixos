# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./hardware/fa401wv/main.nix
    ./hardware/default/main.nix
    ./software/desktop/desktop.nix
    ./software/system/system.nix
    ./user/int16.nix
  ];

  # Source
  nix.settings.substituters = [ "https://mirror.nju.edu.cn/nix-channels/store" "https://mirrors.ustc.edu.cn/nix-channels/store" "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];
  # Unfree software
  nixpkgs.config.allowUnfree = true;  
  
  system.stateVersion = "24.11"; # Did you read the comment?

}

