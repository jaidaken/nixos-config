{ config, pkgs, lib, ... }:

{
  # Define a user account
  users.users.jaidaken = {
    isNormalUser = true;                      # Mark as a normal user
    description = "Jamie Hewitt";             # User's full name or description
    extraGroups = [ "networkmanager" "wheel" ]; # Additional group memberships
    packages = with pkgs; [];                 # Custom packages for the user (empty in this case)
    shell = pkgs.zsh;
  };
}
