{
  pkgs,
  config,
  ...
}: {
  # xdg.configFile."hypr/hyprland.conf".enable = false;
  services.hyprpolkitagent.enable = true;

  home.file.".config/hypr/hyprland.conf".source = ./hyprland.conf;
  home.file.".config/hypr/hyprlock.conf".source = ./hyprlock.conf;
  home.file.".config/hypr/hyprpaper.conf".source = ./hyprpaper.conf;
  home.file.".config/hypr/hypridle.conf".source = ./hypridle.conf;
  home.file.".config/hypr/wallpaper/wallpaper.jpg".source = ./wallpaper/wallpaper.jpg;
}