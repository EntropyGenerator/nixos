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

  # Shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.pathsToLink = [ "/share/zsh" ];
  environment.shells = with pkgs; [ zsh ];
}
