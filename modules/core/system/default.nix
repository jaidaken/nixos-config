
{  self, pkgs, lib, inputs, ... }:

{
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

	environment.systemPackages = with pkgs; [
    wget
    git
  ];

  environment.sessionVariables = {
    GSETTINGS_SCHEMA_DIR = "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}/glib-2.0/schemas";
    WLR_NO_HARDWARE_CURSORS = "1"; # cursor not visible, needed for nvidia

    NIXOS_OZONE_WL = "1"; # for electron and chromium apps to run on wayland
    MOZ_ENABLE_WAYLAND = "1"; # firefox should always run on wayland
    
    SDL_VIDEODRIVER = "wayland";
    _JAVA_AWT_WM_NONREPARENTING = "1"; # On tiling window managers like hyprland this is needed for java apps
    CLUTTER_BACKEND = "wayland";
    GDK_BACKEND = "wayland"; # GTK: use wayland if possible, else X11
    QT_QPA_PLATFORM = "wayland;xcb"; # QT: use wayland if possible, else X11
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    GTK_USE_PORTAL = "1"; # makes dialogs (file opening) consistent with rest of the ui
    # WLR_RENDERER = "vulkan"; # vulkan not supported in hyprland
    BEMENU_BACKEND = "wayland";
  };

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05";
}
