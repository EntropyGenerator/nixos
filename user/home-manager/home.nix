{ pkgs, lib, username, ... }:
{
  imports = [
    ./core.nix
    ./applications.nix

    ./hyprland
  ];
}
