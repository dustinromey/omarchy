# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Omarchy is an Arch Linux configuration framework that transforms a fresh Arch installation into a fully-configured Hyprland-based desktop environment optimized for web development. It's not a traditional software project but rather a collection of installation scripts, configurations, and utilities.

## Common Commands

### Installation & Management
- `./boot.sh` - One-line installer that clones and runs the complete setup
- `./install.sh` - Main installer that orchestrates all installation modules
- `omarchy-update` - Updates Omarchy configuration and system packages
- `omarchy-dev-add-migration` - Creates new migration scripts for incremental updates

### Theme Management
- `omarchy-theme-next` - Cycles through the 6 available themes (Catppuccin, Everforest, Gruvbox, Kanagawa, Nord, Tokyo Night)
- `omarchy-refresh-waybar` - Reloads Waybar status bar configuration
- `omarchy-refresh-plymouth` - Updates Plymouth boot theme

### System Utilities
- `omarchy-power-menu` - Power management interface
- `omarchy-show-keybindings` - Displays Hyprland keyboard shortcuts
- `omarchy-toggle-idle` - Controls idle/screen lock behavior
- `omarchy-sync-applications` - Synchronizes application shortcuts

### No Traditional Build/Test Commands
This project doesn't use npm, cargo, make, or similar build systems. Changes are typically tested by running the installation scripts in a virtual machine or on a test system.

## Architecture

### Modular Installation System
Installation is handled by numbered scripts in `/install/`:
1. `1-yay.sh` - AUR helper installation
2. `2-identification.sh` - User identity setup  
3. `3-terminal.sh` - Shell and terminal configuration
4. `4-config.sh` - Configuration file deployment
5. Additional modules for development tools, desktop environment, themes, etc.

### Configuration Management
- `/config/` - User configuration files that get symlinked to appropriate locations
- `/default/` - Default configurations organized by application
- `/themes/` - Theme-specific overrides for all configured applications
- Symlink-based theme switching allows instant theme changes across all applications

### Migration System
- `/migrations/` contains timestamp-based migration files
- Migrations handle incremental configuration updates
- Similar to database migrations but for system configuration
- Managed by `omarchy-update` command

## Key Components

### Hyprland Window Manager
- Main config: `/config/hypr/hyprland.conf`
- Modular defaults in `/default/hypr/` (bindings, autostart, styling, etc.)
- Monitor configuration in `/config/hypr/monitors.conf`

### Shell Environment
- Comprehensive bash configuration in `/default/bash/`
- Custom aliases for git, file operations, and system management
- Utility functions for compression, web app creation, and development tasks
- Custom prompt with git integration

### Development Tools Integration
- Neovim with LazyVim configuration
- Zed editor with custom settings
- Lazygit and Lazydocker for TUI interfaces
- GitHub CLI integration
- mise for runtime version management

### Theming Architecture
Six complete themes that modify:
- Terminal colors (Alacritty/Ghostty)
- Window manager styling (Hyprland)
- Status bar appearance (Waybar)
- Notification styling (Mako)
- Application launcher (Wofi)
- Editor themes (Neovim)
- System monitor (Btop)

Theme switching updates all applications simultaneously through symlink manipulation.

## Development Workflow

### Adding New Features
1. Create installation module in `/install/` if needed
2. Add configuration files to `/config/` or `/default/`
3. Update theme files in `/themes/` if appearance-related
4. Test installation on fresh Arch system or VM
5. Create migration script if updating existing installations

### Configuration Changes
- Edit files in `/config/` or `/default/` directories
- Theme-specific changes go in `/themes/{theme_name}/`
- Run `omarchy-update` to apply changes to existing installations
- Use migration scripts for breaking changes

### Script Development
- Utility scripts go in `/bin/`
- Follow existing naming pattern: `omarchy-{function}`
- Use bash for consistency with existing codebase
- Include proper error handling and user feedback

This is a configuration management system, not a traditional application, so development involves testing installation procedures and configuration file management rather than unit tests or build processes.