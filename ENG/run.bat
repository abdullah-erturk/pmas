
 :: LibTSforge.dll file	    	--> Windows_Addict (MASSGRAVE)
 :: activate.ps1 script file 	--> Dark Vador (MDL)
 
 :: All praise to these friends :)
 
 
 :: The activate.ps1 script file was modified for automatic use by Abdullah ERTÜRK (https://github.com/abdullah-erturk)
 
 :: run.bat betik dosyası --> Abdullah ERTÜRK (https://github.com/abdullah-erturk/tsf_activation)

@echo off
title TSF Activation by mephistooo2 ^| TNCTR.^com
color 0A
pushd %~dp0

:: Only continue if Windows 10 or higher
for /f %%i in ('powershell -NoProfile -Command "(Get-CimInstance Win32_OperatingSystem).Version"') do set "winver=%%i"

for /f "tokens=1,2 delims=." %%a in ("%winver%") do (
    set "major=%%a"
    set "minor=%%b"
)

if %major% LSS 10 (
    echo.
    echo This script can only be run on Windows 10 or higher systems.
    pause
    echo.
    exit /b
)

:: If not running as Administrator, restart as Administrator
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if %errorlevel% NEQ 0 (
    echo.
    echo Enabling with Administrator privileges...
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

:: Main menu
:menu
cls
echo.
echo ===============================================
echo			TSF Activation 
echo ===============================================
echo.
echo      1. GUI Mode [Interactive selection window]
echo.
echo      2. Unattended Mode [Windows ^+ Office]
echo.
echo      3. Unattended Mode [Windows]
echo.
echo      4. Unattended Mode [Office]
echo.
echo      5. Exit
echo.
choice /C:12345 /N /M "Your Choice [1-2-3-4-5] : "

if errorlevel 5 goto :exit
if errorlevel 4 goto :office
if errorlevel 3 goto :windows
if errorlevel 2 goto :unattended
if errorlevel 1 goto :gui
goto menu

:gui
echo.
echo.
echo.
echo Selected mode: GUI Mode [Interactive selection window]
timeout 2 >nul 2>&1
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0activate.ps1"
goto exit

:unattended
echo.
echo.
echo.
echo Selected mode: Unattended Mode [Windows ^+ Office]
timeout 2 >nul 2>&1
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0activate.ps1" -w -o
goto exit

:windows
echo.
echo.
echo.
echo Selected mode: Unattended Mode [Windows]
timeout 2 >nul 2>&1
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0activate.ps1" -w
goto exit

:office
echo.
echo.
echo.
echo Selected mode: Unattended Mode [Office]
timeout 2 >nul 2>&1
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0activate.ps1" -o
goto exit

:exit
timeout 1 >nul 2>&1
exit