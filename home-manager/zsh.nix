{ pkgs, lib, username, ... }:
{
  # Shell
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -la";
      update = "sudo nixos-rebuild switch";
      rm-hm-bak = "cd ~ && find . -type f -name \"*.hm.bak\" -delete";
    };
    history.size = 1000;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "direnv"
        "vscode"
        "sudo"
      ];
      theme = "agnoster";
    };
  };
}