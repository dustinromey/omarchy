  # Copy with error checking
  if ! sudo cp -R ~/.local/share/omarchy/bin/xTuple /opt/; then
      echo "Error: Failed to copy xTuple to /opt/"
      exit 1
  fi

  # Set permissions with error checking
  if ! sudo chmod +x /opt/xTuple/xtuple*; then
      echo "Error: Failed to set executable permissions"
      exit 1
  fi

  echo "xTuple installed successfully"
