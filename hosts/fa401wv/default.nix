{ config, pkgs, lib, username, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/hardware/main
    ../../modules/hardware/fa401wv

    ../../modules/software/system/main.nix
    # ../../modules/software/system/dev.nix
    ../../modules/software/system/game.nix
    ../../modules/software/system/utils.nix
    # ../../modules/software/system/waydroid.nix
    ../../modules/software/desktop/hyprland.nix
  ];

  # direnv
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
