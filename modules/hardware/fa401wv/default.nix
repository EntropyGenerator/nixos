{ config, lib, pkgs, ... }:

{
  imports = 
    [
      ./asus.nix
      ./nvidia.nix
      ./hardware-configuration.nix
    ];
    
  networking.hostName = lib.mkForce "tx";

  # Sound
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };
  environment.systemPackages = with pkgs; [
    pavucontrol
  ];

  # Kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # AMD CPU
  boot = {
    blacklistedKernelModules = [ "nouveau" ];
    extraModulePackages = [
      #config.boot.kernelPackages.asus-ec-sensors
      #config.boot.kernelPackages.asus-wmi-sensors
      #config.boot.kernelPackages.zenpower 
      #config.boot.kernelPackages.acpi_call
    ];
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
}
