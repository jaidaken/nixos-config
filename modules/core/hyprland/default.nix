{ lib, inputs, pkgs, ... }:
let
  pkgs-hyprland = inputs.hyprland.packages.${pkgs.system};
in

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
    #package = inputs.hyprland.packages.${pkgs.system}.default;
    package = pkgs-hyprland.hyprland;
    #systemd.enable = true;
    systemd.setPath.enable = true;
    xwayland.enable = true;

    #portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };

  environment.sessionVariables = {
    GSETTINGS_SCHEMA_DIR = "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}/glib-2.0/schemas";
    # WLR_NO_HARDWARE_CURSORS = "1"; # cursor not visible, needed for nvidia

    NIXOS_OZONE_WL = "1"; # for electron and chromium apps to run on wayland
    MOZ_ENABLE_WAYLAND = "1"; # firefox should always run on wayland
    
    SDL_VIDEODRIVER = "wayland";
    _JAVA_AWT_WM_NONREPARENTING = "1"; # On tiling window managers like hyprland this is needed for java apps
    CLUTTER_BACKEND = "wayland";
    GDK_BACKEND = "wayland,x11"; # GTK: use wayland if possible, else X11
    QT_QPA_PLATFORM = "wayland;xcb"; # QT: use wayland if possible, else X11
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    GTK_USE_PORTAL = "1"; # makes dialogs (file opening) consistent with rest of the ui
    # WLR_RENDERER = "vulkan"; # vulkan not supported in hyprland
  };

 #wayland.windowManager.hyprland = {
 #enable = true;
 # };

}
