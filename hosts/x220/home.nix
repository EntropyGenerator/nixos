{ pkgs, lib, username, ... }:
{
  imports = [
    ../../home-manager/core.nix
    ../../home-manager/applications.nix
    ../../home-manager/zsh.nix
    ../../home-manager/nix-alien.nix

    ../../home-manager/hyprland
  ];
}