{ lib, pkgs, inputs, ... }:
let
	  pkgs-hyprland = inputs.hyprland.packages.${pkgs.system};

in

{
  imports = [
    ./hyprland.nix
    #./config.nix
    #./hyprlock.nix
    #./variables.nix
    inputs.hyprland.homeManagerModules.default
  ];
}
