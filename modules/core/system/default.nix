
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

	environment.sessionVariables.NIXOS_OZONE_WL = "1";

	nixpkgs.config.allowUnfree = true;

	system.stateVersion = "25.05";
}
