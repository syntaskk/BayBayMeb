@echo off
title VPN Baslatici
color 0A

:: Yönetici olarak çalışıyor mu kontrol et
net session >nul 2>&1
if %errorLevel% neq 0 (
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

cd /d "%~dp0"
cls

:: dosyalar klasörü kontrolü
if not exist "dosyalar" (
    echo [!] dosyalar klasoru bulunamadi!
    pause
    exit /b 1
)

cd dosyalar

:: erisimasan.exe kontrolü
if exist "erisimasan.exe" (
    echo [*] VPN baslatiliyor...
    timeout /t 2 /nobreak >nul
    start "" "erisimasan.exe"
    echo [+] VPN baslatildi!
    exit
) else (
    echo [!] erisimasan.exe bulunamadi!
    pause
)

cd ..
