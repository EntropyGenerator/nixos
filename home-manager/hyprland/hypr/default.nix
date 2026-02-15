{
  pkgs,
  config,
  ...
}: {
  # xdg.configFile."hypr/hyprland.conf".enable = false;
  home.packages = with pkgs; [
    # Environment
    libsForQt5.qt5.qtwayland
    kdePackages.qtwayland
    xorg.xlsclients
    xwayland
    kdePackages.qtsvg

    # Hyprland
    hyprpicker
    hyprcursor
    hyprlock
    hypridle
    hyprpaper
    hyprshot
    hyprlauncher
    wofi # todo: replace with hyprlauncher
    wlogout
    dunst
    hyprshade
    bibata-cursors

    wl-clipboard
  ];

  services.hyprpolkitagent.enable = true;
  # services.hyprlauncher.enable = true;
  services.clipman.enable = true;

  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
  home.file.".config/hypr/hyprlock.conf".source = ./hyprlock.conf;
  home.file.".config/hypr/hyprpaper.conf".source = ./hyprpaper.conf;
  home.file.".config/hypr/hypridle.conf".source = ./hypridle.conf;
  home.file.".config/hypr/wallpaper/wallpaper.jpg".source = ./wallpaper/wallpaper.jpg;
}