{ config, lib, pkgs, ... }:

{
  imports = [
    # ./home-manager.nix
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
    radeontop 
    direnv
  ];
}
