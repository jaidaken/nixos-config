{ inputs, nixpkgs, self, username, host, lib, ... }:

{
 imports = [
   #./gtk
   ./hyprland
   #./hyprsunset
   #./qt
   #./rofi
   #./sway
   #./swaylock
   #./swaync
   #./swayosd
   #./ulauncher
   #./waybar
   #./waypaper
   #./wofi
   #./wpaperd
   #./xserver
 ];
}
