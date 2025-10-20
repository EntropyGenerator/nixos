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
      package = config.boot.kernelPackages.nvidiaPackages.production;
      # package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
      #   version = "580.65.06";
      #   sha256_64bit = "sha256-BLEIZ69YXnZc+/3POe1fS9ESN1vrqwFy6qGHxqpQJP8=";
      #   openSha256 = "sha256-BKe6LQ1ZSrHUOSoV6UCksUE0+TIa0WcCHZv4lagfIgA=";
      #   settingsSha256 = "sha256-9PWmj9qG/Ms8Ol5vLQD3Dlhuw4iaFtVHNC0hSyMCU24=";
      #   usePersistenced = false;
      # };
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
