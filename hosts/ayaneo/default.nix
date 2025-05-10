{ config, pkgs, lib, username, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../modules/hardware/main
    ../../modules/hardware/ayaneo

    ../../modules/software/system/main.nix
    ../../modules/software/system/utils.nix
    ../../modules/software/desktop/kde.nix
  ];
  networking.hostName = lib.mkForce "ayaneo";

  environment.systemPackages = with pkgs; [
    maliit-keyboard
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
