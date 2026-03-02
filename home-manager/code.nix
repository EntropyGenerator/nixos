{ pkgs, lib, username, ... }: {
  # Visual Studio Code
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      ms-ceintl.vscode-language-pack-zh-hans
      ms-vscode-remote.vscode-remote-extensionpack
      ms-vscode.cpptools-extension-pack
      ms-python.python
      mkhl.direnv
      golang.go
      marp-team.marp-vscode
      bbenoist.nix
      rust-lang.rust-analyzer
      yy0931.vscode-sqlite3-editor
      tauri-apps.tauri-vscode
      myriad-dreamin.tinymist
      vue.volar

    ];
  };
}