#!/usr/bin/env bash
#
# agents-init installer
#
# Installs the agents CLI tool to ~/.local/
#
# Usage:
#   ./install.sh              # Install to ~/.local/
#   ./install.sh --uninstall  # Remove installation
#

set -euo pipefail

INSTALL_DIR="${HOME}/.local/share/agents-init"
BIN_DIR="${HOME}/.local/bin"

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

log_info() {
    echo -e "${BLUE}→${NC} $1"
}

log_success() {
    echo -e "${GREEN}✓${NC} $1"
}

log_error() {
    echo -e "${RED}✗${NC} $1" >&2
}

install() {
    local script_dir
    script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

    log_info "Installing agents-init..."

    # Create directories
    mkdir -p "$INSTALL_DIR/bin"
    mkdir -p "$INSTALL_DIR/templates"
    mkdir -p "$BIN_DIR"

    # Copy files
    cp "$script_dir/bin/agents" "$INSTALL_DIR/bin/agents"
    chmod +x "$INSTALL_DIR/bin/agents"
    
    cp "$script_dir/templates/"* "$INSTALL_DIR/templates/"

    # Create symlink
    ln -sf "$INSTALL_DIR/bin/agents" "$BIN_DIR/agents"

    log_success "Installed to $INSTALL_DIR"
    log_success "Symlinked to $BIN_DIR/agents"

    # Check if bin is in PATH
    if [[ ":$PATH:" != *":$BIN_DIR:"* ]]; then
        echo ""
        log_info "Add to your PATH (add to ~/.bashrc or ~/.zshrc):"
        echo "    export PATH=\"\$HOME/.local/bin:\$PATH\""
    fi

    echo ""
    log_success "Installation complete!"
    echo ""
    echo "  Usage:"
    echo "    agents init              # Scaffold current directory"
    echo "    agents init my-project   # Create new project directory"
    echo "    agents help              # Show help"
    echo ""
}

uninstall() {
    log_info "Uninstalling agents-init..."

    if [[ -L "$BIN_DIR/agents" ]]; then
        rm "$BIN_DIR/agents"
        log_success "Removed symlink"
    fi

    if [[ -d "$INSTALL_DIR" ]]; then
        rm -rf "$INSTALL_DIR"
        log_success "Removed $INSTALL_DIR"
    fi

    log_success "Uninstall complete"
}

main() {
    case "${1:-}" in
        --uninstall|-u)
            uninstall
            ;;
        --help|-h)
            echo "Usage: ./install.sh [--uninstall]"
            ;;
        *)
            install
            ;;
    esac
}

main "$@"
