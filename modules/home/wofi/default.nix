{ pkgs, ... }:
{
  home.packages = with pkgs; [ wofi ];
  
  stylix.targets.wofi.enable = true;

}
