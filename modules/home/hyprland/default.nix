{ lib, pkgs, inputs, ... }:
let
	  pkgs-hyprland = inputs.hyprland.packages.${pkgs.system};

in

{
  imports = [
    ./hyprland.nix
    #./hyprpanel.nix
    inputs.hyprland.homeManagerModules.default
  ];
}
