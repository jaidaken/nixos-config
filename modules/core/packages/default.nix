{ pkgs, ... }:

{
  # System-wide packages
  environment.systemPackages = with pkgs; [
    vim
    git
    curl
    pciutils
    wget
    gzip
    kitty
    rofi-wayland
    dolphin
   #--------------------------------------------------------
   # Browsers
   #--------------------------------------------------------
    chromium
  ];

  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "sudo" "docker" "kubectl" ];
      theme = "robbyrussell";
    };
  };
}
