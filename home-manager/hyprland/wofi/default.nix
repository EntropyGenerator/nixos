{pkgs,config,...}:{
  home.file.".config/wofi/style.css".source = ./style.css;
  home.file.".config/wofi/config".source = ./config;

}