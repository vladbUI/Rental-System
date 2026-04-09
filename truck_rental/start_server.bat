@echo off
REM Truck Rental System - PHP Server Startup Script
REM Sets Oracle in PATH so OCI8 extension can find Oracle DLLs

set PATH=C:\app\gabo\product\21c\dbhomeXE\bin;%PATH%
set ORACLE_HOME=C:\app\gabo\product\21c\dbhomeXE
set PHPRC=C:\Users\gabo\AppData\Local\Microsoft\WinGet\Packages\PHP.PHP.8.5_Microsoft.Winget.Source_8wekyb3d8bbwe

echo ==========================================
echo   Truck Rental System
echo   http://localhost:8000
echo   Login: admin / admin
echo ==========================================
echo Press Ctrl+C to stop the server.
echo.
php -S localhost:8000
