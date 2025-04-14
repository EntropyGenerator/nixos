{ config, lib, pkgs, ... }:
{
  # docker
  virtualisation.docker.enable = true;
  hardware.nvidia-container-toolkit.enable = true;

  # mysql
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };
}