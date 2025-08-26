#!/bin/bash
set -e

readonly FORCE="$1"
readonly BIN_DIR="/opt/my-resources/bin"
readonly SETUP_DIR="/opt/my-resources/setup"

# Colors
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly PURPLE='\033[0;35m'
readonly CYAN='\033[0;36m'
readonly WHITE='\033[1;37m'
readonly NC='\033[0m' # No Color

# Status indicators
readonly SUCCESS="[${GREEN}+${NC}]"
readonly INFO="[${BLUE}*${NC}]"
readonly WARNING="[${YELLOW}!${NC}]"
readonly ERROR="[${RED}-${NC}]"
readonly DEBUG="[${PURPLE}DEBUG${NC}]"

# Utility functions
log_success() { echo -e "${SUCCESS} $1"; }
log_info()    { echo -e "${INFO} $1"; }
log_warning() { echo -e "${WARNING} $1"; }
log_error()   { echo -e "${ERROR} $1"; }
log_debug()   { echo -e "${DEBUG} $1"; }

# Error handler
error_exit() {
    log_error "Script failed at line $1. Command: $2"
    exit 1
}
trap 'error_exit $LINENO "$BASH_COMMAND"' ERR

should_install() {
    local binary="$1"
    [[ ! -f "$BIN_DIR/$binary" || "$FORCE" == "force" ]]
}

download_and_extract() {
    local url="$1"
    local target_dir="${2:-.}"
    curl -sL "$url" | tar xz -C "$target_dir"
}

install_yazi() {
    log_debug "Starting yazi installation"
    if should_install "yazi"; then
        log_info "${CYAN}Installing Yazi file manager${NC}"
        local url="https://github.com/sxyazi/yazi/releases/download/v25.5.31/yazi-x86_64-unknown-linux-musl.zip"
        
        jar xvf <(curl -Ls "$url" --output -)
        chmod +x yazi-x86_64-unknown-linux-musl/yazi
        mv yazi-x86_64-unknown-linux-musl/yazi "$BIN_DIR/"
        rm -rf yazi-x86_64-unknown-linux-musl
        log_success "Yazi binary installed"
    else
        log_warning "Yazi already exists, skipping download"
    fi

    mkdir -p /root/.config
    cp -r "$SETUP_DIR/yazi/" /root/.config/ 2>/dev/null || log_warning "Yazi config not found, skipping"
    log_success "${CYAN}Yazi${NC} configuration applied"
}

install_starship() {
    log_debug "Starting starship installation"
    if should_install "starship"; then
        log_info "${PURPLE}Installing Starship prompt and Eza${NC}"
        local starship_url="https://github.com/starship/starship/releases/download/v1.23.0/starship-x86_64-unknown-linux-musl.tar.gz"
        local eza_url="https://github.com/eza-community/eza/releases/download/v0.23.0/eza_x86_64-unknown-linux-musl.tar.gz"

        download_and_extract "$starship_url"
        mv starship "$BIN_DIR/"
        log_success "Starship binary installed"

        download_and_extract "$eza_url"
        mv eza "$BIN_DIR/"
        log_success "Eza binary installed"
    else
        log_warning "Starship already exists, skipping download"
    fi

    mkdir -p /root/.config
    cp "$SETUP_DIR/starship/starship.toml" /root/.config/ 2>/dev/null || log_warning "Starship config not found"
    cp "$SETUP_DIR/zsh/zsh.bak" /root/.zshrc 2>/dev/null || log_warning "Zsh config not found"
    log_success "${PURPLE}Starship${NC} and ${YELLOW}Eza${NC} configuration applied"
}

install_zoxide() {
    log_debug "Starting zoxide installation"
    if should_install "zoxide"; then
        log_info "${GREEN}Installing Zoxide smart cd${NC}"
        local url="https://github.com/ajeetdsouza/zoxide/releases/download/v0.9.8/zoxide-0.9.8-x86_64-unknown-linux-musl.tar.gz"
        local temp_dir
        temp_dir=$(mktemp -d)
        
        download_and_extract "$url" "$temp_dir"
        mv "$temp_dir/zoxide" "$BIN_DIR/"
        rm -rf "$temp_dir"
        log_success "Zoxide binary installed"
    else
        log_warning "Zoxide already exists, skipping download"
    fi
    log_success "${GREEN}Zoxide${NC} ready"
}

