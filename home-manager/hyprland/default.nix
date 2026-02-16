{ pkgs, config, ... }:
{
  imports = [
    ./dunst
    ./hypr
    ./kitty
    ./waybar
    ./wlogout
    ./wofi

    ./applications.nix
  ];
}