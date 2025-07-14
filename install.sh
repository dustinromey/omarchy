# Exit immediately if a command exits with a non-zero status
set -e

# Enhanced error handling with specific failure information
handle_error() {
    echo -e "\n❌ Omarchy installation failed!"
    echo "Failed while running: $CURRENT_INSTALLER"
    echo "Error occurred on line $1"
    echo "Exit code: $2"
    echo ""
    echo "💡 Suggestions:"
    echo "- Check if you have sufficient permissions (run with sudo if needed)"
    echo "- Ensure internet connection is stable"
    echo "- Make sure all dependencies are installed"
    echo "- Review the error messages above for specific issues"
    echo ""
    echo "🔄 To retry the installation, run:"
    echo "source ~/.local/share/omarchy/install.sh"
    exit 1
}

# Set up error trap with line number and exit code
trap 'handle_error $LINENO $?' ERR

# Install everything
for f in ~/.local/share/omarchy/install/*.sh; do
  CURRENT_INSTALLER="$f"
  echo -e "\n🔧 Running installer: $(basename "$f")"
  
  # Run installer with error context
  if ! source "$f"; then
    echo "❌ Failed to run installer: $(basename "$f")"
    exit 1
  fi
  
  echo "✅ Completed: $(basename "$f")"
done

# Ensure locate is up to date now that everything has been installed
sudo updatedb

gum confirm "Reboot to apply all settings?" && reboot
