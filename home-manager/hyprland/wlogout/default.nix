{pkgs,config,...}:{
  home.file.".config/wlogout/layout".source = ./layout;
  home.file.".config/wlogout/style.css".source = ./style.css;

  home.file.".config/wlogout/icons/hibernate.png".source = ./icons/hibernate.png;
  home.file.".config/wlogout/icons/logout.png".source = ./icons/logout.png;
  home.file.".config/wlogout/icons/reboot.png".source = ./icons/reboot.png;
  home.file.".config/wlogout/icons/shutdown.png".source = ./icons/shutdown.png;
  home.file.".config/wlogout/icons/suspend.png".source = ./icons/suspend.png;
  home.file.".config/wlogout/icons/lock.png".source = ./icons/lock.png;
}