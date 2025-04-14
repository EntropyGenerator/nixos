{
  description = "Nix16 flake";

  nixConfig = {
    extra-substituters = [
      "https://mirror.nju.edu.cn/nix-channels/store"
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs @ { 
    self,
    nixpkgs,
    nixpkgs-stable,
    home-manager,
    ...
  }: {
    nixosConfigurations = {
      nix16 = let
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
    };
  };
}
