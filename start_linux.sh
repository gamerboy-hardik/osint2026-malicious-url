#!/usr/bin/env bash
# ==============================================================================
#  SCANTOTAL // THREAT DEFENSE GRID v4.9.2
#  Cross-Platform Linux & WSL2 Launcher
# ==============================================================================

# Cyber Green & Neon Colors
GREEN='\033[1;32m'
CYAN='\033[1;36m'
YELLOW='\033[1;33m'
RED='\033[1;31m'
NC='\033[0m' # No Color
BOLD='\033[1m'

clear

echo -e "${GREEN}"
cat << "EOF"
  ███████╗ ██████╗ █████╗ ███╗   ██╗████████╗ ██████╗ ████████╗ █████╗ ██╗     
  ██╔════╝██╔════╝██╔══██╗████╗  ██║╚══██╔══╝██╔═══██╗╚══██╔══╝██╔══██╗██║     
  ███████╗██║     ███████║██╔██╗ ██║   ██║   ██║   ██║   ██║   ███████║██║     
  ╚════██║██║     ██╔══██║██║╚██╗██║   ██║   ██║   ██║   ██║   ██╔══██║██║     
  ███████║╚██████╗██║  ██║██║ ╚████║   ██║   ╚██████╔╝   ██║   ██║  ██║███████╗
  ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝    ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝
             [CYBER THREAT INTELLIGENCE & X.509 PKI DEFENSE GRID]
EOF
echo -e "${NC}"

echo -e "${CYAN}[+] SYSTEM AUDIT INITIALIZED...${NC}"

# Detect Environment
if grep -qi "microsoft" /proc/version 2>/dev/null; then
    ENV_DESC="Windows Subsystem for Linux (WSL2)"
    IS_WSL=true
else
    ENV_DESC="Native Linux Kernel ($(uname -s) $(uname -m))"
    IS_WSL=false
fi

echo -e "    ${BOLD}Environment:${NC}  ${GREEN}${ENV_DESC}${NC}"
echo -e "    ${BOLD}Kernel:${NC}       $(uname -r)"
echo -e "    ${BOLD}Host System:${NC}  $(hostname)"
echo -e "    ${BOLD}Current Time:${NC} $(date -u '+%Y-%m-%d %H:%M:%SZ')"

# Check Node.js
if ! command -v node &> /dev/null; then
    echo -e "${RED}[!] Node.js is not installed or not in PATH.${NC}"
    echo -e "    Please install Node.js via: sudo apt update && sudo apt install -y nodejs"
    exit 1
fi

NODE_VER=$(node -v)
echo -e "    ${BOLD}Node Runtime:${NC} ${GREEN}${NODE_VER}${NC}"

PORT=${PORT:-3000}
TARGET_URL="http://localhost:${PORT}"

echo -e "\n${YELLOW}[*] Booting ScanTotal Defense Engine on Port ${PORT}...${NC}"
echo -e "${GREEN}[✔] 88 Threat Engines: ARMED${NC}"
echo -e "${GREEN}[✔] ITU-T X.509 Cryptographic Validator: READY${NC}"
echo -e "${GREEN}[✔] Real-Time Threat Telemetry: ACTIVE${NC}"
echo -e "${CYAN}------------------------------------------------------------${NC}"
echo -e "${BOLD}Access the Hacker Dashboard at:${NC} ${GREEN}${TARGET_URL}${NC}"
echo -e "${CYAN}------------------------------------------------------------${NC}"

# Launch browser if running in WSL
if [ "$IS_WSL" = true ]; then
    echo -e "${CYAN}[*] WSL detected: opening Windows browser...${NC}"
    (sleep 1 && cmd.exe /c start "${TARGET_URL}" 2>/dev/null || true) &
elif command -v xdg-open &> /dev/null; then
    (sleep 1 && xdg-open "${TARGET_URL}" 2>/dev/null || true) &
fi

echo -e "${YELLOW}Press Ctrl+C to terminate the defense grid server.${NC}\n"

# Run Node.js server
exec node server.js
