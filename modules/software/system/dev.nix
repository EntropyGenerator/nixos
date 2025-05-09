{ config, lib, pkgs, ... }:
{
  # direnv
  programs.direnv = {
    enable = true;
    package = pkgs.direnv;
    silent = false;
    loadInNixShell = true;
    direnvrcExtra = "";
    nix-direnv = {
      enable = true;
      package = pkgs.nix-direnv;
    };
  };
  
  # docker
  virtualisation.docker.enable = true;
  hardware.nvidia-container-toolkit.enable = true;

  # mysql
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };
}