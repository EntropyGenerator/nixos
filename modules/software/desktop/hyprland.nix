{ config, lib, pkgs, ... }:

{
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
    brightnessctl
    remmina

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
    bibata-cursors

    # Greetd
    greetd.tuigreet
  ];

  # Gnome fix
  services.udev.packages = with pkgs; [ gnome-settings-daemon ];

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

  # greetd
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "tuigreet --time --remember --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  # this is a life saver.
  # literally no documentation about this anywhere.
  # might be good to write about this...
  # https://www.reddit.com/r/NixOS/comments/u0cdpi/tuigreet_with_xmonad_how/
  systemd.services.greetd.serviceConfig = {
    Type = "idle";
    StandardInput = "tty";
    StandardOutput = "tty";
    StandardError = "journal"; # Without this errors will spam on screen
    # Without these bootlogs will spam on screen
    TTYReset = true;
    TTYVHangup = true;
    TTYVTDisallocate = true;
  };

  #environment.etc."greetd/environments".text = ''
  #  Hyprland
  #  fish
  #  bash
  #'';
}
