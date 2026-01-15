{
  description = "Nix16 flake";

  nixConfig = {
    extra-substituters = [
      "https://mirror.nju.edu.cn/nix-channels/store"
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://mirror.sjtu.edu.cn/nix-channels/store"

      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "mirror.nju.edu.cn-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "mirrors.ustc.edu.cn-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      # nix community's cache server public key
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-latest.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nix-alien.url = "github:thiagokokada/nix-alien";
  };

  outputs = inputs @ { 
    self,
    nixpkgs,
    nixpkgs-latest,
    home-manager,
    nix-alien,
    ...
  }: {
    nixosConfigurations = {
      tx = let
        # USERNAME
        username = "int16";
        system = "x86_64-linux";
        specialArgs = {inherit self username system;};
      in nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        modules = [
          ./hosts/fa401wv
          home-manager.nixosModules.home-manager{
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "hm.bak";
            home-manager.extraSpecialArgs = inputs // specialArgs;
            home-manager.users.${username} = import ./hosts/fa401wv/home.nix;
          }
          ({ self, system, ... }: {
            environment.systemPackages = with self.inputs.nix-alien.packages.${system}; [
              nix-alien
            ];
            # Optional, needed for `nix-alien-ld`
            programs.nix-ld.enable = true;
          })
        ];
      };

      x220 = let
        # USERNAME
        username = "int16";
        specialArgs = {inherit username;};
      in nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        system = "x86_64-linux";
        modules = [
          ./hosts/x220
          home-manager.nixosModules.home-manager{
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "hm.bak";
            home-manager.extraSpecialArgs = inputs // specialArgs;
            home-manager.users.${username} = import ./hosts/x220/home.nix;
          }
        ];

      };
    };
  };
}
