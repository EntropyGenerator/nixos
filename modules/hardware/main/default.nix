{ config, lib, pkgs, ... }:

{
  imports = [
    ./network.nix
    ./input.nix
    ./bluetooth.nix
  ];
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Kernel
  boot.kernelPackages = lib.mkOptionDefault pkgs.linuxPackages_latest;

  # NTFS
  boot.supportedFilesystems = [ "ntfs" ];

  # Power
  services.power-profiles-daemon.enable = true;

  # Firmware
  hardware.enableRedistributableFirmware = true;
}
