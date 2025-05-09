{ pkgs, lib, username, ... }:
{
  imports = [
    ../../home-manager/core.nix
    ../../home-manager/applications.nix
    ../../home-manager/zsh.nix

    ../../home-manager/hyprland
  ];

  # Keyring
  services.gnome-keyring.enable = true;
}