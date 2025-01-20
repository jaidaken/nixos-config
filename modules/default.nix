{ inputs, nixpkgs, self, username, host, lib, ... }:
{
  imports = [
    ./core           # System-level configuration (NixOS)
    ./home           # User-level configuration (Home Manager)
  ];
}
