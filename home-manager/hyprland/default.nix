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

  programs.kitty.enable = true;
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
}