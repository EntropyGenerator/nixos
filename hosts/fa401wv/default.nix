{ config, pkgs, lib, username, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/hardware/main
    ../../modules/hardware/fa401wv

    ../../modules/software/system/main.nix
    ../../modules/software/system/dev.nix
    ../../modules/software/system/game.nix
    ../../modules/software/system/utils.nix
    ../../modules/software/desktop/hyprland.nix
  ];
  networking.hostName = lib.mkForce "tx";

  # Security
  security.pam.services.${username}.enableGnomeKeyring = true;

  # Sound
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };
  environment.systemPackages = with pkgs; [
    pavucontrol
  ];
}
