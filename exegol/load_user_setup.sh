#!/bin/bash
set -e

# This script will be executed on the first startup of each new container with the "my-resources" feature enabled.
# Arbitrary code can be added in this file, in order to customize Exegol (dependency installation, configuration file copy, etc).
# It is strongly advised **not** to overwrite the configuration files provided by exegol (e.g. /root/.zshrc, /opt/.exegol_aliases, ...), official updates will not be applied otherwise.
#
# --- INSTALL YAZI ----

install_yazi() {
  echo "Installing Yazi"

  sudo apt update
  apt install -y ffmpeg 7zip jq poppler-utils fd-find ripgrep zoxide imagemagick
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  cargo install --locked yazi-fm yazi-cli
  cp -r /opt/my-resources/setup/yazi/ /root/.config/

  echo "Yazi installed"
}

install_starship() {
  cargo install eza starship

  cp /opt/my-resources/setup/starship/starship.toml /root/.config/
  cp /opt/my-resources/setup/zsh/zsh.bak /root/.zshrc

  echo "starship and eza installed"
}

install_zellij() {
  echo "installing zellij"
  cargo install zellij

  rm -rf ~/.config/zellij/
  cp /opt/my-resources/setup/zellij/ ~/.config/ -r
  echo "installed zellij"
}

install_nu() {
  echo "Installing nushell"

  curl -fsSL https://apt.fury.io/nushell/gpg.key | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/fury-nushell.gpg
  echo "deb https://apt.fury.io/nushell/ /" | sudo tee /etc/apt/sources.list.d/fury.list
  sudo apt update --allow-insecure-repositories
  yes | sudo apt install nushell

  cp /opt/my-resources/setup/nushell/config.nu /root/.config/nushell/
  echo "Nushell installed"
}

install_yazi
sleep 2

install_starship
sleep 2

install_zellij
sleep 2

install_nu
sleep 2

zsh
echo -e "\n DONE :)\n"

# ---- LOAD TMUX CONF ----

# Exegol also features a set of supported customization a user can make.
# The /opt/supported_setups.md file lists the supported configurations that can be made easily.
