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
  ];

  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [ "git" "thefuck" ];
      theme = "robbyrussell";
    };
  };
}
