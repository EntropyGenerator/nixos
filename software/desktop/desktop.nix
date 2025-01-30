{ config, lib, pkgs, ... }:

{
  # Wayland Desktop Environment Configuations.
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.compositor = "kwin";
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.defaultSession = "plasma";
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  # Hyprland
  programs.hyprland = { # or wayland.windowManager.hyprland
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };
  environment.systemPackages = with pkgs; [
    # Hyprland
    kitty
    libsForQt5.qt5.qtwayland
    kdePackages.qtwayland
    pyprland
    xwayland
    hyprpicker
    hyprcursor
    hyprlock
    hypridle
    hyprpaper
    waypaper
    hyprshot
    waybar
    wofi
    wlogout
    dunst    
    hyprshade
  ];
}
