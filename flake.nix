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

    hypr-contrib = {
      url = "github:hyprwm/contrib";
    };

    hyprpicker = {
      url = "github:hyprwm/hyprpicker";
    };
    
    hyprmag = {
      url = "github:SIMULATAN/hyprmag";
    };

  };

  outputs = inputs@{ self, nixpkgs, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs;};
      modules = [
	./hosts/default/default.nix

	inputs.home-manager.nixosModules.default
	{
    nix = {
      settings.experimental-features = [ "nix-command" "flakes" ];
    };
	}

	./modules

	];
    };
  };
}
