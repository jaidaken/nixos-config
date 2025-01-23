{

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #obsidian-nvim.url = "github:epwalsh/obsidian.nvim";

    nvf = {
      url = "github:notashelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    hypr-contrib.url = "github:hyprwm/contrib";
    hyprpicker.url = "github:hyprwm/hyprpicker";
    hyprmag.url = "github:SIMULATAN/hyprmag";

    ags.url = "github:aylur/ags"; 

    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    catppuccin.url = "github:catppuccin/nix";
    stylix.url = "github:danth/stylix";

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
	inputs.catppuccin.nixosModules.catppuccin
        inputs.stylix.nixosModules.stylix
        {
	nixpkgs.overlays = [ 
	  inputs.hyprpanel.overlay
	];
        _module.args = { inherit inputs; };
        }
      ];
    };
  };
}
