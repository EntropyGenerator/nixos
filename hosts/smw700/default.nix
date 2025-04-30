{ config, pkgs, lib, username, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/hardware/main

    ../../modules/software/system
    ../../modules/software/system/utils.nix
    ../../modules/software/system/steam.nix
    ../../modules/software/desktop/lxqt.nix
  ];
  networking.hostName = lib.mkForce "smw700";

  environment.systemPackages = with pkgs; [
    maliit-keyboard
    touchegg
  ];

  services.displayManager.autoLogin ={
    enable = true;
    user = "${username}";
  };

  services.touchegg.enable = true;
}
