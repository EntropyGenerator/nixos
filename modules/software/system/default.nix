{ config, lib, pkgs, ... }:

{
  imports = [
    ./utils.nix
    ./applications.nix
    ./user.nix
  ];

  # Unfree software
  nixpkgs.config.allowUnfree = true;  
  
  # flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.settings.substituters = [ "https://mirror.nju.edu.cn/nix-channels/store" "https://mirrors.ustc.edu.cn/nix-channels/store" "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" ];
  system.stateVersion = "24.11";
}
