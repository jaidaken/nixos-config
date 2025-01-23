{ pkgs, config, ... }: 
{
  home.packages = with pkgs; [
    rofi-wayland
  ];
  
  programs.rofi = {
    theme = "gruvbox-dark";
  };

  stylix.targets.rofi.enable = true;

  }
