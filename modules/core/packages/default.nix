{ pkgs, ... }:

{
  # System-wide packages
  environment.systemPackages = with pkgs; [
   # vim
    git
    curl
    pciutils
    wget
    gzip
    dmidecode
    killall
    thefuck
    zip
    unzip
   #--------------------------------------------------------
   # Browsers
   #--------------------------------------------------------
    chromium
    google-chrome
  ];

#  programs.zsh = {
 #   enable = true;
  #  ohMyZsh = {
   #   enable = true;
    #  plugins = [ "git" "sudo" "docker" "kubectl" ];
     # theme = "robbyrussell";
    #};
  #};
}
