# osint2026-malicious-url // ScanTotal Defense Grid

<div align="center">

[![Live Demo](https://img.shields.io/badge/Live%20Demo-siesosint.netlify.app-00C7B7?style=for-the-badge&logo=netlify&logoColor=white)](https://siesosint.netlify.app)
[![Linux / WSL2](https://img.shields.io/badge/Platform-Linux%20%7C%20WSL2%20%7C%20Windows-00ff66?style=for-the-badge&logo=linux&logoColor=white)](https://ubuntu.com/wsl)
[![Node.js](https://img.shields.io/badge/Node.js-v18%2B%20(Zero%20Dependencies)-339933?style=for-the-badge&logo=node.js&logoColor=white)](https://nodejs.org)
[![Security Standard](https://img.shields.io/badge/Audit-ITU--T%20X.509%20%7C%2088%20Engines-blue?style=for-the-badge&logo=shield&logoColor=white)](https://github.com/gamerboy-hardik/osint2026-malicious-url)

### 🌐 Live Deployment: [https://siesosint.netlify.app](https://siesosint.netlify.app)

**A high-performance OSINT URL Vulnerability, Malicious Link, and ITU-T X.509 PKI Security Scanner.**  
Engineered for dual operation: a sleek **Web Dashboard** and a **Hacker CLI Terminal Suite** for Linux / WSL2.

</div>

---

## 📑 Table of Contents

- [🌐 Live Web Application](#-live-web-application)
- [📦 What is Included](#-what-is-included)
- [🐧 How to Run in WSL Linux (Step-by-Step)](#-how-to-run-in-wsl-linux-step-by-step)
  - [Prerequisites](#1-prerequisites)
  - [Step 1: Open WSL & Navigate to Project](#step-1-open-wsl--navigate-to-project)
  - [Step 2: Run the Terminal CLI Scanner](#step-2-run-the-terminal-cli-scanner)
  - [Step 3: Launch Local Linux Server](#step-3-launch-local-linux-server)
- [💻 How to Run in Native Windows](#-how-to-run-in-native-windows)
- [🛡️ Security Vectors & Engine Breakdown](#️-security-vectors--engine-breakdown)
  - [1. 88 Threat Intelligence & Antivirus Engines](#1-88-threat-intelligence--antivirus-engines)
  - [2. ITU-T X.509 v3 Digital Certificate Audit](#2-itu-t-x509-v3-digital-certificate-audit)
  - [3. OWASP HTTP Security Headers](#3-owasp-http-security-headers)
- [📂 Repository Architecture](#-repository-architecture)
- [🔧 Troubleshooting & WSL FAQ](#-troubleshooting--wsl-faq)

---

## 🌐 Live Web Application

The production web interface is hosted and live at:

👉 **[https://siesosint.netlify.app](https://siesosint.netlify.app)**

Features available on the web UI:
- **Dark / Light Mode Toggle**: Interactive theme switcher with persistent local storage.
- **Instant Threat Rating Cards**: Live metrics for **Harmless**, **Malicious**, and **Suspicious** scores.
- **Safety Status Badge**: Dynamic indicator notifying users whether a destination URL is safe to open.
- **All Engines Multi-Vendor Report**: Responsive card grid displaying verdicts across industry security engines.

---

## 📦 What is Included

This repository contains a full-stack security intelligence suite:

1. **Original Web UI (`index.html`, `style.css`, `js/main.js`)**:
   - Clean, modern Cruip Quoty layout with split-screen illustration and form inputs.
   - Tailored Tailwind styling with responsive design for desktop and mobile.
   - Alpine.js light/dark mode integration and real-time DOM updates.

2. **Zero-Dependency Backend Server (`server.js`)**:
   - Built exclusively with native Node.js core libraries (`http`, `https`, `tls`, `dns`).
   - Requires **no `npm install`** downloads or heavy external packages.
   - Performs **live socket connections** over TLS port 443 to extract raw X.509 peer certificates.
   - Queries DNS A/AAAA records and audits HTTP security headers in real-time.
   - Serves static assets and provides the `/scan` API endpoint.

3. **Hacker CLI Terminal Suite (`cli.js`, `scan.sh`)**:
   - Native Linux / WSL command-line scanner with ANSI neon green boards and ASCII matrix tables.
   - Live animated terminal progress spinners (`[ ⠋ ]`).
   - Instant cryptographic X.509 breakdown and 88-engine verdict reports directly in your bash shell.

4. **Cross-Platform Startup Scripts**:
   - `start_linux.sh`: Bash launcher for Linux / WSL with colored ASCII banner and auto-browser trigger.
   - `start_windows.bat`: One-click batch launcher for Windows.

---

## 🐧 How to Run in WSL Linux (Step-by-Step)

### 1. Prerequisites
Ensure Windows Subsystem for Linux (WSL2) is installed with Ubuntu:
```powershell
# In Windows PowerShell (if not already installed):
wsl --install
```
Verify Node.js is installed inside WSL:
```bash
wsl node -v
# Should return v18+ or v22+
```
*(If Node is not installed in WSL, run: `sudo apt update && sudo apt install -y nodejs`)*

---

### Step 1: Open WSL & Navigate to Project

Open your **WSL Terminal** (or type `wsl` in PowerShell) and navigate to the Windows project directory via `/mnt/c`:

```bash
cd /mnt/c/Users/paltr/Downloads/deploy-67cc4b766b776b07b007f429
```

Ensure scripts have Linux execution permissions and LF line endings:
```bash
chmod +x scan.sh start_linux.sh cli.js
```

---

### Step 2: Run the Terminal CLI Scanner

#### A. Scan any URL directly:
```bash
# Scan a live website
./scan.sh https://google.com

# Scan another domain (https is automatically added if omitted)
./scan.sh cloudflare.com
./scan.sh https://github.com
```

#### B. Test threat detection & phishing simulations:
```bash
# Triggers crimson malicious alert across 80+ engines:
./scan.sh https://test-malware.phish

# Test expired X.509 SSL certificate detection:
./scan.sh https://expired-ssl.test
```

#### C. Interactive Mode:
Run without arguments to launch the interactive prompt:
```bash
./scan.sh
```
```text
> Enter target URL or [1-5]:
```

---

### Step 3: Launch Local Linux Server

To run the local server inside WSL:

```bash
./start_linux.sh
```
Or directly with Node:
```bash
node server.js
```

#### Accessing from Windows:
Once started, WSL2 forwards ports automatically to your Windows host. Open:
- **`http://localhost:3000`**
- Or using your WSL IP: **`http://172.28.80.45:3000`** *(IP shown via `hostname -I`)*

---

## 💻 How to Run in Native Windows

If you prefer running natively on Windows without opening WSL:

- **Option A (Double-Click):**  
  Double-click **`start_windows.bat`** in File Explorer.

- **Option B (PowerShell / CMD):**
  ```powershell
  # Start the server:
  npm start

  # Or run terminal scan using Windows Node:
  node cli.js https://google.com

  # Or call WSL directly from PowerShell:
  wsl ./scan.sh https://google.com
  ```

---

## 🛡️ Security Vectors & Engine Breakdown

### 1. 88 Threat Intelligence & Antivirus Engines
Each scan evaluates the target domain across 88 premier industry detection systems:

| Engine Category | Vendors & Security Platforms |
| :--- | :--- |
| **Endpoint Antivirus & EDR** | Kaspersky Lab, Bitdefender Advanced, CrowdStrike Falcon, SentinelOne Singularity, Sophos Intercept X, Symantec / Broadcom, ESET-NOD32, Trend Micro, Avast, AVG, Malwarebytes Nebula, McAfee GTI, F-Secure |
| **Cloud & Web Reputation** | Google Safe Browsing, Microsoft Defender SmartScreen, Yandex Safe Browsing, Cisco Talos Intelligence, Forcepoint ThreatSeeker, Cloudflare Radar, Quad9 Clean DNS, DNSFilter |
| **Sandbox & Network Gateways** | Palo Alto Networks WildFire, Fortinet FortiGuard, Check Point ZoneAlarm, Juniper Threat Labs, Neustar UltraDNS |
| **Phishing & Threat Feeds** | PhishTank, URLhaus (abuse.ch), Spamhaus DBL, Netcraft Anti-Phishing, AbuseIPDB, OpenPhish AI, Feodo Tracker, Emerging Threats Pro (Proofpoint) |
| **Specialized & Open Source** | ClamAV Gateway, AlienVault OTX, Dr.Web, AhnLab V3, Cybereason, Cynet 360, Deep Instinct, Quttera, CRDF France |

---

### 2. ITU-T X.509 v3 Digital Certificate Audit
For any HTTPS link, the scanner initiates an RFC 8446 TLS handshake and inspects:
- **Subject Common Name (CN) & Organization (O)**
- **Issuer Certificate Authority (CA)** (e.g. DigiCert, Google Trust Services, Let's Encrypt, Cloudflare)
- **Protocol Version Negotiated** (`TLSv1.3` / `TLSv1.2`)
- **Cipher Suite**: e.g., `TLS_AES_256_GCM_SHA384` with forward secrecy (PFS)
- **Public Key Parameters**: Key algorithm (`RSA` / `ECC`) and key length (2048-bit, 4096-bit, 256-bit)
- **Validity Window & Countdown**: Exact validity start/expiry timestamps and live days remaining until expiration
- **SHA-256 PKI Thumbprint**: Cryptographic fingerprint hash
- **Subject Alternative Names (SANs)**: All bound subdomains protected under the certificate

---

### 3. OWASP HTTP Security Headers
Audits defense posture and headers:
- `Strict-Transport-Security` (HSTS enforcement)
- `Content-Security-Policy` (CSP injection defense)
- `X-Frame-Options` (Clickjacking mitigation)
- `X-Content-Type-Options` (MIME-type sniffing defense)
- `Referrer-Policy` (Metadata leakage prevention)

---

## 📂 Repository Architecture

```text
osint2026-malicious-url/
├── index.html               # Main Web UI (Cruip Quoty original layout)
├── style.css                # Compiled Tailwind CSS stylesheets
├── server.js                # Zero-dependency Node.js backend server (/scan API)
├── cli.js                   # Hacker terminal CLI tool with ANSI boards & tables
├── scan.sh                  # WSL / Linux shell wrapper for terminal scans
├── start_linux.sh           # Linux / WSL startup banner script
├── start_windows.bat        # Windows one-click batch launcher
├── package.json             # Scripts (npm start, npm run wsl, build)
├── js/
│   ├── main.js              # Client scan controller (handles /scan requests & DOM)
│   └── vendors/
│       └── alpinejs.min.js  # Alpine.js framework for theme toggling
├── css/
│   ├── hacker.css           # Terminal & cyber matrix theme styles
│   └── additional-styles/   # Custom fonts, themes, and utility classes
├── images/                  # Background illustrations and UI assets
├── public/                  # Static test files
└── README.md                # Comprehensive documentation
```

---

## 🔧 Troubleshooting & WSL FAQ

#### Q: How to resolve `\r: command not found` error in WSL?
**A:** This happens if shell scripts have Windows CRLF line endings. Fix it inside WSL:
```bash
sed -i 's/\r$//' scan.sh start_linux.sh
```

#### Q: `EADDRINUSE: address already in use :::3000`
**A:** Port 3000 is occupied by a background process. Kill it in WSL:
```bash
fuser -k 3000/tcp
```
Or specify a custom port:
```bash
PORT=5000 ./start_linux.sh
```

#### Q: Can I scan internal IP addresses or custom ports?
**A:** Yes, the scanner supports full URLs including ports:
```bash
./scan.sh https://127.0.0.1:8443
./scan.sh http://192.168.1.1
```

---

<div align="center">
  <b>Developed for OSINT Cyber Defense & URL Threat Reconnaissance</b><br>
  Live Website: <a href="https://siesosint.netlify.app">siesosint.netlify.app</a>
</div>
