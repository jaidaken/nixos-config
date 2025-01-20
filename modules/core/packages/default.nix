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

	programs.zsh.enable = true;

	programs.zsh.ohMyZsh = {
    enable = true;
    plugins = [ "git" "sudo" "docker" "kubectl" ];
  };
}

