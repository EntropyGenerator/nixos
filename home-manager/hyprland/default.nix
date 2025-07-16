{ pkgs, config, ... }:
{
  imports = [
    ./hypr
    ./kitty
    ./waybar
    ./wlogout
    ./wofi

    ./applications.nix
  ];
}