# modules/core/default.nix
# ==============================================================================
# Core System Configuration
# ==============================================================================
# This configuration manages the import of all core system modules including:
# - System services and hardware management
# - Network and security configurations
# - User environment and desktop settings
# - Virtualization and gaming support
#
# Note: Modules have been consolidated for better organization and maintenance
#
# Author: Kenan Pelit
# ==============================================================================

{ inputs, nixpkgs, self, username, host, ... }:
{
  imports = [
    # =============================================================================
    # Media and Desktop
    # =============================================================================
    #./desktop        # Wayland, X11, and font configuration
    ./hyprland
    ./gtk		
    #./media          # Audio, PipeWire, and Bluetooth configuration

    # =============================================================================
    # System Core
    # =============================================================================
    #./system         # System settings, bootloader, hardware, and power management
    ./boot
    ./system
    ./graphics
    ./audio
    ./power
    ./stylix
    # =============================================================================
    # Network and Security
    # =============================================================================
    ./network        # Network, VPN, and SSH configuration
    ./locale
    ./keymap
    #./security       # Security, GPG, and host blocking

    # =============================================================================
    # Services and Applications
    # =============================================================================
    #./services       # System services and Flatpak integration
    ./packages
    # =============================================================================
    # User Environment
    # =============================================================================
    ./user           # User configuration, packages, and programs
    ./zsh
    # =============================================================================
    # Virtualization and Gaming
    # =============================================================================
    #./virtualization # Container and VM support
    #./gaming         # Gaming platform support

    # =============================================================================
    # Nix Configuration
    # =============================================================================
    #./nix            # Nix settings and helper utilities
  ];
}