install_zellij() {
    log_debug "Starting zellij installation"
    if should_install "zellij"; then
        log_info "${BLUE}Installing Zellij terminal multiplexer${NC}"
        local url="https://github.com/zellij-org/zellij/releases/download/v0.43.1/zellij-x86_64-unknown-linux-musl.tar.gz"
        
        download_and_extract "$url"
        mv zellij /usr/local/bin/
        rm -rf ~/.config/zellij/ 2>/dev/null || true
        log_success "Zellij binary installed"
    else
        log_warning "Zellij already exists, skipping download"
    fi

    mkdir -p ~/.config
    cp -r "$SETUP_DIR/zellij/" ~/.config/ 2>/dev/null || log_warning "Zellij config not found"
    log_success "${BLUE}Zellij${NC} configuration applied"
}

install_nushell() {
    log_debug "Starting nushell installation"
    if should_install "nu"; then
        log_info "${YELLOW}Installing Nushell${NC}"
        local url="https://github.com/nushell/nushell/releases/download/0.106.1/nu-0.106.1-x86_64-unknown-linux-musl.tar.gz"
        
        download_and_extract "$url"
        mv nu-0.106.1-x86_64-unknown-linux-musl/nu "$BIN_DIR/"
        rm -rf nu-0.106.1-x86_64-unknown-linux-musl
        log_success "Nushell binary installed"
    else
        log_warning "Nushell already exists, skipping download"
    fi

    mkdir -p /root/.config
    cp -r "$SETUP_DIR/nushell/config.nu" /root/.config/ 2>/dev/null || log_warning "Nushell config not found"
    log_success "${YELLOW}Nushell${NC} configuration applied"
}

install_fd_rg() {
    log_debug "Starting fd/rg installation"
    local need_install=false
    
    if should_install "fd" || should_install "rg"; then
        need_install=true
    fi

    if [[ "$need_install" == true ]]; then
        log_info "${WHITE}Installing fd (find) and ripgrep (rg)${NC}"
        
        # Install fd
        local fd_url="https://github.com/sharkdp/fd/releases/download/v10.2.0/fd-v10.2.0-x86_64-unknown-linux-musl.tar.gz"
        download_and_extract "$fd_url"
        mv fd-v10.2.0-x86_64-unknown-linux-musl/fd "$BIN_DIR/"
        rm -rf fd-v10.2.0-x86_64-unknown-linux-musl
        log_success "fd binary installed"

        # Install ripgrep
        local rg_url="https://github.com/BurntSushi/ripgrep/releases/download/14.1.1/ripgrep-14.1.1-x86_64-unknown-linux-musl.tar.gz"
        download_and_extract "$rg_url"
        mv ripgrep-14.1.1-x86_64-unknown-linux-musl/rg "$BIN_DIR/"
        rm -rf ripgrep-14.1.1-x86_64-unknown-linux-musl
        log_success "ripgrep binary installed"
        
        log_success "${WHITE}fd${NC} and ${WHITE}ripgrep${NC} ready"
    else
        log_warning "fd and ripgrep already installed"
    fi
}

