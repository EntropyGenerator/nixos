{ config, lib, pkgs, ... }:

{
  imports = [
    ./network.nix
    ./input.nix
    ./sound.nix
    ./bluetooth.nix
  ];
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Kernel
  boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_6_12;

  # NTFS
  boot.supportedFilesystems = [ "ntfs" ];
}
