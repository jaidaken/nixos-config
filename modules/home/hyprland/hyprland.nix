{ inputs, pkgs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {

      "$terminal" = "kitty";
      "$mod" = "SUPER";
      "$menu" = "rofi -show run";
      "$fileManagaer" = "dolphin";

      exec-once = [
	"hyprctl setcursor Bibata-Modern-Ice 24"	
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

    home.sessionVariables = {
    };


      bind = [

      "$mod, RETURN, exec, $terminal"
      "$mod, Q, killactive"
      "$mod, M, exit"
      "$mod, SPACE, exec, $menu"
      "$mod, V, togglefloating"

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


      ];

    };


  };

  


}
