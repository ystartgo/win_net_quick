@echo off
start "" /b powershell.exe -WindowStyle Hidden -ExecutionPolicy Bypass -NoProfile -File "%~dp0web.ps1"
exit

