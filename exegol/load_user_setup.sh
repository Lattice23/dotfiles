#!/bin/bash
set -e

# This script will be executed on the first startup of each new container with the "my-resources" feature enabled.
# Arbitrary code can be added in this file, in order to customize Exegol (dependency installation, configuration file copy, etc).
# It is strongly advised **not** to overwrite the configuration files provided by exegol (e.g. /root/.zshrc, /opt/.exegol_aliases, ...), official updates will not be applied otherwise.

force="$1"

install_yazi() {
  if [[ ! -f /opt/my-resources/bin/yazi || ""$force"" == "force" ]]; then
    echo "Installing Yazi"
    local URL="https://github.com/sxyazi/yazi/releases/download/v25.5.31/yazi-x86_64-unknown-linux-musl.zip"
  
    jar xvf <(curl -Ls $URL --output -)
  
    chmod +x yazi-x86_64-unknown-linux-musl/yazi
    mv yazi-x86_64-unknown-linux-musl/yazi /opt/my-resources/bin
    rm -rf yazi-x86_64-unknown-linux-musl
  fi

  cp -r /opt/my-resources/setup/yazi/ /root/.config/

  echo "Yazi installed"
}

install_starship() {
  if [[ ! -f /opt/my-resources/bin/starship || ""$force"" == "force" ]]; then
    local URL="https://github.com/starship/starship/releases/download/v1.23.0/starship-x86_64-unknown-linux-musl.tar.gz"
    local URL2="https://github.com/eza-community/eza/releases/download/v0.23.0/eza_x86_64-unknown-linux-musl.tar.gz"

    echo "installing starship"

    curl -sL "$URL" | tar xz

    mv starship /opt/my-resources/bin

    curl -sL "$URL2" | tar xz
    mv eza /opt/my-resources/bin
  fi


  cp /opt/my-resources/setup/starship/starship.toml /root/.config/
  cp /opt/my-resources/setup/zsh/zsh.bak /root/.zshrc


  echo "starship and eza installed"
}

install_zoxide() {
  if [[ ! -f /opt/my-resources/bin/zoxide || ""$force"" == "force" ]]; then
    local URL="https://github.com/ajeetdsouza/zoxide/releases/download/v0.9.8/zoxide-0.9.8-x86_64-unknown-linux-musl.tar.gz"

    tempDir=$(mktemp -d)

    curl -sL "$URL" | tar xz -C "$tempDir"

    mv "$tempDir/zoxide" /opt/my-resources/bin
  fi

}

install_zellij() {
  if [[ ! -f /opt/my-resources/bin/zellij || ""$force"" == "force" ]]; then
    local URL="https://github.com/zellij-org/zellij/releases/download/v0.43.1/zellij-x86_64-unknown-linux-musl.tar.gz"
    echo "Installing zellij"

    curl -sL "$URL" | tar xz

    mv  zellij /usr/local/bin
    rm -rf zellij-x86_64-unknown-linux-musl

    rm -rf ~/.config/zellij/
  fi

  cp /opt/my-resources/setup/zellij/ ~/.config/ -r
  echo "installed zellij"
}

install_nu() {
  if [[ ! -f /opt/my-resources/bin/nu || ""$force"" == "force" ]]; then
    local URL="https://github.com/nushell/nushell/releases/download/0.106.1/nu-0.106.1-x86_64-unknown-linux-musl.tar.gz"
    echo "Installing nushell"
    curl -sL "$URL" | tar xz
    mv nu-0.106.1-x86_64-unknown-linux-musl/nu /opt/my-resources/bin
    rm -rf nu-0.106.1-x86_64-unknown-linux-musl
  fi

  cp -r /opt/my-resources/setup/nushell/config.nu /root/.config/

  echo "Nushell installed"
}

extras() {
  # move arsenal 
  cp /opt/my-resources/setup/arsenal-cheats/personal.md /root/.local/share/pipx/venvs/arsenal-cli/lib/python3.11/site-packages/arsenal/data/cheats/Active_directory
  cp /opt/my-resources/setup/arsenal-cheats/arsenal.json ~/.arsenal.json

  if ! command -v uv &>/dev/null || [[ ""$force"" == "force" ]]; then
     echo "Installing uv"
     curl -LsSf https://astral.sh/uv/install.sh | sh
  else
     echo "uv already installed"
  fi

  uv tool install "git+https://github.com/aniqfakhrul/powerview.py" --force
  uv tool install "git+https://github.com/Pennyw0rth/NetExec" --force
}

install_fd_rg() {
  local fd_bin="/opt/my-resources/bin/fd"
  local rg_bin="/opt/my-resources/bin/rg"

  if [[ ! -f "$fd_bin" || ! -f "$rg_bin" || "$force" == "force" ]]; then
    echo "Installing fd and rg"
    curl -Ls https://github.com/sharkdp/fd/releases/download/v10.2.0/fd-v10.2.0-x86_64-unknown-linux-musl.tar.gz | tar xz
    mv fd-v10.2.0-x86_64-unknown-linux-musl/fd "$fd_bin"
    rm -rf fd-v10.2.0-x86_64-unknown-linux-musl

    curl -Ls https://github.com/BurntSushi/ripgrep/releases/download/14.1.1/ripgrep-14.1.1-x86_64-unknown-linux-musl.tar.gz | tar xz
    mv ripgrep-14.1.1-x86_64-unknown-linux-musl/rg "$rg_bin"
    rm -rf ripgrep-14.1.1-x86_64-unknown-linux-musl
  else
    echo "fd and rg already installed"
  fi
}

install_yazi

install_starship

install_zellij

install_zoxide

install_nu

extras

install_fd_rg

echo -e "\n DONE :)\n"

# ---- LOAD TMUX CONF ----

# Exegol also features a set of supported customization a user can make.
# The /opt/supported_setups.md file lists the supported configurations that can be made easily.
