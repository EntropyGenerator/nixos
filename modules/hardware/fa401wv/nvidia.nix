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
      # package = config.boot.kernelPackages.nvidiaPackages.production;
      package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
        version = "580.95.05";
        sha256_64bit = "sha256-hJ7w746EK5gGss3p8RwTA9VPGpp2lGfk5dlhsv4Rgqc=";
        sha256_aarch64 = "sha256-zLRCbpiik2fGDa+d80wqV3ZV1U1b4lRjzNQJsLLlICk=";
        openSha256 = "sha256-RFwDGQOi9jVngVONCOB5m/IYKZIeGEle7h0+0yGnBEI=";
        settingsSha256 = "sha256-F2wmUEaRrpR1Vz0TQSwVK4Fv13f3J9NJLtBe4UP2f14=";
        persistencedSha256 = "sha256-QCwxXQfG/Pa7jSTBB0xD3lsIofcerAWWAHKvWjWGQtg=";
      };
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

  # MultiGPU
  environment.variables = {
    __EGL_VENDOR_LIBRARY_FILENAMES="/run/opengl-driver/share/glvnd/egl_vendor.d/50_mesa.json";
    WLR_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";
    KWIN_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";
    AQ_DRM_DEVICES = "/dev/dri/card1:/dev/dri/card0";
    __GLX_VENDOR_LIBRARY_NAME = "mesa";
  };
}
