{
  config,
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
    extraSpecialArgs = { 
      inherit inputs; 
      inherit username;
      inherit host;
      inherit pkgs;
      };
    users.${username} = {
      imports = [ 
        ../../home/default.nix 
	inputs.catppuccin.homeManagerModules.catppuccin
      ];
      home.username = "${username}";
      home.homeDirectory = "/home/${username}";
      programs.home-manager.enable = true;
      home.stateVersion = "25.05";
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

  security.sudo.extraRules = 
    [{  
      users = [ "${username}" ];
      commands = 
      [{ 
	 command = "ALL";
         options= [ "NOPASSWD" ];
      }];
    }];
  
  nix.settings.allowed-users = [ "${username}" ];
}
