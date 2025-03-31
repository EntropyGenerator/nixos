{username, ...}: {
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
  };
  programs.home-manager.enable = true;
  
  # Keyring
  services.gnome-keyring.enable = true;
}