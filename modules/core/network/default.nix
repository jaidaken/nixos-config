{ config, pkgs, host, lib, ... }:

{

  networking = {

    hostName = "nixos";
    
    networkmanager.enable = true;

  };
  
  services.openssh.enable = true;

  # Firewall configuration
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

}
