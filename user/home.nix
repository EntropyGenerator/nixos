{ pkgs, lib, username, ... }:

{
  home.homeDirectory = "/home/${username}";

  home.packages = with pkgs; [
    firefox-esr
    chromium
    (vscode.override { commandLineArgs = "--enable-wayland-ime %F"; })
    seafile-client
    qq
    v2ray
    v2raya
    libreoffice-qt6-fresh
    go-musicfox
    vlc
    wechat-uos
    (pkgs.callPackage ../modules/software/3rd/easierconnect/easierconnect.nix { })

    bibata-cursors

    yazi
    atool
  ];

  # Default Applications
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/plain" = "org.kde.kwrite.desktop";
      "image/x-mng" = "org.kde.gwenview.desktop";
    };
  };

  # programs.bash.enable = true;
  programs.zsh.enable = true;
 
  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
