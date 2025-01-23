{ inputs, pkgs, ... }:
{
  imports = [ inputs.hyprpanel.homeManagerModules.hyprpanel ];
  
  home.packages = with pkgs; [

  ## Used for Tracking GPU Usage in your Dashboard (NVidia only)
  python3
  #python-gpustat

  ## To control screen/keyboard brightness
  #brightnessctl

  ## Only if a pywal hook from wallpaper changes applied through settings is desired
  pywal

  ## To check for pacman updates in the default script used in the updates module
  #pacman-contrib

  ## To switch between power profiles in the battery module
  power-profiles-daemon

  ## To take snapshots with the default snapshot shortcut in the dashboard
  grimblast

  ## To record screen through the dashboard record shortcut
  #gpu-screen-recorder

  ## To enable the eyedropper color picker with the default snapshot shortcut in the dashboard
  hyprpicker

  ## To enable hyprland's very own blue light filter
  hyprsunset

  ## To enable hyprland's very own idle inhibitor
  hypridle

  ## To click resource/stat bars in the dashboard and open btop
  btop

  ## To enable matugen based color theming
  matugen

  ## To enable matugen based color theming and setting wallpapers
  swww

  ];
  
  programs.hyprpanel = {

    # Enable the module.
    # Default: false
    enable = true;

    # Automatically restart HyprPanel with systemd.
    # Useful when updating your config so that you
    # don't need to manually restart it.
    # Default: false
    #systemd.enable = true;

    # Add '/nix/store/.../hyprpanel' to your
    # Hyprland config 'exec-once'.
    # Default: false
    hyprland.enable = true;

    # Fix the overwrite issue with HyprPanel.
    # See below for more information.
    # Default: false
    overwrite.enable = true;

    # Import a theme from './themes/*.json'.
    # Default: ""
    theme = "catppuccin_mocha";

    # Override the final config with an arbitrary set.
    # Useful for overriding colors in your selected theme.
    # Default: {}
    override = {
      theme.bar.menus.text = "#123ABC";
    };

    # Configure bar layouts for monitors.
    # See 'https://hyprpanel.com/configuration/panel.html'.
    # Default: null
    layout = {
      "bar.layouts" = {
        "0" = {
          left = [ "dashboard" "workspaces" ];
          middle = [ ];
          right = [
	    "media" 
	    "network" 
	    "bluetooth" 
	    "volume" 
	    "battery" 
	    "clock" 
	    "systray" 
	    "notifications" 
	  ];
        };
      };
    };

    # Configure and theme almost all options from the GUI.
    # Options that require '{}' or '[]' are not yet implemented,
    # except for the layout above.
    # See 'https://hyprpanel.com/configuration/settings.html'.
    # Default: <same as gui>
    settings = {
      bar.launcher.autoDetectIcon = true;
      bar.workspaces.show_icons = true;

      menus.clock = {
        time = {
          military = true;
          hideSeconds = true;
        };
        weather.unit = "metric";
      };


      menus.dashboard.directories.enabled = false;
      menus.dashboard.stats.enable_gpu = true;

      theme.bar.transparent = false;

      theme.font = {
        name = "CaskaydiaCove NF";
        size = "12px";
      };
    };
  };
}
