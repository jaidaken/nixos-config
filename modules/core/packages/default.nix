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
}

