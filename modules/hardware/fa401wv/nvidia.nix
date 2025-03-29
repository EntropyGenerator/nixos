{ config, lib, pkgs, ... }:

{
  # NVIDIA fxxk U
  services.xserver.videoDrivers = lib.mkForce ["amdgpu" "nvidia"];
  hardware = {
    graphics = { 
      enable = true;
      enable32Bit = true;
    };
    ## Enable the Nvidia card, as well as Prime and Offload:
    amdgpu.initrd.enable = true;
    nvidia = {
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      open = true;
      modesetting.enable = true;
      nvidiaSettings = true;

      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        amdgpuBusId = "PCI:101:0:0";
        nvidiaBusId = "PCI:100:0:0";
      };  

      powerManagement = {
        enable = true;
        finegrained = true;
      };

      dynamicBoost.enable = true;
    };
  };
  environment.variables = {
    KWIN_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";
    AQ_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";
  };
}
