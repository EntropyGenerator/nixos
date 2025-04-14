{ config, lib, pkgs, ... }:
{
  # kde
  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
  hardware.bluetooth.enable = true;
}