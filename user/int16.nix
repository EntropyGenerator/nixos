{ config, lib, pkgs, ... }:

{
  imports = [

  ];

  users.users.int16 = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      firefox
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
    ];
  };

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
