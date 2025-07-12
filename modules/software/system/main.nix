{ config, lib, pkgs, username, ... }:

{
  imports = [

  ];

  # Unfree software
  nixpkgs.config.allowUnfree = true;

  # User
  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
  };

  # git
  programs.git = {
    enable = true;
    lfs.enable = true;
  };

  # Shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.pathsToLink = [ "/share/zsh" ];
  environment.shells = with pkgs; [ zsh ];

  # Secure
  security.pam.services.login.enableGnomeKeyring = true;
  
  # flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.substituters = [ "https://mirror.nju.edu.cn/nix-channels/store" "https://mirrors.ustc.edu.cn/nix-channels/store" "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];
  system.stateVersion = "24.11";
}
