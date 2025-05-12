{ config, lib, pkgs, ... }:
{
  imports = [

  ];

  # Kernel
  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_6_14;

  # AMD CPU
  boot = {
    blacklistedKernelModules = [ "nouveau" ];
    extraModulePackages = [ ];
    kernelModules = [ "amd-pstate" ];
    kernelParams = [
      "pcie_aspm.policy=powersupersave"
    ];
  };
  powerManagement.enable = true;
  powerManagement.powertop.enable = true;
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

  # SSD
  services.fstrim.enable = lib.mkDefault true;

  # Sound
  hardware.firmware = with pkgs; [ sof-firmware ];
  services.pulseaudio.enable = true;
  services.pulseaudio.support32Bit = true;
  services.pulseaudio.extraConfig = "load-module module-combine-sink";
  services.pulseaudio.package = pkgs.pulseaudioFull;
  services.pipewire.enable = false;
}