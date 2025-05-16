
 :: LibTSforge.dll dosyas	   --> Windows_Addict (MASSGRAVE)
 :: activate.ps1 betik dosyas --> Dark Vador (MDL)

 :: Tm ”vgler bu arkadaŸlara :) 


 :: activate.ps1 betik dosyas Abdullah ERTšRK (https://github.com/abdullah-erturk) tarafndan otomatik kullanm i‡in de§iŸtirildi.
 
 :: run.bat betik dosyas --> Abdullah ERTšRK (https://github.com/abdullah-erturk/tsf_activation)
 
@echo off
title TSF Activation by mephistooo2 ^| TNCTR.^com
color 0A
pushd %~dp0

:: Yalnzca Windows 10 veya zeri srm
for /f %%i in ('powershell -NoProfile -Command "(Get-CimInstance Win32_OperatingSystem).Version"') do set "winver=%%i"

for /f "tokens=1,2 delims=." %%a in ("%winver%") do (
    set "major=%%a"
    set "minor=%%b"
)

if %major% LSS 10 (
    echo.
    echo Bu script sadece Windows 10 veya daha st sistemlerde ‡alŸtrlabilir.
    pause
    echo.
    exit /b
)

:: Y”netici olarak ‡alŸmyorsa kendini y”netici olarak yeniden baŸlat
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if %errorlevel% NEQ 0 (
    echo.
	echo Y”netici yetkileriyle yeniden baŸlatlyor...
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

:: Ana men
:menu
cls
echo.
echo ===============================================
echo			TSF Activation 
echo ===============================================
echo.
echo      1. Se‡imli Mod [šrn se‡imi penceresi]
echo.
echo      2. Katlmsz Mod [Windows ^+ Office]
echo.
echo      3. Katlmsz Mod [Windows]
echo.
echo      4. Katlmsz Mod [Office]
echo.
echo      5. €kŸ
echo.
choice /C:12345 /N /M "Se‡iminiz [1-2-3-4-5] : "

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
echo Se‡ilen mod: Se‡imli Mod [šrn se‡imi penceresi]
timeout 2 >nul 2>&1
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0activate.ps1"
goto exit

:unattended
echo.
echo.
echo.
echo Se‡ilen mod: Katlmsz Mod [Windows ^+ Office]
timeout 2 >nul 2>&1
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0activate.ps1" -w -o
goto exit

:windows
echo.
echo.
echo.
echo Se‡ilen mod: Katlmsz Mod [Windows]
timeout 2 >nul 2>&1
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0activate.ps1" -w
goto exit

:office
echo.
echo.
echo.
echo Se‡ilen mod: Katlmsz Mod [Office]
timeout 2 >nul 2>&1
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File "%~dp0activate.ps1" -o
goto exit

:exit
timeout 1 >nul 2>&1
exit