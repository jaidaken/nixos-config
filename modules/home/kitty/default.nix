{ pkgs, ... }:
  {
   # home.packages = with pkgs; [
   #   kitty
   # ];
  
  programs.kitty.enable = true;

  stylix.targets.kitty.enable = true;

  }


