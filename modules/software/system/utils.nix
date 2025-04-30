{ config, lib, pkgs, ... }:
{
  # Utils
  environment.systemPackages = with pkgs; [
    nano
    vim
    htop
    btop
    git
    tree
    curl
    wget
    linuxKernel.packages.linux_6_13.cpupower
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
    remmina
  ];

  # nix-ld
  programs.nix-ld.enable = true;

  # polkit
  security.polkit.enable = true;

  # USB devices
  services.udisks2.enable = true;

  # 666
  services.v2raya.enable = true;
}
