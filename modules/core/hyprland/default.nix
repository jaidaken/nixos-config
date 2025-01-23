{ lib, inputs, pkgs, ... }:
let
  pkgs-hyprland = inputs.hyprland.packages.${pkgs.system};
in

{
  programs.hyprland = {
    enable = true;
    #withUWSM = true;
    package = pkgs-hyprland.hyprland;
    systemd.setPath.enable = true;
    xwayland.enable = false;
    #portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };

}
