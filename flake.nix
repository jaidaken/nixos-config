{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
    };

    hypr-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    hyprmag.url = "github:SIMULATAN/hyprmag";

  };

# outputs =
#     { nixpkgs, self, ... }@inputs:
#     let
#       username = "jaidaken";
#       system = "x86_64-linux";
#       pkgs = import nixpkgs {
#         inherit system;
#         config.allowUnfree = true;
#       };
#       lib = nixpkgs.lib;
#     in
#     {
#       nixosConfigurations = {
#         desktop = nixpkgs.lib.nixosSystem {
#           inherit system;
#           modules = [ ./hosts/nixos/default.nix ];
#           specialArgs = {
#             host = "nixos";
#             inherit self inputs username;
#           };
#         };
#       };
#     };
# }



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
        ./hosts/default/default.nix
        inputs.home-manager.nixosModules.default
        ./modules
      ];
    };
  };
}
