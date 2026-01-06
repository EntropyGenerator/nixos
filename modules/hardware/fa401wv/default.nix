{ config, lib, pkgs, ... }:

{
  imports = 
    [
      ./asus.nix
      ./nvidia.nix
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
  boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_latest;

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

  # ACPI S3 Fix for FA401WV BIOS Version 319
  # Not Success Yet...
  # boot.initrd.prepend = [
  #   "${(pkgs.callPackage ./custom-dsdt.nix {})}/dsdt.cpio"
  # ];

  # TMP Config for Moneta GPU fuzzing test
  specialisation = {
    moneta.configuration = {
      system.nixos.tags = [ "moneta" ];
      
      boot.kernelPackages = let
        linux_moneta_pkg = { fetchurl, buildLinux, ... } @ args:

          buildLinux (args // rec {
            version = "6.18.2";
            modDirVersion = version;

            src = fetchurl {
              url = "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.18.2.tar.xz";
              # After the first build attempt, look for "hash mismatch" and then 2 lines below at the "got:" line.
              # Use "sha256-....." value here.
              hash = "sha256-VYxrurdJSSs0+Zgn/oB7ADmnRGk8IdOn4Ds6SO2quWo=";
            };
            kernelPatches = [
              {
                name = "moneta";
                patch = ./moneta.patch;
                structuredExtraConfig = {
                  KVM_AGAMOTTO = lib.kernel.yes;
                };
              }
            ];

            extraConfig = ''
            '';

            extraMeta.branch = "6.18";
          } // (args.argsOverride or {}));
        linux_moneta = pkgs.callPackage linux_moneta_pkg{};
      in 
        pkgs.recurseIntoAttrs (pkgs.linuxPackagesFor linux_moneta);
    };
  };
}
