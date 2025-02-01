{ config, lib, pkgs, ... }:

{
  # Wayland Desktop Environment Configuations.
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
  };
  # Hyprland
  programs.hyprland = { # or wayland.windowManager.hyprland
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };
  environment.systemPackages = with pkgs; [
    # Hyprland
    networkmanagerapplet
    kitty
    xfce.thunar

    libsForQt5.qt5.qtwayland
    kdePackages.qtwayland
    xorg.xlsclients
    xwayland

    hyprpicker
    hyprcursor
    hyprlock
    hypridle
    hyprpaper
    hyprshot
    waybar
    wofi
    wlogout
    dunst    
    hyprshade
  ];
}
