{ config, lib, pkgs, inputs, host, ... }:

{
  imports = [

	# =============================================================================
    # Desktop and UI
    # =============================================================================
    ./desktop       # Window managers, bars, notifications, launchers

    # =============================================================================
    # Applications
    # =============================================================================


    # =============================================================================
    # Development and Files
    # =============================================================================
    #./development   # Git, Neovim, development tools
    #./file          # File managers and document viewers

    # =============================================================================
    # System and Security
    # =============================================================================
    #./system        # Scripts, monitoring, and system utilities
    #./security      # GnuPG, password management, encryption

    # =============================================================================
    # Network and Services
    # =============================================================================
    #./network       # Remote desktop, file sync, torrent client
    #./services      # System services and daemons

    # =============================================================================
    # Terminal Environment
    # =============================================================================
    #./terminal      # Terminal emulators, shell, multiplexer
    #./utility       # CLI tools and utilities

    # =============================================================================
    # System Integration
    # =============================================================================
    #./xdg           # XDG specifications and portals
  ];

}
