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
        kdePackages.gwenview
        kdePackages.kate
        kdePackages.ark
        brightnessctl
        remmina

        # File Manager
        kdePackages.dolphin
        kdePackages.qtsvg
        
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

        # Greetd
        greetd.tuigreet
    ]
}