
{  self, pkgs, lib, inputs, ... }:

{
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

	environment.systemPackages = with pkgs; [
    wget
    git
  ];

	nixpkgs.config.allowUnfree = true;

	system.stateVersion = "25.05";
}
