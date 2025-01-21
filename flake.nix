{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    hypr-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    hyprmag.url = "github:SIMULATAN/hyprmag";

    nixos-conf-editor.url = "github:snowfallorg/nixos-conf-editor";

  };

  outputs = inputs@{ self, nixpkgs, ... }:
  let
      username = "jaidaken";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {
        host = "nixos";
        inherit self inputs username;
      };
      modules = [
        ./hosts/nixos/default.nix
        inputs.home-manager.nixosModules.default
      ];
    };
  };
}
