{ config, lib, pkgs, ... }:

let
  home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz;
in

{
  imports = [
    (import "${home-manager}/nixos")
  ];

  users.users.int16 = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" "docker" ];
  };

  home-manager.users.int16 = { pkgs, ... }: {
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
    programs.bash.enable = true;
    programs.zsh.enable = true;
   
    # The state version is required and should stay at the version you
    # originally installed.
    home.stateVersion = "24.11";
    programs.home-manager.enable = true;
  };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.backupFileExtension = "bak";

  # Security
  security.pam.services.int16.enableGnomeKeyring = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    #dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  services.v2raya.enable = true;

  # Waydroid
  virtualisation.waydroid.enable = true;

  # Network
  networking.hostName = "nix16"; # Define your hostname.
}
