
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
    wechat-uos
    (pkgs.callPackage ../../modules/software/3rd/easierconnect/easierconnect.nix { })

    bibata-cursors

    yazi
    atool
    thefuck
  ];

  # Shell
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -la";
      update = "sudo nixos-rebuild switch";
      rm-hm-bak = "cd ~ && find . -type f -name \"*.hm.bak\" -delete";
    };
    history.size = 1000;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "agnoster";
    };
  };

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