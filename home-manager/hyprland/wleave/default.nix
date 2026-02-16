{pkgs,config,...}:{
  home.file.".config/wleave/layout.json".source = ./layout.json;
  home.file.".config/wleave/style.css".source = ./style.css;
}