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
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-latest.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ { 
    self,
    nixpkgs,
    nixpkgs-latest,
    home-manager,
    ...
  }: {
    nixosConfigurations = {
      tx = let
        # USERNAME
        username = "int16";
        specialArgs = {inherit username;};
      in nixpkgs.lib.nixosSystem {
        inherit specialArgs;
        system = "x86_64-linux";
        modules = [
          ./hosts/fa401wv
          home-manager.nixosModules.home-manager{
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "hm.bak";
            home-manager.extraSpecialArgs = inputs // specialArgs;
            home-manager.users.${username} = import ./hosts/fa401wv/home.nix;
          }
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
