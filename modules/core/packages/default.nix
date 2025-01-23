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
    direnv
   #--------------------------------------------------------
   # Browsers
   #--------------------------------------------------------
    chromium
    google-chrome
    vscode-fhs
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