install_extras() {
    log_debug "Starting extras installation"
    log_info "${PURPLE}Installing additional tools and configurations${NC}"
    
    # Arsenal setup
    log_info "Configuring Arsenal cheat sheets"
    local arsenal_dir="/root/.local/share/pipx/venvs/arsenal-cli/lib/python3.11/site-packages/arsenal/data/cheats/Active_directory"
    if [[ -d "$arsenal_dir" ]]; then
        cp "$SETUP_DIR/arsenal-cheats/personal.md" "$arsenal_dir/" 2>/dev/null || log_warning "Arsenal personal.md not found"
        log_success "Arsenal personal cheats copied"
    else
        log_warning "Arsenal directory not found, skipping"
    fi
    
    cp "$SETUP_DIR/arsenal-cheats/arsenal.json" ~/.arsenal.json 2>/dev/null || log_warning "Arsenal config not found"
    log_success "Arsenal configuration applied"

    # Install uv if needed
    if ! command -v uv &>/dev/null || [[ "$FORCE" == "force" ]]; then
        log_info "Installing ${CYAN}uv${NC} Python package manager"
        curl -LsSf https://astral.sh/uv/install.sh | sh
        
        # Source the PATH changes
        source ~/.bashrc 2>/dev/null || true
        export PATH="$HOME/.local/bin:$PATH"
        
        log_success "uv installed"
    else
        log_warning "uv already installed"
    fi
    
    # Verify uv is available
    if ! command -v uv &>/dev/null; then
        log_error "uv not found in PATH after installation"
        return 1
    fi
    
    # Install godap
    log_info "Installing ${GREEN}godap${NC}"
    local godap_url="https://github.com/Macmod/godap/releases/download/v2.10.5/godap-v2.10.5-linux-amd64.tar.gz"
    download_and_extract "$godap_url"
    rm -f README.md LICENSE 2>/dev/null || true
    mv godap "$BIN_DIR/"
    log_success "godap installed"
    
    # Install Python tools via uv
    log_info "${BLUE}Installing Python security tools${NC}"
    local tools=(
        "git+https://github.com/aniqfakhrul/powerview.py"
        "git+https://github.com/Pennyw0rth/NetExec"
        "git+https://github.com/brightio/penelope"
        "git+https://github.com/ThePorgs/Exegol-history"
    )
    
    for tool in "${tools[@]}"; do
        local tool_name=$(basename "$tool" .py | sed 's/.*\///')
        log_info "Installing ${YELLOW}$tool_name${NC}"
        
        # Try to install with error handling
        if uv tool install "$tool" --force 2>/dev/null; then
            log_success "$tool_name installed"
        else
            log_warning "$tool_name installation failed, continuing..."
        fi
    done

    # Setup exegol-history
    log_info "Configuring ${GREEN}Exegol-history${NC}"
    rm -rf /opt/tools/Exegol-history 2>/dev/null || true
    
    if [[ -d "/root/.local/share/uv/tools/exegol-history/" ]]; then
        cp -r /root/.local/share/uv/tools/exegol-history/ /opt/tools/
        mv /opt/tools/exegol-history /opt/tools/Exegol-history
        
        local base_url="https://raw.githubusercontent.com/ThePorgs/Exegol-history/refs/heads/main"
        curl -s "$base_url/profile.sh" -o /opt/tools/Exegol-history/profile.sh
        
        mkdir -p /root/.exegol_history
        curl -s "$base_url/exegol_history/config/config.toml" -o /root/.exegol_history/config.toml
        
        log_success "Exegol-history configured"
    else
        log_warning "Exegol-history not found in uv tools, skipping setup"
    fi
}

# Main execution
main() {
    echo -e "\n${WHITE}╔══════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${WHITE}║                    ${CYAN}Exegol Customization Setup${WHITE}                        ║${NC}"
    echo -e "${WHITE}╚══════════════════════════════════════════════════════════════════════╝${NC}\n"
    
    # Ensure directories exist
    mkdir -p "$BIN_DIR" /root/.config /root/.exegol_history
    
    install_yazi
    echo ""
    install_starship
    echo ""
    install_zellij
    echo ""
    install_zoxide
    echo ""
    install_nushell
    echo ""
    install_fd_rg
    echo ""
    install_extras
    
    echo -e "\n${WHITE}╔══════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${WHITE}║                           ${GREEN}SETUP COMPLETE${WHITE}                             ║${NC}"
    echo -e "${WHITE}╚══════════════════════════════════════════════════════════════════════╝${NC}\n"
    
    log_success "${GREEN}All tools installed and configured successfully!${NC}"
    log_info "Restart your shell or source your configuration to use new tools"
}

main "$@"

