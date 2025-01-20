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


{
  pkgs,
  inputs,
  username,
  host,
  ...
}:
{
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs username host; };
    users.${username} = {
      imports =
        if (host == "desktop") then
          [ ./../home/default.desktop.nix ]
        else
          [ ./../home ];
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      home.stateVersion = "24.05";
      programs.home-manager.enable = true;
    };
  };

  users.users.${username} = {
    isNormalUser = true;
    description = "${username}";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.zsh;
  };
  nix.settings.allowed-users = [ "${username}" ];
}
