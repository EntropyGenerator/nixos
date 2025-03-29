{
  pkgs,
  lib,
  username,
  ...
}: {
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
  };

  # Security
  security.pam.services.${username}.enableGnomeKeyring = true;

  services.v2raya.enable = true;

  home-manager.backupFileExtension = "bak";
}