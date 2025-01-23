{ pkgs, ... }:
  {
   home.packages = with pkgs; [
     ghostty
   ];
  
 # programs.ghostty.enable = true;

  programs.ghostty = {
    enable = true;
  };

  stylix.targets.ghostty.enable = true;

  }


