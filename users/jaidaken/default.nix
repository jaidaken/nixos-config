{ config, pkgs, ... }:

{
  home.username = "jaidaken";
  home.homeDirectory = "/home/jaidaken";

  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
}
