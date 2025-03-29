{ pkgs, lib, username, ... }:

{
  inherit username;
  home.homeDirectory = "/home/${username}";

  users.users.${username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
  };

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
    (pkgs.callPackage ../software/3rd/easierconnect/easierconnect.nix { })

    bibata-cursors

    yazi
    atool
  ];
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/plain" = "org.kde.kwrite.desktop";
    };
  };

  # Security
  security.pam.services.${username}.enableGnomeKeyring = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    #dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  services.v2raya.enable = true;

  # Waydroid
  virtualisation.waydroid.enable = true;

  # programs.bash.enable = true;
  programs.zsh.enable = true;
 
  # The state version is required and should stay at the version you
  # originally installed.
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
