{pkgs,config,...}:{
  home.file.".config/wleave/layout.json".source = ./layout.json;
  home.file.".config/wleave/style.css".source = ./style.css;

  home.file.".config/wleave/icons/hibernate.svg".source = ./icons/hibernate.svg;
  home.file.".config/wleave/icons/logout.svg".source = ./icons/logout.svg;
  home.file.".config/wleave/icons/reboot.svg".source = ./icons/reboot.svg;
  home.file.".config/wleave/icons/shutdown.svg".source = ./icons/shutdown.svg;
  home.file.".config/wleave/icons/suspend.svg".source = ./icons/suspend.svg;
  home.file.".config/wleave/icons/lock.svg".source = ./icons/lock.svg;
}