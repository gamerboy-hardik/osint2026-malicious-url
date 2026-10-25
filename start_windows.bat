@echo off
title SCANTOTAL // CYBER DEFENSE GRID v4.9.2
color 0A
cls
echo ======================================================================
echo   SCANTOTAL DEFENSE GRID // THREAT & X.509 PKI AUDIT SYSTEM
echo   Windows Native Launcher
echo ======================================================================
echo.

where node >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo [ERROR] Node.js is not found in your PATH.
    echo Please install Node.js from https://nodejs.org
    pause
    exit /b 1
)

echo [+] Node.js detected:
node -v
echo.
echo [+] Starting server on port 3000...
echo [+] Opening dashboard: http://localhost:3000
echo.
start http://localhost:3000
node server.js
pause
