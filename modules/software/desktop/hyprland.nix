{ config, lib, pkgs, ... }:

{
  # Dolphin fix
  nixpkgs.overlays = [
    (import ./dolphin-fix.nix)
  ];

  # Wayland Desktop Environment Configuations.
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # services.xserver = {
  #   enable = true;
  #   # displayManager.gdm.enable = true;
  # };

  # Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.systemPackages = with pkgs; [
    kitty
    tuigreet
  ];

  # Gnome fix
  # services.udev.packages = with pkgs; [ gnome-settings-daemon ];

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

  # Nautilus fix
  # services.gvfs.enable = true;

  # Avoid suspend on power
  # services.logind.extraConfig = ''
  #   HandleLidSwitch=suspend
  #   HandleLidSwitchExternalPower=ignore
  # '';
}
