{ config, pkgs, lib, username, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/hardware/main

    ../../modules/software/system/main.nix
    ../../modules/software/system/utils.nix
    ../../modules/software/system/game.nix
    ../../modules/software/desktop/hyprland.nix
  ];
  networking.hostName = lib.mkForce "x220";

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

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Direnv
  programs.direnv = {
    enable = true;
    package = pkgs.direnv;
    silent = false;
    loadInNixShell = true;
    direnvrcExtra = "";
    nix-direnv = {
      enable = true;
      package = pkgs.nix-direnv;
    };
  };

}
