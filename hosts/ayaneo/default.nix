{ config, pkgs, lib, username, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/hardware/main

    ../../modules/software/system/main.nix
    ../../modules/software/system/utils.nix
    ../../modules/software/desktop/kde.nix
  ];
  networking.hostName = lib.mkForce "ayaneo";

  environment.systemPackages = with pkgs; [
    maliit-keyboard
    touchegg
    mangohud
  ];

  services.displayManager.autoLogin ={
    enable = true;
    user = "${username}";
  };

#  services.getty.autologinUser = "${username}";
#  environment = {
#    loginShellInit = ''
#      [[ "$(tty)" = "/dev/tty1" ]] && ./gamescope.sh
#    '';
#  };

  services.touchegg.enable = true;

  programs = {
    gamescope = {
      enable = true;
      capSysNice = true;
    };
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };

  # hardware.xone.enable = true; # support for the xbox controller USB dongle
  # boot.initrd.kernelModules = [ "usbhid" "joydev" "xpad" ];

  services.handheld-daemon = {
    enable = true;
    user = "${username}";
    ui.enable = true;
  };

  security.pam.services.${username}.kwallet = {
    enable = true;
    forceRun = true;
  };
}
