{ pkgs, ... }:

{
  # Configure the keymap for X11
  services.xserver.xkb = {
    layout = "us";
    variant = "mac";
  };
}

