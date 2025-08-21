#!/bin/bash
set -e

# This script will be executed on the first startup of each new container with the "my-resources" feature enabled.
# Arbitrary code can be added in this file, in order to customize Exegol (dependency installation, configuration file copy, etc).
# It is strongly advised **not** to overwrite the configuration files provided by exegol (e.g. /root/.zshrc, /opt/.exegol_aliases, ...), official updates will not be applied otherwise.
#
# --- INSTALL YAZI ----

install_yazi() {
  echo "Installing Yazi"
  local URL="https://github.com/sxyazi/yazi/releases/download/v25.5.31/yazi-x86_64-unknown-linux-musl.zip"

  jar xvf <(curl -Ls $URL --output -)

  chmod +x yazi-x86_64-unknown-linux-musl/yazi
  mv yazi-x86_64-unknown-linux-musl/yazi /opt/my-resources/bin
  rm -rf yazi-x86_64-unknown-linux-musl

  cp -r /opt/my-resources/setup/yazi/ /root/.config/

  echo "Yazi installed"
}

install_starship() {
  local URL="https://github.com/starship/starship/releases/download/v1.23.0/starship-x86_64-unknown-linux-musl.tar.gz"
  local URL2="https://github.com/eza-community/eza/releases/download/v0.23.0/eza_x86_64-unknown-linux-musl.tar.gz"

  echo "installing starship"

  curl -sL "$URL" | tar xz

  mv starship /opt/my-resources/bin

  cp /opt/my-resources/setup/starship/starship.toml /root/.config/
  cp /opt/my-resources/setup/zsh/zsh.bak /root/.zshrc

  curl -sL "$URL2" | tar xz
  mv eza /opt/my-resources/bin

  echo "starship and eza installed"
}

install_zoxide() {
  local URL="https://github.com/ajeetdsouza/zoxide/releases/download/v0.9.8/zoxide-0.9.8-x86_64-unknown-linux-musl.tar.gz"

  tempDir=$(mktemp -d)

  curl -sL "$URL" | tar xz -C "$tempDir"

  mv "$tempDir/zoxide" /opt/my-resources/bin
}

install_zellij() {
  local URL="https://github.com/zellij-org/zellij/releases/download/v0.43.1/zellij-x86_64-unknown-linux-musl.tar.gz"
  echo "installing zellij"

  curl -sL "$URL" | tar xz

  mv  zellij /usr/local/bin
  rm -rf zellij-x86_64-unknown-linux-musl

  rm -rf ~/.config/zellij/
  cp /opt/my-resources/setup/zellij/ ~/.config/ -r
  echo "installed zellij"
}

install_nu() {
  echo "Installing nushell"

  local URL="https://github.com/nushell/nushell/releases/download/0.106.1/nu-0.106.1-x86_64-unknown-linux-musl.tar.gz"

  curl -sL "$URL" | tar xz

  mv nu-0.106.1-x86_64-unknown-linux-musl/nu /opt/my-resources/bin
  cp -r /opt/my-resources/setup/nushell/config.nu /root/.config/

  rm -rf nu-0.106.1-x86_64-unknown-linux-musl
  echo "Nushell installed"
}

extras() {
  # move arsenal 
  cp /opt/my-resources/setup/arsenal-cheats/personal.md /root/.local/share/pipx/venvs/arsenal-cli/lib/python3.11/site-packages/arsenal/data/cheats/Active_directory
  cp /opt/my-resources/setup/arsenal-cheats/arsenal.json ~/.arsenal.json

  pipx install "git+https://github.com/aniqfakhrul/powerview.py"
  pipx install "git+https://github.com/Pennyw0rth/NetExec"
}

install_yazi
sleep 2

install_starship
sleep 2

install_zellij
sleep 2

install_zoxide
sleep 2

install_nu
sleep 2

extras

echo -e "\n DONE :)\n"
exec zsh

# ---- LOAD TMUX CONF ----

# Exegol also features a set of supported customization a user can make.
# The /opt/supported_setups.md file lists the supported configurations that can be made easily.
