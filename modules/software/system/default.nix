{ config, lib, pkgs, ... }:

{
  imports = [
    ./utils.nix
    ./applications.nix
  ];

  # Unfree software
  nixpkgs.config.allowUnfree = true;  
  
  # flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  system.stateVersion = "24.11";
}
