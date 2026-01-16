{ pkgs, config, ... }:
{
    home.packages = with pkgs; [
        # Environment
        libsForQt5.qt5.qtwayland
        kdePackages.qtwayland
        xorg.xlsclients
        xwayland
        kdePackages.qtsvg

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
        
        # Hyprland
        hyprpicker
        hyprcursor
        hyprlock
        hypridle
        hyprpaper
        hyprshot
        waybar
        wofi
        wlogout
        dunst
        hyprshade
        bibata-cursors
    ];
}