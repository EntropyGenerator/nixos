{ config, pkgs, lib, username, ... }:
{
  imports = [
    ../../modules/hardware/main
    ../../modules/hardware/fa401wv

    ../../modules/software/system/main.nix
    ../../modules/software/system/dev.nix
    ../../modules/software/system/game.nix
    ../../modules/software/system/utils.nix
    # ../../modules/software/system/waydroid.nix
    ../../modules/software/desktop/hyprland.nix
  ];
}
