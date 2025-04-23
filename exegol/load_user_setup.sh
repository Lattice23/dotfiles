#!/bin/bash
set -e

# This script will be executed on the first startup of each new container with the "my-resources" feature enabled.
# Arbitrary code can be added in this file, in order to customize Exegol (dependency installation, configuration file copy, etc).
# It is strongly advised **not** to overwrite the configuration files provided by exegol (e.g. /root/.zshrc, /opt/.exegol_aliases, ...), official updates will not be applied otherwise.
#
# --- INSTALL YAZI ----
install_yazi() {

  sudo apt update
  apt install -y ffmpeg 7zip jq poppler-utils fd-find ripgrep fzf zoxide imagemagick
  cargo install --locked yazi-fm yazi-cli
  mkdir /root/.config/yazi/
  curl -o /root/.config/yazi/yazi.toml https://raw.githubusercontent.com/sxyazi/yazi/refs/heads/main/yazi-config/preset/yazi-default.toml
}

# Exegol also features a set of supported customization a user can make.
# The /opt/supported_setups.md file lists the supported configurations that can be made easily.
