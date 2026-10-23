{
  description = "my flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = {
    nixpkgs,
    ...
  } @ inputs: let
    lib = nixpkgs.lib;
    system = "x86_64-linux";
  in {
    packages.${system} = {
      zig = nixpkgs.legacyPackages.${system}.zig;
      zls = nixpkgs.legacyPackages.${system}.zls;
    };
    nixosConfigurations = {
      jee = lib.nixosSystem {
        inherit system;
        specialArgs = {
          inherit inputs;
        };
        modules = [./config/configuration.nix];
      };
    };
  };
}
