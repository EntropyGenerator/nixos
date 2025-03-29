{
  pkgs,
  lib,
  username,
  ...
}: {
  # User
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
  };

  # Security
  security.pam.services.${username}.enableGnomeKeyring = true;

  # 666
  services.v2raya.enable = true;

}