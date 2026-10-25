# osint2026-malicious-url

## SCANTOTAL // CYBER THREAT DEFENSE GRID v4.9.2
> **Cross-Platform URL & Threat Intelligence Engine with ITU-T X.509 PKI Auditor**  
> Native support for **Linux (WSL2 / Ubuntu)** and **Windows x86_64**. Zero external runtime dependencies.

---

## ⚡ Quick Start: Running in WSL Linux Terminal

You can run the full hacker dashboard directly in your **WSL Linux terminal**:

### 1. Interactive Terminal Mode
```bash
# Navigate to project directory in WSL
cd /mnt/c/Users/paltr/Downloads/deploy-67cc4b766b776b07b007f429

# Run the interactive hacker CLI
./scan.sh
```

### 2. Direct Target Scan in Terminal
```bash
# Scan a live website (performs live TLS handshake, X.509 cert extraction, & 88-engine check)
./scan.sh https://google.com
./scan.sh https://github.com

# Test malware / phishing detection vectors (crimson alert simulation)
./scan.sh https://test-malware.phish

# Test expired X.509 SSL certificate detection
./scan.sh https://expired-ssl.test
```

### 3. Launch Web Server in Linux / WSL
```bash
# Starts the server in WSL Linux with full colored banner
./start_linux.sh

# Or start daemon directly:
node server.js
```
Open **`http://localhost:3000`** in any browser (WSL2 mirrors localhost ports to Windows host automatically).

---

## 💻 Quick Start: Running in Windows

- **Method 1 (Double-Click):** Double-click `start_windows.bat` in File Explorer.
- **Method 2 (PowerShell / CMD):**
  ```powershell
  npm start
  ```
  Open **`http://localhost:3000`**.

---

## 🛡️ Features & Capabilities

### 1. 88 Global Security & Antivirus Engines
Scans URLs against 88 industry-standard threat intelligence engines:
- **Endpoint Security & EDR:** Kaspersky, Bitdefender, CrowdStrike Falcon, SentinelOne, Symantec, Sophos Intercept X, Microsoft Defender.
- **Network & Gateway Firewalls:** Fortinet FortiGuard, Cisco Talos, Palo Alto WildFire, Check Point ZoneAlarm.
- **Web & DNS Feeds:** Google Safe Browsing, Cloudflare Radar, Quad9, AbuseIPDB, Spamhaus, URLhaus, PhishTank, Netcraft.

### 2. ITU-T X.509 v3 Digital Certificate & PKI Suite
Extracts live cryptographic parameters via TLS sockets:
- Subject Common Name (CN) & Organization (O)
- Certificate Authority (CA) & Root Issuer Chain
- TLS Protocol negotiated (`TLSv1.3` / `TLSv1.2`)
- Cipher Suite & Forward Secrecy (`TLS_AES_256_GCM_SHA384`)
- Public Key Algorithm & Key Length (RSA 2048/4096-bit, ECC 256-bit)
- Validity Dates & Countdown of Days to Expiration
- SHA-256 PKI Thumbprint / Fingerprint
- Subject Alternative Names (SANs) domain bindings

### 3. OWASP HTTP Security Headers Audit
Checks and grades:
- `Strict-Transport-Security` (HSTS)
- `Content-Security-Policy` (CSP)
- `X-Frame-Options` (Clickjacking prevention)
- `X-Content-Type-Options` (MIME sniffing defense)
- `Referrer-Policy`

### 4. Hacker Cyberpunk Aesthetic
- Terminal Matrix Code Rain canvas (toggleable)
- CRT scanlines retro overlay filter (toggleable)
- Concentric radar scanner sweep animation
- Real-time Zulu/UTC digital clock
- Live terminal console logger
- Synthesized Web Audio API sound effects
- Filterable green matrix tables with instant search

---

## 📂 Project Structure

```
deploy-67cc4b766b776b07b007f429/
├── cli.js             # Terminal CLI hacker scanner for WSL/Linux
├── scan.sh            # One-line terminal scan launcher script (WSL/Linux)
├── server.js          # Zero-dependency Node.js backend & static server
├── start_linux.sh     # Linux / WSL startup script with colored ASCII banner
├── start_windows.bat  # Windows one-click batch launcher
├── index.html         # Cyberpunk hacker web cockpit dashboard
├── css/
│   └── hacker.css     # Cyber styling, green boards, matrix tables, HUD
├── js/
│   └── hacker.js      # Client controller, sound FX, matrix canvas, live logs
├── package.json       # Project scripts (npm start, npm run wsl)
└── README.md          # Project documentation
```
