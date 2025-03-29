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

    # Environment
    libsForQt5.qt5.qtwayland
    kdePackages.qtwayland
    kdePackages.qtsvg
    xorg.xlsclients
    xwayland
    adwaita-icon-theme
    gnomeExtensions.appindicator

    # Utils
    networkmanagerapplet
    kitty
    kdePackages.gwenview
    kdePackages.kate
    kdePackages.ark
    kdePackages.plasma-systemmonitor

    # File Manager
    nautilus
    code-nautilus
    
    # Hyprland
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

  # Gnome fix
  programs.dconf.enable = true;
  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];

  # Nautilus fix
  services.gvfs.enable = true;
  nixpkgs.overlays = [
    (final: prev: {
      nautilus = prev.nautilus.overrideAttrs (nprev: {
        buildInputs =
          nprev.buildInputs
          ++ (with pkgs.gst_all_1; [
            gst-plugins-good
            gst-plugins-bad
          ]);
      });
    })
  ];

}
