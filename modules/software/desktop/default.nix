{ config, lib, pkgs, ... }:

{
  imports = [
    ./greetd.nix
  ];

  # Wayland Desktop Environment Configuations.
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  services.xserver = {
    enable = true;
    # displayManager.gdm.enable = true;
  };

  # Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Desktop Apps
  environment.systemPackages = with pkgs; [
    # Hyprland
    networkmanagerapplet
    kitty

    libsForQt5.qt5.qtwayland
    kdePackages.qtwayland
    kdePackages.qtsvg
    kdePackages.gwenview
    kdePackages.kate
    kdePackages.ark
    kdePackages.plasma-systemmonitor

    nautilus
    code-nautilus
    
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

  # Nautilus fix
  services.gvfs.enable = true;

  # Multi GPU
  environment.variables = {
    AQ_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";
  };
}
