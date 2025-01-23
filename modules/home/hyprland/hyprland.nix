{ inputs, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

      "$terminal" = "kitty";
      "$mod" = "SUPER";
      "$menu" = "wofi --show drun";
      "$fileManagaer" = "dolphin";

      env = [
	"HYPRCURSOR_SIZE, 12"
	"HYPRCURSOR_THEME,bibata-Modern-Ice"
	"XCURSOR_THEME,Bibata-Modern-Ice"
	"XCURSOR_SIZE,24"
      ];

      exec-once = [
	"dbus-update-activation-environment --systemd --all &"
        "waybar"
      ];

      input = {
        kb_layout = "us";
	follow_mouse = true;
	touchpad = {
	  natural_scroll = true;
	};
	accel_profile = "none";
	sensitivity = -0;
      };
      
      gestures = {
        workspace_swipe = true;
      };
      
      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };

      general = {
	gaps_in = 4;
	gaps_out = 10;
     
	border_size = 2;
	
        #"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        #"col.inactive_border" = "rgba(595959aa)";

        resize_on_border = true;

        allow_tearing = false;

        layout = "dwindle";
      };

      decoration = {
        rounding = 8;
        rounding_power = 2;
        
        active_opacity = 1.0;
	inactive_opacity = 0.8;

	shadow = {
	  enabled = true;
	  range = 4;
	  render_power = 3;
	  #color = "rgba(1a1a1aee)";
	};

        blur = {
          enabled = true;
	  size = 3;
	  passes = 1;
	  vibrancy = 0.1696;
        };
      };

      animations = {
	enabled = true;

        bezier = [
          "fluent_decel, 0, 0.2, 0.4, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutCubic, 0.33, 1, 0.68, 1"
          "fade_curve, 0, 0.55, 0.45, 1"
        ];

        animation = [
          # name, enable, speed, curve, style

          # Windows
          "windowsIn,   0, 4, easeOutCubic,  popin 20%" # window open
          "windowsOut,  0, 4, fluent_decel,  popin 80%" # window close.
          "windowsMove, 1, 2, fluent_decel, slide" # everything in between, moving, dragging, resizing.

          # Fade
          "fadeIn,      1, 3,   fade_curve" # fade in (open) -> layers and windows
          "fadeOut,     1, 3,   fade_curve" # fade out (close) -> layers and windows
          "fadeSwitch,  0, 1,   easeOutCirc" # fade on changing activewindow and its opacity
          "fadeShadow,  1, 10,  easeOutCirc" # fade on changing activewindow for shadows
          "fadeDim,     1, 4,   fluent_decel" # the easing of the dimming of inactive windows
          "border,      1, 2.7, easeOutCirc"  # for animating the border's color switch speed
          "borderangle, 1, 30,  fluent_decel, once" # for animating the border's gradient angle - styles: once (default), loop
          "workspaces,  1, 4,   easeOutCubic, fade" # styles: slide, slidevert, fade, slidefade, slidefadevert
        ];
      };

      dwindle = {
	pseudotile = true;
	preserve_split = true;
      };

      master = {
	new_status = "master";
      };

      misc = {
	force_default_wallpaper = -1;
	disable_hyprland_logo = false;

      };

      bind = [

	"$mod, RETURN, exec, $terminal"
	"$mod, Q, killactive"
	"$mod, M, exit"
	"$mod, E, exec, $fileManager"
      	"$mod, SPACE, exec, $menu"
      	"$mod, V, togglefloating"

	#dwindle
	"$mod, P, pseudo"
	"$mod, J, togglesplit"

	#Focus	

	"$mod, left, movefocus, l"
	"$mod, right, movefocus, r"
	"$mod, up, movefocus, u"
	"$mod, down, movefocus, d"

	#workspaces
      	"$mod, 1, workspace, 1"
      	"$mod, 2, workspace, 2"
      	"$mod, 3, workspace, 3"
      	"$mod, 4, workspace, 4"
      	"$mod, 5, workspace, 5"
      	"$mod, 6, workspace, 6"
      	"$mod, 7, workspace, 7"
      	"$mod, 8, workspace, 8"
      	"$mod, 9, workspace, 9"
      	"$mod, 0, workspace, 10"

	#move active window to workspace
	
	"$mod SHIFT, 1, movetoworkspace, 1"
	"$mod SHIFT, 2, movetoworkspace, 2"
	"$mod SHIFT, 3, movetoworkspace, 3"
	"$mod SHIFT, 4, movetoworkspace, 4"
	"$mod SHIFT, 5, movetoworkspace, 5"
	"$mod SHIFT, 6, movetoworkspace, 6"
	"$mod SHIFT, 7, movetoworkspace, 7"
	"$mod SHIFT, 8, movetoworkspace, 8"
	"$mod SHIFT, 9, movetoworkspace, 9"
	"$mod SHIFT, 0, movetoworkspace, 10"

	# mouse scroll through workspaces

	"$mod, mouse_down, workspace, e+1"
	"$mod, mouse_up, workspace, e-1"
      ];

      bindm = [

	# Mouse drag window resize

	"$mod, mouse:272, movewindow"
	"$mod, mouse:273, resizewindow"
      ];

      bindel = [
	
	",XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
	",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
	",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
	",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
	",XF86MonBrightnessUp, exec, brightnessctl s 10%+"
	",XF86MonBrightnessDown, exec, brightnessctl s 10%-"
		
      ];

      bindl = [

     	",XF86AudioNext, exec, playerctl next"
     	",XF86AudioPrev, exec, playerctl previous"
     	",XF86AudioPause, exec, playerctl play-pause"
     	",XF86AudioPlay, exec, playerctl play-pause"

      ];

      windowrule = [
   	"pin,rofi"
      ];

      windowrulev2 = [
	"opacity 1.0 override 1.0 override 1.0 override, class:google-chrome"
	"opacity 1.0 override 1.0 override 1.0 override, class:chromium-browser"
	"suppressevent maximize, class:.*"
	"nofocus,class:^$,title:^$,wayland:1,floating:1,fullscreen:0,pinned:0"
      ];

    };


  };

  


}
