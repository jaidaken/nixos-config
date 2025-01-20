{ config, pkgs, inputs, lib, ... }:

{
  # Home Manager configuration
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "jaidaken" = import ./../../home/default.nix;
    };
  };
}
