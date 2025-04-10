{username, pkgs,  ...}: {
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    stateVersion = "24.11";
  };
  programs.home-manager.enable = true;
  
  # Keyring
  services.gnome-keyring.enable = true;

  # USB devices
  services.udiskie = {
    enable = true;
    settings = {
        # workaround for
        # https://github.com/nix-community/home-manager/issues/632
        program_options = {
            # replace with your favorite file manager
            file_manager = "${pkgs.nautilus}/bin/nautilus";
        };
    };
};
}
