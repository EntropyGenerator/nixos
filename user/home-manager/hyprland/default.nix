{ pkgs, config, ... }:
{
  imports = [
    ./hypr
    ./kitty
    ./waybar
    ./wlogout
    ./wofi
  ];
}