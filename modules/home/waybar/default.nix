{ pkgs, lib, config, ... }:
{
  home.packages = with pkgs; [ waybar ydotool networkmanager_dmenu
 ];

        home.file = {
        nmDmenuConfig = {
          target = ".config/networkmanager-dmenu/config.ini";
          text = ''
            [dmenu]
            dmenu_command = "wofi"

	    [editor]
	    terminal = "kitty"
          '';
        };
	};
  
  stylix.targets.waybar.enable = true;

  programs.waybar = {
      enable = true;
      #systemd.enable = true;
      style = 
        with config.lib.stylix.colors.withHashtag;
        ''
        @define-color base00 ${base00}; @define-color base01 ${base01}; @define-color base02 ${base02}; @define-color base03 ${base03};
        @define-color base04 ${base04}; @define-color base05 ${base05}; @define-color base06 ${base06}; @define-color base07 ${base07};

        @define-color base08 ${base08}; @define-color base09 ${base09}; @define-color base0A ${base0A}; @define-color base0B ${base0B};
        @define-color base0C ${base0C}; @define-color base0D ${base0D}; @define-color base0E ${base0E}; @define-color base0F ${base0F};
        '' + builtins.readFile ./style.css;
      settings = {
        bar = {
          layer = "top";
          height = 20;
          spacing = 8;
          margin-top = 5;
          margin-left = 5;
          margin-right = 5;
          margin-down = 5;
          modules-left = ["hyprland/workspaces"];
          modules-center = ["clock"];
          modules-right = ["network" "memory" "backlight" "pulseaudio" "hyprland/language" "battery"];
          "hyprland/workspaces" =  {
            format = "{icon}";
            "format-icons" = {
              "1" = "1";
              "2" = "2";
              "3" = "3";
              "4" = "4";
              "5" = "5";
              "6" = "6";
              "7" = "7";
              "8" = "8";
              "9" = "9";
              "10" = "0";
              urgent = "λ";
              focused = "σ";
              default = "ω";
            };
          };
          "hyprland/language" = {
            format = "{} <span font-family='Material Design Icons' rise='-1000' size='medium'>󰌌</span>";
            format-ru = "ru";
            format-en = "en";
          };
          "tray" = {
            spacing = 10;
          };
          "clock" = {
            format = "{:%H:%M  󰅐}";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
            format-alt = "{:%d %h %Y  󰃮}";
            on-click = "killall calcure || kitty -t calcure -e calcure;sudo ydotool click 0xc1";
          };
          "memory" = {
            format = "{}% ";
            on-click = "killall btop || kitty -t btop -e btop;sudo ydotool click 0xc1";
          };
          "backlight" = {
            format = "{percent}% {icon}";
            format-icons = ["󰃞" "󰃟" "󰃠"];
          };
          "battery" = {
            "states" = {
              good = 95;
              warning = 30;
              critical = 15;
            };
            format = "{capacity}% {icon}";
            format-charging = "{capacity}% 󰂄";
            format-plugged = "{capacity}% ";
            format-alt = "{icon}";
            format-icons = ["󱃍" "󰁼" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
            
          };
          "network" = {
            interface = "wlp2*";
            format-wifi = "{essid} ({signalStrength}%) 󰤨";
            format-ethernet = "{ipaddr}/{cidr} 󰈀";
            tooltip-format = "{ifname} via {gwaddr} 󰩟";
            format-linked = "{ifname} (No IP) 󰩟";
            format-disconnected = "󰤫";
            on-click = "killall networkmanager_dmenu || networkmanager_dmenu -d";
          };
          "pulseaudio" = {
            format = "{volume}% {icon} {format_source}";
            format-bluetooth = "{volume}% <span font-family='Material Design Icons' rise='-2000' font-size='x-large'>󰥰</span> {format_source}";
            format-bluetooth-muted = "󰟎 {format_source}";
            format-muted = "󰝟 {format_source}";
            format-source = "{volume}% 󰍬";
            format-source-muted = "󰍭";
            on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            "format-icons" = {
              headphone = "󰋋";
              hands-free = "";
              headset = "";
              phone = "";
              portable = "";
              car = "";
              muted-icon = "󰝟";
              default = ["󰕿" "󰖀" "󰕾"];
            };
          };
        };
      };
    };



}
