{ pkgs, config, ... }:
{
    home.packages = with pkgs; [
        # Utils
        networkmanagerapplet
        brightnessctl
        remmina
        kdePackages.gwenview # Image Viewer
        kdePackages.ark # Archive Manager
        kdePackages.dragon # Media Player

        # File Manager
        kdePackages.dolphin
        kdePackages.kio # needed since 25.11
        kdePackages.kio-fuse # to mount remote filesystems via FUSE
        kdePackages.kio-extras
        # nautilus
    ];
}