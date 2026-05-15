{ config, lib, pkgs, ... }:

{
  imports = [
    ./network.nix
    ./input.nix
    ./bluetooth.nix
    ./audio.nix
  ];
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Kernel
  boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;

  # NTFS
  boot.supportedFilesystems.ntfs = true;

  # Firmware
  hardware.enableRedistributableFirmware = true;
}
