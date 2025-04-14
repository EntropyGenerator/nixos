{ pkgs, lib, username, ... }:
{
  imports = [
    ../../home-manager/core.nix
    ../../home-manager/applications.nix

    ../../home-manager/hyprland
  ];
}