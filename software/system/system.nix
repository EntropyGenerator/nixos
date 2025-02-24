{ config, lib, pkgs, ... }:

{
  imports = [
  ];

  # nix-ld 
  programs.nix-ld.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    nano
    vim
    htop
    btop
    git
    tree
    bash-completion
    curl
    wget
    linuxKernel.packages.linux_6_12.cpupower
    fastfetch
    s-tui
    unzip
    zip
    unar
    ntfs3g
    wqy_microhei
    wqy_zenhei
    toybox # Linux Utils
    pciutils
    nvtopPackages.full
    powertop
    brightnessctl
  ];

  # Keyring
  services.gnome.gnome-keyring.enable = true;

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
