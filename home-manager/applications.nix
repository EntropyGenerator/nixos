
{ pkgs, lib, username, ... }:
{
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
    wechat
    (pkgs.callPackage ../modules/software/3rd/easierconnect/easierconnect.nix { })
  ];

  # Default Applications
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/plain" = ["org.kde.kwrite.desktop" "code.desktop"];
      "image/x-mng" = "org.kde.gwenview.desktop";
      "application/pdf" = "firefox-esr.desktop";

      "text/html" = "firefox-esr.desktop";
      "x-scheme-handler/http" = "firefox-esr.desktop";
      "x-scheme-handler/https" = "firefox-esr.desktop";
      "x-scheme-handler/about" = "firefox-esr.desktop";
      "x-scheme-handler/unknown" = "firefox-esr.desktop";
    };
  };
}