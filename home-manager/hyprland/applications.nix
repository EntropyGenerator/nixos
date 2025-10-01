{ pkgs, config, ... }:
{
    home.packages = with pkgs; [
        # Environment
        libsForQt5.qt5.qtwayland
        kdePackages.qtwayland
        xorg.xlsclients
        xwayland
        adwaita-icon-theme
        gnomeExtensions.appindicator

        # Utils
        networkmanagerapplet
        loupe
        gnome-text-editor
        file-roller
        brightnessctl
        remmina

        # File Manager
        nautilus
        
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