{pkgs,config,...}:{
  home.file.".config/wlogout/layout".source = ./layout;
  home.file.".config/wlogout/style.css".source = ./style.css;

  home.file.".config/wlogout/icons/hibernate.svg".source = ./icons/hibernate.svg;
  home.file.".config/wlogout/icons/logout.svg".source = ./icons/logout.svg;
  home.file.".config/wlogout/icons/reboot.svg".source = ./icons/reboot.svg;
  home.file.".config/wlogout/icons/shutdown.svg".source = ./icons/shutdown.svg;
  home.file.".config/wlogout/icons/suspend.svg".source = ./icons/suspend.svg;
  home.file.".config/wlogout/icons/lock.svg".source = ./icons/lock.svg;
}