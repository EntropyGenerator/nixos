{ pkgs, config, ... }:
{
  imports = [
    ./dunst
    ./hypr
    ./kitty
    ./waybar
    ./wlogout
    ./wleave
    ./wofi

    ./applications.nix
  ];
}