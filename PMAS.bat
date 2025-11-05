	
	:: PMAS - PowerShell Multi Activation System
	
	:: Dark Vador (MDL) & Windows_Addict (MASSGRAVE)
	
	:: TÅm îvgÅler bu arkadaülara :)ˇ
	:: All praise to these friends :)ˇ

	:: PMAS_v7.bat --> Abdullah ERTöRK (https://github.com/abdullah-erturk/pmas)

	:: https://erturk.netlify.app

	:: https://erturk.netlify.app/run

@echo off
title PMAS v7 by mephistooo2 ^| TNCTR.com
mode con cols=95 lines=48
color 0a
pushd %temp%

::===============================================================================================================

:: Dil Tespiti ve Metin Ayarlarç / Language Detection and String Settings
set "LANG="
:: PowerShell kullanarak UI dilini al / Get UI language using PowerShell / Get UI language using PowerShell
for /f %%i in ('powershell -NoProfile -Command "(Get-UICulture).Name"') do set "LANG=%%i"

if "%LANG%"=="tr-TR" (
    :: --- TöRKÄE ---
    set "s_winVerErr=Bu script sadece Windows 10 ve ÅstÅ iületim sistemlerinde áalçütçrçlabilir."
    set "s_autoClose=5 saniye icinde otomatik kapanacaktçr..."
    set "s_64bitErr=Bu script sadece 64 bit iületim sistemlerinde áalçütçrçlabilir."
    set "s_adminRestart=Yînetici yetkileriyle yeniden baülatçlçyor..."
    set "s_netWarnTitle=DòKKAT"
    set "s_netWarnMsg1=ònternet baßlantçnçz yok."
    set "s_netWarnMsg2=Ohook ve KMS38 hariá dißer yîntemler iáin internet baßlantçsç gereklidir."
    set "s_menuPrompt=Seáiminiz [1-2-3-4-5-6-7-8] :"
    set "s_menuoemPrompt=Seáiminiz [1-2]:"
    set "s_tsfSelected=Seáilen yîntem: TSF Aktivasyon [Windows 10 - 11 / Server]"
    set "s_hwidSelected=Seáilen yîntem: HWID / KMS38 Aktivasyon [Windows 10 - 11 / Server]"
    set "s_ohookSelected=Seáilen yîntem: Ohook Aktivasyon [Office]"
    set "s_ohookRemoveSelected=Seáilen yîntem: Ohook Aktivasyon Kaldçr"
    set "s_checkMsg=Aktivasyon bilgisi kontrol ediliyor, lÅtfen bekleyin..."
    set "s_exiting=Äçkçü yapçlçyor..."
    set "s_decodeSuccess=base64 Decode iülemi baüarçlç."
    set "s_decodePath=Dosya Yolu:"
    set "s_decodeFail=Decode iülemi baüarçsçz oldu."
    set "s_decodeCorrupt=base64 deßeri bozulmuü olabilir."
    set "s_pressKey=Ana menÅ iáin herhangi bir tuüa basçn..."
    set "s_pressKeyExit=Äçkçü iáin herhangi bir tuüa basçn..."
    set "s_oemPrompt=$OEM$ klasîrÅ %systemdrive%\ dizininde zaten mevcut"
    set "s_tsfoemfolder=$OEM$ klasîrÅ %systemdrive%\ dizinine áçkarçlmçütçr. $OEM$ TSF aktivasyon yîntemi kalçcçdçr. Windows kurulumu esnasçnda internet baglantçsç gereklidir."
    set "s_hwidoemfolder=$OEM$ klasîrÅ %systemdrive%\ dizinine áçkarçlmçütçr. $OEM$ HWID/KMS38 & Ohook aktivasyon yîntemi kalçcçdçr. Windows kurulumu esnasçnda HWID yîntemi iáin internet baglantçsç gereklidir."
    set "s_hwidohookSelected=Seáilen yîntem: HWID / KMS38 ^& Ohook Aktivasyon"
    set "s_hwidohooktitle=HWID / KMS38 ^& Ohook Aktivasyon"
    set "s_SetupComplete=HATA: SetupComplete.cmd oluüturulamadç."
    set "s_method=înerilen yîntem"
) else (
    :: --- òNGòLòZCE / ENGLISH ---
    set "s_winVerErr=This script can only be run on Windows 10 and above."
    set "s_autoClose=It will close automatically in 5 seconds..."
    set "s_64bitErr=This script can only be run on 64-bit operating systems."
    set "s_adminRestart=Restarting with administrator privileges..."
    set "s_netWarnTitle=ATTENTION"
    set "s_netWarnMsg1=You have no internet connection."
    set "s_netWarnMsg2=An internet connection is required for methods other than Ohook and KMS38."
    set "s_menuPrompt=Your choice [1-2-3-4-5-6-7-8] :"
    set "s_menuoemPrompt=Your choice [1-2]:"
    set "s_tsfSelected=Selected method: TSF Activation [Windows 10 - 11 / Server]"
    set "s_hwidSelected=Selected method: HWID / KMS38 Activation [Windows 10 - 11 / Server]"
    set "s_ohookSelected=Selected method: Ohook Activation [Office]"
    set "s_ohookRemoveSelected=Selected method: Remove Ohook Activation"
    set "s_checkMsg=Checking activation status, please wait..."
    set "s_exiting=Exiting..."
    set "s_decodeSuccess=base64 Decode operation successful."
    set "s_decodePath=File Path:"
    set "s_decodeFail=Decode operation failed."
    set "s_decodeCorrupt=The base64 value may be corrupted."
    set "s_pressKey=Press any key for the main menu..."
    set "s_pressKeyExit=Press any key to exit..."
    set "s_oemPrompt=$OEM$ folder already exists in %systemdrive%\"
    set "s_tsfoemfolder=The $OEM$ folder has been extracted to the %systemdrive%\ directory. The $OEM$ TSF activation method is permanent. An internet connection is required during Windows installation."
    set "s_hwidoemfolder=The $OEM$ folder has been extracted to the %systemdrive%\ directory. The $OEM$ HWID/KMS38 & Ohook activation methods are permanent. An internet connection is required for the HWID method during Windows installation."
    set "s_hwidohookSelected=Selected method: HWID / KMS38 ^& Ohook Activation"
    set "s_hwidohooktitle=HWID / KMS38 ^& Ohook Activation"
    set "s_SetupComplete=ERROR: Failed to create SetupComplete.cmd."
    set "s_method=recommended method"
)
::===============================================================================================================

:: Dosya Temizlißi / File Cleanup
set "tsfps1file=tsf.ps1"
if exist %tsfps1file% del /f /q %tsfps1file% >nul

set "hwidps1file=hwid.ps1"
if exist %hwidps1file% del /f /q %hwidps1file% >nul

set "ohookps1file=ohook.ps1"
if exist %ohookps1file% del /f /q %ohookps1file% >nul

set "disableXfile=disableX.ps1"
if exist %disableXfile% del /f /q %disableXfile% >nul

set "centerfile=center.ps1"
if exist %centerfile% del /f /q %centerfile% >nul

set "checkfile=check.ps1"
if exist %checkfile% del /f /q %checkfile% >nul

set Auto=0		ˇˇ
if /I "%~1"=="-tsf" set Auto=1
if /I "%~1"=="-ho" set Auto=1

if /I "%~1"=="-ho" goto :hwidohook
if /I "%~1"=="-tsf" goto :tsf
::===============================================================================================================

:: Yalnçzca Windows 10 veya Åzeri sÅrÅm / Only Windows 10 or later
for /f %%i in ('powershell -NoProfile -Command "(Get-CimInstance Win32_OperatingSystem).Version"') do set "winver=%%i"

for /f "tokens=1,2 delims=." %%a in ("%winver%") do (
ˇ ˇ set "major=%%a"
ˇ ˇ set "minor=%%b"
)

if %major% LSS 10 (
ˇ ˇ echo.
ˇ ˇ echoˇ ˇ ˇ %s_winVerErr%
ˇ ˇ echo.
ˇ ˇ echoˇ ˇ ˇ %s_autoClose%
ˇ ˇ timeout /t 5 > nul
ˇ ˇ exit /b
)

::===============================================================================================================

:: òületim sistemi 64 bit kontrolÅ / Operating system 64 bit control
if not "%PROCESSOR_ARCHITECTURE%"=="AMD64" (
ˇ ˇ echo.
ˇ ˇ echoˇ ˇ ˇ %s_64bitErr%
ˇ ˇ echo.
ˇ ˇ echoˇ ˇ ˇ %s_autoClose%
ˇ ˇ timeout /t 5 > nul
ˇ ˇ exit /b
)

::===============================================================================================================

:: Yînetici olarak áalçümçyorsa kendini yînetici olarak yeniden baülat / Restart yourself as administrator if not running as administrator
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if %errorlevel% NEQ 0 (
ˇ ˇ echo.
	echoˇ ˇ ˇ %s_adminRestart%
ˇ ˇ powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
ˇ ˇ exit /b
)

powershell -NoProfile -Command ^
ˇ "try { $copy = $false; $base64 = ''; foreach ($line in Get-Content -Encoding UTF8 '%~f0') { if ($line -eq '-----BEGIN CERTIFICATE_center-----') { $copy = $true; continue } if ($line -eq '-----END CERTIFICATE_center-----') { $copy = $false; break } if ($copy -and $line.Trim() -ne '') { $base64 += $line.Trim() } }; [IO.File]::WriteAllBytes('%centerfile%', [Convert]::FromBase64String($base64)) } catch {}" 2>$null
Powershell.exe -executionpolicy remotesigned -File %centerfile% -TitleContains "PMAS*"

powershell -NoProfile -Command ^
ˇ "try { $copy = $false; $base64 = ''; foreach ($line in Get-Content -Encoding UTF8 '%~f0') { if ($line -eq '-----BEGIN CERTIFICATE_disableX-----') { $copy = $true; continue } if ($line -eq '-----END CERTIFICATE_disableX-----') { $copy = $false; break } if ($copy -and $line.Trim() -ne '') { $base64 += $line.Trim() } }; [IO.File]::WriteAllBytes('%disableXfile%', [Convert]::FromBase64String($base64)) } catch {}" 2>$null
Powershell.exe -executionpolicy remotesigned -File %disableXfile%

::===============================================================================================================

:: ònternet Kontrol / Internet Check
>nul 2>&1 ping -n 2 8.8.8.8
if errorlevel 1 (
ˇ ˇ echo.
ˇ ˇ echoˇ ˇ ˇ %s_netWarnTitle%
ˇ ˇ echo.
ˇ ˇ echoˇ ˇ ˇ %s_netWarnMsg1%
ˇ ˇ echo.
ˇ ˇ echoˇ ˇ ˇ %s_netWarnMsg2%
	timeout /t 5 >nul
)

goto :menu

::===============================================================================================================

:: Ana menÅ / Main menu
:menu
Powershell.exe -executionpolicy remotesigned -File %centerfile% -TitleContains "Administrator:ˇ PMAS*"
mode con cols=92 lines=48
cls
echo.
set "xOS="
if /i "%PROCESSOR_ARCHITECTURE%"=="amd64" set "xOS=x64"
if /i "%PROCESSOR_ARCHITECTURE%"=="x86" set "xOS=x86"
if /i "%PROCESSOR_ARCHITECTURE%"=="arm64" set "xOS=arm64"

for /f "tokens=6 delims=[]. " %%# in ('ver') do set NameOS=%%#
for /f "tokens=* delims=" %%a in ('powershell -nop -c "(([WMISEARCHER]'Select Caption from Win32_OperatingSystem').Get()).Caption"') do set "NameOS=%%a"
for /f "tokens=* delims=" %%a in ('powershell -nop -c "(([WMISEARCHER]'Select Version from Win32_OperatingSystem').Get()).Version"') do set "Version=%%a"

set yy=%date:~-4%
set mm=%date:~-7,2%
set dd=%date:~-10,2%
for /f "tokens=1-2 delims=/:" %%a in ('time /t') do (set mytime=%%a:%%b)
echoˇ ˇ ˇ ˇ ˇ ˇ ˇ ˇ ˇ ˇ ˇ ˇ ˇ ˇ ˇ ˇ ˇ ˇ ˇ ˇ ˇ ˇ ˇ ˇ ˇ ˇ ˇ ˇ ˇ ˇ	ˇ ˇ ˇ%dd%.%mm%.%yy% ^- %mytime%

if "%LANG%"=="tr-TR" (
goto TR
) else (
goto Eng
)

:TR
powershell -NoProfile -Command ^
Write-Host (' ' * 12) -NoNewline; Write-Host 'PMAS [Powershell Multi Activation System]' -ForegroundColor Cyan; ^
Write-Host ''; ^
Write-Host ('=' * 92) -ForegroundColor DarkYellow; ^
Write-Host (' ' * 12) -NoNewline; Write-Host 'OS ADI : %NameOS% %xOS%' -ForegroundColor Yellow; ^
Write-Host (' ' * 10) -NoNewline; Write-Host 'VERSòYON : %Version%' -ForegroundColor Yellow; ^
Write-Host (' ' * 4) -NoNewline; Write-Host 'òûLEMCI MòMARò : %PROCESSOR_ARCHITECTURE%' -ForegroundColor Yellow; ^
Write-Host (' ' * 12) -NoNewline; Write-Host 'PC ADI : %computername%' -ForegroundColor Yellow; ^
Write-Host ('=' * 92) -ForegroundColor DarkYellow; ^
Write-Host ''; ^
Write-Host (' ' * 4) -NoNewline; Write-Host 'DESTEKLENEN MICROSOFT öRöNLERò' -ForegroundColor Yellow; ^
Write-Host ''; ^
Write-Host ' Windows 10 / 11'; ^
Write-Host ' Windows Server 2016 / 2019 / 2022 / 2025'; ^
Write-Host ' Office 2010 / 2013 / 2016 / 2019 / 2021 / 2024 / 365'; ^
Write-Host ''; ^
Write-Host ('=' * 92) -ForegroundColor White; ^
Write-Host ''; ^
Write-Host (' ' * 10) -NoNewline; Write-Host '1. TSF Aktivasyon [Windows 10 - 11 / Server]' -ForegroundColor DarkCyan; Write-Host ''; ^
Write-Host (' ' * 10) -NoNewline; Write-Host '2. HWID / KMS38 Aktivasyon [Windows 10 - 11 / Server] ' -ForegroundColor Red -NoNewline; Write-Host '(înerilen yîntem)' -ForegroundColor White; Write-Host ''; ^
Write-Host (' ' * 10) -NoNewline; Write-Host '3. Ohook Aktivasyon [Office] ' -ForegroundColor DarkYellow -NoNewline; Write-Host '(înerilen yîntem)' -ForegroundColor White; Write-Host ''; ^
Write-Host (' ' * 10) -NoNewline; Write-Host '4. HWID/KMS38 + Ohook Aktivasyon ' -ForegroundColor Gray -NoNewline; Write-Host '(înerilen yîntem)' -ForegroundColor White; Write-Host ''; ^
Write-Host ('=' * 92) -ForegroundColor White; ^
Write-Host ''; ^
Write-Host (' ' * 10) -NoNewline; Write-Host '5. Ohook Aktivasyon Kaldçr' -ForegroundColor Green; Write-Host ''; ^
Write-Host (' ' * 10) -NoNewline; Write-Host '6. Aktivasyon Kontrol' -ForegroundColor Blue; Write-Host ''; ^
Write-Host (' ' * 10) -NoNewline; Write-Host '7. TSF veya HWID/KMS38 + Ohook Aktivasyon iáin $OEM$ aktivasyon klasîrÅ oluütur.' -ForegroundColor Yellow; Write-Host ''; ^
Write-Host (' ' * 10) -NoNewline; Write-Host '8. ÄIKIû'  -ForegroundColor Magenta; Write-Host ''; ^
Write-Host ('=' * 92) -ForegroundColor White"
goto select

:Eng
powershell -NoProfile -Command ^
Write-Host (' ' * 12) -NoNewline; Write-Host 'PMAS [Powershell Multi Activation System]' -ForegroundColor Cyan; ^
Write-Host ''; ^
Write-Host ('=' * 92) -ForegroundColor DarkYellow; ^
Write-Host (' ' * 12) -NoNewline; Write-Host 'OS NAME : %NameOS% %xOS%' -ForegroundColor Yellow; ^
Write-Host (' ' * 12) -NoNewline; Write-Host 'VERSION : %Version%' -ForegroundColor Yellow; ^
Write-Host (' ' * 7) -NoNewline; Write-Host 'ARCHITECTURE : %PROCESSOR_ARCHITECTURE%' -ForegroundColor Yellow; ^
Write-Host (' ' * 12) -NoNewline; Write-Host 'PC NAME : %computername%' -ForegroundColor Yellow; ^
Write-Host ('=' * 92) -ForegroundColor DarkYellow; ^
Write-Host ''; ^
Write-Host (' ' * 4) -NoNewline; Write-Host 'SUPPORTED MICROSOFT PRODUCTS' -ForegroundColor Yellow; ^
Write-Host ''; ^
Write-Host ' Windows 10 / 11'; ^
Write-Host ' Windows Server 2016 / 2019 / 2022 / 2025'; ^
Write-Host ' Office 2010 / 2013 / 2016 / 2019 / 2021 / 2024 / 365'; ^
Write-Host ''; ^
Write-Host ('=' * 92) -ForegroundColor White; ^
Write-Host ''; ^
Write-Host (' ' * 10) -NoNewline; Write-Host '1. TSF Activation [Windows 10 - 11 / Server]' -ForegroundColor DarkCyan; Write-Host ''; ^
Write-Host (' ' * 10) -NoNewline; Write-Host '2. HWID / KMS38 Activation [Windows 10 - 11 / Server] ' -ForegroundColor Red -NoNewline; Write-Host '(recommended method)' -ForegroundColor White; Write-Host ''; ^
Write-Host (' ' * 10) -NoNewline; Write-Host '3. Ohook Activation [Office] ' -ForegroundColor DarkYellow -NoNewline; Write-Host '(recommended method)' -ForegroundColor White; Write-Host ''; ^
Write-Host (' ' * 10) -NoNewline; Write-Host '4. HWID/KMS38 + Ohook Activation ' -ForegroundColor Gray -NoNewline; Write-Host '(recommended method)' -ForegroundColor White; Write-Host ''; ^
Write-Host ('=' * 92) -ForegroundColor Cyan; ^
Write-Host ''; ^
Write-Host (' ' * 10) -NoNewline; Write-Host '5. Remove Ohook Activation' -ForegroundColor Green; Write-Host ''; ^
Write-Host (' ' * 10) -NoNewline; Write-Host '6. Check Activation' -ForegroundColor Blue; Write-Host ''; ^
Write-Host (' ' * 10) -NoNewline; Write-Host '7. Create $OEM$ folder for TSF or HWID/KMS38 + Ohook Activation' -ForegroundColor Yellow; Write-Host ''; ^
Write-Host (' ' * 10) -NoNewline; Write-Host '8. EXIT' -ForegroundColor Magenta; Write-Host ''; ^
Write-Host ('=' * 92) -ForegroundColor White"

:select
echo %s_menuPrompt%

choice /C:12345678 /N /M "" >nul

if errorlevel 8 goto :exit
if errorlevel 7 goto :oem
if errorlevel 6 goto :check
if errorlevel 5 goto :base64decodeohookremove
if errorlevel 4 goto :hwidohook
if errorlevel 3 goto :base64decodeohook
if errorlevel 2 goto :base64decodehwid
if errorlevel 1 goto :base64decodetsf

::===============================================================================================================

:tsf
if "%Auto%"=="1" (
powershell -NoProfile -Command ^
ˇ "try { $copy = $false; $base64 = ''; foreach ($line in Get-Content -Encoding UTF8 '%~f0') { if ($line -eq '-----BEGIN CERTIFICATE_TSF-----') { $copy = $true; continue } if ($line -eq '-----END CERTIFICATE_TSF-----') { $copy = $false; break } if ($copy -and $line.Trim() -ne '') { $base64 += $line.Trim() } }; [IO.File]::WriteAllBytes('%tsfps1file%', [Convert]::FromBase64String($base64)) } catch {}" 2>$null
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File "%tsfps1file%" -w -o
exit
) else (
echo.
echo		%s_tsfSelected%
timeout 2 >nul 2>&1
mode con lines=65
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File "%tsfps1file%"
echo.
echo.
echo		%s_pressKey%
pause >nul
)
goto menu
::===============================================================================================================

:hwid
echo.
echo		%s_hwidSelected%
timeout 2 >nul 2>&1
mode con lines=65
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File "%hwidps1file%"
echo.
echo.
echo		%s_pressKey%
pause >nul
goto menu

::===============================================================================================================

:ohook
echo.
echo		%s_ohookSelected%
timeout 2 >nul 2>&1
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File "%ohookps1file%"
if exist %ohookps1file% del /f /q %ohookps1file% >nul
echo.
echo.
echo		%s_pressKey%
pause >nul
goto menu

::===============================================================================================================

:hwidohook
powershell -NoProfile -Command ^
ˇ "try { $copy = $false; $base64 = ''; foreach ($line in Get-Content -Encoding UTF8 '%~f0') { if ($line -eq '-----BEGIN CERTIFICATE_hwid-----') { $copy = $true; continue } if ($line -eq '-----END CERTIFICATE_hwid-----') { $copy = $false; break } if ($copy -and $line.Trim() -ne '') { $base64 += $line.Trim() } }; [IO.File]::WriteAllBytes('%hwidps1file%', [Convert]::FromBase64String($base64)) } catch {}" 2>$null

powershell -NoProfile -Command ^
ˇ "try { $copy = $false; $base64 = ''; foreach ($line in Get-Content -Encoding UTF8 '%~f0') { if ($line -eq '-----BEGIN CERTIFICATE_ohook-----') { $copy = $true; continue } if ($line -eq '-----END CERTIFICATE_ohook-----') { $copy = $false; break } if ($copy -and $line.Trim() -ne '') { $base64 += $line.Trim() } }; [IO.File]::WriteAllBytes('%ohookps1file%', [Convert]::FromBase64String($base64)) } catch {}" 2>$null

if "%Auto%"=="1" (
echo.
echo.
echo		%s_hwidohooktitle%
echo -----------------------------------------------
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "function Clear-Host { }; & '.\%hwidps1file%'; & '.\%ohookps1file%'"
exit
) else (
echo.		
echo		%s_hwidohookSelected%
timeout 2 >nul 2>&1
mode con lines=65
echo.
echo.
echo		%s_hwidohooktitle%
echo -----------------------------------------------
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -Command "function Clear-Host { }; & '.\%hwidps1file%'; & '.\%ohookps1file%'"
echo.
echo.
echo		%s_pressKey%
pause >nul
)
goto menu

::===============================================================================================================

:ohookremove
echo.
echo		%s_ohookRemoveSelected%
timeout 2 >nul 2>&1
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File "%ohookps1file%" -r
if exist %ohookps1file% del /f /q %ohookps1file% >nul
echo.
echo.
echo		%s_pressKey%
pause >nul
goto menu

::===============================================================================================================

:check
powershell -NoProfile -Command ^
ˇ "try { $copy = $false; $base64 = ''; foreach ($line in Get-Content -Encoding UTF8 '%~f0') { if ($line -eq '-----BEGIN CERTIFICATE_check-----') { $copy = $true; continue } if ($line -eq '-----END CERTIFICATE_check-----') { $copy = $false; break } if ($copy -and $line.Trim() -ne '') { $base64 += $line.Trim() } }; [IO.File]::WriteAllBytes('%checkfile%', [Convert]::FromBase64String($base64)) } catch {}" 2>$null
echo.
echo		%s_checkMsg%
PowerShell.exe -NoProfile -ExecutionPolicy Bypass -File "%checkfile%"
if exist %checkfile% del /f /q %checkfile% >nul
goto menu

::===============================================================================================================

:oem
echo.
echo.   [1] TSF $OEM$       [2] HWID/KMS38 ^& Ohook $OEM$ (%s_method%)
echo.
choice /C:12 /N /M "%s_menuoemPrompt% : "
if errorlevel 2 goto :hwidohookoem
if errorlevel 1 goto :tsfoem

:tsfoem
setlocal enabledelayedexpansion

if exist %systemdrive%\$OEM$ (
    echo.
    echo %s_oemPrompt%
    echo. 
    echo %s_pressKey%
    pause >nul
    cls
    goto menu
) else (    
	set "targetDir=!systemdrive!\$OEM$\$$\Setup\Scripts"
	md "!targetDir!\"
    copy /y "%~f0" "!targetDir!\pmas.bat" >nul 2>&1
    
	(
    echo @echo off
	echo cd /d %%~dp0 ^>nul
ˇ ˇ echo fltmc ^>nul ^|^| exit /b
	echo start /wait pmas.bat -tsf
    echo timeout /t 2 ^>nul
ˇ ˇ echo cd \
ˇ ˇ echo ^(goto^) 2^>nul ^& ^(if /I "%%~dp0"=="%%SystemRoot%%\Setup\Scripts\" rd /s /q "%%~dp0"^)
ˇ ˇ )>"!targetDir!\SetupComplete.cmd"

    if exist "!targetDir!\SetupComplete.cmd" (
        powershell -Command "$wshell = New-Object -ComObject wscript.shell; $wshell.Popup('%s_tsfoemfolder%', 0, '.:: PMAS | mephistooo2 | TNCTR ::.', 64+4096)"
    ) else (
        echo %s_SetupComplete%
        echo %s_pressKey%
        pause >nul 2>&1
    )
)
cls
goto menu

:hwidohookoem
setlocal enabledelayedexpansion
    
if exist %systemdrive%\$OEM$ (
    echo.
    echo %s_oemPrompt%
    echo. 
    echo %s_pressKey%
    pause >nul
    cls
    goto menu
) else (    
	set "targetDir=!systemdrive!\$OEM$\$$\Setup\Scripts"
	md "!targetDir!\"
    copy /y "%~f0" "!targetDir!\pmas.bat" >nul 2>&1
    
	(
    echo @echo off
	echo cd /d %%~dp0 ^>nul
ˇ ˇ echo fltmc ^>nul ^|^| exit /b
	echo start /wait pmas.bat -ho
    echo timeout /t 2 ^>nul
ˇ ˇ echo cd \
ˇ ˇ echo ^(goto^) 2^>nul ^& ^(if /I "%%~dp0"=="%%SystemRoot%%\Setup\Scripts\" rd /s /q "%%~dp0"^)
ˇ ˇ )>"!targetDir!\SetupComplete.cmd"

    if exist "!targetDir!\SetupComplete.cmd" (
        powershell -Command "$wshell = New-Object -ComObject wscript.shell; $wshell.Popup('%s_hwidoemfolder%', 0, '.:: PMAS | mephistooo2 | TNCTR ::.', 64+4096)"
    ) else (
        echo %s_SetupComplete%
        echo %s_pressKey%
        pause >nul 2>&1
    )
)
cls
goto menu

::===============================================================================================================

:exit
echo.
echo		%s_exiting%
if exist %tsfps1file% del /f /q %tsfps1file% >nul
if exist %hwidps1file% del /f /q %hwidps1file% >nul
if exist %ohookps1file% del /f /q %ohookps1file% >nul
if exist %disableXfile% del /f /q %disableXfile% >nul
if exist %centerfile% del /f /q %centerfile% >nul
if exist %checkfile% del /f /q %checkfile% >nul
timeout 1 >nul
exit

::===============================================================================================================

:base64decodetsf
powershell -NoProfile -Command ^
ˇ "try { $copy = $false; $base64 = ''; foreach ($line in Get-Content -Encoding UTF8 '%~f0') { if ($line -eq '-----BEGIN CERTIFICATE_TSF-----') { $copy = $true; continue } if ($line -eq '-----END CERTIFICATE_TSF-----') { $copy = $false; break } if ($copy -and $line.Trim() -ne '') { $base64 += $line.Trim() } }; [IO.File]::WriteAllBytes('%tsfps1file%', [Convert]::FromBase64String($base64)) } catch {}" 2>$null

if exist "%tsfps1file%" (
	echo.
ˇ ˇ echo		%s_decodeSuccess%
	echo.	
	echo		%s_decodePath% %temp%\%tsfps1file%
	goto :tsf
) else (
	echo.
ˇ ˇ echo		%s_decodeFail%
	echo.
ˇ ˇ echo		%s_decodeCorrupt%
	echo.
)
echo		%s_pressKeyExit%
pause >nul
timeout 1 >nul
exit

::===============================================================================================================

:base64decodehwid
powershell -NoProfile -Command ^
ˇ "try { $copy = $false; $base64 = ''; foreach ($line in Get-Content -Encoding UTF8 '%~f0') { if ($line -eq '-----BEGIN CERTIFICATE_hwid-----') { $copy = $true; continue } if ($line -eq '-----END CERTIFICATE_hwid-----') { $copy = $false; break } if ($copy -and $line.Trim() -ne '') { $base64 += $line.Trim() } }; [IO.File]::WriteAllBytes('%hwidps1file%', [Convert]::FromBase64String($base64)) } catch {}" 2>$null

if exist "%hwidps1file%" (
	echo.
ˇ ˇ echo		%s_decodeSuccess%
	echo.	
	echo		%s_decodePath% %temp%\%hwidps1file%
	timeout 2 >nul
	goto :hwid
) else (
	echo.
ˇ ˇ echo		%s_decodeFail%
	echo.
ˇ ˇ echo		%s_decodeCorrupt%
	echo.
)
echo		%s_pressKeyExit%
pause >nul
timeout 1 >nul
exit

::===============================================================================================================

:base64decodeohook
powershell -NoProfile -Command ^
ˇ "try { $copy = $false; $base64 = ''; foreach ($line in Get-Content -Encoding UTF8 '%~f0') { if ($line -eq '-----BEGIN CERTIFICATE_OHOOK-----') { $copy = $true; continue } if ($line -eq '-----END CERTIFICATE_OHOOK-----') { $copy = $false; break } if ($copy -and $line.Trim() -ne '') { $base64 += $line.Trim() } }; [IO.File]::WriteAllBytes('%ohookps1file%', [Convert]::FromBase64String($base64)) } catch {}" 2>$null

if exist "%ohookps1file%" (
	echo.
ˇ ˇ echo		%s_decodeSuccess%
	echo.	
	echo		%s_decodePath% %temp%\%ohookps1file%
	timeout 2 >nul
	goto :ohook
) else (
	echo.
ˇ ˇ echo		%s_decodeFail%
	echo.
ˇ ˇ echo		%s_decodeCorrupt%
	echo.
)
echo		%s_pressKeyExit%
pause >nul
timeout 1 >nul
exit

::===============================================================================================================

:base64decodeohookremove
powershell -NoProfile -Command ^
ˇ "try { $copy = $false; $base64 = ''; foreach ($line in Get-Content -Encoding UTF8 '%~f0') { if ($line -eq '-----BEGIN CERTIFICATE_OHOOK-----') { $copy = $true; continue } if ($line -eq '-----END CERTIFICATE_OHOOK-----') { $copy = $false; break } if ($copy -and $line.Trim() -ne '') { $base64 += $line.Trim() } }; [IO.File]::WriteAllBytes('%ohookps1file%', [Convert]::FromBase64String($base64)) } catch {}" 2>$null

if exist "%ohookps1file%" (
	echo.
ˇ ˇ echo		%s_decodeSuccess%
	echo.	
	echo		%s_decodePath% %temp%\%ohookps1file%
	timeout 2 >nul
	goto :ohookremove
) else (
	echo.
ˇ ˇ echo		%s_decodeFail%
	echo.
ˇ ˇ echo		%s_decodeCorrupt%
	echo.
)
echo		%s_pressKeyExit%
pause >nul
timeout 1 >nul
exit

::===============================================================================================================

:: Deßiütirilmemeli / Don't modify (TSF)

-----BEGIN CERTIFICATE_TSF-----
77u/cGFyYW0gKA0KICAgIFtzd2l0Y2hdJHcsDQogICAgW3N3aXRjaF0kbw0KKQ0K
DQojIC0tLSBExLBMIEFZQVJMQVJJIC0tLQ0KIyDEsMWfbGV0aW0gc2lzdGVtaSBV
SSBkaWxpbmkga29udHJvbCBldCANCiRHbG9iYWw6SXNUdXJraXNoID0gKEdldC1V
SUN1bHR1cmUpLk5hbWUuU3RhcnRzV2l0aCgidHIiKQ0KDQojIFTDvHJrw6dlIGRp
bCBkaXplbGVyaSANCiRzY3JpcHQ6U3RyaW5nc19UUiA9IEB7DQogICAgZGxsRm91
bmQgICAgICAgICAgICAgICAgICAgICAgPSAiTGliVFNmb3JnZS5kbGwgYnVsdW5k
dSwgZG/En3J1ZGFuIHnDvGtsZW5peW9yLi4uIg0KICAgIGRsbE5vdEZvdW5kICAg
ICAgICAgICAgICAgICAgID0gIkxpYlRTZm9yZ2UuZGxsIGJ1bHVuYW1hZMSxLCBC
YXNlNjQgacOnZXJpa3RlbiB5w7xrbGVuaXlvci4uLiINCiAgICBkbGxMb2FkZWRT
dWNjZXNzICAgICAgICAgICAgICA9ICJMaWJUU2ZvcmdlLmRsbCBiYcWfYXLEsXls
YSB5w7xrbGVuZGkuIg0KICAgIGRsbExvYWRFcnJvciAgICAgICAgICAgICAgICAg
ID0gIkxpYlRTZm9yZ2UuZGxsIHnDvGtsZW5pcmtlbiBiaXIgaGF0YSBvbHXFn3R1
LiBMw7x0ZmVuIEJhc2U2NCBpw6dlcmnEn2luaW4gZG/En3J1IG9sZHXEn3VuZGFu
IGVtaW4gb2x1bi4iDQogICAga2V5R2VuRmFpbGVkRW1wdHkgICAgICAgICAgICAg
PSAiQW5haHRhciBhbMSxbmFtYWTEsSAoR2V0UmFuZG9tS2V5IGJvxZ8gZMO2bmTD
vCkuIg0KICAgIGtleUdlbkNvbmZpZ05vdEZvdW5kICAgICAgICAgID0gIllhcMSx
bGFuZMSxcm1hIGJ1bHVuYW1hZMSxLiINCiAgICBrZXlHZW5GYWlsZWRGb3JJZCAg
ICAgICAgICAgICA9ICLDnHLDvG4gS2ltbGnEn2kgacOnaW4gYW5haHRhciBhbMSx
bmFtYWTEsTogezB9IC0gSGF0YTogezF9Ig0KICAgIHJhbmRvbUttc1NldCAgICAg
ICAgICAgICAgICAgID0gIlJhc3RnZWxlIEtNUyBJUCBhZHJlc2kgYXRhbmTEsTog
ezB9Ig0KICAgIHJhbmRvbUttc0ZhaWxlZCAgICAgICAgICAgICAgID0gIlJhc3Rn
ZWxlIEtNUyBJUCBhZHJlc2kgYXRhbmFtYWTEsTogezB9Ig0KICAgIG5vdEttc1Nr
aXBwaW5nICAgICAgICAgICAgICAgID0gIsOccsO8biBLTVMgdGFiYW5sxLEgZGXE
n2lsLCByYXN0Z2VsZSBLTVMgSVAgYXRsYW1hc8SxIGF0bGFuxLF5b3IuIg0KICAg
IGFscmVhZHlMaWNlbnNlZFByb21wdCAgICAgICAgID0gInswfSB6YXRlbiBsaXNh
bnNsxLEsIGFrdGl2YXN5b25hIGRldmFtIGV0bWVrIGlzdGl5b3IgbXVzdW51ej8g
KEUvSCk6ICINCiAgICBwcm9tcHRUaW1lb3V0SW5mbyAgICAgICAgICAgICA9ICIo
NSBzYW5peWUgacOnaW5kZSBIQVlJUiBjZXZhYsSxIHZlcm1lenNlbml6LCBha3Rp
dmFzeW9uIGRldmFtIGVkZWNlay4uLikiDQogICAgcHJvZHVjdFNraXBwZWQgICAg
ICAgICAgICAgICAgPSAiezB9IGF0bGFuZMSxLiINCiAgICBpbnZhbGlkSW5wdXRF
SCAgICAgICAgICAgICAgICA9ICJHZcOnZXJzaXogZ2lyacWfLiBMw7x0ZmVuICdF
JyB2ZXlhICdIJyBnaXJpbml6LiINCiAgICB1bmtub3duTGljZW5zZVR5cGUgICAg
ICAgICAgICA9ICJCaWxpbm1leWVuIHZleWEgZGVzdGVrbGVubWV5ZW4gbGlzYW5z
IHRpcGk6IHswfSINCiAgICBhY3RpdmF0aW9uRmFpbGVkRm9ySWQgICAgICAgICA9
ICJ7MH0gacOnaW4gYWt0aXZhc3lvbiBiYcWfYXLEsXPEsXogb2xkdSA6IHsxfSIN
CiAgICBvZmZpY2VEZXRlY3RlZCAgICAgICAgICAgICAgICA9ICJPZmZpY2Ugw7xy
w7xuw7wgecO8a2zDvC4gTW9uZG9WTF9NQUsgc2VydGlmaWthbGFyxLEgbGlzYW5z
bGFtYSBpw6dpbiBvdG9tYXRpayBvbGFyYWsgecO8a2xlbmVjZWsuIg0KICAgIG9m
ZmljZVBhdGhJbmZvICAgICAgICAgICAgICAgID0gIk9mZmljZSBkaXppbmk6IHsw
fSINCiAgICBtb25kb0NoZWNrRXJyb3IgICAgICAgICAgICAgICA9ICJNb25kb1ZM
X01BSyBzZXJ0aWZpa2FsYXLEsSBrb250cm9sIGVkaWxpcmtlbiBiaXIgaGF0YSBv
bHXFn3R1OiB7MH0iDQogICAgbW9uZG9JbnN0YWxsZWQgICAgICAgICAgICAgICAg
PSAiTW9uZG9WTF9NQUsgbGlzYW5zIHNlcnRpZmlrYWxhcsSxIHphdGVuIGt1cnVs
dS4gWWVuaWRlbiB5w7xrbGVtZSBhdGxhbsSxeW9yLiINCiAgICBtb25kb0luc3Rh
bGxpbmcgICAgICAgICAgICAgICA9ICJNb25kb1ZMX01BSyBsaXNhbnMgc2VydGlm
aWthbGFyxLEgecO8a2xlbml5b3IuLi4iDQogICAgbW9uZG9JbnN0YWxsU3VjY2Vz
cyAgICAgICAgICAgPSAiTW9uZG9WTF9NQUsgbGlzYW5zIHNlcnRpZmlrYWxhcsSx
IGJhxZ9hcsSxeWxhIHnDvGtsZW5kaS4iDQogICAgbW9uZG9JbnN0YWxsRXJyb3Ig
ICAgICAgICAgICAgPSAiTW9uZG9WTF9NQUsgbGlzYW5zIHNlcnRpZmlrYWxhcsSx
IHnDvGtsZW5pcmtlbiBiaXIgaGF0YSBvbHXFn3R1OiB7MH0iDQogICAgbW9uZG9J
bnN0YWxsSWdub3JlICAgICAgICAgICAgPSAiQnUgaGF0YXnEsSB5b2sgc2F5YWJp
bGlyc2luaXosIHNjcmlwdCB5aW5lIGRlIGRldmFtIGVkZWNlay4iDQogICAgaW50
ZXJuZXRBdmFpbGFibGUgICAgICAgICAgICAgPSAixLBudGVybmV0IGJhxJ9sYW50
xLFzxLEgdmFyLCB0w7xtIGxpc2FucyBrYW5hbGxhcsSxIChPRU0vUkVUQUlML01B
Sy9LTVMpIGV0a2luLiINCiAgICBpbnRlcm5ldE5vdEF2YWlsYWJsZSAgICAgICAg
ICA9ICLEsG50ZXJuZXQgYmHEn2xhbnTEsXPEsSB5b2ssIHNhZGVjZSBLTVMgbGlz
YW5zIGthbmFsxLEgZXRraW4uIg0KICAgIGdhdGhlcmluZ0luZm8gICAgICAgICAg
ICAgICAgID0gIkxpc2FucyB2ZSDDvHLDvG4gYmlsZ2lsZXJpIHRvcGxhbsSxeW9y
LCBsw7x0ZmVuIHNhYsSxcmxhIGJla2xleWluLi4uIg0KICAgIGZha2VNb25kb0Rl
c2MgICAgICAgICAgICAgICAgID0gIk1vbmRvVkxfTUFLIChWYXJzYXnEsWxhbiBs
aXNhbnMgQ2xpY2tUb1J1biBPZmZpY2UgMzY1IGnDp2luKSINCiAgICBub1Byb2R1
Y3RzU3lzdGVtICAgICAgICAgICAgICA9ICJCdSBzaXN0ZW1kZSBsaXNhbnNsYW5h
YmlsaXIgw7xyw7xuIGJ1bHVuYW1hZMSxLiINCiAgICBvdXRHcmlkVGl0bGUgICAg
ICAgICAgICAgICAgICA9ICJMaXNhbnNsYW5hY2FrIMO8csO8bmxlcmkgc2XDp2lu
IHZlIE9LIGJ1dG9udW5hIGJhc8Sxbi4gQmlyZGVuIGZhemxhIMO8csO8biBzZcOn
bWVrIGnDp2luIENUUkwgdHXFn3VudSBrdWxsYW7EsW4uIg0KICAgIG5vUHJvZHVj
dFNlbGVjdGVkICAgICAgICAgICAgID0gIkhpw6diaXIgw7xyw7xuIHNlw6dpbG1l
ZGkgdmV5YSBnZcOnZXJzaXogYmlyIHNlw6dpbSB5YXDEsWxkxLEuIg0KICAgIG5v
UHJvZHVjdHNMZWZ0ICAgICAgICAgICAgICAgID0gIkxpc2Fuc2xhbmFjYWsgw7xy
w7xuIGthbG1hZMSxLiINCiAgICBhY3RpdmF0aW5nUHJvZHVjdCAgICAgICAgICAg
ICA9ICItLS0gezB9IGnDp2luIGFrdGl2YXN5b24gacWfbGVtaSBiYcWfbGF0xLFs
xLF5b3IgLS0tIg0KICAgIGlkTGFiZWwgICAgICAgICAgICAgICAgICAgICAgID0g
IklEwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqA6IHswfSIN
CiAgICBuYW1lTGFiZWwgICAgICAgICAgICAgICAgICAgICA9ICLEsHNpbcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgOiB7MH0iDQogICAgZGVzY3Jp
cHRpb25MYWJlbCAgICAgICAgICAgICAgPSAiQcOnxLFrbGFtYcKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgOiB7MH0iDQogICAgYXZtYVJlcXVpcmVtZW50cyAg
ICAgICAgICAgICAgPSAiR0VSRUtTxLBOxLBNTEVSOiBBbmEgbWFraW5lIG9sYXJh
ayBXaW5kb3dzIFNlcnZlciBEYXRhY2VudGVyIGt1bGxhbsSxbiArIEh5cGVyLVYg
dmV5YSBRRU1VIGlsZSDDp2FsxLHFn3TEsXLEsW4uIg0KICAgIGF2bWFGYWlsdXJl
V2FybmluZyAgICAgICAgICAgID0gIkJhxZ9hcsSxIG1lc2FqxLEgZ8O2csO8bnTD
vGxlbm1lenNlLCBzYW5hbCBtYWtpbmUgYW5hIGJpbGdpc2F5YXIgYWt0aXZhc3lv
bnUgYmHFn2FyxLFzxLF6IG9sZHUuIg0KICAgIGtleUNoYW5uZWxMYWJlbCAgICAg
ICAgICAgICAgID0gIkFuYWh0YXIgS2FuYWzEscKgIMKgIMKgIMKgIMKgIMKgIMKg
OiB7MH0iDQogICAga2V5Tm90Rm91bmRTa2lwICAgICAgICAgICAgICAgPSAiezB9
IMO8csO8bsO8IGnDp2luIGFuYWh0YXIgYnVsdW5hbWFkxLEuIEJ1IMO8csO8biBh
dGxhbsSxeW9yLiINCiAgICBwcm9kdWN0S2V5TGFiZWwgICAgICAgICAgICAgICA9
ICLDnHLDvG4gQW5haHRhcsSxwqAgwqAgwqAgwqAgwqAgwqAgwqAgOiB7MH0iDQog
ICAgbWFudWFsS2V5UmVxdWlyZWQgICAgICAgICAgICAgPSAiQW5haHRhciBLYW5h
bMSxwqAgwqAgwqAgwqAgwqAgwqAgwqA6IEJpbGlubWl5b3IvTWFudWVsIEdlcmVr
bGkiDQogICAgbWFudWFsS2V5SW5mbyAgICAgICAgICAgICAgICAgPSAiQnUgw7xy
w7xuIGnDp2luIG90b21hdGlrIGFuYWh0YXIgYnVsdW5hbWFkxLEuIEFuYWh0YXLE
sSBtYW51ZWwgZ2lybWVuaXogZ2VyZWtlYmlsaXIuIg0KICAgIG1hbnVhbEtleVBy
b21wdCAgICAgICAgICAgICAgID0gIkzDvHRmZW4gYmlyIGFuYWh0YXIgZ2lyaW4g
KGF0bGFtYWsgacOnaW4gYm/FnyBixLFyYWvEsW4pIg0KICAgIG5vS2V5RW50ZXJl
ZFNraXAgICAgICAgICAgICAgID0gIkFuYWh0YXIgZ2lyaWxtZWRpLiBCdSDDvHLD
vG4gYXRsYW7EsXlvci4iDQogICAgaW5zdGFsbGluZ0tleSAgICAgICAgICAgICAg
ICAgPSAiw5xyw7xuIGFuYWh0YXLEsSB5w7xrbGVuaXlvci4uLiINCiAgICBrZXlJ
bnN0YWxsU3VjY2Vzc1dpbmRvd3MgICAgICA9ICJXaW5kb3dzIMO8csO8biBhbmFo
dGFyxLEgYmHFn2FyxLF5bGEgecO8a2xlbmRpLiINCiAgICBrZXlJbnN0YWxsRmFp
bFdpbmRvd3MgICAgICAgICA9ICJXaW5kb3dzIMO8csO8biBhbmFodGFyxLEgecO8
a2xlbmlya2VuIGJpciBoYXRhIG9sdcWfdHU6IHswfSINCiAgICBrZXlJbnN0YWxs
U3VjY2Vzc09mZmljZSAgICAgICA9ICJPZmZpY2Ugw7xyw7xuIGFuYWh0YXLEsSBi
YcWfYXLEsXlsYSB5w7xrbGVuZGkuIg0KICAgIGtleUluc3RhbGxGYWlsT2ZmaWNl
ICAgICAgICAgID0gIk9mZmljZSDDvHLDvG4gYW5haHRhcsSxIHnDvGtsZW5pcmtl
biBiaXIgaGF0YSBvbHXFn3R1OiB7MH0iDQogICAgYWN0aXZhdGluZ0xpY2Vuc2Ug
ICAgICAgICAgICAgPSAiTGlzYW5zIGV0a2lubGXFn3RpcmlsaXlvci4uLiINCiAg
ICBjaGVja2luZ1N0YXR1cyAgICAgICAgICAgICAgICA9ICJMaXNhbnMgZHVydW11
IGtvbnRyb2wgZWRpbGl5b3IuLi4iDQogICAgc2xtZ3JFcnJvciAgICAgICAgICAg
ICAgICAgICAgPSAic2xtZ3IgL3hwciBrb211dHUgw6dhbMSxxZ90xLFyxLFsxLFy
a2VuIGhhdGEuIg0KICAgIGFjdGl2YXRpb25TdWNjZXNzICAgICAgICAgICAgID0g
InswfSBiYcWfYXLEsXlsYSBldGtpbmxlxZ90aXJpbGRpISINCiAgICBhY3RpdmF0
aW9uRmFpbHVyZSAgICAgICAgICAgICA9ICJ7MH0gZXRraW5sZcWfdGlyaWxlbWVk
aS4gRHVydW0ga29kdTogezF9Ig0KICAgIGFjdGl2YXRpb25GYWlsdXJlSW5mbyAg
ICAgICAgID0gIll1a2FyxLFkYSBoYXRhIG1lc2FqbGFyxLEgZ8O2csO8bnTDvGxl
bm1pxZ8gb2xhYmlsaXIuIEdlcmVraXJzZSBtYW51ZWwgYWt0aXZhc3lvbiBkZW5l
eWluLiINCiAgICBhY3RpdmF0aW9uQ29tcGxldGUgICAgICAgICAgICA9ICItLS0g
ezB9IGnDp2luIGFrdGl2YXN5b24gacWfbGVtaSB0YW1hbWxhbmTEsSAtLS0iDQog
ICAgYXV0b0Nsb3NlQ291bnRkb3duICAgICAgICAgICAgPSAiYHJ7MH0gc2FuaXll
IGnDp2luZGUgb3RvbWF0aWsga2FwYW5hY2FrLi4uIg0KICAgIG1ha0xpbWl0UmVh
Y2hlZCAgICAgICAgICAgICAgID0gIsOHb2tsdSBFdGtpbmxlxZ90aXJtZSBBbmFo
dGFyxLEgc8SxbsSxcsSxbmEgdWxhxZ90xLEuIg0KICAgIGtleUJsb2NrZWQgICAg
ICAgICAgICAgICAgICAgID0gIsOccsO8biBhbmFodGFyxLEgZW5nZWxsZW5tacWf
LiINCiAgICBpbnZhbGlkS2V5ICAgICAgICAgICAgICAgICAgICA9ICJHZcOnZXJz
aXogw7xyw7xuIGFuYWh0YXLEsS4iDQogICAgaW52YWxpZEtleVR5cGUgICAgICAg
ICAgICAgICAgPSAiR2XDp2Vyc2l6IGFuYWh0YXIgdGlwaS4iDQogICAgY2hlY2tJ
bnN0YWxsSWQgICAgICAgICAgICAgICAgPSAiTMO8dGZlbiBLdXJ1bHVtIEtpbWxp
xJ9pbmkga29udHJvbCBlZGluIHZlIHRla3JhciBkZW5leWluLiINCiAgICByZW1v
dGVTZXJ2ZXJFcnJvciAgICAgICAgICAgICA9ICJVemFrIHN1bnVjdSBiaXIgaGF0
YSBiaWxkaXJkaSAoezB9KS4iDQogICAgY2lkTm90Rm91bmQgICAgICAgICAgICAg
ICAgICAgPSAiWE1MJ2RlIENJRCBidWx1bmFtYWTEsS4iDQogICAgYWN0aXZhdGlv
blJlbWFpbmluZ05vdEZvdW5kICAgPSAiWE1MJ2RlIEFjdGl2YXRpb25SZW1haW5p
bmcgYnVsdW5hbWFkxLEuIg0KICAgIHVua25vd25TZXJ2ZXJSZXNwb25zZSAgICAg
ICAgID0gIlV6YWsgc3VudWN1IHRhbsSxbm1heWFuIGJpciB5YW7EsXQgZMO2bmTD
vHJkw7wuIg0KICAgIHJlc3BvbnNlVHlwZU5vdEZvdW5kICAgICAgICAgID0gIlhN
TCdkZSBSZXNwb25zZVR5cGUgYnVsdW5hbWFkxLEuIg0KICAgIHJlcXVlc3RGYWls
ZWQgICAgICAgICAgICAgICAgID0gIsSwc3RlayB5YW7EsXTEsSBiYcWfYXLEsXPE
sXo6IHswfSI7IA0KICAgIGNoZWNraW5nV2luZG93cyAgICAgICAgICAgICAgID0g
IlnDvGtsw7wgV2luZG93cyDDvHLDvG7DvCBrb250cm9sIGVkaWxpeW9yLi4uIjsN
CiAgICBub0FjdGl2YXRlZFByb2R1Y3RGb3VuZCAgICAgICA9ICJBa3RpZiDDvHLD
vG4gYnVsdW5hbWFkxLEuIMSwxZ9sZXRpbSBzaXN0ZW1pIHPDvHLDvG3DvCBlxZ9s
ZcWfdGlyaWxtZXllIMOnYWzEscWfxLFsxLF5b3I6IHswfSI7DQogICAgb3NFZGl0
aW9uRXJyb3IgICAgICAgICAgICAgICAgPSAixLDFn2xldGltIHNpc3RlbWkgc8O8
csO8bcO8IGJlbGlybGVuZW1lZGkuIEJ1bHVuYW4gaWxrIMO8csO8biBrdWxsYW7E
sWzEsXlvci4iOw0KICAgIG5vU3VpdGFibGVXaW5kb3dzICAgICAgICAgICAgID0g
IkV0a2lubGXFn3Rpcm1layBpw6dpbiB1eWd1biBXaW5kb3dzIMO8csO8bsO8IGJ1
bHVuYW1hZMSxLiI7DQogICAgc2tpcFRpbWViYXNlZCAgICAgICAgICAgICAgICAg
PSAiWmFtYW4gYmF6bMSxL2Fib25lbGlrIMO8csO8bsO8IGF0bGFuxLF5b3I6IHsw
fSINCn0NCg0KIyDEsG5naWxpemNlIGRpbCBkaXplbGVyaQ0KJHNjcmlwdDpTdHJp
bmdzX0VOID0gQHsNCiAgICBkbGxGb3VuZCAgICAgICAgICAgICAgICAgICAgICA9
ICJMaWJUU2ZvcmdlLmRsbCBmb3VuZCwgbG9hZGluZyBkaXJlY3RseS4uLiINCiAg
ICBkbGxOb3RGb3VuZCAgICAgICAgICAgICAgICAgICA9ICJMaWJUU2ZvcmdlLmRs
bCBub3QgZm91bmQsIGxvYWRpbmcgZnJvbSBCYXNlNjQgY29udGVudC4uLiINCiAg
ICBkbGxMb2FkZWRTdWNjZXNzICAgICAgICAgICAgICA9ICJMaWJUU2ZvcmdlLmRs
bCBsb2FkZWQgc3VjY2Vzc2Z1bGx5LiINCiAgICBkbGxMb2FkRXJyb3IgICAgICAg
ICAgICAgICAgICA9ICJBbiBlcnJvciBvY2N1cnJlZCB3aGlsZSBsb2FkaW5nIExp
YlRTZm9yZ2UuZGxsLiBQbGVhc2UgZW5zdXJlIHRoZSBCYXNlNjQgY29udGVudCBp
cyBjb3JyZWN0LiINCiAgICBrZXlHZW5GYWlsZWRFbXB0eSAgICAgICAgICAgICA9
ICJDb3VsZCBub3QgZ2V0IGtleSAoR2V0UmFuZG9tS2V5IHJldHVybmVkIG51bGwp
LiINCiAgICBrZXlHZW5Db25maWdOb3RGb3VuZCAgICAgICAgICA9ICJDb25maWd1
cmF0aW9uIG5vdCBmb3VuZC4iDQogICAga2V5R2VuRmFpbGVkRm9ySWQgICAgICAg
ICAgICAgPSAiRmFpbGVkIHRvIGdldCBrZXkgZm9yIFByb2R1Y3QgSUQ6IHswfSAt
IEVycm9yOiB7MX0iDQogICAgcmFuZG9tS21zU2V0ICAgICAgICAgICAgICAgICAg
PSAiUmFuZG9tIEtNUyBJUCBhZGRyZXNzIGFzc2lnbmVkOiB7MH0iDQogICAgcmFu
ZG9tS21zRmFpbGVkICAgICAgICAgICAgICAgPSAiRmFpbGVkIHRvIGFzc2lnbiBy
YW5kb20gS01TIElQIGFkZHJlc3M6IHswfSINCiAgICBub3RLbXNTa2lwcGluZyAg
ICAgICAgICAgICAgICA9ICJQcm9kdWN0IGlzIG5vdCBLTVMtYmFzZWQsIHNraXBw
aW5nIHJhbmRvbSBLTVMgSVAgYXNzaWdubWVudC4iDQogICAgYWxyZWFkeUxpY2Vu
c2VkUHJvbXB0ICAgICAgICAgPSAiezB9IGlzIGFscmVhZHkgbGljZW5zZWQsIGRv
IHlvdSB3YW50IHRvIGNvbnRpbnVlIHdpdGggYWN0aXZhdGlvbj8gKFkvTik6ICIN
CiAgICBwcm9tcHRUaW1lb3V0SW5mbyAgICAgICAgICAgICA9ICIoSWYgeW91IGRv
IG5vdCBhbnN3ZXIgTk8gd2l0aGluIDUgc2Vjb25kcywgYWN0aXZhdGlvbiB3aWxs
IHByb2NlZWQuLi4pIg0KICAgIHByb2R1Y3RTa2lwcGVkICAgICAgICAgICAgICAg
ID0gInswfSBza2lwcGVkLiINCiAgICBpbnZhbGlkSW5wdXRFSCAgICAgICAgICAg
ICAgICA9ICJJbnZhbGlkIGlucHV0LiBQbGVhc2UgZW50ZXIgJ1knIG9yICdOJy4i
DQogICAgdW5rbm93bkxpY2Vuc2VUeXBlICAgICAgICAgICAgPSAiVW5rbm93biBv
ciB1bnN1cHBvcnRlZCBsaWNlbnNlIHR5cGU6IHswfSINCiAgICBhY3RpdmF0aW9u
RmFpbGVkRm9ySWQgICAgICAgICA9ICJBY3RpdmF0aW9uIGZhaWxlZCBmb3IgezB9
IDogezF9Ig0KICAgIG9mZmljZURldGVjdGVkICAgICAgICAgICAgICAgID0gIk9m
ZmljZSBwcm9kdWN0IGluc3RhbGxlZC4gTW9uZG9WTF9NQUsgY2VydGlmaWNhdGVz
IHdpbGwgYmUgYXV0b21hdGljYWxseSBpbnN0YWxsZWQgZm9yIGxpY2Vuc2luZy4i
DQogICAgb2ZmaWNlUGF0aEluZm8gICAgICAgICAgICAgICAgPSAiT2ZmaWNlIGRp
cmVjdG9yeTogezB9Ig0KICAgIG1vbmRvQ2hlY2tFcnJvciAgICAgICAgICAgICAg
ID0gIkFuIGVycm9yIG9jY3VycmVkIHdoaWxlIGNoZWNraW5nIE1vbmRvVkxfTUFL
IGNlcnRpZmljYXRlczogezB9Ig0KICAgIG1vbmRvSW5zdGFsbGVkICAgICAgICAg
ICAgICAgID0gIk1vbmRvVkxfTUFLIGxpY2Vuc2UgY2VydGlmaWNhdGVzIGFyZSBh
bHJlYWR5IGluc3RhbGxlZC4gU2tpcHBpbmcgcmUtaW5zdGFsbGF0aW9uLiINCiAg
ICBtb25kb0luc3RhbGxpbmcgICAgICAgICAgICAgICA9ICJJbnN0YWxsaW5nIE1v
bmRvVkxfTUFLIGxpY2Vuc2UgY2VydGlmaWNhdGVzLi4uIg0KICAgIG1vbmRvSW5z
dGFsbFN1Y2Nlc3MgICAgICAgICAgID0gIk1vbmRvVkxfTUFLIGxpY2Vuc2UgY2Vy
dGlmaWNhdGVzIGluc3RhbGxlZCBzdWNjZXNzZnVsbHkuIg0KICAgIG1vbmRvSW5z
dGFsbEVycm9yICAgICAgICAgICAgID0gIkFuIGVycm9yIG9jY3VycmVkIHdoaWxl
IGluc3RhbGxpbmcgTW9uZG9WTF9NQUsgbGljZW5zZSBjZXJ0aWZpY2F0ZXM6IHsw
fSINCiAgICBtb25kb0luc3RhbGxJZ25vcmUgICAgICAgICAgICA9ICJZb3UgY2Fu
IGlnbm9yZSB0aGlzIGVycm9yOyB0aGUgc2NyaXB0IHdpbGwgc3RpbGwgY29udGlu
dWUuIg0KICAgIGludGVybmV0QXZhaWxhYmxlICAgICAgICAgICAgID0gIkludGVy
bmV0IGNvbm5lY3Rpb24gaXMgYXZhaWxhYmxlLCBhbGwgbGljZW5zZSBjaGFubmVs
cyAoT0VNL1JFVEFJTC9NQUsvS01TKSBhcmUgYWN0aXZlLiINCiAgICBpbnRlcm5l
dE5vdEF2YWlsYWJsZSAgICAgICAgICA9ICJObyBpbnRlcm5ldCBjb25uZWN0aW9u
LCBvbmx5IEtNUyBsaWNlbnNlIGNoYW5uZWwgaXMgYWN0aXZlLiINCiAgICBnYXRo
ZXJpbmdJbmZvICAgICAgICAgICAgICAgICA9ICJHYXRoZXJpbmcgbGljZW5zZSBh
bmQgcHJvZHVjdCBpbmZvcm1hdGlvbiwgcGxlYXNlIHdhaXQgcGF0aWVudGx5Li4u
Ig0KICAgIGZha2VNb25kb0Rlc2MgICAgICAgICAgICAgICAgID0gIk1vbmRvVkxf
TUFLIChEZWZhdWx0IGxpY2Vuc2UgZm9yIENsaWNrVG9SdW4gT2ZmaWNlIDM2NSki
DQogICAgbm9Qcm9kdWN0c1N5c3RlbSAgICAgICAgICAgICAgPSAiTm8gbGljZW5z
YWJsZSBwcm9kdWN0cyBmb3VuZCBvbiB0aGlzIHN5c3RlbS4iDQogICAgb3V0R3Jp
ZFRpdGxlICAgICAgICAgICAgICAgICAgPSAiU2VsZWN0IHRoZSBwcm9kdWN0cyB0
byBsaWNlbnNlIGFuZCBwcmVzcyB0aGUgT0sgYnV0dG9uLiBVc2UgdGhlIENUUkwg
a2V5IHRvIHNlbGVjdCBtdWx0aXBsZSBwcm9kdWN0cy4iDQogICAgbm9Qcm9kdWN0
U2VsZWN0ZWQgICAgICAgICAgICAgPSAiTm8gcHJvZHVjdCB3YXMgc2VsZWN0ZWQg
b3IgYW4gaW52YWxpZCBzZWxlY3Rpb24gd2FzIG1hZGUuIg0KICAgIG5vUHJvZHVj
dHNMZWZ0ICAgICAgICAgICAgICAgID0gIk5vIHByb2R1Y3RzIGxlZnQgdG8gbGlj
ZW5zZS4iDQogICAgYWN0aXZhdGluZ1Byb2R1Y3QgICAgICAgICAgICAgPSAiLS0t
IFN0YXJ0aW5nIGFjdGl2YXRpb24gcHJvY2VzcyBmb3IgezB9IC0tLSINCiAgICBp
ZExhYmVsICAgICAgICAgICAgICAgICAgICAgICA9ICJJRMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgOiB7MH0iDQogICAgbmFtZUxhYmVsICAg
ICAgICAgICAgICAgICAgICAgPSAiTmFtZcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgOiB7MH0iDQogICAgZGVzY3JpcHRpb25MYWJlbCAgICAgICAg
ICAgICAgPSAiRGVzY3JpcHRpb27CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCA6IHsw
fSINCiAgICBhdm1hUmVxdWlyZW1lbnRzICAgICAgICAgICAgICA9ICJSRVFVSVJF
TUVOVFM6IFVzZSBXaW5kb3dzIFNlcnZlciBEYXRhY2VudGVyIGFzIHRoZSBob3N0
ICsgUnVuIHdpdGggSHlwZXItViBvciBRRU1VLiINCiAgICBhdm1hRmFpbHVyZVdh
cm5pbmcgICAgICAgICAgICA9ICJJZiBubyBzdWNjZXNzIG1lc3NhZ2UgaXMgZGlz
cGxheWVkLCB2aXJ0dWFsIG1hY2hpbmUgaG9zdCBhY3RpdmF0aW9uIGhhcyBmYWls
ZWQuIg0KICAgIGtleUNoYW5uZWxMYWJlbCAgICAgICAgICAgICAgID0gIktleSBD
aGFubmVswqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgOiB7MH0iDQogICAga2V5Tm90
Rm91bmRTa2lwICAgICAgICAgICAgICAgPSAiS2V5IG5vdCBmb3VuZCBmb3IgcHJv
ZHVjdCB7MH0uIFNraXBwaW5nIHRoaXMgcHJvZHVjdC4iDQogICAgcHJvZHVjdEtl
eUxhYmVsICAgICAgICAgICAgICAgPSAiUHJvZHVjdCBLZXnCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCA6IHswfSINCiAgICBtYW51YWxLZXlSZXF1aXJlZCAgICAgICAg
ICAgICA9ICJLZXkgQ2hhbm5lbMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDogVW5r
bm93bi9NYW51YWwgUmVxdWlyZWQiDQogICAgbWFudWFsS2V5SW5mbyAgICAgICAg
ICAgICAgICAgPSAiQW4gYXV0b21hdGljIGtleSBjb3VsZCBub3QgYmUgZm91bmQg
Zm9yIHRoaXMgcHJvZHVjdC4gWW91IG1heSBuZWVkIHRvIGVudGVyIHRoZSBrZXkg
bWFudWFsbHkuIg0KICAgIG1hbnVhbEtleVByb21wdCAgICAgICAgICAgICAgID0g
IlBsZWFzZSBlbnRlciBhIGtleSAobGVhdmUgYmxhbmsgdG8gc2tpcCkiDQogICAg
bm9LZXlFbnRlcmVkU2tpcCAgICAgICAgICAgICAgPSAiTm8ga2V5IGVudGVyZWQu
IFNraXBwaW5nIHRoaXMgcHJvZHVjdC4iDQogICAgaW5zdGFsbGluZ0tleSAgICAg
ICAgICAgICAgICAgPSAiSW5zdGFsbGluZyBwcm9kdWN0IGtleS4uLiINCiAgICBr
ZXlJbnN0YWxsU3VjY2Vzc1dpbmRvd3MgICAgICA9ICJXaW5kb3dzIHByb2R1Y3Qg
a2V5IGluc3RhbGxlZCBzdWNjZXNzZnVsbHkuIg0KICAgIGtleUluc3RhbGxGYWls
V2luZG93cyAgICAgICAgID0gIkFuIGVycm9yIG9jY3VycmVkIHdoaWxlIGluc3Rh
bGxpbmcgdGhlIFdpbmRvd3MgcHJvZHVjdCBrZXk6IHswfSINCiAgICBrZXlJbnN0
YWxsU3VjY2Vzc09mZmljZSAgICAgICA9ICJPZmZpY2UgcHJvZHVjdCBrZXkgaW5z
dGFsbGVkIHN1Y2Nlc3NmdWxseS4iDQogICAga2V5SW5zdGFsbEZhaWxPZmZpY2Ug
ICAgICAgICAgPSAiQW4gZXJyb3Igb2NjdXJyZWQgd2hpbGUgaW5zdGFsbGluZyB0
aGUgT2ZmaWNlIHByb2R1Y3Qga2V5OiB7MH0iDQogICAgYWN0aXZhdGluZ0xpY2Vu
c2UgICAgICAgICAgICAgPSAiQWN0aXZhdGluZyBsaWNlbnNlLi4uIg0KICAgIGNo
ZWNraW5nU3RhdHVzICAgICAgICAgICAgICAgID0gIkNoZWNraW5nIGxpY2Vuc2Ug
c3RhdHVzLi4uIg0KICAgIHNsbWdyRXJyb3IgICAgICAgICAgICAgICAgICAgID0g
IkVycm9yIHJ1bm5pbmcgc2xtZ3IgL3hwciBjb21tYW5kLiINCiAgICBhY3RpdmF0
aW9uU3VjY2VzcyAgICAgICAgICAgICA9ICJ7MH0gaGFzIGJlZW4gYWN0aXZhdGVk
IHN1Y2Nlc3NmdWxseSEiDQogICAgYWN0aXZhdGlvbkZhaWx1cmUgICAgICAgICAg
ICAgPSAiezB9IGNvdWxkIG5vdCBiZSBhY3RpdmF0ZWQuIFN0YXR1cyBjb2RlOiB7
MX0iDQogICAgYWN0aXZhdGlvbkZhaWx1cmVJbmZvICAgICAgICAgPSAiRXJyb3Ig
bWVzc2FnZXMgbWF5IGhhdmUgYmVlbiBkaXNwbGF5ZWQgYWJvdmUuIFRyeSBtYW51
YWwgYWN0aXZhdGlvbiBpZiBuZWNlc3NhcnkuIg0KICAgIGFjdGl2YXRpb25Db21w
bGV0ZSAgICAgICAgICAgID0gIi0tLSBBY3RpdmF0aW9uIHByb2Nlc3MgZm9yIHsw
fSBjb21wbGV0ZWQgLS0tIg0KICAgIGF1dG9DbG9zZUNvdW50ZG93biAgICAgICAg
ICAgID0gImByQ2xvc2luZyBhdXRvbWF0aWNhbGx5IGluIHswfSBzZWNvbmRzLi4u
Ig0KICAgIG1ha0xpbWl0UmVhY2hlZCAgICAgICAgICAgICAgID0gIlRoZSBNdWx0
aXBsZSBBY3RpdmF0aW9uIEtleSBoYXMgcmVhY2hlZCBpdHMgbGltaXQuIg0KICAg
IGtleUJsb2NrZWQgICAgICAgICAgICAgICAgICAgID0gIlRoZSBwcm9kdWN0IGtl
eSBoYXMgYmVlbiBibG9ja2VkLiINCiAgICBpbnZhbGlkS2V5ICAgICAgICAgICAg
ICAgICAgICA9ICJJbnZhbGlkIHByb2R1Y3Qga2V5LiINCiAgICBpbnZhbGlkS2V5
VHlwZSAgICAgICAgICAgICAgICA9ICJJbnZhbGlkIGtleSB0eXBlLiINCiAgICBj
aGVja0luc3RhbGxJZCAgICAgICAgICAgICAgICA9ICJQbGVhc2UgY2hlY2sgdGhl
IEluc3RhbGxhdGlvbiBJRCBhbmQgdHJ5IGFnYWluLiINCiAgICByZW1vdGVTZXJ2
ZXJFcnJvciAgICAgICAgICAgICA9ICJUaGUgcmVtb3RlIHNlcnZlciByZXBvcnRl
ZCBhbiBlcnJvciAoezB9KS4iDQogICAgY2lkTm90Rm91bmQgICAgICAgICAgICAg
ICAgICAgPSAiQ0lEIG5vdCBmb3VuZCBpbiBYTUwuIg0KICAgIGFjdGl2YXRpb25S
ZW1haW5pbmdOb3RGb3VuZCAgID0gIkFjdGl2YXRpb25SZW1haW5pbmcgbm90IGZv
dW5kIGluIFhNTC4iDQogICAgdW5rbm93blNlcnZlclJlc3BvbnNlICAgICAgICAg
PSAiVGhlIHJlbW90ZSBzZXJ2ZXIgcmV0dXJuZWQgYW4gdW5yZWNvZ25pemVkIHJl
c3BvbnNlLiINCiAgICByZXNwb25zZVR5cGVOb3RGb3VuZCAgICAgICAgICA9ICJS
ZXNwb25zZVR5cGUgbm90IGZvdW5kIGluIFhNTC4iDQogICAgcmVxdWVzdEZhaWxl
ZCAgICAgICAgICAgICAgICAgPSAiUmVxdWVzdCBmYWlsZWQgdG8gZ2V0IHJlc3Bv
bnNlOiB7MH0iOyANCiAgICBjaGVja2luZ1dpbmRvd3MgICAgICAgICAgICAgICA9
ICJDaGVja2luZyBmb3IgaW5zdGFsbGVkIFdpbmRvd3MgcHJvZHVjdC4uLiI7DQog
ICAgbm9BY3RpdmF0ZWRQcm9kdWN0Rm91bmQgICAgICAgPSAiTm8gYWN0aXZhdGVk
IHByb2R1Y3QgZm91bmQuIFRyeWluZyB0byBtYXRjaCBPUyBFZGl0aW9uOiB7MH0i
Ow0KICAgIG9zRWRpdGlvbkVycm9yICAgICAgICAgICAgICAgID0gIkNvdWxkIG5v
dCBkZXRlcm1pbmUgT1MgZWRpdGlvbi4gVXNpbmcgZmlyc3QgYXZhaWxhYmxlIHBy
b2R1Y3QuIjsNCiAgICBub1N1aXRhYmxlV2luZG93cyAgICAgICAgICAgICA9ICJO
byBzdWl0YWJsZSBXaW5kb3dzIHByb2R1Y3QgZm91bmQgdG8gYWN0aXZhdGUuIjsN
CiAgICBza2lwVGltZWJhc2VkICAgICAgICAgICAgICAgICA9ICJTa2lwcGluZyB0
aW1lYmFzZWQvc3Vic2NyaXB0aW9uIHByb2R1Y3Q6IHswfSINCn0NCg0KIyBLdWxs
YW7EsWxhY2FrIGRpbGkgc2XDpw0KaWYgKCRHbG9iYWw6SXNUdXJraXNoKSB7DQog
ICAgJEwgPSAkc2NyaXB0OlN0cmluZ3NfVFINCn0gZWxzZSB7DQogICAgJEwgPSAk
c2NyaXB0OlN0cmluZ3NfRU4NCn0NCiMgLS0tIETEsEwgQVlBUkxBUkkgU09OVSAt
LS0NCg0KDQojIC0tLSBJTlRFUk5FVCBLT05UUk9MIEZPTktTxLBZT05VIC0tLQ0K
ZnVuY3Rpb24gVGVzdC1JbnRlcm5ldENvbm5lY3Rpb24gew0KICAgIHRyeSB7DQog
ICAgICAgICRyZXF1ZXN0ID0gW1N5c3RlbS5OZXQuV2ViUmVxdWVzdF06OkNyZWF0
ZSgiaHR0cHM6Ly93d3cubWljcm9zb2Z0LmNvbSIpDQogICAgICAgICRyZXF1ZXN0
LlRpbWVvdXQgPSAyNTAwDQogICAgICAgICRyZXNwb25zZSA9ICRyZXF1ZXN0Lkdl
dFJlc3BvbnNlKCkNCiAgICAgICAgJHJlc3BvbnNlLkNsb3NlKCkNCiAgICAgICAg
cmV0dXJuICR0cnVlDQogICAgfSBjYXRjaCB7DQogICAgICAgIHJldHVybiAkZmFs
c2UNCiAgICB9DQp9DQokR2xvYmFsOkludGVybmV0QXZhaWxhYmxlID0gJGZhbHNl
DQppZiAoVGVzdC1JbnRlcm5ldENvbm5lY3Rpb24pIHsNCiAgICAkR2xvYmFsOklu
dGVybmV0QXZhaWxhYmxlID0gJHRydWUNCn0gZWxzZSB7DQogICAgJEdsb2JhbDpJ
bnRlcm5ldEF2YWlsYWJsZSA9ICRmYWxzZQ0KfQ0KIyAtLS0gSU5URVJORVQgS09O
VFJPTCBGT05LU8SwWU9OVSAtLS0NCg0KDQojIC0tLSBETEwgQkVMTEXEnkUgWcOc
S0xFTUUgLS0tDQppZiAoLW5vdCAkUFNTY3JpcHRSb290KSB7DQogICAgJFBTU2Ny
aXB0Um9vdCA9IFNwbGl0LVBhdGggLVBhcmVudCAkTXlJbnZvY2F0aW9uLk15Q29t
bWFuZC5EZWZpbml0aW9uDQp9DQokYmFzZTY0RW5jb2RlZERsbCA9IEAiDQpINHNJ
QUFBQUFBQUVBT1M5Q1h3Y3hiRTQzRE83TzN2dmFuYWwxUzJ0c0dVdldrbldmUmhq
ck5NV3ZtUkxOcmF4a1dWcFpjdVd0ZktzNUFNaFk4NEFBUU1KOXcwaEJBSWhoRHVF
RUFnRXlBc2tFQWhIQUFPQkpKREg0MEhpSkZ3eC82cnFucDFaU1RiSisvSjk3L3Y5
L3Y1WjNWMTlWRmRYVjFkVjkvVE1MbDEzRWJNd3hxenc5K1dYakQzSStMOEY3S3Yv
N1lNL1grRkRQbmF2ODltaUI2VWx6eFoxYnhsTWhFZTArR2F0ZDN1NHIzZDRPRDRh
M2hRTGEyUEQ0Y0hoY092eXJ2RDJlSCtzM090MXpSUTRPdHNZV3lKWjJDTk8rUVlk
NzF2c3FMQmJxZ0RrRW1NS3p4c29oblFZQ1pNUVRLTzB6T2xteklqWlBvbnk4WitG
TFRnTHErSi9JMDVHOUM4ZDhDNW5IRytGWlpwQmJwU1lCNkpQWmtvczc1L2dTZklm
ME9jd2dRNkFGNW5nOHRIWTdsR0lYL0dJY2ZrTXVrMG9OcFpyQ2EwUDBrUWJqaDBI
bWlhbDFGc0EvOHUxMkZBY0tub0V6WVFyZlVxOTVzbGtMaXJtZFpBMm1kbll6UmN5
MW4wcFk5TGtpdi9rdnlBUUNpaXd2Vm80NjRLNWtDcCtiaHpJanZnWmMrMnpReXA4
SFpTTGtsT1NKUTRzZWRjbzJaMHNjV0tKVlVxV1RDUkxYSkNhQVUwT2ZmbmxtMDBS
bUZhWEs4QWlLaGE1b2Fpd29yQWlFVUFJdUdJdEFkcXM3Q2dhSjFQbGVCQUs0dWtR
RExvNG9NUXNtV3Q3dG1iR013Q1lWWEo2SkFTeGJJbG5Zc1VzQ0RJdkFQWkpXZkZz
U0lldTR2aHlrdmh5VFBnNHFvZ054TGRrbVJ5eVJJRDZhQVRxUmVQNVVLUGtkRGxT
QUxFbFhvaU5NRXUyV3VJdzM2NjF2Qkh4RVhIRHRLc1dISzBDV0VWTlpmK2dxTmJP
dXgwRnlaVGlSWWc1RjlyTll5UW02blBRYTI0RVJ1eUtBSmRjeEQ2WGtoMkJ0ZWR5
eStkamFVQ0tGT05vSXJNZ1BPQUFjRFlrWGxkS3BEUWNWejdMcU9KaXZFeE9STER6
K05FNFF1SUpqQ0swTmNTNUpWdjJEMjZObHhERFFwQ09SN0hDU1p5Rkp1YkZTekYv
SGMvWGdJS1JTQm15QVBsUWdtUHVnTDVnYUdxR1MzYUhQTkVHdStOaXIrSXN6TnJV
NndvRnJkRkNCZGZLdnA1U2o1SzVLZnhBL21QV1hsZlVDbW1YYXMxY0U3U3Exb0tx
MXgyWmF6d08rLzdCcXA4cUF5VWtrektEOGFFcVVUVkFQcElWS2NkTzU2REFLRm8x
VWdIYXhsVW1LeVhhY1FDVjhEWmRZbTRqbFZpN0NvTnFhaExlQjB5cmtuTktsUEFJ
Y0tJS2NoSVFWOGdoeUxrcm4rZmNuWTg1bVpEekVYQy9XczRxMFJZQzdrUU5vRGg1
N2w0dnpGR1pJa2RxY2VRRmNxUU9ZNWdSNlBkbTZCY1dpcHFvaDd4RUEzV1pHVzlF
bG8wSGhQQXJiZ1ZHU0ptS25jdkZPQWl4TlE2VDdQSkVGd1hreURHUThnWXNrWGtv
QU5na2FBWG8yQ1JrVTFTcmprSzFKVk5Xd2dZNUZBT2UrY2lhN3gvd0JlUkRJUkRI
M1BoeEpDSVJCMG9nbDVPNWJOV0Z6S2V2L3lGR3VrKzFKQmJnQUNJMGdIZ1R5Z21Q
M0xKaWp3QXFaUUtIRTUzRGN6MDg4aW9PS2d0YUZTZFAyUGpRVkN2UTFJeTBHV3NY
UksxZzdkYXFSMG9HNUVRTHdCTllrVE5UdHFDVUtTWEhUeW5oTW1GakpTQi9UbHk3
NDNuSU9aVHN2ZERFdW5XT1ZNTHpDbWNtQlp4Z0dvdmJIbS9GTEI2NVFwNkdKM0RD
Q1BMeUtQT1FGTFR5Wk5BbVlrVTBDOUU2RE5wVmEra3hkaHFKYWlzTXJ4a1dIZkZh
cWxMdTFpNUFjV2xEY2JFWGhtbkp6YktyQ2lXQ2R0N1VXWmllYkNtUDV5S0p3QmFs
MkI0K0hXamlQSVo1c1JiYkN6amdSMEMxVDZSUmJKMVFjZVR0MEp3V3pWN0FiVDJ1
OHNzdnYrVG9GUjIzTXRjT21TU2ZObllWWUhMcDh1bFNTRUp4NmUxTlIyUUxrWHpy
M214TTUxUGFwQnFETnRWV3NDWUkwa1djWGhPMGg0S09obTI0eWh5Yy9qaFlJdGNj
bFFPcUk5NkJ5SjNSQmhwWDBLVzZORWxpSXpRb1BlMm5kSWpHQWpIeGx3YW9Ra3ZS
dldyVFo1TEVxSkVJQzRtWTExQk1OUlJSb2pySEVXdm9rQ1Uxbzh3U2lzcXFmWEpt
UnRRSmFleGFMS2V2TE1OeDhMbUNGYTlRRmc2blFJQm0xaWtDVmVtZ1RySGRvTmpN
NzJtNlFUZ0NMb3lTV2tWQWUzT21ueXk3Q2xKQk1yRmg3bU1NNTZqeElUWjVxdktT
SE01WlkrS2cvWEM4M1p1RnROaU00UmxUUXpKUkdGN0xWNGhiVWQwaFBTdCtQTFYy
MHlDQ25tUlRMa1pRd2RTMWh3L0ZQbFhZY0R4QlJ3cjlOTHdUeFREWEhUZjJqeSsv
aEFiY2xoMkFma3Bob1FxTlJ4YldiYy9CbFJTMUY4Nk1XTkdxMjNUVFRxUjU3S1Qw
WEVKZk5KQkNJN1VSOVBLOFVLcEtVVWp2VUhkTzFadkR2UTJpMzZzdmVxZURNcUJZ
OVhMVlIwWTRaNjFSR1NqMUFxVmVUaWtnYTZyaExpQXE1ZDlBNGgxWitJYmNwcEUv
dVFHOUxZdVJYOGZaWWlGOVVKS0Vsakh5SzJSMkl0UnhrNzRrN2kzSGNVYXJ3ZVBx
Skw2UUxGdklrcGJtMjBtTXJSenk4eGIyK0FvY3pvRnNhTElTamNvVFlGVFlvWkNT
TkNvbGpOc1REMXV3aE5zVDlHZkFGVVFhMVVRWDUyeXlkemYwTGxIdkhrZEs3NDZV
M2gxOEJkb1ZCNDBNbWlSN2w4eTl5eHkxRWxGd05tRUJSaWNRRmpZdXdCYXMxR25p
dlBCTzVrWEZ0THpJU2VHRng4NFhzZFh1T1pDck0rS3B5WXhJTDNFWXZEaTJ3N0N0
alh4T1ZkbWlXVUQzb2J1bTZPa0llb2xLbVQrUmhTYkFRc2JWSGZVb3ROVFJRVkhj
ZG03N3JPeGNpSUVxTmVTS0hpK0dUYW8ybGZSb0N1bjVndlFNdTQzVXEyaG5qNjlH
Q1ZFeTE3Z1UwOEtxdXRWc2tESkpPd05SWkkyczNBNXhORnpjcnBOcGVvbmp1Z0hQ
eVE1RlRzRE1QTW84aXB0emRHWVZZYlBYTVBJYitYemd2K3g5NmZvV1kxOEdwc0t3
SFBmaDhpY2RzQmZ6VHR5SGE3MXdZQjlxb3NKVmhXSERQZCtIYWpUOFhXaWRrb3Y2
c1dTVFBCNUcxbFI0TGZJNHFBTHJJVGwwU0NvSkpiMDNuSit0K2hvYmp5SjlhM0Yy
M1pvYnBpZXhEaTI1UEY1Q3NzakxTM2kwOTFUa1Jsbm1yTDE3RWEweUJ4UkpBa2Jr
S3Q2SEplaHBSU1BncVVTTGRZUkhTN29uU2I2cXdzREZ3WDJ0S3VOVUthN0VCcHhM
eGE1UWcvaEpHUFRnT3JFN2FCQU9Ha0I4STJTQlB1SkV5WTVFSTNJNDZZem1BdDV5
M0VqUUhxUUg1VWNlTDZlRjNJdnlJSlhZSTRCQlNXeEN6SWsrSk5nUjc4Y29Ib013
TVlEYXo2bTVaRGFpcFVFUTM0eHFURnM1Q1Y2TjhIb2RqbStCUUxzVFFHZDhrRHlM
eUZadVNiWkJGQmxpWWpmbU91QnlsTUtTNXJxWmFBamFPQkZnNENkUkFVWkEwWFpa
b0o5eGkraW5XSHNIa21EcHQyTzV2VmpiWURWQWgvYTRBU1dHeVFkSnhERnlKVWFv
Y1ptTmpZVGlPeWdkZzNRbXBZUHV1SWFSSjdvWXpGQUNrcU16MFphQjV0YXV0UkZH
SEJNZnlpalc5S2xPMWFlNm9meStTZVh4TVF4MjR0Zzk4VjA0NzNjY3lGQTlZem1J
MEsvNlFkLzcrZWpCVGVLOU5yeVA1dG5jY1pxYXB2MW1FdUtncXJwVU5iNGJVZm93
bWRpRFJTZmpVT2ZnWW9VMm4wOUg3RVNZdk1ZMHphOU1WMW9rU2dzbmxVNGNKUW9h
SnhmTUVBVW5UQ3FJajZNTXhCV3hNWnVBb1ZpREFhTDZGT1JISUQ1aHNHV3VHMXpU
dzNIR3JuT21USnJFbWFBYTFQWk02amVZSHNoUTB5TjdFWGxRdTNLNlVRWkRRRVo2
SUROK0t0b3lOYlB4UldSNUpxMnowUHluYU9tWG9lK1pFZCtIeE4ySHhVNDFGTWlL
bjRZdEVsWEU0ZEJFTVkwOXFEMHdtU216Uk1FTGt3dG1pd0xKUHFrZ2NwaUN5V3c4
bXVwbFRaUlFuRGtScFRoam9oVFptNjNUcldiSFR6ZHg5NmxEd04yaTZibHJnN1JO
R0UraEdjNGcxY0dhVHVGK0JwNjNBTS9acGZEbk12c2ZNQjJndk5rNUVHZVk4bThC
K0F1SWI1SlQ4eCtWeGRHZk5UWC9PL0EzREQ1TWh0WHdZOUErbndseGdPd3pEaXAr
Sm5MakxETFNpOEhvbnMwdEhVNkJwWHF1bmV2cXI2RVdpd1poeDNzT3BLeHhHSThD
WnRwNzRGaklPaGNYeTd0OEU1eVdOTk9BNmp5K01NbCsrNU1GMm15WWlzVFhVVUU3
UzZROHBMV0NoVHU1SFpkQm82NFpOSHdKUEs4SmtvNEZyYVhFenljeTB3SDNCVWlt
Ykk5VVEvWUJ5NndETUtMSWZ1enZIZDZmYWpoT0VoMU9ocGl6a0ZsZ21pWDBHNHJL
ZUI4NzVjU0ZPUDNJQ1RseEVTYkxqYzN3MmZKNEJScVppOUhramxmcVNjT3ZOZGsz
aGYwZDhLV1RuU0VUN2JNUkV5ZXFFSjlsb2hvajYwUU5ScmFKV294ODFvazZpcFZ4
VkFNVDlRTEFwWjlGWjBMRm9jSzUxeFpuRmg1emJmd2J1SWl1bW1pZ09yWnhYQWtU
alFKQUlaK1lLd0NVMklsanFMZndsOENCclQyRlZac3NXOE9nQ1k2RGRQcW1qZkk0
MG9RNWZpamRPRkZCTk1GR2JtdGg1U1pyb2ErL0NPcCtDWXVZUVdFbHNRTklVL0FV
VVFsL0NSTFY0NUk1TzVUaHd0bWJlSjJTUjdUdndzVEs0emlrMGt3ZVo1YmJ0ZDlD
YnRTai9Ra2ptM2JRTHM2MThCelB6bTVqSkxOcVRzSXJvWWMyRG5yRW1uMEJhQ0c1
T0pSUUlLODRhMklIcmtYdEVMU00vdzAxaEJ6L0pzcnNKNUMrcVRpVGFzSFdnNnJa
dFFxSHFHWVh1OTBFWnQ5VW5KV0s3U1JIRWx0a0xvb1dZWXRmd3ZBTXhRRTFhY3RT
bUVZYkdwcnJ4S1ZNUHg5UjJJY2tVZUIzVnlEWjh2ZzhITFNkeHlXVERzVkFUTU1N
cG1oT3NaMU94K2FFN0hUdU5jZXU3UWNxb2tIdEtnZXg2QllIc2VodWlDWVFrZllJ
cENLWG9hSjZCVk9YNHlwMFJLNUFCeU1naitQc2F4L2dPSzdFSEwxM1Jmc0lLNnZr
Q1dJZGFqZXhEMTJieUZVNHZrTktKWHBSVjZNb2crS0plcDJsQmJJelU1ZTRZN213
WlY0VnZ4WWJ6aU4zbGxBTGZ3cDBUU2JwajJQRnFJOGxmNDJmT0J4TDFYSHk1MmJp
V1R1ZXNTR0hVTGcxMlNuMGJXa05wZDFjRkxOT0xPemZFRTRESmI1T0hzZUZFcjdo
YkltZHVNWmpnalo0MFJzbmNFR3puNTBZdEFWc21ndnhYVWM4Tm9vMmVNeFkzNE1K
WEVjK0h5WEozMXZqRFFXdG9MbXVKL2NuRkxSRmoxTHhWTzhHY25kVWE4QWV1VkUz
YW5oeWFvT3RNV3lZd1g3Z09YVFZDL21xTlgvRDJxQlYxdEtBZ053TDBvaHhLSXdv
YUk3elFYdExOeFZucTFhUnluSHlST1FtWkNqbkVQR005aHVuaXJOczQweXpPSXpu
bkhSS1VKek5JeGxQSjVYQ0xOeUFnY3pTQUVYSk9Pb0VrRlFxS1J5aTg0TmlPb0tN
dUpNYmNGeTdBNUdiY1ZUSlRGY3hQL1BneDVWRXkvM1FiOVlrV2o2eDZyVGs2TFFz
UUUyd1R6K2FBUkpRMzdoUTd4YmdTVFl1VDFNeDBHYmoxVkFjd3c3WmFJZDZFQlZQ
L051SXVMQlRyNGhEU3VsZzd1U00rcFFNTVFRNnUvd0k5enFraDRYb0dVS1RLaVlS
RDUybFRscXVRVnZrRm93Y0FVZmtPeVFnQm53ckNRanZQT2hVbllaQWw2VUIxSnlF
bEtnanl4dFZzcjFST2VUVk9pRy8wR2tTRXo1L1FqcXk3THJBT0NiSlMzRXVpTkNK
bE1wVGJTSXZYMVZFcWtDMW0rU3FCT2Z2UnpEMkhMU1htZFZ6aEpvdlBCcDJaMmgy
Q2d0UjllUDR0MlppU3VmOVJqSnFKV1krbVptMndXMElnOUR1ZHUwNUo2bXFIQmNi
OFJRN0V1Z1Y0bm42YlV3Y3VxUklLRDh4TExicjhpbzYxa0dramVZL0tZZXd0OElu
TVBoTUFuV0tpeU1Mcy8rNDZoaWhJTllrdnN0WFBkSlQxcUQxQXlHdWtDZGFyT3lk
Zy9xK01JdHY3RzRRaE5GeVJyUEREM056cTE1dStDNzVvMlNsRnVDZUdGUUN0M05C
VzJGV1VJbjJoSUwyUWwvUUVhMVFRWDhEUGV0QU5ZQlBwem91eHVNeWlGWG81c1Jm
WDRQUkJpd0RUZUhJWEl1SGFLRTV2eUE2d01jMlU2QndFbFFGYXNHdUt6VG5HaVVU
Tm0rM280YmZEeU5ROEVrTlZ6S3FkVzNtV2lxSjNJRnRjb1BPYUxvQ012WU5xQmYv
SHFGeDVxMUJJUlJhNlhkS1NibDJHWlR1bThOMU5lNVJRZlhqczFrMVVjWE5LOWdP
cTUvdHZSTWFwQWNrVUlITFlNQ095UGVSU0h5SXRNS3BXbDg0bEFjekk2OWJzd01q
Vkh6ajMwQjVCNHJ4eUVIWmV4ZFM5UU1VOHp6SUF0V3FsQVV0WlM2bzkwMnkrVkF4
YUQ4UTFoODdiYlVQVjkxS2pTRFhwWlFxaXI0QjBjOXhGSGJtZWR3RnhqTXRjR0JZ
ZnBMbWRMZE9kVUNLTEVhLzA1SWVsZXdlTXlaSGlZNG5KNnpqVWVnNWZjR2tzV2Y2
V1E2TmV5bFNiYkdYT1lndzc0RXN6b1FkcUwrOFp0ek9KTzd5R2gyM2xlRXorc0lw
ZkxWWUkwdndLTURjM3A1c0g4amk3WThLNFVtWU1xdEUwSW5qRFUvQnBUME5VNG1r
Z3V5c3dPcG1wRW1jdVVVRzMvQTVYdEVrUE5wYmdNWFBJdDFUTUxBazd6Tnl2NUpu
b2YvblBGTllHOS96VEI0bjJLTVJHS1VreG9rU0U2cnlxZFp3NENQcm80ZWswQ0Vw
S29HSlRwRWNHL0pPNzZPcTRjajBaL3RaMXIrRGZtak9aa3lsZjU0N1paN0tMSTR5
SjVkMjY0RUNaK1J1MUoyb0h5TW4wZWhTeG1FMWoyUHVBa08rZGtJOEUyMllzZGhL
M1ZxL1d6OHJTNldCUnJjUzE0WXRIWG80MWs2ZXI5ZmhETmtqOTBCMXA3TndIaHE3
S0QrV1I5dnZwWk1qSngwWFRVTVVwNm1BTFI0MHhvL25xOFZUeDM5LzZ2d1owM2Fr
c2M0cU5mQkNNY3J1Wkx6dkdYenRFSHlsMGFWem5rN0ZydU11clVyRlBYdnFPalhS
VzJhM2wxb2RtZVgvT3U3TjZIeDhsVzZsUGFXWEMxclFpcTVtZ1JNZnN5V1ZMT2xX
T2hyUTNVelVsNjg1ZzBvS0RZcEJRL2M2WTgxUHI0ZjhVcVRycS9VUWpnSE1IenM2
Mlo2RVRlaGJHUitYSzN5ckZZTHhSQllDT0Vuckd2TTVzMFRIS2FNT21xS0hRQVV0
bWtZRkpkdW5oWXoySU1pc2hQdzMwNTYvUk4vejI4a0dlUndtSytTemN5TUVoZ3pt
Uk5GUEFwNmRjaExBa3M4TjZsdjQvcjlaK3dUWEZLN1BmZk81MlNTKzR2V2dLTklB
dms2emgzeWRUb2pjOXNSOWpCN1ozNDg3cEdyYkc3Z1JQSkR2MWRaRHFUM3lBSzJw
QjNWbkkvRkRYS3ZhZWNteVNCRG9DM25RMHE1bUhFbDJPZkRqSVhRT01tZlFFYzJD
VXhkRWZvUyt5OE1RSEpnOTY4Q3NvRTM3THFDQURVb1NNeUVLSHdRcUl6L0dhbktt
aDV0YlVENmdPaHRnblZkZDV5aFR0WFN2M25maUVTSm1yamVGR0xsc1RtUW5hbzZJ
Tmd3bG5NRElMZ3pudUxWTElDdnhFMnIzVTcyMFJJb2dtV2tzY3piTEw2WHJUT3Za
ck5PWnBVeFBuOFZtWWo3eThXZFFzeFQ1T0JkWXdZaUhaZzdtQUFlL2pSek05R2hm
UUFlT0tid3I5K2xFdVVQZWFMZGdXaFl5N1ZGa1dzNWhtV2JWVmtKYmNLK093RFMz
TTNPTkZ3eUNNN3dGY3F0dXRKZTV0WWVnbGVEVkgvVE9JMnY1OW9MeHNaUGR6ZVJq
NzJDejR2cllJYTNwWTVjWlNDOHJ3enN5MkhqdlkramtGZmpCZWZzcEgvL2pLTTNn
c3M2ME82N3lPclVhTEhvQzliemZxYlg3eGE0ZU5GRlI4czdPUytiVm94M3YxNC9S
VlAwNVhBYXJYOExYRWU0RjhNQzFISG1mV1JzdUxJNzhEQW40QnpTS1BJbTg4T0l6
a3pKbEZubllKZHBsYVd4RVc2cENnSERrYWFneU9oL0grM04wMHJVK0tJbjhCeEll
K1FXdUxZZEN4eEJsRzNJdW1FKzdHbTBNYXNET1JqdVg0aXp0MnhSbmE0OWpqT01z
d1hFS09weUV5NFNWb3l1VmxaTGthSitMNHAyajkxVjlsRFNtbC9ReGxTcHlabmxt
dEVTTEJnQUhFcWtkR3hEWXpKbC9NaksvWW9pM0JmL2ZHS0tCOWJCRC9Fa3dPVVI2
am5rMDQvZXg1TWgyMnIvU1VGM1JOTVdTK0NXS0ljVC96V001OFgxTVZNbVJZVFEx
VVM2a3VlSVo1aHg2aG1rclMrT0kwaXlaTGhtdHZtSVRBN1R4QVlhMHo0RUNtN1k0
SFVqRnpZWWd4cGFkbVVuUEdFSG51bERuV2gwV09USUx6OGFld2VYanNwY3FkaUdN
SzZDdDFjQkFpNGFrVlk1c2d5VFg5WFRXMjg0eU4zQVp4ZFBkNXIyR0xjTm43ckI1
VnEyQ1BLdE8zb1dFL0xaVTh2aFFaRXNrVG85MnJaRm5jZmwvVSs5WHJCTGV2Zlpz
dXE2OGtqYW5odm1hZWQ5N1pmQysyYU1oc3R6WlBJb2tvSEltOGh2MzFRNTZobGlK
KzFGdkJtQWF4UzR6STc4aWF4bDJiR1Q3cUZISW5obVFlZk14TkhiMnlIT1llOGhp
anp5UHVpcithOGJQUFIzcytLbjRjZ1ErdWN3ZXR0N0E5a1Z0WVhaREVuUE9KTXd2
UURvRnJYNFNYU1dQTDhWRFB4K090azdtRnlRbk1BdUxsazB0d2l5ODBZQnhLUElp
by9zTkZqb3E0bVhRYlBuVVpzdEZzK1hUTktNeUUwRmRVNXQzaWVaZDB6VHZFcjEy
VDIzV0xacDFUOU9zVzlodmZPYTlsdkYvRm5tOGs0bWJWNUJlWVVwakwvc0hkYWc3
QlZvNXFSNmRhWWhhL0pvcTQydDFFOFJWZE1lVkxyenh5TTBqRDQrOFBBcGFaUWUv
bjJhVG5UeWhKRzdBc3l4bEFra3N0azhnZFhqeGJDWEZOdUpEc1NvR25Yb1A4blhv
dDNyU1BVaDVmSlZPSHFSWFkvbzN1Q1pld29CZmtUUXlYMFk2bzN2QXIzdUZTS1Vp
Ui94VlJ0NHF2eEpwdmdRcDhEcmp2OVd4S1RtNG00Q2MxMmhRMGZTQUxmSTZ5ZU4x
a0MxS0llOE5KcDdLMkE2RnNvekhRMUxrQU1SengvRUJKVjAyQ1UyNVAwbjY0anhX
ZEx2K2JHZytPL2NwNDc0SDZENVl4YWwzS1dXbGdIZzdnYXlJVGloOFBrQTFEL0dr
VitHOEo3R0NFWXA3aUVDdFRPZmx5QVhWbW5nVEIva1dMcnlnRWkzV3M0azdDcDRh
Sy9HM09RZXdsYXBrNGswcVphdHFHNjU2Z1pRN3V2RDdVKzlpNXF6ZGV0eDJ1aWlJ
ZHV3MElaOGN0U1crQjNIK2p0U2RPY3NnSktVaTBzRmx4ekorUEQ3dUlRR3lqQy9H
OUFxZVhvTHBsVHlOeTVoTGs0WFdLMGtVRGFGRStOeDRCbEdMdkl5L2cyeU0rcFQ0
dTR3L1lmc1d6aVoveVA2bmFjNGc3Q3pIZEFZQnFobjNGS3BPTGxKS0F1S0tyZ08v
L0hXeUp2SExBS1c0T05PYU9BUEhZYWRsT25FOExRUmFwaE9MaVY1RGZVRStEb0Yw
RXFSeENLUm8rRjBoa3JKcnVjZHZTSm5wcmxDQWJkNWozSnM2Ky9CMHJqTG92QUxw
clA2M2tualR0Q1FtYWR3MGFzZzMzckd1bjBTaksrU09Sc0hxL2g0WHJjUE1TTlZo
bzJsVjdJNzRIeUFqNnJWbnJuSGJGVnF3VmM4SUpBb0pFNzlEdit3dytHY1orRGtE
am96NitWVFU4MldMMVVZc3dkTnpSY0QwNE1FRVUvbXRrOHB2MWYwWGZrKzZ3VVFi
TFEyOGVtd2lWYUVKYzBmRG9FdGVuOElQbCtLSS81SHhPM1VTNS8zTFhORVl2RSts
bk0vQkRGYldhY2pKNW4rQmpseUREczYzYVVoNC9jZ2tNSjJHeUdKZERteGtZMGhY
aUFlYXFOcmt4SHVvNWJEdGxCdGhKMkNtUEk0UitXM0FYbkxhYmlJTmg5bkdQVXZi
eEJwR3o2WFhNdkY4ejhMV01mNDhpdGVOdjQvY1hDTGpBVFkweDNyeU9EYUt6T2FQ
UHJHU3NsKzg0VEFKUFMvRUowNmlaMzRyN1c0VGRTa29rYzVKT0xpc0xoSTBXZjVO
RktDUERBNGpubW1waVQrUjVaaHNIQnZBbDJUVDJVZWFibS8wcElDRnBoc1BMRW53
TFB3NWJMdkM5WVZxTlNrTUFBeU40Y0Q3UkZUQjBCWUFKTlZGL0Q4QkQyQW5pYmtT
Sk1ZeW5lWHNuYzV5R241MkhkdDJvMjQzTTlrdFA5Wmwyc3FlL29weDd6L3l1TmVh
eDQyQ2JxbitOdy81dXNNTmVXRGFJZXZqSGJqR0dPK05EL0kwZUpIcnAzcVI2NFVY
dVg0YUwzSzljRDQzVEcyMlFUVGJNRTJ6RGZyNmtlbWNXUGllNjB4KzVJbW05SHFX
dklOdTRmZ01hTDNKMzl3dzJkL0VzN0c1MC9pYjlKSUlqN3k2bjJuVi9Vd2JIdUdn
bjdtTys1a25Dajl6dmZBek4wejFMOUYvUG1hS2YzbVNUbzQ4M29QSkQwanY0ZUhn
ZjVIajkyT1Q0eWRGUHRRZFA1aXYvTW5PWFhJZk5vTVZ0Um8yRC9kRjgzQ2Q3eDkw
bWZ3NjhFT0VYNGNrUkxONC8vYklJK2dOd1diWVplZXVtTjF3dVpUQzlMVmJxMTRx
NFdjaFRVbC9DeHR5ZmdqZmFaM0pkenJSNUMrdE4vbExOQS8vL2MvNVN6LzlWL3ls
c3lBK2xuUnRrcUhjVS9vdjdvSGNONDJudE03a2hweVlYR0hDT0FnM1pMM0pEZG1R
Nm9aOGFQS1U4aWU1SWNuejBjMEp3d2J1bTQ3R1ZRYU5ENlI2U2Y4TzhtNmFqanlk
dGszRGhyekFlb0pkQWQzVnJ1SDBLZkdQcHJBT2IyVnZJTE5CTmV6eGo1bHhLNXNH
OVdmMFpCN2h0cWJad0RsbkVrNCsxSDhTM2VObVgrZkpTYjZPQ2FieXB5YVZQNlg3
UWx5ZkhEZVovOFhUeW9oZkxJejRYNWorTmdIeDg5ZVQrV21lNjZyNXhuMjdSZFAx
Rlo0ODE0ZnI1dVVwM2VoOWxEVWEvc3llU2Y3TVNlVFBITVRWM1RPZFA3TVJNeTNh
N0F3Mm9zMkJJUDVYeUUyVzluTC9aUk4zZWpZbW5aNFFkM29lSThPL01kV2o0TEp6
WmRMUDJhajdPWTNua0k3b1Rmbzk0M0xrVWNLd2lYUytjRGcycGpnY3ZTbFFTbGU4
MEFSdU5Ia2p2YWIwUnQwekVaMlRrM0tkYVR3NkJkeERtblk4dXd3ZjZYK0RXdkl0
em1mMExuWFN0ekNaaVEzQ1RJQjdmSi9oTFMwVXJvUERwRGNjaDlFYkRwUGVjQmg2
Zy9zT3d0NWNOY1hlSk45UjJYcUs0UU45N2ZCMHJqSG9mSUM4bTM4M2lkZFBKVEc1
LzR2dFN2b3RzYWtPU0V6NEpnTlRpd2FFYnpJd2pXOHlJSnB0bnRwc3MyaTJlWnBt
bTVseG5yYlo4R242VEg1TXZ5a2RTL0ZpQmxLZ3pTbFF6T1RoREpqU213MXZSMzlY
dHVtcmZCMktwanRiazhFNzVhK0RKdDdpM2s4ZjkzNzZoZGNUWS94MGJZRHgxejQz
bTcwZzNRZHFudUlEYlRGOG9FRk0vaTNwQS8yZGZLQURLVDdRSnlZZnFQRGY1UU50
RVQ3UUlQbEFiNklQOU9rLzRRUHBmaWx2eUxraWZLQStrdy9VejlNb3pweEh3aDhh
TVBsRE5GT2YvblArMER2L2lqK0VlNjRXMHNsSjVycWlXOEMrL0ozYm54ZHhSWEpi
dDlLT0o1dFR2S00ray92Um4xeWpkaEk2M2YwWU1Ma2ZtMVBkRDVxd0M3a2RLNXp1
SE1uRHhrNHpmS1A5MDlIYk55MjlTKzN4VjFJOXBYOEhxWmRNUzJxUzFwRlRETGxh
QlhFcjkydWFPYjFLL0xNcFpNNUlZU3U2T3B2SjFSbmtyczduSmxlSGh2d0Z1anAz
NlRhbzAramoyTVAzVWFDejRwOUVmNS9aVS9yakpFL0pCRlA1ZTVQS0NkYmZTMnli
UEZmVjA4NVZmZ29UL0dLcHhmK1JkSGVJOTA5TTV2MTA3MmpLYlBWMC9aWlAyMitX
enBqRGRmbnpxVjBtK3p4bTRlRjlyQzNrWXgxQzdURTRuWSsxOVlnKzFqYnVZdzF4
SDJ0cjBzZks1RDdXNzhncDJIcGtIMnZySkI5cm05bkhlcHN3SVA1TTNXdlptdUtu
YkV1QlVycmloU1p3cThsVDJXWktielc4bG0xbUh5czVIcDBDN21OTk94NlRqL1cv
UVczU3gybzMrUzRtTTdSQm1DSHdYVjZhenNjeU5JN0RwSEVjSm8zak1Ha2NoNkZ4
ZEFmbUU1T1BWZmhQK0ZpSG9YT05RZWNyazN5c2Z3K0oxMDhsY1RvZlM1dnFFV25D
V1VwTUxVb0laeWt4amJPVVlDbG5LRUd4N3VsOUlGekVDam80TzVMdVVrajNoYlFV
enloaGdoVGRzZEpNTGxMQ2NKR29EM0MvY1E4TWRwZDhKQjdONHBHYlJ4NGVlUzEy
Y1N4a1NmcEtDcjBNQTU0U2pWb0dwd2p4YzNxZDVXNnRIalJCNGt1R3I5THFITUgz
Q0hDY2g1aTRieS9UYzN2ek9KT0VHOE05MGpqTkF5d2d2OGs4VHBHbCs2RmJwaHZ2
NUlIcTUxL1FGaDBpaTM0TUptRFpmb1JoSzZuRHhqVy9YdWhTMHpzUklmM3VlbktJ
eFNsRExFNFpZckZwaU1XbXNmRjNORkk0cWorWFdUU04veGM5V2g0Zmc3Wmxqb1NN
bjFPSUt2UktrOGRoUnlzSktnUGZuWExFbVFTdW9Oa0hUQU1mOEdmaUxBRy9sOVdS
NnRQeWRuRkp3aTVLWUFFQmNqejRwYTU4anRFWnNHb1VOTXhLMU9QQTkwTUZCRFV0
a3JobUIwc3RQTVc3NWVzdGs5VXZNMndoM2dFK251eEJzbE5YTkFlc0czWUt0dkN2
aGkzVXZ3SkFuYnpCN1Y3NGNPZFZzNnRUejRRV0o4K0VSc2tIc1U1Qm4yRzM4bW5u
TmV4eG0yUzRIa1FjTUpmT2hQUXptQ1dUNlM2ZWxtNC9yMk9QMnlYZGROTVFmajE1
Q05PZHdad3VKeHhRZVdMVU1OTFdpVEV5emhIQXArREhmQ1pYc0ZBRnZtZDZVc2lx
dGlORDNIalJYa0NiM2hWaUk1WTR2a0lVY1VKem5ybVpNdWVuWnA1TG1jY2xNNzhY
RXMzVDZjWlU2WEZHamhraFpVNUdTSm1URUZyb1ZSNnRJVk4vRXl4YnppelAwRllD
ckxtejJFZ212ZEpDVlVsbUhXeWhqU0gvVmJuTXJjM08wbC91dDZiY2pMNCtLM2t6
dW83UmZhQTR2Um5xbndWTzNIcmNJZFVpeUJSNjU5VWFrT0l1bkIxN1diRTJLNXVO
V0lQT2dOUDA4cExXbXExZk5pS2s5bmdsd3d0UWRQZlV5NjkzUjl5QW9WUngwcDFU
QjMrUnBIcXVJd0xHU1FtNnROMkF3YUc2NlBVZGVnT1Baa04xNGJYSzE2RXM0Wkhv
Zm1PT2ZqTkpPMDlQT2ppTFBzalJXZVNYTTZ2ZG1qVlhIN3RNYjB2aUF4Z1N0VUxu
Vjd3dzZaajZ3bVN5MWxDdVVRdmZseEsxeE91U09hTFdSYVpheHhxMXNsTnIzVytx
TlYrM21EY1Y1NlRXZXQxVTZ6aWpWbTRxWFhKZXNoYXhRL1NZbDFwcnBxbFdvMUVy
UDZWSEdWOUQ3YzZqVzd6bkdRM283RUR2dllCYUJOMnFtemRTM2NhYnBLcmI5Q3Fw
NnVadmlYS3hDdG9jOFdNd1RwV2ZJRWdkWGtrTzJxM2FJOUJqcEE4QmgycmJpNWVN
aGRDcTlqSzdhb3RzUWQxdHZzd1c5TWlSRVl5OTJqTjVRaVRrckhLL25GM3Vsbk5n
S0hoOUVZWXlLeCtXVEhtK2VKODI2RXZCdmhXd0QyZ05VS282ZUhtRzZsVXo4RlVo
SlJoU1EvVFpNTzMwZkhvckhyOGNwbWM5QWxsKzJUUVdYZ3B0NlVzcUtqbXU5TDBm
UlhaRWZNQTA3UlBFNHVPOStLR21uL2VTcHFieGo1TXBEcnBMcmlQeWMwUnBCcUxK
eTA5SHBrSnRsU01McUFIK0VUZVFmRmNjdW5VRk02T1JRR2JFajhrc05VdXJLOUF2
MEtxaXJwb1ZUeE02T0RPaW9nNytGZWpnekVPaG81STZXTlRVMmdzTVJvaXNibE1X
a01HSkRoaEVhMXV4Z3UxOHBOcEtJUzN6WUZEMXFFRm91QjhseDhQZDJrenUwY0xz
V2JLaXRyQU1MZzMzYTlXZ2VEQ3E0TmNiOEFFcHZYek1IZHF6U1RMd2FpZGRJOVhP
S1JBYnMyQzZtczV2azlvaEVZQ1JIY2d5ZitSSTlVRGF3OVBXeURwRWNHdEI4Z1pr
VXorM0VYaG00K1RuTnZpOUc4YmZqY2NMbUR5djNjcS9rVVQ3U1BqN013U2w4RmRn
Uy8xZTBwL3crd1B3VjJJemYyZUFQemRhUnZkWVViaTF6M1FLOUR1YldrMGhHM0dE
NWIwRWJZTVB2d0FaUk5jRC9BRTVraTd4eTFwNDM4bUpIMnZnRElXU0RPNFBaT0hu
Qm1ZWVRzZmtLNStkaGNuNzZ1SWJBN05QMEo4UFo3R2xNZVBNNldXSWwwK3hMNGVq
T2hHUzhMYndrNEErbmtuSlArdEoydWk0NDFuSlFXVGpJT3hBdnpIQ0hJaytISmly
T3pVd2lPTGtJT3pFZ0tBMW1oK3dFZ2Z3UTRRMjRnRkVCaE9zbkFtL0JTWllwMmVD
VmhCT3pqZmVXVWNQWnZhb1B2N3pXTW05ZW5vV3UrYW5PaS9zN0h1d3VlMUVFVEJa
MTJKU0s1bVJWWUF0VFU2MXUxbzRhWS9KTmtZMklkUEl1T2RKVk9NaFV3M1VtSzdD
S25kaHRtY3ZmdTdVcTdtSzJJakNGODhENUxQemQyMWRBVmNrbjhZdlBnbW82SjhH
RkxIRGNHQ0RUbm51SFNpMnpzSlNLdVNmQ0hPR1F2RUNYUDJxVTN4dnpSbCs5RmJ4
SmpQVURldUo5R1E5eDYvamhSSXZuSm9YeXVKWm9hQTdXcVk2STJFa3p4UHdHTys4
cWs3VlZ1aFMzWmxyMW0xZEd5L0NWcEJHaytLbytpVzBjSkFOYURpUDRidW1Ya1JD
OWIybSt0T2loUXI0a1J3VEVzVThlaUEzWWg1M3pqVGp5WnFheHpIWkR5UG1RWi9j
U0svdmMwOERWVGw2R25rcGpvWnUwTU5GdWsxMUNtdktmUXpRMzJvbXQ2YXFzS0Fh
QVhZOEUxUlVWWGN6RGxzeHpGeTN6azlXemo1eVpVZXlZazZ5WXM1MEZWVnU5TEZt
N2xmVXRPczF5ZWFEelVMdEhIVElwUUZ0U2Fyb2drRytEbkxBQVBwVUs1aEFVdisr
S2VvL2hOZTZEZlZ2RmVyZkw5Uy93OUQ4Mm51QWpyOFJicnl1YzhDaitrQzMrOHlx
RHZjUlRYbGNGOHNRWEFIemRwWEZySXV0REw4ZXZPSUl1bGd1Q3lwYXpWRXdqMGxW
NVk1R3dPME00bGRsWFN4K3FaR3RLdHJlMUpwMm9iaFg2WXBiTGt1ZnFydWpkWUF2
SjVrL0FXRUJGOXl2WTJsV1NndFJjbzVKNTkvRTFhV2g3clJmSGlXR2tmcGNnWGl4
Z1czNmlhSHZIM3ZWZUxmeWVPRFB5aVB1SjJhVHhuTXAwK204QU5kNVIwbUdSdU9x
ejMwWTNucklVVkFtK3dsZWh4TzN6WWFiZFNZS0FPeEg4bWJnZnNRZXNKdjNJL3Rt
NlBzUk9wZWdwekF5YmlGZ0Y0QjZRQ24yOFMvTkZQdHM5S21aWXA5QzM1b3B0dEUz
Wm9wRDlNbVpvRzJ5THh6RUQydUNkZUhPTU82S2xFbUVDWmVFcHNMOFhUSHR6Qm5H
U3hWOEg3dUZQVnNydWZTOVBqNi9xemlpekhrVjdVbEVBaVpWaWM0RzZmQXFxUDlZ
SkJNelFvcVdObE9VS3RxQW50UWVuam5Ockl1bHdPbklZaTBuNnU5QldaQUd2RXVy
Sm1ycGZVUjU0a3JjOEk5amFER0VXRG1rMU9GWFVXYWdmemxURXQrc3c3YmRkRjRp
Mmw1RmJhK2l0cGVhMmpha3RrVTVBemNkbjduOC8xUE8zSnFyV0VlZklrMnFWYXVE
a3JqN1g1Q0VqZERBamg5a01WVTIzcmd6emptMnNQakwrcnpJZUdiSW53M3dyMi9U
TjFxVWVERlFwQkQvOE14bE5iNC9Od3RQV3hSTGZEWVdaY1lqR0dYRmo4WklpWmRB
RkNwTU0zMUdQQW81Y2tqZVB4Z3Z4Y09aMUpkZ2s3UW83SmdtUXlmOFQvc3ErNWY3
NHUvc25vQXlWVTU5eWZFNWlOMFNpbGRNUlRIMW5kMGp0Sy84WjlyTGFBZncrMktU
MnVQYnVpNjNYWHNTSjc4YTBwRWExT1JPUzd3V2Rmc0JsN01VVkROSDY0alhTZE8r
Tmk3dW5oWXoxeHo5SFMrRnpXODFhTWY3aTJ1bjlsMXY2cnZoSy9xMnhodW43M3k2
dm85cjQrazZPVEVYRDU4SVljbGNQRTRMNDZNclAzN0VTK2lKYkNHUDFEbFVTSDds
QzZUU2FIWlVzaG55RWo4dHRnN2J6QlBqcVQzOEhMalNPQzB2aGJ2bDVCZjdUMmI2
Ri90M1FzcGNzaWRac291SnU2Vlc5Z2RvZnlLZURaZlo5MkoyMUxaM0p5M2U1REd4
K0FSNFlacitpSWwvcUllT3dOMm10S2ZZWVkrQUs2aUFLbmd1cVFvYzZMWXJYa1V4
ZlV3M2pMK3B3RCtvNjhTTkMzM1FKL2xacktBVlFmeXVRR0c2S2RkV0dERStOaEJV
cktWWjNNNUVpckRMR1ZyNkxQMk1YZVRQNEtUc052SVZNZWFERE44cUJwazVGcmRi
NElmUHh6Z3psOGRabVR6T0Z2azUyUlM3Sm5HSVBuZWd2UXZZNllQNmJxQTVHdy9Q
aSsyNDBWQzh6a2dCcVQ5cm1kTWgweVJIN1pCQUlkRTNJUTZTQ0NBVm8xRGtPRWw4
Q1U0MkpNVWV5WkZTL2ZOaXhScGZJSWxYcG9vNUZjcHNRUVYvSWlEZXJTcDJDdEQ4
VVNiY2svMVNwdThScStBKzBobVFGcDU5SkdNU09yd3hNVy9EelB1MU0yY2IrN1dM
Wm4vRkR0Zzl2WjN4MkxWZlExTnRaZ1FHaHpaR3ZCblloSThqZU5IWjB4UjU3UTd0
dzJueWcxYm5HdFc2Sm1pTE5DUGtDL2o0aGxCUkZmcFEyTmIxUWZ0ZS9DVUxIWEtJ
clFwK1NYektSK1R3MjR6Q3dmZWJIWHkvcXRESGo3aVg3MDl1WEtCNjFuVFZ0ZWFq
Z1ZROFk4VEtXVjlSdWROVW1lOGZuSHovNEFxa0hjcUE5U1FIMGtKYkoxcWhkaUJO
dFUyMDhZUjlvcDBuSEJNTEVWRmEwSzN0TzNvYWxnYzkycFBUNWdOVFZRLzUzSkR3
OGtUV0JkbWNIK1lkaVdrcm90L1E5NGlkQ0grTEV6bENEYko1ZzV6VXlsNVIyWTFQ
c2FLOEJYNHNVakcvSEV6dnZ5dVJFMUdZUENXR3o2anZXZkErd0N4STNDbXo1SGN3
OGR6L2FxRHRwRWxuRWYrRXgzUTRJYWZqZENIa3EwditoMEllMnVybEFnbit1VGlo
SUNrTUtuS3BGUnpZTlB6NEJmMHNpRGUwTldpTnh2OW5xeUxvT055eWNLcU9OYXFU
UGtxblM3N05XQktLUE5jR3lqcmdQWlNSaGVMbEJhbGFoTUxrSlNvbk9sQ2V2RUdY
ZG5QSmRITGpCbkZ4QzdsSlBRUEdQSk5TMitzd1BkMGtnT3N1T3RVeDFGZlFNMG5z
aEJTRlVxWElyWXNjZnJRd21pcDNtZE8xU0tXTk4vYVlwTytOcFNCS1JFdlFKMmV1
YmJPS2swcmdBWG1kK0JmTkpicUQvbWorWGlkUHBPOTE4WVJiKzZSazByTVcvUVFr
VmExa3FCbENyV1NZbDM2RzZ1Y2FKU09wVWFCbTFuUTF0VmxSWFVsa1RIbnFZaHlz
cUQ1K3NrSnFSTTZwSGhMa1pFMG1aL3BPMXBzNytTcUtkcHNxcHh4N3FJR1FVRnNo
SjlkYUlkWEt0VllJQksyZEp4U3V0VUxCZ0haNmREb3BDMnIvTVcxK09raGZVTmRh
NlVmUVdsUFBVWFJKQ2dwaFVLZFZYckQzdGVSRXBVblNseTdhQkk2a3cvajJVaWl4
UUtseGxpNTAyQmo4MllDY2s2MkdEak4vKzd5U2lUc1NscjM0ZzB1Uk5haWR0SFds
eUljVFUwNTRGRkJQMTBBKy8vNUppVGlYcGErdUhrWVgvdE1HdjVlUmkvVmlxVkd5
R25VZDE1SWVyc0hzVm5za0t1bVBwS1lvUmk5ZlZsYXRxZ3lQS2Z3Qi83UjdQbTFs
R1g1bXhvQjNBdXc0YkhXNUxOZk9iKzlOL3VwcTBCYWRBMVQ1VGNXUWxXZW5IMGpp
dktRUFRwaEtwMWZkUWNXcEtnSDU4Q2N1cWJRZDZjVEZMczk5QWcrYzdkb1ZNS3E0
RS9Mb1VnZCsrUzhjeHMvTG9PZkxQMDZaSEFoLzR4eU1ldmlHSTlWSWZvVzFUUDhL
YTBDTnRORFpyUXB6ZDIrWi9yczNURTFMMXAybDE2VlB3SWNpcldncEFnYzhzN1Mv
SmV1ckFWVWRMang2MDBaOGxFWk9UOUFSTFFYV1pzQTQ2S21vYVJ6Um9NcFBpVklH
WjlmbWxvdVRnY204Vk8zRzBZREpUaVIvTzZsWS9HWlNjZktUQXJyYnl3MkY4OGlO
SE1rY2g2bVJDNy9PdEthY3pySTJRaFIweTZVV1IxU3lnbU8wQldEVnJYck1YcEgy
Nk5STUg0eEV1RWlZOHZIVXRHcEg2QTN3ejFPZEgrZVJMRmF5dGkvVnJ4SWF4dGpZ
eXFWdVBKdExyajZUdmduTk1mUk5EZGN0YnBtK1JjZkt4VytYcElsbmQvaHpPY3RB
b3A2ekdIcW9IRGZieWo3OC9ZVGtEYldWRnZya3RMWnBqdmpRRVA1Y2cxNVlaNUhI
OTZFaHh3TDhWUW02Wm5JS2ZzY3Iwc3JvaHlib28xNlJObHk2a1RaSnZ3Y3VKWDgv
VUk1VVE1OEg3RElLZGZLdU4zaEdEdno1TGtNM2JwTEZPUnllL0ZxTXMrSWtMU2ZM
NHJDTlY1aDBhRnpTM0hVOHVHUDhGL21RRHp1cnlpdktheXZxcStveHgwWm5rTGRX
QTY5ZzlPbkF1MWZBUDV2Uk5hb05EbTlPWUkwUFFIVU96WUc4VlYxc0RmOUZSRFpq
NGFvT0dDYmJBdkFIb0ZkbU5BL0ZrKzlnUTg4bmZIblRjVTZRSVBhWlZJMGZnY2Jl
RVJtK1l3aTBzZ2JJdUZmaTNnYndCcjlsaWQ4a3BIcjRod3dBWFU0LzN4aGk5SjB4
eXNlZk1RUTNqcjdocm9nOEc2UGZVcUcwS21MR0hnN3cyTVZhZk05bksreEZDbWY1
TWN6eUZXY0gyY2ZaaU1QcmZ6SmRZZmY1TUZ4TllZTENneFNXVXZoQStzdTVDcnZT
aCtFaDcvZUxGSFovc0Rxb3NJRjhESitnZEhubVdUYUZQVWpoaDI3TU9kTjFOL1Qx
Y1FCelJxU3d2WWVOWm1HUHZaQldXTXlGZGJJcDdRNmVaWXVMMHFBVDg3OUpPTi94
UHAvdFl1c2tUTThBekQ2MkwvT2xnSS9kNWNRd1V2aFNBUEJrL1NXM2g3MENodk42
Z2VHekRLeC9GdEFRWUZkbnh2SVU5bHdHcGowaFRQOHdYQ29wN0hiWG9od1lJME9x
M29PMlQ0bTJicURIeGU3TWZpZXNzT1pNREYrbDhFNkdvWnFGNFhJWncwVis3S1U0
RC9rcGh6RjlBWTNvajJrWXFrRWM5ZWNVOXFTZFY2aUExcTRPd2xoYzcrRFAxSGl3
emtOVVB4WkFMcjN0eHJDdkFITk9KYTZXRUFlYTB6RzhrRVkwbTdqNkowb2Y1VWJN
Q1NlRzYvSXd0SGt3REJHWDRnWEluem9YaHEwRnlDVjdJYmJxSms1K093TnJQb1BQ
YlZnSDVmd29DL256Mnp6a1R6Q0VPYmM2YXRNVTRCaW1oNm4rK1VXbDBnenB4RXpr
VW1rUjV1eFZNYndCWmpuRVRxWTZQeUxhWk1JNU40aGN1c1NKNFRrVVhrVTVTeWs4
U0Z6dHAzUTVjZlc3eE9IZlc2cURLTFUvcHQ4U3hWV0xKK1N6MHJOY3h4SjBHaWlK
TS9PeVhFMndRampVWFlpUUYxWWRRdjBDc2hJMEtpQW5RZTBDY2hIMDdWd09lUWk2
SkpORFFZYjZhVTNSaEtlSitjQWJRK2kzQ2tJQldITTNBdlJOejRRSC9iUnNLbXNQ
WVZrNk80cm8zQm04MEhZc3JPVnlLdnZjZWFHdGlZVUZsSkdHVURHcklHZ0dRV1dz
bXFCcnd3ak5ZZlZFeTdkVWhPYXpWb0l1eTBYb09MYVZhcko4RGlXb3Y4L2RVYyt4
QU8xaFRxaDVkMmJVc3dKYWNlaDdCQzBDQ052OVVZMENuY2NEaEdObzlVUTkrQXov
VEU1TEFNczYyV1dBTTQxVmhSQmFCZld3N0wrcDNUcDJINVc5cXlCMEVudVV5aDZq
c2o3MklwWDlUVVpvQzN1YktQdUVLTnZPL3NwT2c1cS9vSm83QU1KMmZ3Y3M1N0JS
OWlWQko0UTRaSkVRK29NZmE0NHl1NFJqdnlLUWx0ZkVkaklmUVZmbWN5aU5vRHU5
SEZJSmNyazRGQ0RvdTZKbWtLRGJjem1VVHRCUFJic01ncTRYVUJhSGNpOE5JWlJO
MElKOERoVVQ5SjBRUXJ2WkxJTHVWV3Z5RUlvUTFUOFMwTkZVRnJSeUtFcEc1MGtM
YXYzZHJFeXlGS1d4UER0Q2V4R0Ntb1ZrRWZheENvQVllOVdLNzFDZnhxb0kraVZC
WHdmSURUVy9zT0d6Mlc5Z0dmUjNjeUcydTRKcXB0RTluQ1oySmFzbDZIaUNybUwx
VWdhdUhBdTJ1NW8xRXRTU0FqbFNJTFFXQm5TNXJFT0tzbE41MXIxNjM1ZktjeEJh
TEJqZVR1RlNQNFlEb2VmY2RleEY5VVVJVzcwWXJxUndJNFV2Rjc0Q1lkRDZtanZF
amlrODRGYllDdmRyRVByU01YeE9lUkhDM3pqMC9GbVE4N2E3a20yMHZROWh1dTFa
Q0owVVZsRDRtUlhESDloZWhQQUpDQ1dXbi9PQnU0amx1USs2ZFRwL0lIMEM0VjJX
VHdEbndZSm5JVHpLaWVIZDFLODdFME9YRTN0c2RXQitTd2JtNUljd3ZDaUE0VWRF
ejhsQnhCRE0rUUxDaU9NZjFsbHNQTS9xS1dJbjVmbzhsU3hOZVEzNi9UV01yb2g1
MUZlZ3pzc2h4TFk5Z09IOVJaaHp2RlBITTR0Nm4wVzl6NkllWjFGZnN3aXp4SnJz
cjhGWXpwSmVBMTdsV3Y5aHhiRzhENlA0dVRYa1diM3ZFd3VHSDFINkVWdklBOVkw
aFBqREVvYm5VWmhMUFo3ck50S2d2S0ZtUis3N2JxeVA0V05oNVBZKy80dEp6ayt0
WTVSSzdOMmNGMkYwenlrNU1Pb0Ryb09RYms1L0RzS3lqQU9UMms1dGRVN3ViR2ls
Rm1Fckc0VlRXMDJteDJnN1o3cTJnaWZaU2ozd29kQ0dZUmVrRmZaak40Wm1iT2Zr
enZOd2F1dll5VGFVdzZNQmY3WFVhMm56VkV1cjVlTWg5Rkg0a0xRY3dudFlONFQz
eVdzOWRleUhscE04SWZDOStnQm5ZL2kxcEZ4dHNXMkhIc3NWRE8rMFl2ZzdDaGRR
enZ0VStqeUZ5eWdzZ0h5OTdXTldEWExXS1JpZVFlbkZsSTVSMkd6VG9LL3RJQWtL
ZXpRUE9UUHN4akNZaitIUk5DODNwYjhDMHZLeTZ5RFc4ZXp5OExBempGYnk0cXl6
c3NaaDAva0JRWmV4dndaUEJTaW5pRVBucEozdHNiQjVSWHJaQlI0YjJ5U2dsV2tY
ZU94c3A0QnVUTHZFNDJSWENPaHo2UktQaHowaW9ML2tYT1B4cytjRTlFWGh0enhw
REg5UURxR2Y1OXp1VWRrOEFiMlVjN2NuUUo3blBuWlorSkRsSVU5NkV2Sm5QQUxR
QmxIejdyVEhQUmxzVEVBL1NWdHFDYkh6QlRSTCtya25rNzByb0w5NFpsdXpXTllN
RHMxTC81VW5pKzBTMEg1M3RwVEZ6aWJvN0t4VHN5U3d6QmR4aU4zbHZ4cWdUbndZ
Q25yMUlmL1pBRDA5VTY5NU5zdGh2NXRwdE1zVi92dVR0b2Y4WnVpdUZLaWw2RVdQ
QWVYay9OYVRsNFNXRk5WYjhwTlFIMENGU1dpMDZHMVBVUktxSzNyUE15TUpUUlI5
NkpuSlBpRmEvaUJoNzdOWnhTd08zVVdRcDRSRDJQdHNsaU1nN0QzQ0lnTEMzbzlt
TndnSWU0K3ltaWlIc1BjeWRvZUFzUGM1N0tDQXNQY0tkbTZwem9rMDhFcCtVTXJM
ZG5vbFZzT2VLRFhrcklaRnl6aDNmNW43TjRCYXl3d08xcklsWlp6WG5welBQYlhz
Q1ZGelpkanFyV1hCY25QTlBBNHhWNW9UeWw2czR0Q0R1WDV2SGR0WHphSGx1VTV2
QTN1MzJtalh5R1RhM1o3dFVITEJPckdaTmVheTBpUVU4amF5T2JVY3kyMnFSVHFP
YlJUUXVZNFozdU5ZVmgySC9zdUNaZW4xSEpxUUVPcHY0TkJGMHRYZ1czMGtvTnNJ
dXJlUlE1ODdzT1pkY3puMHRCSUJuTHVQb2Rsa3o2UlpwQVhzN25rR3p4YUltYjQ0
L0Vad2p0ZUFocjA3RlA3Vm1YMEFYV3l0OVRZbklZdDNucmMxQ2VWNU83ekhKNkVM
MGxkNGx5U2g3Zm1idkN1VDBNMTJ6YnMyQ2YzUmZvcDNmUkxLS1R6YnV6SForOHIw
Szd3RHliTGU3RnU4UTBub3Z2eTd2U05KU0lQK2RpU2hldTh0M2wwRzFlRUh2T05K
Nk5xQ24zcjNza2RwN0tCZnJML3duc1pHaitWUWlmVUY3eG5zWVFHTldGLzFuc215
NW5Ob252VXQ3MWxzallEdXlSc0huN0JmUUNlNjMvT2V3KzRRME5jSzN2T2V5ejRT
VUszalZlOTViTWx4SEZMU1AvUituZDBsb0hYMlY3M25NODc4eTlnMmdDNWd1d1cw
UCs4RjczN21hZUxRRHRlSDNndFp2NERPRGJ6Z3ZZZzlLcUNmWmgzMFhzenltam5V
a1AyNTk1dnNCZ0Y5TTZ6NExtRnZDV2hiMk9lN2pOVzBjR2dpL0o3M2NqWXFvTEw4
OTd4WHNIZGJESm00a24waXlxNnpwZnV1WkF2YU9IUUxRRmV4ZWUwY3VqV2M0N3Vh
UFN5Z285VUNnQzVheUtFVEFMcUdqUzdpMEFPZW1iNXIyVzBDdXQ1VDZydWVQU2ln
NzNtcWZUZXdvUTRPRlhubStXNDI1TXpkNnZzT2U0L0tMbVl2TzVmNzdreVd2UjFZ
N2ZzK2N4elAyMjFKeS9FOXlOWUlTTW1QQVhRblFYejkvWkRkenlHSFBkc2kvWkE5
THFEMDdEUW9lMTVBNzJkWnBJZllBUUY5QXRybUlmYUJnRElLTHBCK3hENFQwTXlD
SHdMa1dNeWhaNkhkd3l4RFFLOUJ1NGZaREFGOW1uK0I5R05XS1NBN3RQc3hPMjZ4
UWRralF1YWZ0TTBKYlBXWm9SMitSNVBRWitwdTMwK1QwTW01ZTMyUEo2R0d3SWVl
SjB6UXViNm5UTkJGdnY4d1FaZjdualZCMS91ZU0wRzMrRjVJUXBaQXZlVWxFL1E5
M3l0SkNDM1hiNU1RV2k0RHVyUHdhdlphRXJxLzhHd1RkR2J1UGI3WFRkQWp2amZZ
d3NVRzV3K3c3c1VHNXcrd1RZc056ci9KUmhZYm5IK1Q3VFZ4L2kzMmRSUG4zMkpY
bWpqL052dU9pZk52c3djNXhIN2gvTG52ZHl4TWl1b3k5cUR6Vjc1MzJQNGx4cXk4
eTY0Z0NHM2MxUUJkczVSRE9OcDMyWnBsSE1KWitUMTdUMEE0SzM5Z0ZjczVoTFA1
Ui9aS0V0cmhlNStkMHNraG5MSC9aSzhub2N0OUg3SzZGVHAwcnU5ajFwNkVMdklk
Wkt1VDBQVyt2N09CSkhTTDd6TzJXMEE0WS8rZ2k2RWMrcDd2UzNibVNuMUVML2tr
NmFBb1E3dHBsZFoxY1FobnpDcWRJeUNjTWF2MHVvQnd4bXpTaTkwNjlJaFBrWjVZ
WmN5WVhYcCtsVEZqZHVuTlZjYU1PYVQvV21YTW1FUDZmSlV4WTA3SnNkcVlNYWNV
V20zTW1FdWF1ZHFZTVpkVVE5QVpOR051NlNLQ3Zna3pkc0Rua1Q1Y2JjeVlWL3Br
dFRGalhtbmtCR1BHdk5MVEp4Z3o1cE95MWhnejVwYzJyakZtTEUyeXJqVm1MQ0Rk
c05hWXNYVHBZQks2M0pjcE5hOHpaaXhIV3BtRUx2TGxTNXVTMFBXK3NLUWxvVnQ4
TTZRejF4a3pOa3Y2S0FsOXp4ZVJ1ay9VUi9SN1g0bjArb25HakpWS3A2MDNacXhV
dW1POU1XT2xVc1VHWThiS3BGZVMwQ08rY3VtVWt3US9RZlBOa2M0VkVHcStPZExs
SnhteldTSGRmSkl4bXhYUzNTY1pzMWtwUFhxU01adVYwaTlQTW1helNucnRKR00y
cTZUM1R6Sm1zMXI2dTk0N3RLdVdIRDNHYk5aSXAvVG9zL21mdmxycFlJOHhtM1hT
RnozR2JOWkpveHVOMmF5VG50bG96R2E5aE04RjlkbHNrRVo2amRsc2xNS2JqTms4
Um5wbWt6R2J4MG9WZmNac0xwRE9UMExuK2xxa2E1TFFSYjUyNlk0a2RMMnZRM280
Q2QzaVd5STkwMmZNNW5LcHRkK1l6UlhTZy8zR2JIWkpDMkxHYks2U2ZoOHpabk9W
bERaZ3pPWXE2WklCWXpaWFMvTTJHN041Z3ZUV1ptTTIxMGovdGRtWXpUWFM1NXVO
MlZ3ck9iWVlzN2xXQ20weFpuT2ROSE9MTVp2citHRTg2R1NjbFJPVDBJUE9QL3ZX
SjZHRGxndWtEVklWdFR1VDVtaUROSStnSjJrMk4wZzNDQWpiblNSNUJ6bUU3WHFr
bkVGamJudWttWU5HdXg3cG9rR2ozVWJKdXRWbzF5c05iVFhhOVVxakJQSGRVcS8w
SEMram5kUW1xWE1iaCtZRVB2RnRrdTRWVUVQZ1MxK2Y1Qmppa0NXUXhtTFM2SkNP
VS9FUFNKY21JWjkvaTNRWFFSZXpndHgwLzZCMDVuYUVMbU9PY0o1L216UXZ3YUh2
NXhmN2g2VjNCZlFyYjdGL1JQcG9sRU9xSzgrdlNVL3ZObXFPU1MvdTRkQVR1YVgr
WGRLOGNRNGRtMXZzM3lzOU1jNzcrN04vcm4rZnhFN2gwRC84VGY3VHBYbW44SnBu
Mi9QOFowcnJKemkwSUh5QzYydlNLUUo2djJDUi94enBQUUc5QU5CNVV2ZGVEajBO
MFBuU0pRSTZBTkIrNlVVQnZSdGM1TDlJNmp5VlF5OTVWdmkvSVQwam9BK2c3Rkxw
dHdKNkpiekNmN24wZ1lCdWg3S3JKSFVmaC80RHlxNlJ3Z0lLcUNmNnI1ZldFTVQ5
eUJ1a2kwUlpsMmVUL3dicHpOTTR0QVdnYjBsbm5zNmh5N3g1L2x1a1U4NHlvTnVr
QmVjWjgzNkh0T2c4enBjMzhvZjhkMGpubkdmVXZGTjZlci9SM3cra0YvY2I3WDRn
dlU3UUdXd0xTL2gvSUgxc0tydGIrbFNVN1dYMTFyc2wrNFZHMlQxU0RrRjhwZDRq
VlJEMEJQdWxINkgxS1RYN0wrUll2czUyKys2UkpreGw5MHBuaWJKcm9PeGVPc1U4
QmkrZnNDZENSdnJYUVV6L3pKVFAwNithOG91eThkbmFzMGZJa2RodkZBem41dXFo
TEhMK2xtNlVZaXM5L1QyM2tlYmgyVVVZRnVNdlFiUFZic1R3M2NLdlNwdHpMUDlt
UERFVnc3M0VreVVPRE44SVlaM1JBS2JuVXc2bVpmYVRJbXkxRWk5QnNUT0QrTXl4
SEw5Sndhd3VySE44dWd3aC9uU3FIczZudnZiNTlSeVphVUhFOEdZYVlyaEpRUXoz
NFkrUnNsR0hVY2VjVGppdy9seTNEUFYvQktHTjlmanhodlFXRTg0WTFkbXJJTTZM
Q09lK0VPSmNtb1ZQVVAyRmsycytZWitjOHpPOHFjSVVVNzh2dWpIL0tyejN4WjZr
Zmp1eXNkOVYyVWFkUVN2V2lWR2RSVlRubmdLczgzU2VHYjhNZFNheWtmNExxTzN1
ME9UZWp6eTZ4WGJFOEhzWDFqbm9tdHgyM0VUelNzcTUxSzdQbXN6ZWRCaHphb1F5
ZThXT05iTk4rZk9uMUd5ekcrbFRUZWx2bXZDYzdVOXRLNHZTbjRXTm1yejArUFRE
aHpKcnlKZ3V4OElXcU1qYmFuVzZmSW5OSWVrNlBnOXpUaUdadkM0SFozOE52bmpO
enMzQjJmZVJ6TGM0OFdjVCtaUEVZNXdTdEZvSG9ZVU5ab0ovenI3cFI4NlA0cHRF
N0VZL2ZtZnVRWWZFSE94cG92eXpBbHByL2lPRlQ0WU5icGpUVGJTQ0xzeE56ZGZY
M2Y4WE9hbHBzeFppcWhFZWJseGM0eDFqMG52VGoraHc2Zis5a1k2b2hyUWNuLzUv
eTZoM0pVZjlyNHozLzdaUm0wZDZ1TFRSNDlSK2VhazhqUjdqZXMrc3FaWTRVbk1P
bHo1eVRWNnEyOXczeUxxaFJiYVRSVTV0OWFnSDA3YTB5ZW1wZlhIUGg0L0ZQQzZl
bmgwMmZKdXZUbHZZK3g2RFYrYjVNcGYrUHQ4b05kSVc5cU9nd1hOT3crU1ZtNXB6
Skw1WlVpemRTWWNwblVHMm1QdG1YTTZiQWg0MnlMeXNBdjRHV1E3ODVZRTNtd2R4
QWNRRkVJY2hEa004Ri82Y0REMVBGVUlieTZaMEVZUXVWc253eVVramhVMFVkbEM0
Z3NLMUZBNUNtTUYyVUN0Snd2QTA4bmhmbFQ0b0RMTnoyVDA1SlJDTzVGYXdqNkcw
QnJ6eEx3THoyYWZTNG93S0NCY0dXcGxUL29sekNlVC9KR2NscEgrVHRnWnF2cHgv
RXJ1U2FtYkxTL0lISUdUaDNaRHpodmRzcURQTHRnVEN2K1NjRHpYUFVML0IzbVlz
ZkRVcmtwOXhmWmRWeWkvNzcyRzNzV1BzRDBHNEx2OXh5TGtqNnlsSS94cXM1TVZB
NXkraDN6TlU3SDIvK2hzSTMvRCtGdkRzRC80T3dyYjg5MWlUM09MNkhOTFZCUmJw
WStuU0lydlVKR2VsZTZVVmNrVjZVRm9yWnptL3dYcGxHcnVNVCtwT283Ry9UZUdW
aEIvcHRMRjB0aU5ybnBUSHhndVdTVE5aWm5namhLdjhNY2c1clhDcjlEekRYUUsy
T2h1bzZwUytBZldMZ3J1bGRNSnpNWnNuWFNEdG9GNUsyYjJPS3lURStVT3BsTjFX
OEEzSXlRbytJbjBxZmN2eGhKUXR6M0E5QStHeklRemI4dCtFT245MmZnTGhqaXlm
WEFPOWI0VDArZjRDU0dPL3BZUS9XMzZzNEUyb1gxTTRWeTZGZm1QeUh2bk40SkQ4
cVRRQ1ZNMmpYam9rN0wwVjZuOWR6cGI5bm92bFQ2bnRwK3lzd2gvTDh6Z05rUDZw
dklUOU1yZEF2cEtvdlZIR09qZkszM2ZNc053b1Ixd2xsbXpBVXdGaHViTWVjcFlY
SEdzcGtxNTN0bGljOGsyV0pheEl1cXpRSXYxUTNwVzJGUEpaVHBlbG0zcFpUMkcv
Q085MTdKYU9sblprN2JGVVN1TUZwMW9lazAvem5tSHBCeHJPZ2ZySXQwb0pSN2Vl
OVlRTGdEYU9BZk0vbGpaa1dTQWZhODRqVG41TWNydWU3ZkJmYUJtaSt0MGlqZldY
VUowaEZzeDl3RElLUEh6V2NncndNQ2JOSTM2ZVNmdzhremg1Q29VL3AxRXZvZEx6
cWZSOHloOGlHcFpRK0R6STZoY1dsR3JGZWhvOVM3dUU1dWhqbXYwbSthaWkyZGFQ
cGE3OHFIV1BmR05lRmFSL21Wc1A2Vk55NWxtdkVmei9VLzd4VnBSU2kvU1kvRXph
c0JWRGxFOGxMMkZWUmJvcmY3YzFXLzZhOTFRcjluaXhGV1htR3VzSzZTZUZkMEg0
U2VnYmJJWDAzeEIrek40cXZKcDlTdXY5WStuRHRHZXRLUGt2UU1nS2YydDlXNzRv
ZEJEQ1grVC8zZm94ZTY3b0h4QmVXaVRaS3VVSFFrc2haRVViYkc5TEIvd0R0clVr
SVd1bFcvTitiY1BlWDdGOUxQL0JhWkY2UmY2dlF4S3MvV3V6U3lEOTU3d0R0ay9s
cDBKL3RFa1dMSFZhZUoyREJhQjVMRGU0YmNvT3FUenNnbkI3anFwOExGMmgxbHVi
NUE2MVFDbXk5T2NVSzhpQlVrVzFqUG9ibFNhNUxHZUJjclRsQ3ZkN1FQL1RSVlhB
cTVkeWxpcDc1Si9uTExYc2dkN1hLcFh5a3NCbUNGdjlReEN1RGV4UUtpMG8yNVZ5
cDdSVGVWNWVLSTByTjdPWitROHBkNUMwM3dFeitJSnlMODNnelNRdEQxUCt3elN6
VDFEK0V6U3o5MUw0TU0zc3pTUXpENVBNM0V5eTlBelV6N2EvU1BVZnBqWHlNSzJ2
aDJrTjNzeFhrUFNTZDZ2ME9xVmZwN2J2VWk4ZlVLc1BDUCs3SWg4eHZFc1kzaVY2
M2lVODcxTGJqNlZaenAvYUQxTGJMNmp0RjlUMklMVTlTRzBQVXR1RDFQWWd0VDFJ
YlJ1Si81ZFF6VXNJZzFWQ0RGWmFSNWRRMjB1bzdTWFU5aEpxZXdtM0ZKWUovMTdI
RUsyYWo5bU5JQnROaEMyZCtPbVJrSlBwaEMyZFdxVVR6ajN5cjd6Wk1HcnNLNDlL
OHloL0psbU5tUkpTTWxQQzBsSXFmWjNyTWFyenNYUWo2T0VWMHNudUN0Q3VDd01S
SjhwMmhmTmpsdWFzcGZSdjJNZTBFbXNrWEMrdnMwL1N0anMvWlYva25NMXVsQzcw
WHVwY1lTa01uODFXV0xZNnI0WjBlOXBORUdhQzFWaGh1U2JyTnVlZ3hSKzRCM0xP
aC9SdFJNOXRrcytPVDhoZktuZ0NjajZBOEFlUS83cHpqNlUzbU1aK0NEamZjWjVt
eVZmZmg1d25QZTg3SDZQU2M2bjBYTXVybmkrZEYxdHdkV2ZMNHdHNzYrZFEveWpY
UE1JOFQwSnRoaXYwQk1oQlNYdGV2bEU2eGJWQ2Vnclc2YXZ5WHUrcnJ1ZmxLNlMz
WEZkYW52VC8wZVdBM2RzaENEM000bmF3Tk9hQU1KMTVJY3hpQVFoM1Ura3BVQXJi
UnVtUXk4bXNFcVlka2dOQ2orU0Y4RUhLZVpoeUhwV3dsVU1tbkRMaGxBbW5URGhs
TE0yVE15RU15M2tRenBTTElJeklzeUNzb0ZZMTFLcUJXczJqVmd1b1ZTdTBtczM2
Z0pKeTVxWXdDSjVtT2N0bEYwSTRnOTBKWVpROUFHRTFld3JDWTlpTEVMYXd0eUZj
VFBsZEVDNmd0aHNwM0VmaEdSVGVRT0czS0h5VXdzY3BmSXZDZHloa0VvWmhDaGRR
dUpIQ001UnQySmJDeHluc3MyTjRCb1U5MGkrQWVvVkYzZnpZT3BQeE9BdGl2TEtD
OTNTdlkvanJLQko5VWVZNGhrL0NHRnNBTWI2NTNnUWpuTXN1WXpld0Q5bmZXWUUw
TE8yVHJwTXM4a3g1c2J4RzdwSHZrcCtXYjdUOHlTSmJ2ZFlDYTUvMWN1dU4xdnV0
ajFqZnNqcHRxaTNYZHBTdHpGWnRXMkJiYVJ1eG5XSTd4M2FKN1h1MisyMlAyejZ3
ZldZTEtXMUt0OUtqbks3c1Z6NVRiUGFvdmNIZWFsOWxQOWwrbHYwNis4MzJIOWdm
c0Q5dGY5WCtSenR6ZUIxQlI0RmpqbU91bzhXeHpySFZzY054bHVOSngxc09tM091
YzZteng3bmJ1ZGQ1Z2ZOaDV6UE9qNXc1cm9pcjBiWEJkWTdyQVZlQTRRMGpHVVpo
Wi9uQXgwTG1aMGZSMjRLdTNEMndVOGpLM2d2aEYxa1lSZ3BPaC9CTlNyc3AvYS9t
SHhuYjVGS1oxWU9mSzdNOXNGZVEyTWtReW15Y2JrcWZBcUhNSnNCN2xkaGVDR1Yy
S3RBdU1aUVpHYnhRTDZSUHAxdlVsOEY0SkhZNWhESzdBdnhjOU5OVVNGOUZkNk92
aGxCbTE3QU1TRjhMb2N6dUl3bTRIMEtaUFVDM29oOGsvdndRT0NTeGh5Q1UyWStB
VXhKWWgzdzhYd09PZ1djUG9jeGVBdDlaWWk5REtMTlhRT2JCRTRaUVpyOWx4WkIr
RFVMOEZkUFprSDREUXBuOWxSME42YjlCS0lQc1JDSDlDWVF5V09jeVNIOEc0Vnky
UmM1bjN3bmNHL2hGNER1c1Zsb29yWlV1bGpMbGNmbDBPYyt5d1JLejdMQmNZWG5j
OHFybEhjdGZMU0Zycy9WTzVVbmxUZVVENVMrS2FwOWhUOWd2c2w5dS83UDlVL3RL
eC8yT1J4eXZPajUxZk9tSU9aZTdtSlRORHVIRlhDbVgrVE5RcHM5bGJ3UmxpTC9P
aHIwWVg4QXV0bUo4SWJNUWZESExvL2liN0lKMGpDOWwyL010RUYvT2JyWWpmQ1g3
SThWWHM1eENqSzlsSzZuZTlhd1hUdzJsRzlsOStSaC9pMm1VLzIxV1QvaSt3eTRP
WTN3YnU3WkFadTNTSDJGVlNoRC9KM3M3SUxHUllnbTAzSnBaRWtqQlhSR1VBa2RV
QWltb2lLSVVQQWZoQkxQdVkyTFY2djlnQThOa0UveUJ5MGJ2NEZqbzdSSTlMNE0r
RjVWYTc2WEE1THkvdW1KNVUrdnhlLzIxb0pQcldBRGtOTWdhNEs4Ui91YkMzekhn
cDgrRHYyTlpEV2lPR3RBYU5hQXhha0JiMUpCdUNiSlNwWjZOUXYxUmtNMVJrTWxS
a01WUjJLblV5cmZEM3cvWjdSRGZMamRLUGRhRjBpZ2JoTDhMSVgwN2U5R3hTeDZG
SHMrQWxYdTNTNkl2bThDL25wNnUwZDdSd2I0bVRldmQwekU4T05xOVp5VFdOWGh5
N05pcXVnbzJiMzVmVDAvcllHSmtxSGRQeTFCdklsRlYyVE5ON3JTWlZaVFoyTlBU
Z0ltRnNkSE9iYkU5SzN1SE44Y1M4emNadVVzN1d4QUVvRFUyRkJ1TnRRLzFiaFla
WGJGUkExcTB0S21sYTFGVEpXdXVhVzZyYW14dGJhaXBiR2xvYm05c2FtK3BiV2lv
YktocWFXbXNyMml2YW11dWFXeXVxNnh1YXExcnFhMm9xR21ycXF0cXFtcHFyNmhw
YUsxcmJhdGtIVzNEWTl0ald1K21vZGpHU3RiVU56b1lIOTVvWkkvR05ZQ1dEQ1pH
SWVvZTNCNnJaQzByVzZxcjJOTEJQaTJlaUErTWxwOHdPQXp3eWxodi82cU80VkZJ
ZHNkRkF2TjRxbjFzdUc5akZWc2MyN082ZDJnczF0azdxQUhZT2tqZDlXcDdBRUNl
RFBaWHNSRU1zQ2M5cTFvZ3JLdUJCSTk1UVEzclhOeTJ0cXFpb3BZMU5MVTNWYlEz
TjFUWE5OZFZORGJWMXRmWE5sYlUxcmEwdGpVMlYxUldOTmZYVnpTMVY3ZTNWRFRX
MXRUWHQ3VzMxcmEyMXpUV3QxZFcxMWZYVmRUWHNoTzBRZUQyNE81WVAzL0hxN0tP
MWJZMk45VldOVFhXTmJSV05yWlhBTk5hR210cnF4b3JXaW9iYXFzYWdPZHR0Ulgx
alcyQXZMYTVxcmFtc1JYNFhkOVVYOXRRWFZ2WFhGM0hZSUtxYWdGUGJYTkRRMVZy
VTN0ZGEydExjMnRiZTF0MVEwdDlUVzFkUTF0RlpYdGpmV1ZsZTAxRGRXdFZYWE56
UTBWelkwMVZkV045TlhSUTM5VGMzTmpZVUhjRXFheHRyR013dXcwd21McUtGaUNr
dWEwYTVyNmhEWWJkVU4vUzNsUlQwZDdRWHRkVVUxTmZYVlhSWGwvWFZOblFYbE5W
MGRaVVZWZmZYTmZhM3RSU3h6cTM3RWtNOXZVT2RjRmN4MkF5NjQrMERLb2FqbEJh
ZmFUQ3l0b0dWbFBWVnQ5Y1hWOWIzVjdkVWw5ZldkdFlXMUhUV3RQU1VsbGJXOTFh
WDkzUTJBUWxsZTJ0amRVVjlkVk5sZldOMWEzVkxVMHdTVFhBaWNyV0JyWTVOdHF6
cXJ1OWdRR2REZnIwTitMS1l2T1d4dnZIaG1MejJieE9iWEJuNzJpc1kvdklVR3g3
YkJqcGlRKzN4a1o3QjRjUzg5bkNGcmFsYTBrTDQ2c05wWmt0YTFyYTFvb1pYWHNT
bzdIdHJiR0IzckdoMFNVdEhhMXNYVXlMWTN4Q3g3TFc1U2QwOVRSMWR2WjBVTjJP
NGNSbzc5QVFJWWVjMXRoSVBERTQyaElmSGhqVXR1dTVVRTlndzVXMVU4OGVhUm9a
U2NFUzYwZDlBRmxkUzNwYW03cWJlbHBQV0w0U0lhZ0NRKzJQNzBwMERBL0VCV0s5
RUNqcFdkTFIwcmFzcTYybnZXTkpXN0wxc3VYTEVNQjA5OXBPVEhhMGlvU3BEV3Zx
N2w3WjBieXF1NDAxTDFuZXNyaW5zNm0xcDZ0am5RNVNzbTFaOThxMVBOa0Z0WmN0
cERsbzZtcnA2S0N5anJhdW5zNjJsVDNVSkVsQTE2cWxvcSt1N3VVcjIzcTZseTl1
VzhaV3Q2M3M2bGkrVEpRQUs0R1FwbTdNNlZ5NXZIVlZDeVg1SEpSM0xBZXRzNm03
Q3dhOU9WYmUxZG5KRmc4T0RXRzhNZ1lzMDBZeDJiSjhXWGRYejZLMnB0YTJsYXk3
WXltRVBLdDkrZkp1QUVSSFM1YWtzS2xyYWo1bDhUUU1FWWh1Nmw3VnhacVdkQzVx
YW03clpxczZsblhydkd2cTZtYmRiVjA2TENqdjZWcThTczhCcVV3eW9ybGpXZE5L
QSt4YWwwd3VYYldrdXdNemRxSkc3T2xoZlp0QUtycEdZbjJEQTROOXJiMmp2V3hr
NStTY3ZrMmRvRU5USzAzTlF2VzRKVDRjSTZBZmcrNzR0dGp3VWxnQ3FhdDlOZWox
WGx3Q3pVUHh2bTBjMnA3b2kydERnNXNZckorNE50cVNHS0czV01HaTZWUFRFZ2VC
SmMyZEtGOFlHNDVwZzMyc2FRZ3dzTzBqZld4b3NLK2puNDBzR2V5TERTZEFwUTdG
QUFTS3BtU2d4Tk55MlN6eUJuakVMZCtxNGNFZFl3amlXZ0djZk9uMDA1SVlSc01V
V3o0d01EUTRIRXRaaDFCOVpGZmk1RWw1ZzZrZ0xBeStXQVdHbERVTEdBREJwS3kr
Vk5DMGxta2t1SnI3V1MrRkM3WDRHRUY5b3dKWDIwN1FRWUlLek9yVVFGSDFqWFp0
R3lNSUpzK1V5eUhCSGN3WDBZcXhtSVlKTkttc2U0dUcwWkk0QkUzOS9XeG9wSG5Q
YUN5eE1qWTZwZzNIRUY2K002WU5BVUVBZE1aSHhtRG9NU1NnYjJpc1B5YW9od3p3
UC9yajIwRTVVNDl0dTBkancvMmdpUWI3R1ZocENKZkZkaTBjZ3hoWGZQUFk0RkEv
YXh0R0VzQ3I2WXRoejh0NnQ4Y1NJd2hzYVkzdGhBbG0vVHhhTmJKWjYrMlBzVEVS
OSsvcWlBTlBSN1g0VUVzYzRBUmdYSW9KbkhwSzlPL3EydEtyOFhSbmIzOC8yR0JL
dHd5T2JJbHBsT3lLb2RoMVFjbFFiQmxtck5rK1JIRnJyQThqTWc3RGc1UnVHNmFv
WFlzQkN1RFdLQWxlVis4QXI3WTBsa2owYnFZeGtCT0duZ2xQYUJ4YzJyVW9uaGh0
QVpJQU1oUVI2KzdkeGpIZzBMdlJheUlxa2dEeWNYam5vQllmUnN1enVsY2JwR3pE
eVdJZDZCYkdFenlkb0hVcVpvUWphRmtFc3dLSmxXUERvK0FGdFEvR2h2cEZGcEp2
U3VLSVVpdWpzUlU1UUFoQzdWcDh1OGpwN3NJR2JLUnZrMmtwd25wSkFRMWVzUzNk
TWJDZ09rUWFKTUhyd01LUFF6dzBnaUNPbmVTY1BMc2t0SEp3ODVaUmdvWXhXQmti
MEdLSkxkM2FHS2lRZm5UdllNWVhhaUE2bE82T0l5cEtndExpQ1hMSmxzRDZoQTYz
YjhKNFNSd1UxOUxldmkwSTRNcGxiU0RhT0V3MlFzcU9rakcrRGpyNk9TUldEZ0U2
Y3drZ2VpbWxLMEFDU0U1UUZOa0pJSGd4UStscE1WcHhwRGpOdGlsRm83S09WQkJF
VTlzek1wcWFDY0k1TmRPRWtYZ3QwSm5TT0tVRzFEcTJmU1NaenhNSkN2a1VkZzF1
SHU0RlBnRHJ1NXBXZzQ0ZTJHTmtKWklwMUY0YU1IUVVWaGJDNENsd1pRbjZLRDZ3
ZktCekRFcDdFMWdBUyt0d1JZWjZ4NVd6c3daTTlFaGNoMnBUb0xva0JFN1lVQnhp
dmg1QUJyUTluYjFhQW1VRnRGZENINGl1YlVHcENKUEFEUVF1V1ZpZnNGcEJMTGFK
dk83ZTdTTXdhZjI0VTBxSVBGeXRMYjNESkU0b1NpTXd3WnB1UlBxYlJzSGYzelJH
NkhjaW0yakJvcEl5U2xwam04WTJiOFo4STY4cGtZaHQzelMwcDN0dzFKeE5TalFC
bG1GcVRSUXNtSWpwQzAzZVhlL1FsRnBkc2I0eElIOVBaMHpiUHBpWUhnTTNwV01h
NFRDSytZQXBjMlZzcUhjM3BSSlRtd3Y3TXgzZTdTTzl3M3VNQXFGcktIOTBjTlBn
RUJCbUtnWExoTllJUGZSbVdHREVmbHBxcUhsRVlrUWtZTXBCZEhpNlMwK1FQd1I0
dHNkM2d2TG9HRzRlR3hpSWFiaUhZTVBMeDBaTllCZk1GeGlxazNHR0VzbDAxOWpJ
Q09nYTBGWERJZ09DNVFPc0E0emJib2gxcGR6Y3U1a1p1MndtOXRkc0FBTmM2Snlo
VERCR2h4YnJUZ3QzQ2picitvSGJaTEJOWk51RUJlTTZUQWZJSm1HaUk5RTFBczJB
a2NNSW9vNXVob1ZVVjhQM25zVERaV05EUTkwNDNjTW9wYUpnOGk1VldENEJjSnNu
Z082NFNKQjJvQlNxWmZJVk9kZzF0aW5CVSsxeHJRMjBLdWQ4VjZ3WDFqWGJ0Z1VV
dU5qQ0x1cE5iQ0ZCZ2dtbU5Qb25YWjI5bzF0WURGUVpDallCQTNvQ3l0dmpRLzB4
VFllNDlTQm8xSlRrMFlnMnVMMFhGeitrVVZxV3hJWTNReEltUkUraHY1ODRZUkNU
UzVwR0JrbHJEVzJPcjlJR1dkUHFwVTAxMjFDMVFJaTdWOUxrU1pXT1NnTzFTZS9R
b2hNNldubFdaeGVQeWQvbFNmQURlSUlMQkU5M2d5K1F3R1ZKa3NUejBCSFJobmth
cU9DSkxqMnhTWUN4YmR3aFhyUVFYT2ZlSVhKRDlQUlMwSEZiSU9iQ3k3amNBZ1Nx
YmJndjFyWmpEQ0RrcjFCdnd6RUVoOGxONU9xWGJRTUtZa1BWVmVYOUFDU0craWcy
bVErUkhkczlTa2tob09DbU1PNmtKVjB4YnV0R1FYQzNjeDhQaEZDQVMySDVhWHRN
WlIyQWcwU2JFc3RIVUh1QzdIRGswTWYyN1RFUXBqNmNGaERTTGR0QmYwek5BMGFo
L0JnWnVrZ2FPYjNKVkRlSWhYQlJXVWNMR3N4NGNrYkEveGthQmVIc0d0dE92aFhy
MnhMcjI1YUFCTG9PWGFDdzJDWVFIcmE5ZHpkR1EvRFh0UVNJSGtacmlIYVFuNkJo
b21rSVE1eXo1ZHJnNXNGaFdKMGdEZkZoUTVYVCtKZDNDYTBNNHFPblNMV0pkR3NN
VGFnTzdSU3h5VFFpczBiQjZKbzM4cnpjdENHWVVrVFRibVR1MkVXZU9XamN0dDBq
ZzVxb0thd0RQN3pUNXhzOExyRkw0NTZPc1dzankybEFKOFIzMWRXMEo5cUdVU211
alBVUGF1WUNuaTNxbUVzRjFaZ2NNWkp0UUp2T21rN2NZeUhRdjR0TU9aNWNrSzNu
dVIzTDIzYjN4VVo0ZW5nbmpndDlPQ056V1h3VWRUbHNRbVA5Umk3NW5ISFFMMlBE
cGx6VEpuRUtWaUdzNXBKMjRxaXB1Ylo1REIxMkl3ZmxLRDVteWdBVDA2Y044dlFX
RFZSMEFwbGdkdUc0Ym1DR2p5WXlkRjBrUUZCU0lyVnFlTnR3Zk5jd0d4UHhpR2xq
Q1pOT2gwL21oYzBYQVhWSytIVjRWTk8xZmRNWXdGMURzZGdJNjlvMkNNRm9mSVJ2
U2RsbUNvVndnRnU5Zytab0xXaDdTclQyN2xrK1FCQnVlbUFMcG8wdUc5dStLYVl4
amhsdEVnRGRvRlZFc25rUVQyNEZvUEVJVmhjbkNyUWJxaG9Ra3AyRFdFRG5FNzFE
M0NyQXprRTM2N2hYMVcyNnZwT2lIZVhTM21IWW9HbGdpVGRqSlBBSnhRVU9ITmZl
T0VzNkpXUWNOYmFMUjgxMEZnZnJjSlNUMWJtNHBhc3k2UUh6K2NjaVEwMU5Vemls
WFd0czRFZ3R6Y1drMnJUNDdqMUlPbkl1dmlTK0MyTFR5VHJmTFNhaDhqNGVVc1Nk
WDdGOVNNSmk1eENuV1Jramw3MzcvN1IzSmZCUlZ0Zit6aVNaSllFaE14Z05RaUNB
VVZDeWt3VUtoV3lRbElRRUpnblFob1pKTWtsR1FwTE9USUFveUlSQ3dTcHVkVWV4
dU5GcVhaQWlvcUtsZFVGY2VZcUFpb0tJbGFjK3RPNkkrUDduM1B2TmtrekM0dnY5
K243djkyWXkzM2ZYYzg4OTU5eHp6em4zeTB3YitBOVI5OUtOZ3BwT3J3T1ZpcWxl
UjU2SGNwNlFuTjhtQzFRR1phbVdkTEsvTHBEQlIwbFFvY3ZSMUFvWDJWWHY0ZTA0
S0NUaUVlMnRtZytHZEhzZ3pUb3RFUElNQ25sUW4yNzU5dEE4V1VsbHJwWVdsd2My
VHlzSzhwd2V2NjZUSm1rS3FJQWwwNjZFcFVlMVp2ejc2NlZocjBJTkhoVmdtTTdw
a0NNYXNnK0tJSGt1SkozcURnV012U21NcysvcGZqYVNFdkRiR1M1cE1FN0FBc1Br
V09UWjVvUE5RUDZ1QndxVEhaaTgxb0I3NHNGSzhTdjZRS0drU2l1bk5kUGJEMHht
ZUYzNGN4VnVaekd2VlprbEc0WVQwN0d3WlVxeFA1QmgwVkJ3aUNaMDRqTFQyWVQx
NSs1VWRZMGVaVGxKQjR5eFp5TWE0MHB6R2ZnaksrUGNXZ2tCcjNSaDMvYmJYNWlR
cTFWTDFzbWJ2YUtpeXV0cThRaXBXV1FhbGtSSlNTRzBsR01CNk8zdzFqZXJOQ3BV
aW5TRkF5NnJKZ1VhOVZJQ1hwUW5URWhUK292UWdaNWcxUXNCZ1d1SVhWMXpmNHFk
TGUzTzBEWnFEYlM1aVlIWUxyQlZOdVRWUTg0OHZHbXBwQjhiVFVGeXFaSjF4aHJM
bzlYckNZcVowa3ljVkZTMEdFU1hHRXBiUW91cnFJYXFzTDI5bThuUlUzMnE4bGtP
RjNaU0xXZXZBSEpDTldJWEJST3BiTU5xNVVnTnRnaS9kSGlFUHh5UXh4RUJ0Vks1
Ty9aaGloSkNZYW1ObHZqckxtK3NjTUdjYlNpdnV4aWtKa3RlT2ZhcXR3aXpsaW9w
L3VZVlBEelk1bXBybUFsUGo2QTczQXRrMGw1S0pJTVNWZWNrSEhnU2JlMjFXS0F3
Q1Z4b2didFhPNkFSY0FXQWxzdnQ4WmE3MWRsTWtLNkVCZ25TbFpRTDBwVmFaVkMy
c3EycUhYSkFsZ1l3UmdIMnNDSjU3Q1NodHRWTHcwS1ZCYzJSbW1yVlV1ZzYzRzVL
QXpubXBGT0dOeG80Z0l4NVVybE1jMnNZUUY1b1RjazdtWlBXQ20xYmF1TVFlVVYy
TFlsU3RYMVFxWlprMzByd2lRbzJFWGdqWHFIMlRiR0l0NjhLMkY5U2NkTXBFcDBF
YTNGWFRtTmJvMXN4ZG5sczVQQVFnNXdLV05BaFZrSWdML2RxemtQTjhHRWhaY3Jn
OHBNaThqdlZsR2J2QTRMajVoeXoyMHNwZ2puVHNVanFKVXB3V0xaTjNxdTg5WlNj
MzRJTEd3bGxqc1hBMVQrYW9MTkpHVENRK1FLSEIxNnFWc2VDcmR3dVRlUzFyVkRB
bTZRYnVSTlNnOU81QjkyMG9KSjBXbVNKTjVEUkZCS2xBMUUydFhCRWNIaE5LN09Y
UXAwcHNRZ3FscjZHS3FjQ1RSdFRtazRNTlBkSXh2M1kxMUhKN3JwUTZ0UW10Nk85
bVJCczd4U1ZkanR2c09BUzBoWFNOeGZzYmtoU3FFTlNkZ1RnSTJvMkIrMlBuZHBH
MmFtMkE1bG1pemk0dUtxMXZhMWRGckFKUkFtN2xuRHlWWnNTcjJSeWlvRXRwVXRh
blZxdTIxekFINVVvOFZEMHBOeGR0S0RkMnlrZldCRWl1VUxNRk9XaVFCUUpPOTds
eU5XS1BGd0xSTEVvRVpVb0w4QzFDaVZGUXNUa2lUSlJLTExwU1JQamJIa3ZxaEt0
d2lIcVJJdHdpa1FCSllPclEzUndLbGswb05TTFR6MnVpV0loVWpDWWhBdDFyZngv
QXEyaUVXbWRweEI5dlBna01oeTRTc2cxcXhZUzZud3U5eUJYejcyOW5QZHlHNDlx
S1dzOFhCS29YNFM4aENaTDNLSlRwTkJqUGNiRllnRjlwMjNDZE1hYVJ1akUzUTA4
Q0FNbm9LQ2Q3ejI3YU9jcHVJQ3NDNmtHTk1yaktia3dKUWZmNVlSS1FCNE5vUTVj
QTRTaCtoWUdUeE4yNHo2TFVXNUFiaEczejBPdWsyRXQ0QjVWR0xXSmtTRWlwcUNr
Z21FNTBOcXA0RHVaMklub1NmQ1RBWk8ra1BKazJMVXE4aERrRktHTGduVXJSRjRI
eG1vVjR6RTZ6YllwS0pVaDBwSExFR2w0WnlLVmhud3lpMFFwMzVQRmRBaVBMc0l0
UkpRWHZjU01ac0NISGtiYlZMd1g4VHNGTlM3ZzVRWTJIbndhMFNLRldiWUFiUW9C
cHd6MzJhZ3ZBOXdNcEN1NVpDSFN3dmQ4cW5BelVpME1STXFDVTB4bGNCMFlpdXE3
MThxeU51WStTVjZKa3JkVVFXaU85OHRmcFo5Um5oNTFwVXFhdXBmbmMrcFhZakxM
UDdGc29oZ0JQS1FVRlRESlNWeWFoQ2JiSStoM1p5TGFoV2c2Yy9KVWlHa2creHlr
Z2tmb1lESFJHSjBLZ3FYUWI2MTFFblFhcFlLaE5xQWRpY1cwSGhoMjcwOTllcS8z
bkxTRmNQNlVrV1dybVVHck1IeTVjUDJVVVNwUVdxZmtSZmJ3OUZvamNoYWdsamd5
SHBDSUh3N1VOL0ZDbHJwbEFmZVZ2RTlWU3lYckRQdU5FK0tjRklWTFFMNUxNRDh4
VEN2UDZ3R0g2NU8wK3BtQTJLalVRREFsdU5WQXJaV2Q1ZEtOcXhpZ2xSV3hVaEtE
QXZrT2pPWEFHdWxrZFNBU1V2eDBrbjJubzhVQ1VJeFdXQUR6RXN5OG11ZnJJbmht
MHJzZDFEOW9EbUd4U3dpZFF6Y0tEQTdnMWNCemx6emx1dVNVc1BKUXlESlV6N1Jx
RDhob1V2aldrdVArMmZxNnBtQVNMbFlPRGY0TnJsSHA3a1EwQ3U2Y0NFS1FvTldE
SlM0VzAwUU1UY2kzTXlHY1lmdG9HMDg3RTFRcUU2L2FLckVCcFo2ZUVJa0J0Q1hQ
NXoxaEVVM1U3QmNyczE4dzArMk1VNFhxbGEvbUkzRU9SeENSM0ZlUE1sYVM5WDVW
SjFMN2F0MVRlRVZNRnJCS2cwR1JqalJoT0JhTEladlRaR2FrcWZKTTVOSnBQeGgw
S2NxV2locEFhV1BScXhHWG9tWXBoTnZEMUNPYWsvcHNwTDB0NG1kQ1dHV1BGTlZ1
SWt5WWNnaFJHZmFzUXNBVjZiSStXZFhUUFFNVUozTm5LZEtacW13c2wyVWhwK3Rm
amJGYldQZ2hLTXVDKzJ0dEFsQzAvcGwrbUFGb0dTcVh4Ym14S3BmdHo2VXcxK2hO
NVRsK2VKZUtYSDhiWFVrMmVoQzFjZ0N2U0V4QjJ4elVFOStUMGFJQUpZVkk1VEpt
WTdrc0hYekpRVGxkTTFFekRwOWNRTXJIbFVyUzBYSWNQc25nV0FiYVpYT3ZUTURN
NTdJYzFCSjBnakNGcjdub2s4ZGpVSC9kNkdLMG40MVVvZWc3SlNLbTQ1TXNkT241
d0xRUXNLYWk5aGVRdlRMSTBBeW9na29vazFsb1BRZVlaS0pmTnMrT1ZHVWxLeFpw
MFRTZ25iU2Z4TlR1cThiSjVtY3JiK1hCWm9LVVNRL0xyVFJWbS8xYkRDbExVaC90
M0xZQnJjcHBSVjBRYnBzdkRURTlXQ0hOQ0MzcmJycHF4aXdwMkFabHhaRStxT08y
YnBaak4ydU5oWXdMZEVGNllGWWU5RW9GcDZzd01oa0d4Y0J0T3ZLVXJnSXZTb0ZE
QWJSQmdacFBLMkRBMkMyaGxWWVB5bVV3ajhheWtaNE5XbVl3ZHh0UVN0WWR5VUlt
ZXNoYW9rb214azFuR1NPcGFJVDhlM2lOZTRCZFBWWW40YVBTeWVHZGducW1oWWZu
TFZmTGVQck9pV0YyYmtHd05KMnByVlY2QzljczFvdXRxcGI2OU93UmpBdnA1NERP
SGhORXkwN1ZucXpwUWk2VDdUd1NrNlJ3dXQ2anh0S3dFcG55SHFocFYrMDlyREcx
T1RZeVgxdWtzNUZVeGZaL0c5dmN3VGg3MlBCUU0wME9OMzVIVU0vZ1BtSmNJQjNh
NnFUWXBKK2NQd0Z1TW1WR0JreUZBUFphQzRWOVUzZys5ZGJyakxsMFVXOWNraU1G
anlGeWdzY0x0RGtwaGVMczBEUjJkb0RMc0xmTXdwckt3eDVDbW8xYzRqVGtwdENl
RkZFQkUyRmpPSVEwSHpqVUE5YTJlcSt5TDhZb2xtcnVwVFFEbXBtcHBEcG9xOWNF
emMzTTBpQUV2TnBVdjBHUnFGekxWQjdSd3lNNjJHK1NtNVJVT3VUVDNwUUREWkdC
ZFp6TmVqdU5mMkFoQjdsODFnTGprS2Exbjg4N2J3YnJnd0tVMHg1ZHBQYU5UTlln
eWVKQ1FmOXNsNFBhWE5ZbldieFAwSTZScS9hZVROd2JlTzlKNXowbG1iVUk2UktD
VWFoc2tqejZ3UWZmNW1MbDRkUkNnVkZrSWcvM1dqQWhUOFVrU01YVmNLeGlDdGd6
aTZNVlZGTFd3M3VxNmVGaVQwZVBHc0FoZjhDdDZGRWRFcE1neUxMM0lxYWNVeGxE
R2dkbHF3cTJpTDNLbFlmNUVsZnBqMURZL2J3UzFnWmxEcVVJbVNMamhOUkZUUkJI
eGVDZVpUV2FCNWZRczY3V3oxdVIxRmV0SDBaZU9Pa2tWVkd2TnJ5K0pRN1NZazBD
SllueWhiak9GRW1Rbi92dFRMYUZhbitUUkdwVXczZ3crSFFXKzBVTVpMNEliVjBE
cGhIaW1yVllBNkJ0YlBmS2RSK2VtZDBaRTd5M2F2MkNBMFYrb3Z1Mi9mdVJQUlVw
NmdYOXVMQ2xQenM1VndQOXV2R3pQQ0NqaWJ3Nm5MdzZOUFBES1Jhcm1FY2l3NUls
N1FwM3pZVnhLTzF6Z2RCRlhVQmhwSW1oVUR0VStLZ3ZSYXZoRFJpRGdudHJ2T0dh
a1JlY0JFdU1QYW0wMjlZWERsWWY2bjVRRGFpZndueHI1eTFINDc0d0ptTU5ZUVRj
MCtrK2ptSklDLzErYlNLMENVVkx0VWpsUXVhM0syaHpyVU9hdGpMaG1LVWNIbTBy
SlB5YTFCemNUQTFOWC9RZUpBenZPcW9OZU5tL1YzZUtnYUdPSTV2QXd3dlpPSGJ4
dkZwRW1CWWpUOVppTEpidzVmK1RVeXRSTnJpYmJXSWlZeEVMZUlzU0dqY3Y4bURt
QklXMkJnVjdmUlFFczRNTXBjQk8rTFlFa0t4Q2NSR0EyQm1wWkRhcGFlTWpCL3gv
Mis2bEd6eE5rRnRSektPSFJtVEVva29PWlhoWUpwM2NyME90TEZmSWV0VENIRzFC
QnBZTU8zZWZSN1VpcXdOMmlxWnJuU3p0TWp5Unl4Ykt5cjVpMkF1VXg2ZjVTc0Vt
bEJabDBaWlFFNVBLcWJqWWR3UkdpNDA3V0RVQWpZUytzQkNaZ2VrM3NoOG5ZMEpT
RlZTRUNVUUNZbjFKeUJpYU1qZ2RMSVA5RDhrUTZWRlIzR0UyZVNnendtME9vWE03
blJHQjlhL3N2YXB3VXJydExEb3VQNXpUZ3UyWUpyb2Z2R2pDcFlXN3RiZ1ZtY3Yx
TEg2T0lFVktmc1Q4RU9NNFlIaXhZanduZE0xTzFWWnMweFIvVDYyc08rNkJvNm96
RS9ZY0duOWszN0d6Q3ZMVGsvcU95TkZtazNGS3JUSlBxUldVNnZEUVZxRnhBbGJO
ZlVieHdnUmdzMExiVndCaUc4TUx0NHI4c2NMTTBGNTI3a1YweldNWHFsbXBPcGN5
YmFoTzlKK2lURENTUVRHbis5WXFKYjV2UjhxaFZtdHZaaEpManJFV1NqdFo2TXkx
S2lvclNvSWpNTzE4OEJTQWtNcHVXWUQvcWQya1hzNlE2SjhLRXk2MExlbUpCU3hU
cldyR29SVFc2TU9VSG5kNmZlM28yeUY3VHV3YmYwMXJVZHNxcG1vWktDVmpIS0Q3
Z1BZZ0xHckJoK0M4aUF2T2FRZG5Jc0VPcUJXOFR4WnduRlpHYmxXOGRsZzlSeDZh
MmRRT3BQMkc3b3pUMHp3QlhkQ3J2aG5YWFZwQ0k0aWhabXlJSGhuY1BmcW1uZGFD
TWgyOTQrbm1NcWN5cURYdDYrYTVCa3VpVXhtV0hTR2FSMUxlcFJ6OHdJanN5RjhV
anB1eUJSbWVIcDVSS2xaUy9pbTNwZmlyc1BjOW13WEFacUYvZDJrTzBiM0I4VlBO
SlpsUHVFNlZ4K3dPLzJsSWZaQ1o3T2gxbi9XRTdLN2t2a3dYOHJTN04wdnNWUGQz
R1ZQVnhZV1RUM0dSMUVxaE9pODBudXZYWURONlVuWSttMVNwck12azhiRjB4MU9E
ZEV5cWl2NXExaWkxVjZPWEZNQU1tc0xSbVNrY2FVcm1hRHM5cUpITTV5RVUwYWY0
VERySFpDZ0dQMDdGNDlOVlpMZVErK21tMlpYa1NiNjRGVjhDSTJ2YU1tQlY5T29t
bGVUdzJCVGRwMnN1UjNMR2N1U0hzS3JEeUkwY0swcmoyRTR5ZnkxSkRuODFTVGFm
M2RBdVhnQ01kZVcxMEI0ajhRNFl5a1hnZ1h5cVFKWlU0MXJJYmFqdGVYaFRYUjRm
aENjRFNqbjZra2xNTmJxeTAxdDkwb0lnNHpleEJ3L0lSZ3RuUHpVcEdMM0pWay9u
clhlWmh1MFlnWEh5ZXNkYXc3aEV0ZS9sYkxDRUluWkZvRCtkbDJWeDlLNElsQzdn
ODUreGFKZXJvbkhaSExFa0p5U1hlVkhFRWxLQUh2TFVTRmQxcGh3cFVIeXA1RnFT
eEZMa3BrcSsvQVNvNVZ3ek14elVQcmhkcjU2UmNYZlRUbDZtWGJ0eU5BS25QYVJE
cHl0cklUeGZRM1RQNkZCYnBZcWozYi9oZyswU1BuM1NkbExoUEhVTkdneEZrdzlO
aG5yRFNrbVIyUTYzTFk4aTBRWGhaTGFCdlNJM0I1dTlKN0dJZXBQN2hXci9rY0hw
WXVWenkrZVIrckt2cE1WY3ozazMyOHNVcWhIelR6Nkd0QUJvMS9Dd2RqL2pzWVl2
NEgzTm8zYmJoY3F1b0gwMkVib2FsdklncVVObXNueFc4cWRjUHV4V253ZjVvN2tt
ZG51b3lDTVNsWHdGL0FFSHIzRVhPOWJhanFaeDBPdDNvRU41Q2Z4aXFqRWVQU3FS
QjEwUTJOVzBzdFBjeDJhRVgydFVVc1BycHJiSHFwUHJqUUtnOUdnZjFWVXdkNHQ0
TFFySG1hemVxUnloeWVjSVRYS1FkaWpoODhsa1R0Rll2SktiZnZvSWxYek9PUzFv
UjBqR3ZTSjBIUHVaakZQRkxUUTR5WHoyVTRwOG5vVFpYNU9Rc2VSTHBxYnhyanhP
aFhvQ0ovWmFLcDMxTUdsaWV1dUtldG9NTGc2SjFDbUxJNVVEanQwdEJybExwMnJX
ODJsQUNWaU9QYUNVaFBwbmNtVjIrT1BxOUR5aE50UDVmVnNJWmVGdHM2bG5acG5a
ZTdlM1V4bWlqTnU1Uk9qalhkV1FoRkp3cjR4UHc3dk5sYyttdy9udjBnSU1EcWRo
UGxtbjh1eE5NM3Q5Uk91eDhzaGxjTzk2UjVpeitkUnRYTWdUQ3QydHhnRDN3bG1O
M1daMFduRDZrSUtwSjVNQ2VockRmbklaeUNzTThjdDZSbWtLMU83VlBYNlZwc1d2
Y25yYnl3SlFlOExEeUhNREVZZnVXanZ3Vkc3cm1XcnJZYjNIQXVVWmVXaGtMMnli
NFJYZDVGK0xmZmxiRE5ZODhIeVdJWnFEOXRpcXlDTjVsMCtQTlBpbFZ0S3ltVnZM
ZFJSOFBLRUZlUjF5RGdYYWVPRnNqbE9Fa1JCcUExWHordk95MTlvaWhERkhyZ0Zq
dHJ6UENraG5hR3dzSUg4QnJwSDNxVVVBU0dxTDFjcks5L3VSZm1tdCtpbHdBMUVP
N1lGZ0JYWGF5ZGJBTDNudHRBWEpjSy9yd0NpZnhzYnIyN2dmZDFyZnZLWjg3WHNy
SDdxeG9lYUFpRWdVdXNoRW5jNFVoWXMxanBJV1RxWkhHblhXSXJQUTYyeSt6NjIr
cjZJRXN2M1JQRG9xVWErTE1FVVlxWSt3K1g0d0p1cWpvNjFkdWlnaGJGMVI2SndR
UmRBc0NWR29TYkFrUkpqNngrcjBjVGJmZHQxUU1WU1lJcUoxVVNqUkpRd1ZxcEFH
VEpBOUxSakJoS0VUb2lJVFJVS1V3YWhQaUxKVzZkRk42R3hkVm10WG5FSG9URWla
aE41YU5jVGFsWUFPOFFZUm9Sc1NyemNBRGhDaVNVUWJFeU1JRVlsSlJKVFFXeXdX
a3pIS1RNZ1I4aFlqRlZtN2t0RGZnbXBrZUFLamFWSmR5WkVDaERqYmFMQ1ZKVVRG
V1Iyb2piTTZjVTJJQWxKeHRybElSaWNLcWhrb0J1b01zZ21YT0xVU2FvNUpEQlIw
MFdFWXZSbndTa3dtazhVQ3l1aW9XVCtqeVl3aXM5NE14TkRFRE5nTGRMWlJSSkdC
NGx5anhmWWJHdEZXWml0RFA1TnRsRzBVNTB0b2ptYTBHaWhNbUttSlptb0xVRm5k
VFBFOWl0UXRHdDA1T1ZCRUcvVngxZzRkZ1RZUi9oMG9NOGdTd01ka1lvMFJFaW10
V1dRMGJyR3hCR0ZCQUdRL05GTU5iS1BBTjl6R1JCbjF3Tm1BeVpvR0NvdUl0TTBC
eGZPc1hVWFdyaEk1MHdrbWRGK3B0MDNRazFnTmlSOFVEdU9WNEwrZVJwM1FUK0V5
d2JiVU5nRTBJUDdxUVJpNzhWeUx0ZFBtdTl6bVcyUHpYYXNsYnNBZk1jdGt6V1dl
eWI2Y3RPYmFmTGVncWNubXd0VUNpTGhhTzAyeUNXb25NNExXVGlsVWw3TllWSEdt
cTRwd2hieFEwUnh6b3A0QitOWmdpVUNBT1g4RDVZMXE2Smlnc1kxcWNGNDZ0NERq
UXlCcEpndmdEaVJlSnVxSjRBTjFKbXFHQ1UyT00wYkdXWDNyT1kwY0VYaUNiWEpN
SXBIbGRwWTBNNmVvbmtxcHJTelZla2xlVGxCc3RuWmlSakxCNk1aZ0taZ3hPcTlU
TU0xM3ZjMTNqWkZ4OWEwMkdTTnR2cjBRMXdnaExGaGpGc3NRUWxjUHNjYUYra09T
bVQ4Vy9WbGdYQStlWWFsYm9vMEFRTUpyaVVBM1doTFFIZ1phZkFsRHJMRktEQU9x
Z0pBeWsrN3BKQkdQc1JpanFiTVpINnZ2ejdSRWNUTWFJd0hPMmttVnRxVW1LZjRz
Q21qTGVCSnprTEVNTkpwc3ZvL004UU9zdmc4QTRBT2F2dDRRajFFRzZPSWpETlpP
YUFFOUZScU5FV2hvc1pocHl1Z0FLaEUxUGpKSGM0SFZkOEFjSDJVRVVUN3FoMFdN
Y3BURW0vWDlqRkZhTFJBV09rdDhOSmVZNHlFSkpoR3BpeWZVektDTktZR1VYNHlz
cGM3Nm1FQmZTMUM1SmQ1b1pBaFMvQmh6bVRReGp0Wk9zMXBxaERjUkFmZzhZQUd5
R3pIWGpSQXNhMWNINjdzaEVDY2RNdFlpMG1hbS9qVEdBMW83eG5OckFtaWtqd1NB
clpBQlhFbGhKVmhBWHd2VlFOVml2YTRCczhCb1N6OHd5ODhuVUhrSVJxQXBvM21F
M2pZSGVoR2JCUlFrbUdkcnBoVVNyMmVxYm9zM29SbGZvdUlKRTdxWW9MUDFwSXhq
akVZenZVaXREU045QzhGOVFhMldGblVqRlF3WmJnbGFTQzF5Q1R6THd0NlBVMEVW
QkVKV0JBRXphRGVHRlEwcWw1aE5ab3NaS0pES2VWbG5hN0ExR0hsK3RnWXpnMzha
YTlLbzZqVDkxb0ozUTR6U1F5MG1XNHVtSDF1MDZnUmpGQmMwaEU1RjFVbzBHcUtO
QmpPa21xYU5wVW5UUnJWWFZub2xqbDVXbnlYYXdGNjhHN2pJcStsc0ZKR2NXeXdh
RGcxYWNYOXNMTFJvQ0g3d0NFdmtDRXZrQ0VzMDJFdndsckNYYUxCUkZBcDFDZFVa
TkY1QkdJRWJsSVFGUEphd2ZhdnhaMVRKQVFveUYrTFBRTUI5cS9zcDZMSU0yemFF
S00wNHlGWUk5VlpNR3Z4NlNEUVVaS2NaZXNqV2JFdXpXR3hqNkkvdWtwNVM1NERm
dU11Qy9saWp6WkxBWUNGdEZBMXlmZzN4a0tqbXdCd3Mva2JNSVF2TGxXV0UwWWJG
QlZKWm9pVzViR1ZRTWlhVUFhclNpTEJ4VExCeFNDZEZSVUlKZGRwb3pDRHFBS2JW
YUtJRnFUb1ZZeEtzTVQ0QnVsMzNFTXQ1MDBWeW9PQ0t6N0IwQXgxSUIyRng3b0lo
QkR2RXQ0dTJHbXZYQS9LMmtYYVZyczFNK01RSXZwbTQrVzVwWmFGQVA0Qlc5RzZi
Yng4bTROdVA1Y2g3MVZhR3RwOVVQQnBaVkp1RDNFYVBydHlYVElkdTJ5NURQNnlR
T1J4THEwVVNSNzdqakx5VFdUVUprMit0akxXNGFhalJ5cE9Mam83QkMxT0VLVmNE
bTh2M1oxRFVXZ01GQUhxYndDNXJ6V2pqT2R5VUdxSWU5dVE4YUJMclBFWk82OGk5
cVBtODRjYUJFQlBxd1pQaUZweENLWDNNTVFheTZHTE51TVhRR05BNlEweGJMcW1w
SGpUMndPV21oeWZWTHJQdWpoNGZTU1l4L2RDQmlLUXZQbytrZjBTTnBNSkkrZ2Ix
U0FOZDZDdlZJMDI0K05hbDZId3IrdmkyZ3BRK3ZnZHVUS0wyeGExakV0VzNFRTNN
U0Vtajk1akVnbzRXK3FxUWlhM09EcS9iMFRJbXNhS2pyc1ZGLzdQTS81bzdzUzRu
eDVGVm41V2RQaTV6ckRNdGQxeWNybElmUzE4Z3cvODFyTDVYUndjT0drelkwdkNC
TUJoaTlBYUwzcUEzS21OVmJ6QWJsVzBaWWJETlFidGNsWjlnTm1qR2hsR1pQS2lk
M2M4UXBHeFZVNis2TDRrMFdIMHJUQVpsSmxEdU9DNWRrWlQ2a2k3ZlVsYlF4dklH
Z1pjV0hsVzhRNWNEUUtHWmZuT1VkZ3lZdjJRTnlKc09kcTRSV3NGV1prRldSMHZS
U0s1Q0ZPMDRsSjFqcEViWWJORGRUTGFJSHJKbUlUSFZRUzNSeW1SUGhveE9kR1Bi
MHphS3JBRWRkQWo1QkdUQ2svbGlJbU9YNTQ4dHoxYk1QazhudFo1c012VkxOT2hN
TVhveUFybWFqVURJSU1tMUxwWjNMa3VzcVo4d1lPZTJZTmhZdGlQTThiakhVaUh1
bGxoTU05WWNHejlBR0xsQUNhalJMQ0prUTR0WlJNcW1GaXQxQW0yUW9TdDY5UmNH
SGRYRld5Z1hvMXBTR25NMm02TTFJTkJSbExSSUROaTZJWG9BWWNIbUFXaHBwaEVJ
Y2JiNDlGUkYrdFVTTFhTUzJ4SjV1aE1SUVFwcWE2SWZLV1ZRNElmZTFtdzE2UUhT
bG9iRmpSV0RITFF2K0VTSmFHR010NWpOOGZpakpyNXRGb3N3UVhsc004ZWI0azJ4
SnQ3dTlVVGFCb3RGM3N6TW93YS9Gd0o5emF5eHlKdVpHV1VtRlVaM1dXbzJzOVZ0
UmlmVnh4SklTb0JsTkg2THJZUzdRdzlSMW1zcjRYNk0vaExLb0dFSld6dXJDUnZs
cDByMmtoRFFmSEcxRlp2ay9KaGdsT2d2akRKdnpUV1pZbGhZbXkzeVpvWTNLaGtN
OXFvVXl5c1hzSGEyc25pRDd1UlVRYXBHd2J1TkdDVXMrSmo1QjB6cE5WVEh2N2h5
OWl5M28zMTYwRGRpVlRhNzJ4WjVkQ2FkK29HR0FUb1JIZlMxdDZLZlRoaG5PbHVj
OUgyZm5FbVh1a1dJYUoySVNwZko0RmRzYUZaTVNOTDUwOVdVVGhSaFg4VkI3WVNv
TFdoekY3YTBsRGxjcmZLTHFaM3k2KzNvOVdNU1lLaGhvc1JUTjM0WFdYbk9wSWNP
bVNvK0h2RzQvZWwvWFh6cEMxRUptd2U5ZC9QN3Z5a1RqaU8zUjN5Zi90MndsSGx6
bnZmcytPalJneGVOZXk3TDBuekpmZVdqUnRyaUQ5MjNvcXQxK1dlVDlybisvTjdq
dFRzektoK1orYk9mNzZweFB2bnpPZjNqN3NqNUpPMjJsd2FQNno4OFkvU2QrNS9m
N3ZxWGU1SzRlZWkzdDNZV3prM3lYZnJWd1NYTlNmZjFiN3I1OEp5MWtkdEhaaFov
UCtxMWhlL3Bxdi81eWRQbjNqbGkxTTZOZnkxTk82dnRQMUowRjBZZTJyWWhML1dG
by9hL3RSZC8vc2lqLy9uUEFaZkU3YnIzeE1nZFh4elVyL3ZqOUcxZi9hZmRlNVYz
L2ZwdFR6VSs0N242dkEwWHBoN2E5K1dvZmQvZTlZZUlkYVB2cDFrYWlUZDNDL29t
and3UlNmL1dyeE1EbmxyMDJQN0s3UDFOYjV6VCtNekFYWk9HbnQzdjdLejdGMHdj
TytQVFNiUE9lblNMNmNpK1MzeWJhdGVPLzJGZHpuaTd1K202ZWY4NHV2bXFvYS9l
ZnR2cjF4emUvK1hiWDd6cDNMUjltK3Znd2h2MjVUejI2NTBUYno1ZVVYUHpnNGVX
bEY3d2o5ZGVXV3lZMFR6eXcvWnZsenlZL1ZUZXJQZi9rZnpROEkyYjRyb0duVDgv
ZHRPUlhVWERGOTMyOWNIOWp5NitQU0hEOGVSRmIvL3VlK041c1lQS3pRc2lybm5q
MTJrcm41MTkyZHdINzJqNFErUnlzMlZJNDU5dXVIYkdJNS9lMmhHNXF1SXZMeVVh
aXJaZW1tKy9kZGZvNDBlM1RqMjd3eFcxNnFJWEsyOGJubHh4bGUzZDErZC9jdDM2
alVlbVBUMy8xdHpuQng1YnZIN0MwQ2R5MDUvb2QwZjd1ZWxpenkvdldYSGU1YjZ2
VnY4OVBmNGRlOVRjWTEzdkhIemw3dnNlTjc0MXFyekJzbUt0NGQwZGl4dFR6MG42
MDIyM0hIOXlxUzUvVDliVGc3NmVsTGp2NXJWejk0OTdxa3ZFdk50MjFzN0x2djNi
K1g5SzJIWDI2b1pWMlVVNUZXKzFmTHh5YzhIbzFXMnBKOWJZcm5CditlV0xqWDlQ
U1ZpYWYrK1hKODZmVzdsdVVjSk5mLy9paDNtYlJxemVlY0V0NyszWXVPZTV5bnNy
dGxaKzllNkpnMTEzUHRWMVIvR1BxWS9kdmVtY3ZkdTN6aDArOGM1UGg5elkrRi9E
cHI1YWQrek43YXQrOWN6aGZhYmNFY2VHYi92WDZyZmVQeTlwMk9jeHlROUdQblh2
c280cjk5MTBjR2ZXMXVOdHVtYnI2ODBacjIxMzNmWHEydGdQWEJ0ZVBYamlRdU82
N1Rrcm1nOC9lMy9TSjB1WGVpL2V0YnRzejhHbDc2Wk4rM0R1eTlmTytkcjN3M01U
OWwrL0xPNzJvNm1pYnM5Yld6ZnRXL1BSbmdrM0ZzMGRXdkg5ZlFXdlQxM1VkYVRw
Z3hQdjVYZSt1T0dCdWNWZmJmSGVhQnRwYU05dnZxVHcrQi9UbHpYdnZQT3N1WGU5
bWoveS9xbGZQM0o4d2VlOXlkWG9WWTlQbW5uTnJMMjI4K2ZuUHZLejc1cE01ZnV2
K09xUTlUSEgrTXo4R2M2bzN3MFZlZTgrdTc5d1h2WEVzOFp0S1hBZStlYWllejY3
eTlsODVJTXJhaUtTczArTUt0MDFZZUwyYXpxK2E5VWZtSDNUeFR0OSt2eEpMWEVy
eTM0Nzh1SWIxdVhPbkpONzhTMmZiWDdaZnBscHllWVpyMTk5Vi84L0hsdXphc0x4
T2NQM3B1eTc2WXJKOHpidXVTaTZkZDdtaXBjbWJKejF3WlozZmxsMnNPYkE5YVcv
SHZYak1kL0ZBKzB6My80aThycUMzSzJEOTYyc3ZQU3M1eTgvKy9mVGxxODM2Vzha
V2J5LzQ3WWQyMTk1ZU0vZ3ZkOG5iMGladWlGKzJ0ZWpYWVZwbVk5dkdQYktqZXNt
SHl6NDdFRC82SXkvL3RmNmYveDY3ZlBMdnJwOTc3OEc3THY2Z1k1b3NUdXA0SnNI
Wnl6Yjh1NldCNzUvNWJjSHUzN2NmK2VpRXg5Zk1DejIyUEtjTHk5NzZmMzFzM2M4
bEhCdVYzcnJsMWZVai8waWFzREJsK0xldVh2VUplcytydHU3OThxVmU0eXJya245
WmtqMXl0U2pHVG5HK3gvK2NMTitVTlpEYjc5eDUyM1p2dWZlV1c0NjhMZmFDWFB1
bTM1K3hPaE5kYlB6NW96UEtjZzZkTWZZOTlkSDNtUzcvY29IdnZuK3l2VjNIdm5n
Nkw1bkQ3OW5lZm9YQnk0Wkdsc3h1MzdHd1RkT3pIcDQzWjYzcnZ4MDZmSy9wQ2JO
anA3OTRkMWZ6cHAyOTJEbjFsK3Ntdkx4bFFOdUxiN211enNXdWlMY2l6N1pubCs2
NnUyWUNXOTRqeDRlZXlDajZPRnY3OTk5L3ZBOS8zRno1ZFVOcXhNdk91dlE4dDBY
VHJ0NmVsYmk4c3NHbnpnMnByT2x0Zkg2SjZJL2ZueGZ1K1BJMU0zTGo4ZFBhQnh2
VGhubThPNTg4ZXRMWnVZay9HVk52V3ZGVmMrM3o5bWZmTzNRYnpaV2YzcUo0Zlpm
WmNidFQzL3R3N09OYSsrNTNyQjArNUUzZHp6MDE2SEpxdzBiNmg5N2RjZWRyU3My
clRrODljT0I5VmZ0V3ZaR1YySHUweVJYNTdOdUhoSmUwZk5MMTA5cSswaFJoMnZn
bjZIbFVXSUdQNjZSelA4K2xjNFA0R1FKK2MvVHNrVW0xOUU5a3gvRmtZL09wb1Fj
U0ZLZkRENlN6TVFJN3c3U3Z6b3M2NmJwdjcvNk1lUEc2elp2dmluL2svRUxWK3pX
WmFCdU1UN3pMaERpbWFIM1hiRy8zLzFWRjcveTBGK1cxVzQ3UXZnWlJPWHJrMDFm
dkJ4eGRFZmNxblU3VTFaKy8rSFhuc2J2MzNyaTBvMVB2dmxkVGQ0ZlR4ejBQdlBF
dFlmZlhURGV1dnQ0ODk4dVhmN0llYnRXUGw3MDlPZm5IN3ZuT1VlN3k5VTZJR2Jl
bG9rZmZUNDF4dm5EaHJTaFg5LzlXdWN6czlkMC9iRGhuL2JQbXhaL05tRGUxVHZP
emhweGZmR0xBNjU2Sk9HYm40L0tyNXB2UFBUUmpOM0hSdlQ3bmJQL3BQMXIxZzUr
NGZYSHhuL3l1WFZRMGpjcmZsRWF2VG45K3B5RnIvenovais3M3J2N2hSRXRJMytj
Zi95dHhYdWZ1ZHI3eFBsUjR1YTFoOTkvb1Arc0czeU5WeFY0Vi8xaDJKZVBqRW1z
M1h0YmFmV21XWVYxeld2dW0yeTlmVVdkcGVEM0NaOE5LZGxiZmJUMDlZYkgreDlk
dFhuTTZpL2lmeHgvNVZmM0xxNnBPN1N1OU5IMFpJUHZ1aWRUcnJ1MytzWSttUGov
cno1Zk9qWlM0dUhmZFM4bjJVOExVMDZ2WW54bVQ5YUpONEorTU9zTlBmM3VWYld3
aTFyMXdKQmRQV3BReS84V01nVnBlbTJMUEhwQ3d0R0Z3SnlrY3VTQUJ2OE9GNzBL
dVZVMVArNHhSUjFJK2cvajhEcVBlMVdxQjljOUlZZCs4dlZ3NUZnOXdhQ0hTdDNx
RUtrbnBGaHVrK1ovMDZOMFpEcG04eS9QYVEvMzBoaWRtSkY4Q0l4ZTlEaGlIVCsy
SW8vb21sVDV6N21mTms0djMzL1JSLzgwT3ZmeDkrLzJYejU0eVVjS3RBK05SNytF
Ri94dk5YUVVHTUEwM0RoMElFNUhaZlFhQmNyVHI5clN2OXhRVDVweE8rWktHRGNK
K3JZY2FScFA0WEhLVmJsTGphUGgyWHJLNDBtNmhoN0ZuZ3BkMDhnZDd0YXZPM1hT
ZytpU3kzVE00Nk5CSjM5SGlud0FyUGMrc3QvL3lWZWlUdENQNGpWbi9ic1IrZi9Y
ditQMTM3VTlUZk1BRmdFQQ0KIkANCiRkbGxQYXRoID0gSm9pbi1QYXRoICRQU1Nj
cmlwdFJvb3QgJ0xpYlRTZm9yZ2UuZGxsJw0KaWYgKFRlc3QtUGF0aCAkZGxsUGF0
aCkgew0KICAgIFdyaXRlLUhvc3QgJEwuZGxsRm91bmQgLUZvcmVncm91bmRDb2xv
ciBHcmVlbg0KICAgIFtSZWZsZWN0aW9uLkFzc2VtYmx5XTo6TG9hZEZyb20oJGRs
bFBhdGgpIHwgT3V0LU51bGwNCn0gZWxzZSB7DQogICAgdHJ5IHsNCiAgICAgICAg
V3JpdGUtSG9zdCAkTC5kbGxOb3RGb3VuZCAtRm9yZWdyb3VuZENvbG9yIFllbGxv
dw0KICAgICAgICAkY29tcHJlc3NlZERsbEJ5dGVzID0gW0NvbnZlcnRdOjpGcm9t
QmFzZTY0U3RyaW5nKCRiYXNlNjRFbmNvZGVkRGxsKQ0KICAgICAgICAkY29tcHJl
c3NlZFN0cmVhbSA9IFtTeXN0ZW0uSU8uTWVtb3J5U3RyZWFtXTo6bmV3KCRjb21w
cmVzc2VkRGxsQnl0ZXMpDQogICAgICAgICRnemlwU3RyZWFtID0gTmV3LU9iamVj
dCBTeXN0ZW0uSU8uQ29tcHJlc3Npb24uR1ppcFN0cmVhbSgkY29tcHJlc3NlZFN0
cmVhbSwgW1N5c3RlbS5JTy5Db21wcmVzc2lvbi5Db21wcmVzc2lvbk1vZGVdOjpE
ZWNvbXByZXNzKQ0KICAgICAgICAkZGVjb21wcmVzc2VkU3RyZWFtID0gTmV3LU9i
amVjdCBTeXN0ZW0uSU8uTWVtb3J5U3RyZWFtDQogICAgICAgICRnemlwU3RyZWFt
LkNvcHlUbygkZGVjb21wcmVzc2VkU3RyZWFtKQ0KICAgICAgICAkZ3ppcFN0cmVh
bS5DbG9zZSgpDQogICAgICAgICRkZWNvbXByZXNzZWREbGxCeXRlcyA9ICRkZWNv
bXByZXNzZWRTdHJlYW0uVG9BcnJheSgpDQogICAgICAgIFtTeXN0ZW0uUmVmbGVj
dGlvbi5Bc3NlbWJseV06OkxvYWQoJGRlY29tcHJlc3NlZERsbEJ5dGVzKQ0KICAg
ICAgICBXcml0ZS1Ib3N0ICRMLmRsbExvYWRlZFN1Y2Nlc3MgLUZvcmVncm91bmRD
b2xvciBHcmVlbg0KICAgICAgICBjbHMNCiAgICAgICAgV3JpdGUtSG9zdA0KICAg
IH0gY2F0Y2ggew0KICAgICAgICBXcml0ZS1Ib3N0ICRMLmRsbExvYWRFcnJvciAt
Rm9yZWdyb3VuZENvbG9yIFJlZA0KICAgICAgICBXcml0ZS1Ib3N0ICRfIC1Gb3Jl
Z3JvdW5kQ29sb3IgUmVkDQogICAgICAgIEV4aXQNCiAgICB9DQp9DQojIC0tLSBE
TEwgQkVMTEXEnkUgWcOcS0xFTUUgLS0tDQoNCg0KIyAtLS0gw5xSw5xOIEbEsExU
UkVMRU1FIEZPTktTxLBZT05VIC0tLQ0KZnVuY3Rpb24gSXNTdXBwb3J0ZWRXaW5Q
cm9kdWN0KCRpdGVtKSB7DQogICAgcmV0dXJuICgNCiAgICAgICAgJGl0ZW0uTmFt
ZSAtbWF0Y2ggJ15XaW5kb3dzXChSXCksICcgLWFuZA0KICAgICAgICAkaXRlbS5O
YW1lIC1ub3RtYXRjaCAnRVNVfEFkZC1vbnxFeHRlbmRlZCBTZWN1cml0eSBVcGRh
dGVzfFllYXJbMS05XXxDbG91ZHxeV2luZG93c1woUlwpLCBTIGVkaXRpb24kfE5h
bm98VGVhbXxDb25uZWN0ZWR8TGVhbnxFdmFsdWF0aW9ufFZPTFVNRV9LTVNfVzEw
JyAtYW5kDQogICAgICAgICgkaXRlbS5EZXNjcmlwdGlvbiAtbm90bWF0Y2ggJ1ZP
TFVNRV9LTVNfVzEwJykNCiAgICApDQp9DQpmdW5jdGlvbiBJc1RpbWViYXNlZCgk
aXRlbSkgew0KICAgICRkZXNjID0gJGl0ZW0uRGVzY3JpcHRpb24NCiAgICAkbmFt
ZSA9ICRpdGVtLk5hbWUNCiAgICByZXR1cm4gKA0KICAgICAgICAkZGVzYyAtbWF0
Y2ggIlRJTUVCQVNFRF9TVUJ8U3Vic2NyaXB0aW9ufFN1YlRyaWFsfFN1YlRlc3R8
VHJpYWx8UkVUQUlMXChHcmFjZVwpfFJFVEFJTFwoRnJlZVwpIiAtb3INCiAgICAg
ICAgJG5hbWUgLW1hdGNoICJUSU1FQkFTRURfU1VCfFN1YnNjcmlwdGlvbnxTdWJU
cmlhbHxTdWJUZXN0fFRyaWFsfFByZW1SX0dyYWNlIg0KICAgICkNCn0NCiMgLS0t
IMOcUsOcTiBGxLBMVFJFTEVNRSBGT05LU8SwWU9OVSAtLS0NCg0KDQojIC0tLSDD
nFLDnE4gQU5BSFRBUkkgw5xSRVRNRSBGT05LU8SwWU9OVSAtLS0NCmZ1bmN0aW9u
IEdldFJhbmRvbUtleShbc3RyaW5nXSRQcm9kdWN0SUQpIHsNCiAgICB0cnkgew0K
ICAgICAgICAkZ3VpZCA9IFtHdWlkXTo6UGFyc2UoJFByb2R1Y3RJRCkNCiAgICAg
ICAgJHBrYyA9IFtMaWJUU2ZvcmdlLlNQUC5QS2V5Q29uZmlnXTo6bmV3KCkNCiAg
ICAgICAgdHJ5IHsgJHBrYy5Mb2FkQ29uZmlnKCRndWlkKSB8IE91dC1OdWxsIH0g
Y2F0Y2ggeyAkcGtjLkxvYWRBbGxDb25maWdzKFtMaWJUU2ZvcmdlLlNQUC5TTEFw
aV06OkdldEFwcElkKCRndWlkKSkgfCBPdXQtTnVsbCB9DQogICAgICAgICRjb25m
aWcgPSBbTGliVFNmb3JnZS5TUFAuUHJvZHVjdENvbmZpZ106Om5ldygpDQogICAg
ICAgICRyZWZDb25maWcgPSBbcmVmXSRjb25maWcNCiAgICAgICAgJHBrYy5Qcm9k
dWN0cy5UcnlHZXRWYWx1ZSgkZ3VpZCwgJHJlZkNvbmZpZykgfCBPdXQtTnVsbA0K
ICAgICAgICBpZiAoJG51bGwgLW5lICRjb25maWcpIHsNCiAgICAgICAgICAgICRr
ZXkgPSAkY29uZmlnLkdldFJhbmRvbUtleSgpDQogICAgICAgICAgICBpZiAoJG51
bGwgLW5lICRrZXkpIHsNCiAgICAgICAgICAgICAgICByZXR1cm4gJGtleS5Ub1N0
cmluZygpDQogICAgICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgICAgIFdy
aXRlLUhvc3QNCiAgICAgICAgICAgICAgICBXcml0ZS1Ib3N0ICRMLmtleUdlbkZh
aWxlZEVtcHR5IC1Gb3JlZ3JvdW5kQ29sb3IgUmVkDQogICAgICAgICAgICAgICAg
V3JpdGUtSG9zdA0KICAgICAgICAgICAgICAgIHJldHVybiAkbnVsbA0KICAgICAg
ICAgICAgfQ0KICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgV3JpdGUtSG9z
dA0KICAgICAgICAgICAgV3JpdGUtSG9zdCAkTC5rZXlHZW5Db25maWdOb3RGb3Vu
ZCAtRm9yZWdyb3VuZENvbG9yIFJlZA0KICAgICAgICAgICAgV3JpdGUtSG9zdA0K
ICAgICAgICAgICAgcmV0dXJuICRudWxsDQogICAgICAgIH0NCiAgICB9IGNhdGNo
IHsNCiAgICAgICAgV3JpdGUtSG9zdA0KICAgICAgICBXcml0ZS1Ib3N0ICgkTC5r
ZXlHZW5GYWlsZWRGb3JJZCAtZiAkUHJvZHVjdElELCAkXykgLUZvcmVncm91bmRD
b2xvciBSZWQNCiAgICAgICAgV3JpdGUtSG9zdA0KICAgICAgICByZXR1cm4gJG51
bGwNCiAgICB9DQp9DQojIC0tLSBLRVkgw5xSRVRNRSBGT05LU8SwWU9OVSAtLS0N
Cg0KDQojIC0tLSBSQVNUR0VMRSBLTVMgQURSRVPEsCBBWUFSTEFNQSBGT05LU8Sw
WU9OVSAtLS0NCmZ1bmN0aW9uIFNldC1SYW5kb21LTVNBZGRyZXNzIHsNCiAgICBw
YXJhbSgNCiAgICAgICAgW3N0cmluZ10kcHJvZHVjdERlc2NyaXB0aW9uDQogICAg
KQ0KICAgICRSZWdQYXRoID0gIkhLTE06XFNPRlRXQVJFXE1pY3Jvc29mdFxXaW5k
b3dzIE5UXEN1cnJlbnRWZXJzaW9uXFNvZnR3YXJlUHJvdGVjdGlvblBsYXRmb3Jt
XDBmZjFjZTE1LWE5ODktNDc5ZC1hZjQ2LWYyNzVjNjM3MDY2MyINCiAgICBpZiAo
VGVzdC1QYXRoIC1QYXRoICRSZWdQYXRoKSB7DQogICAgICAgIHRyeSB7DQogICAg
ICAgICAgICBSZW1vdmUtSXRlbSAtUGF0aCAkUmVnUGF0aCAtUmVjdXJzZSAtRm9y
Y2UgLUVycm9yQWN0aW9uIFN0b3ANCiAgICAgICAgfSBjYXRjaCB7DQogICAgICAg
ICAgICBXcml0ZS1Ib3N0DQogICAgICAgIH0NCiAgICB9DQppZiAoJHByb2R1Y3RE
ZXNjcmlwdGlvbiAtbWF0Y2ggJ0tNU3xWT0xVTUVfS01TJykgew0KICAgICRyYW5k
ID0gTmV3LU9iamVjdCBTeXN0ZW0uUmFuZG9tDQogICAgJHJhbmRfQSA9IFtpbnRd
KDE5MiArICRyYW5kLk5leHQoMCwgNjMpKQ0KICAgICRyYW5kX0IgPSBbaW50XSgx
NjkgKyAkcmFuZC5OZXh0KDAsIDg3KSkNCiAgICAkcmFuZF9DID0gW2ludF0oMSAr
ICRyYW5kLk5leHQoMCwgMjU1KSkNCiAgICAkcmFuZF9EID0gW2ludF0oMSArICRy
YW5kLk5leHQoMCwgMjU1KSkNCiAgICAkaXAgPSAiJHJhbmRfQS4kcmFuZF9CLiRy
YW5kX0MuJHJhbmRfRCINCiAgICB0cnkgew0KICAgICAgICBTZXQtSXRlbVByb3Bl
cnR5IC1QYXRoICdIS0xNOlxTT0ZUV0FSRVxNaWNyb3NvZnRcV2luZG93cyBOVFxD
dXJyZW50VmVyc2lvblxTb2Z0d2FyZVByb3RlY3Rpb25QbGF0Zm9ybScgLU5hbWUg
J0tleU1hbmFnZW1lbnRTZXJ2aWNlTmFtZScgLVZhbHVlICRpcCAtRm9yY2UNCiAg
ICAgICAgU2V0LUl0ZW1Qcm9wZXJ0eSAtUGF0aCAnSEtMTTpcU09GVFdBUkVcV09X
NjQzMk5vZGVcTWljcm9zb2Z0XFdpbmRvd3MgTlRcQ3VycmVudFZlcnNpb25cU29m
dHdhcmVQcm90ZWN0aW9uUGxhdGZvcm0nIC1OYW1lICdLZXlNYW5hZ2VtZW50U2Vy
dmljZU5hbWUnIC1WYWx1ZSAkaXAgLUZvcmNlDQogICAgICAgIFdyaXRlLUhvc3QN
CiAgICAgICAgV3JpdGUtSG9zdCAoJEwucmFuZG9tS21zU2V0IC1mICRpcCkgLUZv
cmVncm91bmRDb2xvciBDeWFuDQogICAgfSBjYXRjaCB7DQogICAgICAgIFdyaXRl
LUhvc3QNCiAgICAgICAgV3JpdGUtV2FybmluZyAoJEwucmFuZG9tS21zRmFpbGVk
IC1mICRfKQ0KICAgICAgICBXcml0ZS1Ib3N0DQogICAgICAgIH0NCiAgICB9IGVs
c2Ugew0KICAgICAgICBXcml0ZS1Ib3N0DQogICAgICAgIFdyaXRlLUhvc3QgJEwu
bm90S21zU2tpcHBpbmcgLUZvcmVncm91bmRDb2xvciBZZWxsb3cNCiAgICAgICAg
V3JpdGUtSG9zdA0KICAgIH0NCn0NCiMgLS0tIFJBU1RHRUxFIEtNUyBBRFJFU8Sw
IEFZQVJMQU1BIEZPTktTxLBZT05VLS0tDQoNCg0KIyAtLS0gT2ZmaWNlIDM2NSBL
T05UUk9MIEZPTktTxLBZT05VIC0tLQ0KZnVuY3Rpb24gVGVzdC1PZmZpY2UzNjVJ
bnN0YWxsZWQgew0KICAgICRwYXRocyA9IEAoDQogICAgICAgICIkZW52OlByb2dy
YW1GaWxlc1xNaWNyb3NvZnQgT2ZmaWNlXHJvb3RcT2ZmaWNlMTYiLA0KICAgICAg
ICAiJGVudjpQcm9ncmFtRmlsZXMgKHg4NilcTWljcm9zb2Z0IE9mZmljZVxyb290
XE9mZmljZTE2Ig0KICAgICkNCiAgICBmb3JlYWNoICgkcCBpbiAkcGF0aHMpIHsN
CiAgICAgICAgaWYgKFRlc3QtUGF0aCAkcCkgeyByZXR1cm4gJHRydWUgfQ0KICAg
IH0NCiAgICB0cnkgew0KICAgICAgICAkcmVnID0gR2V0LUl0ZW1Qcm9wZXJ0eSAt
UGF0aCAiSEtMTTpcU09GVFdBUkVcTWljcm9zb2Z0XE9mZmljZVxDbGlja1RvUnVu
XENvbmZpZ3VyYXRpb24iIC1FcnJvckFjdGlvbiBTaWxlbnRseUNvbnRpbnVlDQog
ICAgICAgIGlmICgkcmVnIC1hbmQgKCRyZWcuUHJvZHVjdFJlbGVhc2VJZHMgLW9y
ICRyZWcuUHJvZHVjdElkcykpIHsNCiAgICAgICAgICAgIHJldHVybiAkdHJ1ZQ0K
ICAgICAgICB9DQogICAgfSBjYXRjaCB7fQ0KICAgIHJldHVybiAkZmFsc2UNCn0N
CiMgLS0tIE9mZmljZSAzNjUgS09OVFJPTCBGT05LU8SwWU9OVS0tLQ0KDQoNCiMg
LS0tIEzEsFNBTlNMSSDDnFLDnE4gS09OVFJPTCBGT05LU8SwWU9OVSAtLS0NCmZ1
bmN0aW9uIEFzay1Db250aW51ZS1Gb3JMaWNlbnNlZFByb2R1Y3QtVGltZW91dCgk
cHJvZHVjdE5hbWUpIHsNCiAgICBXcml0ZS1Ib3N0DQogICAgV3JpdGUtSG9zdCAo
JEwuYWxyZWFkeUxpY2Vuc2VkUHJvbXB0IC1mICRwcm9kdWN0TmFtZSkgLUZvcmVn
cm91bmRDb2xvciBZZWxsb3cNCiAgICBXcml0ZS1Ib3N0ICRMLnByb21wdFRpbWVv
dXRJbmZvIC1Gb3JlZ3JvdW5kQ29sb3IgR3JheQ0KICAgIFdyaXRlLUhvc3QNCiAg
ICAkYW5zd2VyID0gJG51bGwNCiAgICAkdGltZW91dCA9IDUNCiAgICAkc3RvcHdh
dGNoID0gW1N5c3RlbS5EaWFnbm9zdGljcy5TdG9wd2F0Y2hdOjpTdGFydE5ldygp
DQogICAgd2hpbGUgKCRzdG9wd2F0Y2guRWxhcHNlZC5Ub3RhbFNlY29uZHMgLWx0
ICR0aW1lb3V0KSB7DQogICAgICAgIGlmIChbU3lzdGVtLkNvbnNvbGVdOjpLZXlB
dmFpbGFibGUpIHsNCiAgICAgICAgICAgICRrZXkgPSBbU3lzdGVtLkNvbnNvbGVd
OjpSZWFkS2V5KCR0cnVlKQ0KICAgICAgICAgICAgaWYgKCgkR2xvYmFsOklzVHVy
a2lzaCAtYW5kICRrZXkuS2V5Q2hhciAtZXEgJ0UnKSAtb3IgKC1ub3QgJEdsb2Jh
bDpJc1R1cmtpc2ggLWFuZCAka2V5LktleUNoYXIgLWVxICdZJykpIHsNCiAgICAg
ICAgICAgICAgICAkYW5zd2VyID0gJ1knDQogICAgICAgICAgICAgICAgYnJlYWsN
CiAgICAgICAgICAgIH0NCiAgICAgICAgICAgIGlmICgoJEdsb2JhbDpJc1R1cmtp
c2ggLWFuZCAka2V5LktleUNoYXIgLWVxICdIJykgLW9yICgtbm90ICRHbG9iYWw6
SXNUdXJraXNoIC1hbmQgJGtleS5LZXlDaGFyIC1lcSAnTicpKSB7DQogICAgICAg
ICAgICAgICAgJGFuc3dlciA9ICdOJw0KICAgICAgICAgICAgICAgIGJyZWFrDQog
ICAgICAgICAgICB9DQogICAgICAgIH0NCiAgICAgICAgU3RhcnQtU2xlZXAgLU1p
bGxpc2Vjb25kcyAxMDANCiAgICB9DQogICAgaWYgKCRhbnN3ZXIgLWVxICdOJykg
ew0KICAgICAgICBXcml0ZS1Ib3N0ICgkTC5wcm9kdWN0U2tpcHBlZCAtZiAkcHJv
ZHVjdE5hbWUpIC1Gb3JlZ3JvdW5kQ29sb3IgQ3lhbg0KICAgICAgICByZXR1cm4g
JGZhbHNlDQogICAgfSBlbHNlIHsNCiAgICAgICAgcmV0dXJuICR0cnVlDQogICAg
fQ0KfQ0KZnVuY3Rpb24gQXNrLUNvbnRpbnVlLUZvckxpY2Vuc2VkUHJvZHVjdCgk
cHJvZHVjdE5hbWUpIHsNCiAgICB3aGlsZSAoJHRydWUpIHsNCiAgICAgICAgV3Jp
dGUtSG9zdA0KICAgICAgICBXcml0ZS1Ib3N0ICgkTC5hbHJlYWR5TGljZW5zZWRQ
cm9tcHQgLWYgJHByb2R1Y3ROYW1lKSAtTm9OZXdsaW5lIC1Gb3JlZ3JvdW5kQ29s
b3IgWWVsbG93DQogICAgICAgICRrZXkgPSAkSG9zdC5VSS5SYXdVSS5SZWFkS2V5
KCJJbmNsdWRlS2V5RG93biIpLkNoYXJhY3Rlci5Ub1N0cmluZygpLlRvVXBwZXIo
KQ0KICAgICAgICBXcml0ZS1Ib3N0DQogICAgICAgIGlmICgoJEdsb2JhbDpJc1R1
cmtpc2ggLWFuZCAka2V5IC1lcSAnRScpIC1vciAoLW5vdCAkR2xvYmFsOklzVHVy
a2lzaCAtYW5kICRrZXkgLWVxICdZJykpIHsNCiAgICAgICAgICAgIHJldHVybiAk
dHJ1ZQ0KICAgICAgICB9IGVsc2VpZiAoKCRHbG9iYWw6SXNUdXJraXNoIC1hbmQg
JGtleSAtZXEgJ0gnKSAtb3IgKC1ub3QgJEdsb2JhbDpJc1R1cmtpc2ggLWFuZCAk
a2V5IC1lcSAnTicpKSB7DQogICAgICAgICAgICBXcml0ZS1Ib3N0ICgkTC5wcm9k
dWN0U2tpcHBlZCAtZiAkcHJvZHVjdE5hbWUpIC1Gb3JlZ3JvdW5kQ29sb3IgQ3lh
bg0KICAgICAgICAgICAgcmV0dXJuICRmYWxzZQ0KICAgICAgICB9IGVsc2Ugew0K
ICAgICAgICAgICAgV3JpdGUtSG9zdCAkTC5pbnZhbGlkSW5wdXRFSCAtRm9yZWdy
b3VuZENvbG9yIFJlZA0KICAgICAgICB9DQogICAgfQ0KfQ0KIyAtLS0gTMSwU0FO
U0xJIMOcUsOcTiBLT05UUk9MIEZPTktTxLBZT05VIC0tLQ0KDQoNCiMgLS0tIEFL
VMSwVkFTWU9OIEZPTktTxLBZT05VIC0tLQ0KZnVuY3Rpb24gQWN0aXZhdGUtTGlj
ZW5zZShbc3RyaW5nXSRkZXNjLCBbc3RyaW5nXSR2ZXIsIFtzdHJpbmddJHByb2Qs
IFtzdHJpbmddJGlkKSB7DQogICAgdHJ5IHsNCiAgICAgICAgaWYgKCR3IC1vciAk
bykgew0KICAgICAgICAgICAgaWYgKCRHbG9iYWw6SW50ZXJuZXRBdmFpbGFibGUp
IHsNCiAgICAgICAgICAgICAgICBpZiAoJGRlc2MgLW1hdGNoICdLTVN8Vk9MVU1F
X0tNUycgLWFuZCAkZGVzYyAtbm90bWF0Y2ggJ01BS3xSRVRBSUx8T0VNJykgew0K
ICAgICAgICAgICAgICAgICAgICByZXR1cm4NCiAgICAgICAgICAgICAgICB9DQog
ICAgICAgICAgICB9IGVsc2Ugew0KICAgICAgICAgICAgICAgIGlmICgkZGVzYyAt
bm90bWF0Y2ggJ0tNU3xWT0xVTUVfS01TJykgew0KICAgICAgICAgICAgICAgICAg
ICByZXR1cm4NCiAgICAgICAgICAgICAgICB9DQogICAgICAgICAgICB9DQogICAg
ICAgIH0NCiAgICAgICAgaWYgKCRkZXNjIC1tYXRjaCAnS01TJykgew0KICAgICAg
ICAgICAgW0xpYlRTZm9yZ2UuQWN0aXZhdG9ycy5LTVM0a106OkFjdGl2YXRlKCR2
ZXIsICRwcm9kLCAkaWQpDQogICAgICAgIH0gZWxzZWlmICgkZGVzYyAtbWF0Y2gg
J1ZJUlRVQUxfTUFDSElORV9BQ1RJVkFUSU9OJykgew0KICAgICAgICAgICAgW0xp
YlRTZm9yZ2UuQWN0aXZhdG9ycy5BVk1BNEtdOjpBY3RpdmF0ZSgkdmVyLCAkcHJv
ZCwgJGlkKQ0KICAgICAgICB9IGVsc2VpZiAoJGRlc2MgLW1hdGNoICdNQUt8UkVU
QUlMfE9FTXxLTVNfUjJ8V1MxMnxXUzEyX1IyfFdTMTZ8V1MxOXxXUzIyfFdTMjUn
KSB7DQogICAgICAgICAgICAkYXR0ZW1wdHMgPSBAKA0KICAgICAgICAgICAgICAg
IEAoMTAwMDU1LCAxMDAwMDQzLCAxMzM4NjYyMTcyNTYyNDc4KSwNCiAgICAgICAg
ICAgICAgICBAKDEzNDUsIDEwMDMwMjAsIDYzMTE2MDgyMzgwODQ0MDUpDQogICAg
ICAgICAgICApDQogICAgICAgICAgICBmb3JlYWNoICgkcGFyYW1zIGluICRhdHRl
bXB0cykgew0KICAgICAgICAgICAgICAgIFdyaXRlLVdhcm5pbmcgIiR2ZXIsICRw
cm9kLCAkaWQiDQogICAgICAgICAgICAgICAgW0xpYlRTZm9yZ2UuTW9kaWZpZXJz
LlNldElJRFBhcmFtc106OlNldFBhcmFtcygkdmVyLCAkcHJvZCwgJGlkLCBbTGli
VFNmb3JnZS5TUFAuUEtleUFsZ29yaXRobV06OlBLRVkyMDA5LCAkcGFyYW1zWzBd
LCAkcGFyYW1zWzFdLCAkcGFyYW1zWzJdKQ0KICAgICAgICAgICAgICAgICRpbnN0
SWQgPSBbTGliVFNmb3JnZS5TUFAuU0xBcGldOjpHZXRJbnN0YWxsYXRpb25JRCgk
aWQpDQogICAgICAgICAgICAgICAgV3JpdGUtV2FybmluZyAiR2V0SW5zdGFsbGF0
aW9uSUQsICRpbnN0SWQiDQogICAgICAgICAgICAgICAgJGNvbmZJZCA9IENhbGwt
V2ViU2VydmljZSAtcmVxdWVzdFR5cGUgMSAtaW5zdGFsbGF0aW9uSWQgJGluc3RJ
ZCAtZXh0ZW5kZWRQcm9kdWN0SWQgIjMxMzM3LTQyMDY5LTEyMy00NTY3ODktMDQt
MTMzNy0yNjAwLjAwMDAtMjU0MjAwMSINCiAgICAgICAgICAgICAgICBXcml0ZS1X
YXJuaW5nICJDYWxsLVdlYlNlcnZpY2UsICRjb25mSWQiDQogICAgICAgICAgICAg
ICAgJHJlc3VsdCA9IFtMaWJUU2ZvcmdlLlNQUC5TTEFwaV06OkRlcG9zaXRDb25m
aXJtYXRpb25JRCgkaWQsICRpbnN0SWQsICRjb25mSWQpDQogICAgICAgICAgICAg
ICAgV3JpdGUtV2FybmluZyAiRGVwb3NpdENvbmZpcm1hdGlvbklELCAkcmVzdWx0
Ig0KICAgICAgICAgICAgICAgIGlmICgkcmVzdWx0IC1lcSAwKSB7IGJyZWFrIH0N
CiAgICAgICAgICAgIH0NCiAgICAgICAgICAgIFtMaWJUU2ZvcmdlLlNQUC5TUFBV
dGlsc106OlJlc3RhcnRTUFAoJHZlcikNCiAgICAgICAgfSBlbHNlIHsNCiAgICAg
ICAgICAgIFdyaXRlLUhvc3QNCiAgICAgICAgICAgIFdyaXRlLUhvc3QgKCRMLnVu
a25vd25MaWNlbnNlVHlwZSAtZiAkZGVzYykgLUZvcmVncm91bmRDb2xvciBSZWQN
CiAgICAgICAgICAgIFdyaXRlLUhvc3QNCiAgICAgICAgfQ0KICAgIH0gY2F0Y2gg
ew0KICAgICAgICBXcml0ZS1Ib3N0DQogICAgICAgIFdyaXRlLUhvc3QgKCRMLmFj
dGl2YXRpb25GYWlsZWRGb3JJZCAtZiAkaWQsICRfKSAtRm9yZWdyb3VuZENvbG9y
IFJlZA0KICAgICAgICBXcml0ZS1Ib3N0DQogICAgfQ0KfQ0KIyAtLS0gQUtUxLBW
QVNZT04gRk9OS1PEsFlPTlUgLS0tDQoNCg0KIyAtLS0gTUFJTiBGT05LU8SwWU9O
VSAtLS0NCmZ1bmN0aW9uIE1haW4gew0KICAgICRvZmZpY2VQYXRoID0gIiRlbnY6
UHJvZ3JhbUZpbGVzXE1pY3Jvc29mdCBPZmZpY2VcT2ZmaWNlMTYiDQogICAgJGxp
Y2Vuc2VzUGF0aCA9ICIkZW52OlByb2dyYW1GaWxlc1xNaWNyb3NvZnQgT2ZmaWNl
XHJvb3RcTGljZW5zZXMxNiINCiAgICAkb2ZmaWNlQXBwSWQgPSAnMGZmMWNlMTUt
YTk4OS00NzlkLWFmNDYtZjI3NWM2MzcwNjYzJw0KICAgICRvZmZpY2UzNjVJbnN0
YWxsZWQgPSAkZmFsc2UNCiAgICBpZiAoVGVzdC1QYXRoICIkZW52OlByb2dyYW1G
aWxlc1xNaWNyb3NvZnQgT2ZmaWNlXHJvb3RcT2ZmaWNlMTZcT2ZmaWNlQ2xpY2tU
b1J1bi5leGUiKSB7DQogICAgICAgICRvZmZpY2UzNjVJbnN0YWxsZWQgPSAkdHJ1
ZQ0KICAgIH0gZWxzZWlmIChUZXN0LVBhdGggIiRlbnY6UHJvZ3JhbUZpbGVzICh4
ODYpXE1pY3Jvc29mdCBPZmZpY2Vccm9vdFxPZmZpY2UxNlxPZmZpY2VDbGlja1Rv
UnVuLmV4ZSIpIHsNCiAgICAgICAgJG9mZmljZTM2NUluc3RhbGxlZCA9ICR0cnVl
DQogICAgfQ0KaWYgKCRvIC1vciAoLW5vdCAkdyAtYW5kIC1ub3QgJG8pKSB7DQog
ICAgaWYgKFRlc3QtUGF0aCAkb2ZmaWNlUGF0aCkgew0KICAgIGNscw0KICAgIFdy
aXRlLUhvc3QNCiAgICBXcml0ZS1Ib3N0ICRMLm9mZmljZURldGVjdGVkIC1Gb3Jl
Z3JvdW5kQ29sb3IgRGFya0dyZWVuDQogICAgV3JpdGUtSG9zdCAoJEwub2ZmaWNl
UGF0aEluZm8gLWYgJG9mZmljZVBhdGgpIC1Gb3JlZ3JvdW5kQ29sb3IgRGFya0dy
ZWVuDQogICAgV3JpdGUtSG9zdA0KICAgICAgICAkbW9uZG9WTE1BS19JbnN0YWxs
ZWQgPSAkZmFsc2UNCiAgICAgICAgICAgIHRyeSB7DQogICAgICAgICAgICAgICAg
JG1vbmRvTUFLU0tVcyA9IEAoR2V0LUNpbUluc3RhbmNlIC1DbGFzc05hbWUgU29m
dHdhcmVMaWNlbnNpbmdQcm9kdWN0IHwgV2hlcmUtT2JqZWN0IHsNCiAgICAgICAg
ICAgICAgICAgICAgJF8uTmFtZSAtbGlrZSAiKk1vbmRvVkxfTUFLKiIgLW9yICRf
LkRlc2NyaXB0aW9uIC1saWtlICIqTW9uZG9WTF9NQUsqIg0KICAgICAgICAgICAg
ICAgIH0pDQogICAgICAgICAgICAgICAgaWYgKCRtb25kb01BS1NLVXMgLWFuZCAk
bW9uZG9NQUtTS1VzLkNvdW50IC1ndCAwKSB7DQogICAgICAgICAgICAgICAgICAg
ICRtb25kb1ZMTUFLX0luc3RhbGxlZCA9ICR0cnVlDQogICAgICAgICAgICAgICAg
fQ0KICAgICAgICAgICAgfSBjYXRjaCB7DQogICAgICAgICAgICAgICAgV3JpdGUt
SG9zdCAoJEwubW9uZG9DaGVja0Vycm9yIC1mICRfKSAtRm9yZWdyb3VuZENvbG9y
IFllbGxvdw0KICAgICAgICAgICAgfQ0KICAgICAgICAgICAgaWYgKCRtb25kb1ZM
TUFLX0luc3RhbGxlZCkgew0KICAgICAgICAgICAgICAgIFdyaXRlLUhvc3QgJEwu
bW9uZG9JbnN0YWxsZWQgLUZvcmVncm91bmRDb2xvciBHcmVlbg0KICAgICAgICAg
ICAgfSBlbHNlIHsNCiAgICAgICAgICAgICAgICBXcml0ZS1Ib3N0ICRMLm1vbmRv
SW5zdGFsbGluZyAtRm9yZWdyb3VuZENvbG9yIERhcmtHcmVlbg0KICAgICAgICAg
ICAgICAgIFdyaXRlLUhvc3QNCiAgICAgICAgICAgICAgICB0cnkgew0KICAgICAg
ICAgICAgICAgICAgICBHZXQtQ2hpbGRJdGVtIC1QYXRoICRsaWNlbnNlc1BhdGgg
LUZpbHRlciAiTW9uZG9WTF9NQUsqLnhybS1tcyIgfCBGb3JFYWNoLU9iamVjdCB7
DQogICAgICAgICAgICAgICAgICAgICAgICAkbGljZW5zZUZpbGUgPSAkXy5GdWxs
TmFtZQ0KICAgICAgICAgICAgICAgICAgICAgICAgY3NjcmlwdC5leGUgIiRvZmZp
Y2VQYXRoXG9zcHAudmJzIiAvaW5zbGljOiIkbGljZW5zZUZpbGUiIHwgT3V0LU51
bGwNCiAgICAgICAgICAgICAgICAgICAgfQ0KICAgICAgICAgICAgICAgICAgICBX
cml0ZS1Ib3N0ICRMLm1vbmRvSW5zdGFsbFN1Y2Nlc3MgLUZvcmVncm91bmRDb2xv
ciBHcmVlbg0KICAgICAgICAgICAgICAgIH0gY2F0Y2ggew0KICAgICAgICAgICAg
ICAgICAgICBXcml0ZS1Ib3N0ICgkTC5tb25kb0luc3RhbGxFcnJvciAtZiAkXykg
LUZvcmVncm91bmRDb2xvciBSZWQNCiAgICAgICAgICAgICAgICAgICAgV3JpdGUt
SG9zdCAkTC5tb25kb0luc3RhbGxJZ25vcmUgLUZvcmVncm91bmRDb2xvciBZZWxs
b3cNCiAgICAgICAgICAgICAgICAgICAgJEVycm9yQWN0aW9uUHJlZmVyZW5jZSA9
ICJDb250aW51ZSINCiAgICAgICAgICAgICAgICB9IGZpbmFsbHkgew0KICAgICAg
ICAgICAgICAgICAgICAkRXJyb3JBY3Rpb25QcmVmZXJlbmNlID0gIlN0b3AiDQog
ICAgICAgICAgICAgICAgfQ0KICAgICAgICAgICAgfQ0KICAgICAgICAgICAgV3Jp
dGUtSG9zdCAiICINCiAgICAgICAgfSBlbHNlIHsNCiAgICAgICAgICAgIGNscw0K
ICAgICAgICAgICAgV3JpdGUtSG9zdA0KICAgICAgICB9DQogICAgfQ0KaWYgKCRH
bG9iYWw6SW50ZXJuZXRBdmFpbGFibGUpIHsNCiAgICBXcml0ZS1Ib3N0ICRMLmlu
dGVybmV0QXZhaWxhYmxlIC1Gb3JlZ3JvdW5kQ29sb3IgWWVsbG93DQogICAgV3Jp
dGUtSG9zdA0KICAgIH0gZWxzZSB7DQogICAgV3JpdGUtSG9zdCAkTC5pbnRlcm5l
dE5vdEF2YWlsYWJsZSAtRm9yZWdyb3VuZENvbG9yIFllbGxvdw0KICAgIFdyaXRl
LUhvc3QNCn0NCiAgICBXcml0ZS1Ib3N0ICRMLmdhdGhlcmluZ0luZm8gLUZvcmVn
cm91bmRDb2xvciBHcmVlbg0KICAgICRpd21pID0gQChHZXQtQ2ltSW5zdGFuY2Ug
U29mdHdhcmVMaWNlbnNpbmdQcm9kdWN0KQ0KICAgICRzZWxlY3Rpb25MaXN0ID0g
QCgpDQogICAgJGNoYW5uZWxzID0gQCgnT0VNJywnTUFLJywnUkVUQUlMJywnS01T
JykNCiAgICAkb2ZmaWNlR3JvdXBzID0gQCgnUHJvUGx1cycsJ1N0YW5kYXJkJywn
VmlzaW8nLCdQcm9qZWN0JykNCiAgICAkcmVhbExpY2Vuc2VkV2luZG93cyA9ICRp
d21pIHwgV2hlcmUtT2JqZWN0IHsgSXNTdXBwb3J0ZWRXaW5Qcm9kdWN0ICRfIC1h
bmQgJF8uTGljZW5zZVN0YXR1cyAtZXEgMSB9IHwgU2VsZWN0LU9iamVjdCAtRmly
c3QgMQ0KICAgICRyZWFsTGljZW5zZWRPZmZpY2UgID0gJGl3bWkgfCBXaGVyZS1P
YmplY3QgeyAkXy5OYW1lIC1tYXRjaCAiT2ZmaWNlIiAtYW5kICRfLkxpY2Vuc2VT
dGF0dXMgLWVxIDEgfSB8IFNlbGVjdC1PYmplY3QgLUZpcnN0IDENCg0KaWYgKCR3
KSB7DQogICAgV3JpdGUtSG9zdCANCiAgICBXcml0ZS1Ib3N0ICRMLmNoZWNraW5n
V2luZG93cyAtRm9yZWdyb3VuZENvbG9yIEdyYXkNCiAgICANCiAgICAkYWxsV2lu
ZG93c1Byb2R1Y3RzID0gJGl3bWkgfCBXaGVyZS1PYmplY3QgeyAkXy5OYW1lIC1t
YXRjaCAnV2luZG93cycgLWFuZCAoSXNTdXBwb3J0ZWRXaW5Qcm9kdWN0ICRfKSB9
DQogICAgDQogICAgJGZpbHRlcmVkUHJvZHVjdHMgPSBAKCkgDQogICAgDQogICAg
aWYgKCRHbG9iYWw6SW50ZXJuZXRBdmFpbGFibGUpIHsNCiAgICAgICAgJGZpbHRl
cmVkUHJvZHVjdHMgPSAkYWxsV2luZG93c1Byb2R1Y3RzIHwgV2hlcmUtT2JqZWN0
IHsgJF8uRGVzY3JpcHRpb24gLW5vdG1hdGNoICdLTVN8Vk9MVU1FX0tNUycgfQ0K
ICAgIH0gZWxzZSB7DQogICAgICAgICRmaWx0ZXJlZFByb2R1Y3RzID0gJGFsbFdp
bmRvd3NQcm9kdWN0cyB8IFdoZXJlLU9iamVjdCB7ICRfLkRlc2NyaXB0aW9uIC1t
YXRjaCAnS01TfFZPTFVNRV9LTVMnIH0NCiAgICB9DQogIA0KICAgICR0YXJnZXRX
aW5kb3dzID0gJGZpbHRlcmVkUHJvZHVjdHMgfCBXaGVyZS1PYmplY3QgeyAkXy5M
aWNlbnNlU3RhdHVzIC1lcSAxIH0gfCBTZWxlY3QtT2JqZWN0IC1GaXJzdCAxDQog
ICAgDQogICAgaWYgKC1ub3QgJHRhcmdldFdpbmRvd3MpIHsNCiAgICAgICAgJHRh
cmdldFdpbmRvd3MgPSAkZmlsdGVyZWRQcm9kdWN0cyB8IFdoZXJlLU9iamVjdCB7
ICRfLkxpY2Vuc2VTdGF0dXMgLWluICgyLCAzLCA0LCA1LCA2KSB9IHwgU2VsZWN0
LU9iamVjdCAtRmlyc3QgMQ0KICAgIH0NCg0KICAgIGlmICgtbm90ICR0YXJnZXRX
aW5kb3dzKSB7DQogICAgICAgIHRyeSB7DQogICAgICAgICAgICAkb3NDYXB0aW9u
ID0gKEdldC1DaW1JbnN0YW5jZSBXaW4zMl9PcGVyYXRpbmdTeXN0ZW0pLkNhcHRp
b24NCiAgICAgICAgICAgICRvc0VkaXRpb24gPSAkb3NDYXB0aW9uLlNwbGl0KCcg
JylbLTFdIA0KICAgICAgICAgICAgaWYgKCRvc0VkaXRpb24gLWVxICJXb3Jrc3Rh
dGlvbnMiKSB7ICRvc0VkaXRpb24gPSAiUHJvIGZvciBXb3Jrc3RhdGlvbnMiIH0g
DQogICAgICAgICAgICANCiAgICAgICAgICAgIFdyaXRlLUhvc3QgKCRMLm5vQWN0
aXZhdGVkUHJvZHVjdEZvdW5kIC1mICRvc0VkaXRpb24pIC1Gb3JlZ3JvdW5kQ29s
b3IgR3JheQ0KDQogICAgICAgICAgICAkdGFyZ2V0V2luZG93cyA9ICRmaWx0ZXJl
ZFByb2R1Y3RzIHwgV2hlcmUtT2JqZWN0IHsgJF8uTmFtZSAtbWF0Y2ggJG9zRWRp
dGlvbiB9IHwgU2VsZWN0LU9iamVjdCAtRmlyc3QgMQ0KICAgICAgICB9IGNhdGNo
IHsNCiAgICAgICAgICAgIFdyaXRlLUhvc3QgJEwub3NFZGl0aW9uRXJyb3IgLUZv
cmVncm91bmRDb2xvciBZZWxsb3cNCiAgICAgICAgfQ0KICAgIH0NCg0KICAgIGlm
ICgtbm90ICR0YXJnZXRXaW5kb3dzKSB7DQogICAgICAgICR0YXJnZXRXaW5kb3dz
ID0gJGZpbHRlcmVkUHJvZHVjdHMgfCBTZWxlY3QtT2JqZWN0IC1GaXJzdCAxDQog
ICAgfQ0KDQogICAgaWYgKCR0YXJnZXRXaW5kb3dzKSB7DQogICAgICAgICRzZWxl
Y3Rpb25MaXN0ICs9ICR0YXJnZXRXaW5kb3dzDQogICAgfSBlbHNlIHsNCiAgICAg
ICAgV3JpdGUtSG9zdCAkTC5ub1N1aXRhYmxlV2luZG93cyAtRm9yZWdyb3VuZENv
bG9yIFllbGxvdw0KICAgIH0NCn0NCg0KaWYgKCRvKSB7DQogICAgICAgIHRyeSB7
DQogICAgICAgICAgICAkYWxsT2ZmaWNlID0gQChHZXQtQ2ltSW5zdGFuY2UgU29m
dHdhcmVMaWNlbnNpbmdQcm9kdWN0IC1FcnJvckFjdGlvbiBTaWxlbnRseUNvbnRp
bnVlIHwgV2hlcmUtT2JqZWN0IHsgJF8uTmFtZSAtbWF0Y2ggJ09mZmljZScgfSkN
CiAgICAgICAgfSBjYXRjaCB7DQogICAgICAgICRhbGxPZmZpY2UgPSBAKCkNCiAg
ICAgICAgfQ0KaWYgKCRhbGxPZmZpY2UuQ291bnQgLWVxIDAgLWFuZCAoVGVzdC1P
ZmZpY2UzNjVJbnN0YWxsZWQpKSB7DQogICAgJGZha2VNb25kbyA9IFtQU0N1c3Rv
bU9iamVjdF1Aew0KICAgICAgICBJRCA9ICJmYWtlLW1vbmRvLTM2NSINCiAgICAg
ICAgTmFtZSA9ICJPZmZpY2UgMzY1IFByb1BsdXMgKE1vbmRvVkxfTUFLKSINCiAg
ICAgICAgRGVzY3JpcHRpb24gPSAkTC5mYWtlTW9uZG9EZXNjDQogICAgICAgIExp
Y2Vuc2VTdGF0dXMgPSAwDQogICAgICAgIH0NCiAgICAgICAgJGFsbE9mZmljZSAr
PSAkZmFrZU1vbmRvDQogICAgICAgIH0NCiAgICAgICAgJG9mZmljZUdyb3VwU2Vs
ID0gQHt9DQogICAgICAgIGZvcmVhY2ggKCRpdGVtIGluICRhbGxPZmZpY2UpIHsN
Cg0KICAgICAgICAgICAgaWYgKElzVGltZWJhc2VkICRpdGVtKSB7DQogICAgICAg
ICAgICAgICAgV3JpdGUtSG9zdCAoJEwuc2tpcFRpbWViYXNlZCAtZiAkaXRlbS5O
YW1lKSAtRm9yZWdyb3VuZENvbG9yIEdyYXkNCiAgICAgICAgICAgICAgICBjb250
aW51ZSANCiAgICAgICAgICAgIH0NCg0KICAgICAgICAgICAgaWYgICAgICAgKCRp
dGVtLk5hbWUgLW1hdGNoICJWaXNpbyIpICAgIHsgJGtleSA9ICJWaXNpbyIgfQ0K
ICAgICAgICAgICAgZWxzZWlmICgkaXRlbS5OYW1lIC1tYXRjaCAiUHJvamVjdCIp
ICAgeyAka2V5ID0gIlByb2plY3QiIH0NCiAgICAgICAgICAgIGVsc2VpZiAoJGl0
ZW0uTmFtZSAtbWF0Y2ggIlN0YW5kYXJkIikgIHsgJGtleSA9ICJTdGFuZGFyZCIg
fQ0KICAgICAgICAgICAgZWxzZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgeyAka2V5ID0gIk9mZmljZSIgfQ0KICAgICAgICAgICAgJHByaW9yaXR5
ID0gOTkNCiAgICAgICAgICAgIGlmICgkR2xvYmFsOkludGVybmV0QXZhaWxhYmxl
KSB7DQogICAgICAgICAgICAgICAgaWYgICAgICAgKCRpdGVtLkRlc2NyaXB0aW9u
IC1tYXRjaCAiT0VNIikgICAgeyAkcHJpb3JpdHkgPSAxIH0NCiAgICAgICAgICAg
ICAgICBlbHNlaWYgKCRpdGVtLkRlc2NyaXB0aW9uIC1tYXRjaCAiTUFLIikgICAg
eyAkcHJpb3JpdHkgPSAyIH0NCiAgICAgICAgICAgICAgICBlbHNlaWYgKCRpdGVt
LkRlc2NyaXB0aW9uIC1tYXRjaCAiUkVUQUlMIikgeyAkcHJpb3JpdHkgPSAzIH0N
CiAgICAgICAgICAgICAgICBlbHNlaWYgKCRpdGVtLkRlc2NyaXB0aW9uIC1tYXRj
aCAiS01TIikgICAgeyBjb250aW51ZSB9DQogICAgICAgICAgICB9IGVsc2Ugew0K
ICAgICAgICAgICAgICAgIGlmICgkaXRlbS5EZXNjcmlwdGlvbiAtbWF0Y2ggIktN
UyIpIHsgJHByaW9yaXR5ID0gNCB9IGVsc2UgeyBjb250aW51ZSB9DQogICAgICAg
ICAgICB9DQogICAgICAgICAgICBpZiAoLW5vdCAkb2ZmaWNlR3JvdXBTZWwuQ29u
dGFpbnNLZXkoJGtleSkpIHsNCiAgICAgICAgICAgICAgICAkb2ZmaWNlR3JvdXBT
ZWxbJGtleV0gPSBAeyBJdGVtID0gJGl0ZW07IFByaW9yaXR5ID0gJHByaW9yaXR5
IH0NCiAgICAgICAgICAgIH0gZWxzZWlmICgkcHJpb3JpdHkgLWx0ICRvZmZpY2VH
cm91cFNlbFska2V5XS5Qcmlvcml0eSkgew0KICAgICAgICAgICAgICAgICRvZmZp
Y2VHcm91cFNlbFska2V5XSA9IEB7IEl0ZW0gPSAkaXRlbTsgUHJpb3JpdHkgPSAk
cHJpb3JpdHkgfQ0KICAgICAgICAgICAgfQ0KICAgIH0NCiAgICAkc2VsZWN0aW9u
TGlzdCArPSAkb2ZmaWNlR3JvdXBTZWwuVmFsdWVzIHwgRm9yRWFjaC1PYmplY3Qg
eyAkXy5JdGVtIH0NCn0NCg0KaWYgKC1ub3QgJHcgLWFuZCAtbm90ICRvKSB7DQog
ICAgJGl3bWkgPSBAKEdldC1DaW1JbnN0YW5jZSBTb2Z0d2FyZUxpY2Vuc2luZ1By
b2R1Y3QpDQogICAgICAgICRzZWxlY3Rpb25MaXN0ID0gQCgpDQogICAgICAgIGlm
ICgkR2xvYmFsOkludGVybmV0QXZhaWxhYmxlKSB7DQogICAgICAgICAgICAkc2Vs
ZWN0aW9uTGlzdCArPSAkaXdtaSB8IFdoZXJlLU9iamVjdCB7DQogICAgICAgICAg
ICAgICAgKElzU3VwcG9ydGVkV2luUHJvZHVjdCAkXykgLW9yDQogICAgICAgICAg
ICAgICAgKCRfLk5hbWUgLW1hdGNoICJPZmZpY2UiIC1hbmQgLW5vdCAoSXNUaW1l
YmFzZWQgJF8pKQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9IGVsc2Ugew0KICAg
ICAgICAkc2VsZWN0aW9uTGlzdCArPSAkaXdtaSB8IFdoZXJlLU9iamVjdCB7DQog
ICAgICAgICAgICAoDQogICAgICAgICAgICAgICAgKElzU3VwcG9ydGVkV2luUHJv
ZHVjdCAkXykgLW9yDQogICAgICAgICAgICAgICAgICAgICgkXy5OYW1lIC1tYXRj
aCAiT2ZmaWNlIiAtYW5kIC1ub3QgKElzVGltZWJhc2VkICRfKSkNCiAgICAgICAg
ICAgICAgICApIC1hbmQNCiAgICAgICAgICAgICAgICAoJF8uRGVzY3JpcHRpb24g
LW1hdGNoICdLTVN8Vk9MVU1FX0tNUycpDQogICAgICAgICAgICB9DQogICAgICAg
IH0NCmlmICgkc2VsZWN0aW9uTGlzdC5Db3VudCAtZXEgMCkgew0KICAgIFdyaXRl
LUhvc3QNCiAgICBXcml0ZS1Ib3N0ICRMLm5vUHJvZHVjdHNTeXN0ZW0gLUZvcmVn
cm91bmRDb2xvciBSZWQNCiAgICBXcml0ZS1Ib3N0DQogICAgU3RhcnQtU2xlZXAg
LVNlY29uZHMgMQ0KICAgIHJldHVybg0KICAgIH0NCiAgICAkc2VsZWN0ZWQgPSAk
c2VsZWN0aW9uTGlzdCB8IFNlbGVjdC1PYmplY3QgSUQsIE5hbWUsIERlc2NyaXB0
aW9uLCBMaWNlbnNlU3RhdHVzIHwNCiAgICBPdXQtR3JpZFZpZXcgLVRpdGxlICRM
Lm91dEdyaWRUaXRsZSAtT3V0cHV0TW9kZSBNdWx0aXBsZQ0KaWYgKC1ub3QgJHNl
bGVjdGVkIC1vciAoQCgkc2VsZWN0ZWQpLkNvdW50IC1lcSAwKSkgew0KICAgIFdy
aXRlLUhvc3QNCiAgICBXcml0ZS1Ib3N0ICRMLm5vUHJvZHVjdFNlbGVjdGVkIC1G
b3JlZ3JvdW5kQ29sb3IgWWVsbG93DQogICAgV3JpdGUtSG9zdA0KICAgIFN0YXJ0
LVNsZWVwIC1TZWNvbmRzIDENCiAgICByZXR1cm4NCn0NCiAgICAkdG9BY3RpdmF0
ZSA9IEAoKQ0KICAgICAgICBmb3JlYWNoICgkaXRlbSBpbiAkc2VsZWN0ZWQpIHsN
CiAgICAgICAgICAgICRpc1dpbmRvd3MgPSBJc1N1cHBvcnRlZFdpblByb2R1Y3Qg
JGl0ZW0NCiAgICAgICAgICAgICRpc09mZmljZSAgPSAkaXRlbS5OYW1lIC1tYXRj
aCAiT2ZmaWNlIg0KICAgICAgICAgICAgJGFscmVhZHlMaWNlbnNlZCA9ICRmYWxz
ZQ0KICAgICAgICAgICAgaWYgKCRpc1dpbmRvd3MgLWFuZCAkcmVhbExpY2Vuc2Vk
V2luZG93cykgew0KICAgICAgICAgICAgICAgICRhbHJlYWR5TGljZW5zZWQgPSAk
dHJ1ZQ0KICAgICAgICAgICAgfQ0KICAgICAgICAgICAgaWYgKCRpc09mZmljZSAt
YW5kICRyZWFsTGljZW5zZWRPZmZpY2UpIHsNCiAgICAgICAgICAgICAgICAkYWxy
ZWFkeUxpY2Vuc2VkID0gJHRydWUNCiAgICAgICAgICAgIH0NCiAgICAgICAgICAg
ICRzaG91bGRDb250aW51ZSA9ICR0cnVlDQogICAgICAgICAgICBpZiAoJGFscmVh
ZHlMaWNlbnNlZCkgew0KICAgICAgICAgICAgICAgICRzaG91bGRDb250aW51ZSA9
IEFzay1Db250aW51ZS1Gb3JMaWNlbnNlZFByb2R1Y3QgJGl0ZW0uTmFtZQ0KICAg
ICAgICAgICAgfQ0KICAgICAgICAgICAgaWYgKCRzaG91bGRDb250aW51ZSkgew0K
ICAgICAgICAgICAgICAgICR0b0FjdGl2YXRlICs9ICRpdGVtDQogICAgICAgICAg
ICB9DQogICAgICAgIH0NCiAgICAgICAgJHNlbGVjdGVkID0gJHRvQWN0aXZhdGUN
CmlmICgkc2VsZWN0ZWQuQ291bnQgLWVxIDApIHsNCiAgICBXcml0ZS1Ib3N0DQog
ICAgV3JpdGUtSG9zdCAkTC5ub1Byb2R1Y3RzTGVmdCAtRm9yZWdyb3VuZENvbG9y
IEdyZWVuDQogICAgfQ0KfSBlbHNlIHsNCiAgICAgICAgJHRvQWN0aXZhdGUgPSBA
KCkNCiAgICAgICAgZm9yZWFjaCAoJGl0ZW0gaW4gJHNlbGVjdGlvbkxpc3QpIHsN
CiAgICAgICAgICAgICRpc1dpbmRvd3MgPSBJc1N1cHBvcnRlZFdpblByb2R1Y3Qg
JGl0ZW0NCiAgICAgICAgICAgICRpc09mZmljZSAgPSAkaXRlbS5OYW1lIC1tYXRj
aCAiT2ZmaWNlIg0KICAgICAgICAgICAgJGFscmVhZHlMaWNlbnNlZCA9ICRmYWxz
ZQ0KICAgICAgICAgICAgaWYgKCRpc1dpbmRvd3MgLWFuZCAkcmVhbExpY2Vuc2Vk
V2luZG93cykgew0KICAgICAgICAgICAgICAgICRhbHJlYWR5TGljZW5zZWQgPSAk
dHJ1ZQ0KICAgICAgICAgICAgfQ0KICAgICAgICAgICAgaWYgKCRpc09mZmljZSAt
YW5kICRyZWFsTGljZW5zZWRPZmZpY2UpIHsNCiAgICAgICAgICAgICAgICAkYWxy
ZWFkeUxpY2Vuc2VkID0gJHRydWUNCiAgICAgICAgICAgIH0NCiAgICAgICAgICAg
ICRzaG91bGRDb250aW51ZSA9ICR0cnVlDQogICAgICAgICAgICBpZiAoJGFscmVh
ZHlMaWNlbnNlZCkgew0KICAgICAgICAgICAgICAgICRzaG91bGRDb250aW51ZSA9
IEFzay1Db250aW51ZS1Gb3JMaWNlbnNlZFByb2R1Y3QtVGltZW91dCAkaXRlbS5O
YW1lDQogICAgICAgICAgICB9DQogICAgICAgICAgICBpZiAoJHNob3VsZENvbnRp
bnVlKSB7DQogICAgICAgICAgICAgICAgJHRvQWN0aXZhdGUgKz0gJGl0ZW0NCiAg
ICAgICAgICAgIH0NCiAgICAgICAgfQ0KaWYgKCR0b0FjdGl2YXRlLkNvdW50IC1l
cSAwKSB7DQogICAgV3JpdGUtSG9zdA0KICAgIFdyaXRlLUhvc3QgJEwubm9Qcm9k
dWN0c0xlZnQgLUZvcmVncm91bmRDb2xvciBHcmVlbg0KICAgIH0NCiAgICAkc2Vs
ZWN0ZWQgPSAkdG9BY3RpdmF0ZQ0KICAgIH0NCiAgICAkdmVyID0gW0xpYlRTZm9y
Z2UuVXRpbHNdOjpEZXRlY3RWZXJzaW9uKCkNCiAgICAkcHJvZCAgPSBbTGliVFNm
b3JnZS5TUFAuU1BQVXRpbHNdOjpEZXRlY3RDdXJyZW50S2V5KCkNCmlmICgkc2Vs
ZWN0ZWQgLWFuZCBAKCRzZWxlY3RlZCkuQ291bnQgLWdlIDEpIHsNCiAgICBpZiAo
LW5vdCAkdyAtYW5kIC1ub3QgJG8pIHsNCiAgICAgICAgJGttc1Byb2R1Y3QgPSAk
c2VsZWN0ZWQgfCBXaGVyZS1PYmplY3QgeyAkXy5EZXNjcmlwdGlvbiAtbWF0Y2gg
J0tNU3xWT0xVTUVfS01TJyB9IHwgU2VsZWN0LU9iamVjdCAtRmlyc3QgMQ0KICAg
ICAgICAgICAgaWYgKCRrbXNQcm9kdWN0KSB7DQogICAgICAgICAgICBTZXQtUmFu
ZG9tS01TQWRkcmVzcyAtcHJvZHVjdERlc2NyaXB0aW9uICRrbXNQcm9kdWN0LkRl
c2NyaXB0aW9uDQogICAgICAgICAgICB9DQogICAgICAgIH0NCmZvcmVhY2ggKCRp
dGVtIGluICRzZWxlY3RlZCkgew0KICAgICR0c2FjdGlkID0gJGl0ZW0uSUQNCiAg
ICAgICAgJGtleSAgICAgPSAkbnVsbA0KICAgIFdyaXRlLUhvc3QNCiAgICBXcml0
ZS1Ib3N0ICItLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0iIC1G
b3JlZ3JvdW5kQ29sb3IgV2hpdGUNCiAgICBXcml0ZS1Ib3N0ICgkTC5hY3RpdmF0
aW5nUHJvZHVjdCAtZiAkaXRlbS5OYW1lKSAtRm9yZWdyb3VuZENvbG9yIEdyZWVu
DQogICAgV3JpdGUtSG9zdA0KICAgIFdyaXRlLUhvc3QgKCRMLmlkTGFiZWwgLWYg
JHRzYWN0aWQpIC1Gb3JlZ3JvdW5kQ29sb3IgRGFya0dyZWVuDQogICAgV3JpdGUt
SG9zdCAoJEwubmFtZUxhYmVsIC1mICRpdGVtLk5hbWUpIC1Gb3JlZ3JvdW5kQ29s
b3IgV2hpdGUNCiAgICBXcml0ZS1Ib3N0ICgkTC5kZXNjcmlwdGlvbkxhYmVsIC1m
ICRpdGVtLkRlc2NyaXB0aW9uKSAtRm9yZWdyb3VuZENvbG9yIERhcmtHcmVlbg0K
aWYgKCRpdGVtLkRlc2NyaXB0aW9uIC1tYXRjaCAnVklSVFVBTF9NQUNISU5FX0FD
VElWQVRJT04nKSB7DQogICAgV3JpdGUtSG9zdCAkTC5hdm1hUmVxdWlyZW1lbnRz
IC1Gb3JlZ3JvdW5kQ29sb3IgWWVsbG93DQogICAgV3JpdGUtSG9zdCAkTC5hdm1h
RmFpbHVyZVdhcm5pbmcgLUZvcmVncm91bmRDb2xvciBZZWxsb3cNCiAgICBXcml0
ZS1Ib3N0DQogICAgQWN0aXZhdGUtTGljZW5zZSAtZGVzYyAkaXRlbS5EZXNjcmlw
dGlvbiAtdmVyICR2ZXIgLXByb2QgJHByb2QgLWlkICR0c2FjdGlkDQogICAgQ29u
dGludWUNCn0NCmlmICgkaXRlbS5EZXNjcmlwdGlvbiAtbWF0Y2ggJ0tNU3xWT0xV
TUV8UkVUQUlMfE1BS3xPRU0nKSB7DQogICAgJGNoYW5uZWxTb3VyY2UgPSAkaXRl
bS5EZXNjcmlwdGlvbg0KICAgICRleHRyYWN0ZWRDaGFubmVsID0gJEwudW5rbm93
bg0KaWYgKCRjaGFubmVsU291cmNlIC1tYXRjaCAnUkVUQUlMXChNQUtcKScpIHsN
CiAgICAkZXh0cmFjdGVkQ2hhbm5lbCA9ICdSRVRBSUwoTUFLKScNCiAgICB9IGVs
c2VpZiAoJGNoYW5uZWxTb3VyY2UgLW1hdGNoICdSRVRBSUwnKSB7DQogICAgJGV4
dHJhY3RlZENoYW5uZWwgPSAnUkVUQUlMJw0KICAgIH0gZWxzZWlmICgkY2hhbm5l
bFNvdXJjZSAtbWF0Y2ggJ01BSycpIHsNCiAgICAkZXh0cmFjdGVkQ2hhbm5lbCA9
ICdNQUsnDQogICAgfSBlbHNlaWYgKCRjaGFubmVsU291cmNlIC1tYXRjaCAnT0VN
Jykgew0KICAgICRleHRyYWN0ZWRDaGFubmVsID0gJ09FTScNCiAgICB9IGVsc2Vp
ZiAoJGNoYW5uZWxTb3VyY2UgLW1hdGNoICdWT0xVTUVfS01TJykgew0KICAgICRl
eHRyYWN0ZWRDaGFubmVsID0gJ1ZPTFVNRV9LTVMnDQogICAgfSBlbHNlaWYgKCRj
aGFubmVsU291cmNlIC1tYXRjaCAnVk9MVU1FJykgew0KICAgICRleHRyYWN0ZWRD
aGFubmVsID0gJ1ZPTFVNRScNCiAgICB9IGVsc2VpZiAoJGNoYW5uZWxTb3VyY2Ug
LW1hdGNoICdLTVMnKSB7DQogICAgJGV4dHJhY3RlZENoYW5uZWwgPSAnS01TJw0K
ICAgIH0gZWxzZWlmICgkY2hhbm5lbFNvdXJjZSAtbWF0Y2ggJ01vbmRvVkxfTUFL
Jykgew0KICAgICRleHRyYWN0ZWRDaGFubmVsID0gJ01vbmRvVkxfTUFLJw0KfQ0K
aWYgKCRleHRyYWN0ZWRDaGFubmVsIC1lcSAkTC51bmtub3duIC1hbmQgKCRjaGFu
bmVsU291cmNlIC1tYXRjaCAnKFx3KylccytjaGFubmVsJykpIHsNCiAgICAkbWF0
Y2ggPSAkY2hhbm5lbFNvdXJjZSB8IFNlbGVjdC1TdHJpbmcgLVBhdHRlcm4gJyhc
dyspXHMrY2hhbm5lbCcNCiAgICBpZiAoJG1hdGNoKSB7DQogICAgICAgICR3b3Jk
QmVmb3JlQ2hhbm5lbCA9ICRtYXRjaC5NYXRjaGVzWzBdLkdyb3Vwc1sxXS5WYWx1
ZQ0KICAgICAgICBpZiAoJHdvcmRCZWZvcmVDaGFubmVsIC1tYXRjaCAnUkVUQUlM
fE1BS3xPRU18Vk9MVU1FfEtNU3xNb25kb1ZMX01BSycpIHsNCiAgICAgICAgICAg
ICRleHRyYWN0ZWRDaGFubmVsID0gJHdvcmRCZWZvcmVDaGFubmVsDQogICAgICAg
IH0NCiAgICB9DQp9DQogICAgV3JpdGUtSG9zdCAoJEwua2V5Q2hhbm5lbExhYmVs
IC1mICRleHRyYWN0ZWRDaGFubmVsKSAtRm9yZWdyb3VuZENvbG9yIERhcmtDeWFu
DQogICAgJGtleSA9IEdldFJhbmRvbUtleSAtUHJvZHVjdElEICR0c2FjdGlkDQog
ICAgaWYgKCRudWxsIC1lcSAka2V5KSB7DQogICAgICAgIFdyaXRlLUhvc3QgKCRM
LmtleU5vdEZvdW5kU2tpcCAtZiAkdHNhY3RpZCkgLUZvcmVncm91bmRDb2xvciBS
ZWQNCiAgICAgICAgQ29udGludWUNCiAgICB9DQogICAgV3JpdGUtSG9zdCAoJEwu
cHJvZHVjdEtleUxhYmVsIC1mICRrZXkpIC1Gb3JlZ3JvdW5kQ29sb3IgV2hpdGUN
CiAgICB9DQogICAgZWxzZSB7DQogICAgV3JpdGUtSG9zdCAkTC5tYW51YWxLZXlS
ZXF1aXJlZCAtRm9yZWdyb3VuZENvbG9yIFJlZA0KICAgIFdyaXRlLUhvc3QgJEwu
bWFudWFsS2V5SW5mbyAtRm9yZWdyb3VuZENvbG9yIFllbGxvdw0KICAgICRrZXkg
PSBSZWFkLUhvc3QgJEwubWFudWFsS2V5UHJvbXB0DQogRC1pZiAoW3N0cmluZ106
OklzTnVsbE9yRW1wdHkoJGtleSkpIHsNCiAgICAgICAgV3JpdGUtSG9zdCAkTC5u
b0tleUVudGVyZWRTa2lwIC1Gb3JlZ3JvdW5kQ29sb3IgWWVsbG93DQogICAgICAg
IENvbnRpbnVlDQogICAgICAgIH0NCiAgICB9DQppZiAoJGl0ZW0uTmFtZSAtbWF0
Y2ggJ15XaW5kb3dzXChSXCksICcgLWFuZCAoSXNTdXBwb3J0ZWRXaW5Qcm9kdWN0
ICRpdGVtKSkgew0KICAgIFdyaXRlLUhvc3QgJEwuaW5zdGFsbGluZ0tleSAtRm9y
ZWdyb3VuZENvbG9yIERhcmtZZWxsb3cNCiAgICB0cnkgew0KICAgICYgY3Njcmlw
dC5leGUgIiRlbnY6U3lzdGVtUm9vdFxTeXN0ZW0zMlxzbG1nci52YnMiIC9pcGsg
JGtleSB8IE91dC1OdWxsDQogICAgV3JpdGUtSG9zdCAkTC5rZXlJbnN0YWxsU3Vj
Y2Vzc1dpbmRvd3MgLUZvcmVncm91bmRDb2xvciBHcmVlbg0KICAgIH0gY2F0Y2gg
ew0KICAgIFdyaXRlLUhvc3QgKCRMLmtleUluc3RhbGxGYWlsV2luZG93cyAtZiAk
XykgLUZvcmVncm91bmRDb2xvciBSZWQNCiAgICAgICAgfQ0KICAgIH0gZWxzZSB7
DQogICAgV3JpdGUtSG9zdCAkTC5pbnN0YWxsaW5nS2V5IC1Gb3JlZ3JvdW5kQ29s
b3IgRGFya1llbGxvdw0KICAgIHRyeSB7DQogICAgY3NjcmlwdC5leGUgIiRvZmZp
Y2VQYXRoXG9zcHAudmJzIiAvaW5wa2V5OiRrZXkgfCBPdXQtTnVsbA0KICAgIFdy
aXRlLUhvc3QgJEwua2V5SW5zdGFsbFN1Y2Nlc3NPZmZpY2UgLUZvcmVncm91bmRD
b2xvciBHcmVlbg0KICAgIH0gY2F0Y2ggew0KICAgIFdyaXRlLUhvc3QgKCRMLmtl
eUluc3RhbGxGYWlsT2ZmaWNlIC1mICRfKSAtRm9yZWdyb3VuZENvbG9yIFJlZA0K
ICAgICAgICB9DQogICAgfQ0KICAgIFdyaXRlLUhvc3QgJEwuYWN0aXZhdGluZ0xp
Y2Vuc2UgLUZvcmVncm91bmRDb2xvciBEYXJrWWVsbG93DQogICAgQWN0aXZhdGUt
TGljZW5zZSAtZGVzYyAkaXRlbS5EZXNjcmlwdGlvbiAtdmVyICR2ZXIgLXByb2Qg
JHByb2QgLWlkICR0c2FjdGlkDQogICAgV3JpdGUtSG9zdCAkTC5jaGVja2luZ1N0
YXR1cyAtRm9yZWdyb3VuZENvbG9yIERhcmtZZWxsb3cNCiAgICBXcml0ZS1Ib3N0
DQogICAgICAgIGlmICgkaXRlbS5OYW1lIC1tYXRjaCAnXldpbmRvd3NcKFJcKSwg
JyAtYW5kIChJc1N1cHBvcnRlZFdpblByb2R1Y3QgJGl0ZW0pKSB7DQogICAgICAg
ICAgICB0cnkgew0KICAgICAgICAgICAgJG91dHB1dCA9IGNzY3JpcHQuZXhlIC8v
Tm9sb2dvICIkZW52OlN5c3RlbVJvb3RcU3lzdGVtMzJcc2xtZ3IudmJzIiAveHBy
ICR0c2FjdGlkDQogICAgICAgICAgICBXcml0ZS1Ib3N0ICRvdXRwdXQgLUZvcmVn
cm91bmRDb2xvciBDeWFuDQogICAgICAgIH0gY2F0Y2ggew0KICAgICAgICBXcml0
ZS1Ib3N0ICRMLnNsbWdyRXJyb3IgLUZvcmVncm91bmRDb2xvciBSZWQNCiAgICAg
ICAgfQ0KICAgIH0gZWxzZWlmICgkaXRlbS5OYW1lIC1tYXRjaCAiT2ZmaWNlIikg
ew0KICAgICAgICB0cnkgew0KICAgICAgICAkb3V0cHV0ID0gY3NjcmlwdC5leGUg
Ly9Ob2xvZ28gIiRlbnY6U3lzdGVtUm9vdFxTeXN0ZW0zMlxzbG1nci52YnMiIC94
cHIgJHRzYWN0aWQNCiAgICAgICAgV3JpdGUtSG9zdCAkb3V0cHV0IC1Gb3JlZ3Jv
dW5kQ29sb3IgQ3lhbg0KICAgICAgICB9IGNhdGNoIHsNCiAgICAgICAgV3JpdGUt
SG9zdCAkTC5zbG1nckVycm9yIC1Gb3JlZ3JvdW5kQ29sb3IgUmVkDQogICAgICAg
IH0NCiAgICB9DQogICAgJHN0YXR1cyA9IChHZXQtQ2ltSW5zdGFuY2UgLUNsYXNz
TmFtZSBTb2Z0d2FyZUxpY2Vuc2luZ1Byb2R1Y3QgfCBXaGVyZS1PYmplY3QgeyAk
Xy5JRCAtZXEgJHRzYWN0aWQgfSkuTGljZW5zZVN0YXR1cw0KaWYgKCRzdGF0dXMg
LWVxIDEpIHsNCiAgICBXcml0ZS1Ib3N0ICgkTC5hY3RpdmF0aW9uU3VjY2VzcyAt
ZiAkaXRlbS5OYW1lKSAtRm9yZWdyb3VuZENvbG9yIEdyZWVuDQogICAgfSBlbHNl
IHsNCiAgICBXcml0ZS1Ib3N0ICgkTC5hY3RpdmF0aW9uRmFpbHVyZSAtZiAkaXRl
bS5OYW1lLCAkc3RhdHVzKSAtRm9yZWdyb3VuZENvbG9yIFJlZA0KICAgIFdyaXRl
LUhvc3QgJEwuYWN0aXZhdGlvbkZhaWx1cmVJbmZvIC1Gb3JlZ3JvdW5kQ29sb3Ig
WWVsbG93DQogICAgfQ0KICAgIFdyaXRlLUhvc3QNCiAgICBXcml0ZS1Ib3N0ICgk
TC5hY3RpdmF0aW9uQ29tcGxldGUgLWYgJGl0ZW0uTmFtZSkgLUZvcmVncm91bmRD
b2xvciBHcmVlbg0KICAgIFdyaXRlLUhvc3QgIi0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLSIgLUZvcmVncm91bmRDb2xvciBXaGl0ZQ0KICAgIH0N
Cn0NCmlmICgtbm90ICR3IC1hbmQgLW5vdCAkbykgew0KICAgIFdyaXRlLUhvc3QN
CiAgICBTdGFydC1TbGVlcCAtU2Vjb25kcyAxDQogICAgfSBlbHNlIHsNCiAgICBX
cml0ZS1Ib3N0DQogICAgZm9yICgkaSA9IDU7ICRpIC1nZSAxOyAkaS0tKSB7DQog
ICAgV3JpdGUtSG9zdCAtTm9OZXdsaW5lICgkTC5hdXRvQ2xvc2VDb3VudGRvd24g
LWYgJGkpIC1Gb3JlZ3JvdW5kQ29sb3IgWWVsbG93DQogICAgU3RhcnQtU2xlZXAg
LVNlY29uZHMgMQ0KICAgICAgICB9DQogICAgfQ0KfQ0KIyAtLS0gTUFJTiBGT05L
U8SwWU9OVSAtLS0NCg0KDQojIC0tLSBDQUxMIFdFQlNFUlZJQ0UgRk9OS1PEsFlP
TlUgLS0tDQpmdW5jdGlvbiBDYWxsLVdlYlNlcnZpY2Ugew0KICAgIHBhcmFtICgN
CiAgICAgICAgW2ludF0kcmVxdWVzdFR5cGUsDQogICAgICAgIFtzdHJpbmddJGlu
c3RhbGxhdGlvbklkLA0KICAgICAgICBbc3RyaW5nXSRleHRlbmRlZFByb2R1Y3RJ
ZA0KICAgICkNCiAgICANCiAgICBbTmV0LlNlcnZpY2VQb2ludE1hbmFnZXJdOjpT
ZWN1cml0eVByb3RvY29sID0gW05ldC5TZWN1cml0eVByb3RvY29sVHlwZV06OlRs
czEyDQogICAgDQpmdW5jdGlvbiBQYXJzZS1Tb2FwUmVzcG9uc2Ugew0KICAgICAg
ICBwYXJhbSAoDQogICAgICAgICAgICBbUGFyYW1ldGVyKE1hbmRhdG9yeT0kdHJ1
ZSldDQogICAgICAgICAgICBbc3RyaW5nXSRzb2FwUmVzcG9uc2UNCiAgICAgICAg
KQ0KICAgICAgICAkdW5lc2NhcGVkWG1sID0gW1N5c3RlbS5OZXQuV2ViVXRpbGl0
eV06Okh0bWxEZWNvZGUoJHNvYXBSZXNwb25zZSkNCiAgICAgICAgaWYgKCR1bmVz
Y2FwZWRYbWwgLW1hdGNoICI8RXJyb3JDb2RlPiguKj8pPC9FcnJvckNvZGU+Iikg
ew0KICAgICAgICAgICAgJGVycm9yQ29kZSA9ICRtYXRjaGVzWzFdDQogICAgICAg
ICAgICBzd2l0Y2ggKCRlcnJvckNvZGUpIHsNCiAgICAgICAgICAgICAgICAiMHg3
RiIgeyB0aHJvdyBbU3lzdGVtLkV4Y2VwdGlvbl06Om5ldygkTC5tYWtMaW1pdFJl
YWNoZWQpIH0NCiAgICAgICAgICAgICAgICAiMHg2NyIgeyB0aHJvdyBbU3lzdGVt
LkV4Y2VwdGlvbl06Om5ldygkTC5rZXlCbG9ja2VkKSB9DQogICAgICAgICAgICAg
ICAgIjB4NjgiIHsgdGhyb3cgW1N5c3RlbS5FeGNlcHRpb25dOjpuZXcoJEwuaW52
YWxpZEtleSkgfQ0KICAgICAgICAgICAgICAgICIweDg2IiB7IHRocm93IFtTeXN0
ZW0uRXhjZXB0aW9uXTo6bmV3KCRMLmludmFsaWRLZXlUeXBlKSB9DQogICAgICAg
ICAgICAgICAgIjB4OTAiIHsgdGhyb3cgW1N5c3RlbS5FeGNlcHRpb25dOjpuZXco
JEwuY2hlY2tJbnN0YWxsSWQpIH0NCiAgICAgICAgICAgICAgICBkZWZhdWx0IHsg
dGhyb3cgW1N5c3RlbS5FeGNlcHRpb25dOjpuZXcoKCRMLnJlbW90ZVNlcnZlckVy
cm9yIC1mICRlcnJvckNvZGUpKSB9DQogICAgICAgICAgICB9DQogICAgICAgIH0N
CmlmICgkdW5lc2NhcGVkWG1sIC1tYXRjaCAiPFJlc3BvbnNlVHlwZT4oLio/KTwv
UmVzcG9uc2VUeXBlPiIpIHsNCiAgICAkcmVzcG9uc2VUeXBlID0gJG1hdGNoZXNb
MV0NCiAgICBzd2l0Y2ggKCRyZXNwb25zZVR5cGUpIHsNCiAgICAiMSIgew0KICAg
IGlmICgkdW5lc2NhcGVkWG1sIC1tYXRjaCAiPENJRD4oLio/KTwvQ0lEPiIpIHsN
CiAgICByZXR1cm4gJG1hdGNoZXNbMV0NCiAgICB9IGVsc2Ugew0KICAgIHRocm93
ICRMLmNpZE5vdEZvdW5kDQogICAgfQ0KfQ0KICAgICIyIiB7DQppZiAoJHVuZXNj
YXBlZFhtbCAtbWF0Y2ggIjxBY3RpdmF0aW9uUmVtYWluaW5nPiguKj8pPC9BY3Rp
dmF0aW9uUmVtYWluaW5nPiIpIHsNCiAgICByZXR1cm4gJG1hdGNoZXNbMV0NCiAg
ICB9IGVsc2Ugew0KICAgIHRocm93ICRMLmFjdGl2YXRpb25SZW1haW5pbmdOb3RG
b3VuZA0KICAgIH0NCn0NCiAgICBkZWZhdWx0IHsNCiAgICB0aHJvdyAkTC51bmtu
b3duU2VydmVyUmVzcG9uc2UNCiAgICAgICAgfQ0KICAgIH0NCiAgICB9IGVsc2Ug
ew0KICAgIHRocm93ICRMLnJlc3BvbnNlVHlwZU5vdEZvdW5kDQogICAgfQ0KfQ0K
ICAgIA0KZnVuY3Rpb24gQ3JlYXRlLVdlYlJlcXVlc3Qgew0KICAgIHBhcmFtICgN
CiAgICBbUGFyYW1ldGVyKE1hbmRhdG9yeT0kdHJ1ZSldDQogICAgW3N0cmluZ10k
c29hcFJlcXVlc3QNCiAgICApDQogICAgJFVyaSA9IE5ldy1PYmplY3QgVXJpKCJo
dHRwczovL2FjdGl2YXRpb24uc2xzLm1pY3Jvc29mdC5jb20vQmF0Y2hBY3RpdmF0
aW9uL0JhdGNoQWN0aXZhdGlvbi5hc214IikNCiAgICAkQWN0aW9uID0gImh0dHA6
Ly93d3cubWljcm9zb2Z0LmNvbS9CYXRjaEFjdGl2YXRpb25TZXJ2aWNlL0JhdGNo
QWN0aXZhdGUiDQogICAgJHdlYlJlcXVlc3QgPSBbU3lzdGVtLk5ldC5IdHRwV2Vi
UmVxdWVzdF06OkNyZWF0ZSgkVXJpKQ0KICAgICR3ZWJSZXF1ZXN0LkFjY2VwdCA9
ICJ0ZXh0L3htbCINCiAgICAkd2ViUmVxdWVzdC5Db250ZW50VHlwZSA9ICJ0ZXh0
L3htbDsgY2hhcnNldD1gInV0Zi04YCIiDQogICAgJHdlYlJlcXVlc3QuSGVhZGVy
cy5BZGQoIlNPQVBBY3Rpb24iLCAkQWN0aW9uKQ0KICAgICR3ZWJSZXF1ZXN0Lkhv
c3QgPSAiYWN0aXZhdGlvbi5zbHMubWljcm9zb2Z0LmNvbSINCiAgICAkd2ViUmVx
dWVzdC5NZXRob2QgPSAiUE9TVCINCiAgICB0cnkgew0KICAgICAgICAkYnl0ZUFy
cmF5ID0gW1N5c3RlbS5UZXh0LkVuY29kaW5nXTo6VVRGOC5HZXRCeXRlcygkc29h
cFJlcXVlc3QpDQogICAgICAgICR3ZWJSZXF1ZXN0LkNvbnRlbnRMZW5ndGggPSAk
Ynl0ZUFycmF5Lkxlbmd0aA0KICAgICAgICAkc3RyZWFtID0gJHdlYlJlcXVlc3Qu
R2V0UmVxdWVzdFN0cmVhbSgpDQogICAgICAgICRzdHJlYW0uV3JpdGUoJGJ5dGVB
cnJheSwgMCwgJGJ5dGVBcnJheS5MZW5ndGgpDQogICAgICAgICRzdHJlYW0uQ2xv
c2UoKQ0KICAgICAgICByZXR1cm4gJHdlYlJlcXVlc3QNCiAgICB9IGNhdGNoIHsN
CiAgICB0aHJvdyAkXw0KICAgIH0NCn0NCmZ1bmN0aW9uIENyZWF0ZS1Tb2FwUmVx
dWVzdCB7DQogICAgcGFyYW0gKA0KICAgIFtpbnRdJHJlcXVlc3RUeXBlLA0KICAg
IFtzdHJpbmddJGluc3RhbGxhdGlvbklkLA0KICAgIFtzdHJpbmddJGV4dGVuZGVk
UHJvZHVjdElkDQogICAgKQ0KICAgICRhY3RpdmF0aW9uUmVxdWVzdFhtbCA9IEAi
DQo8QWN0aXZhdGlvblJlcXVlc3QgeG1sbnM9Imh0dHA6Ly93d3cubWljcm9zb2Z0
LmNvbS9EUk0vU0wvQmF0Y2hBY3RpdmF0aW9uUmVxdWVzdC8xLjAiPg0KICA8VmVy
c2lvbk51bWJlcj4yLjA8L1ZlcnNpb25OdW1iZXI+DQogIDxSZXF1ZXN0VHlwZT4k
cmVxdWVzdFR5cGU8L1JlcXVlc3RUeXBlPg0KICA8UmVxdWVzdHM+DQogICAgPFJl
cXVlc3Q+DQogICAgICA8UElEPiRleHRlbmRlZFByb2R1Y3RJZDwvUElEPg0KICAg
ICAgPElJRD4kaW5zdGFsbGF0aW9uSWQ8L0lJRD4NCiAgICA8L1JlcXVlc3Q+DQog
IDwvUmVxdWVzdHM+DQo8L0FjdGl2YXRpb25SZXF1ZXN0Pg0KIkANCmlmICgkcmVx
dWVzdFR5cGUgLW5lIDEpIHsNCiAgICAkYWN0aXZhdGlvblJlcXVlc3RYbWwgPSAk
YWN0aXZhdGlvblJlcXVlc3RYbWwgLXJlcGxhY2UgJ1xzKjxJSUQ+Lio/PC9JSUQ+
XHMqJywgJycNCiAgICB9DQogICAgJGJhc2U2NFJlcXVlc3RYbWwgPSBbQ29udmVy
dF06OlRvQmFzZTY0U3RyaW5nKFtTeXN0ZW0uVGV4dC5FbmNvZGluZ106OlVuaWNv
ZGUuR2V0Qnl0ZXMoJGFjdGl2YXRpb25SZXF1ZXN0WG1sKSkNCiAgICAkaG1hY1NI
QSA9IE5ldy1PYmplY3QgU3lzdGVtLlNlY3VyaXR5LkNyeXB0b2dyYXBoeS5ITUFD
U0hBMjU2DQogICAgJGhtYWNTSEEuS2V5ID0gW2J5dGVbXV1AKA0KICAgIDI1NCwg
NDksIDE1MiwgMTE3LCAyNTEsIDcyLCAxMzIsIDEzNCwgMTU2LCAyNDMsIDI0MSwg
MjA2LCAxNTMsIDE2OCwgMTQ0LCAxMDAsIA0KICAgIDE3MSwgODcsIDMxLCAyMDIs
IDcxLCA0LCA4MCwgODgsIDQ4LCAzNiwgMjI2LCAyMCwgOTgsIDEzNSwgMTIxLCAx
NjAsIDAsIDAsIDAsIDAsDQogICAgMCwgMCwgMCwgMCwgMCwgMCwgMCwgMCwgMCwg
MCwgMCwgMCwgMCwgMCwgMCwgMCwgMCwgMCwgMCwgMCwgMCwgMCwgMCwgMA0KICAg
ICkNCiAgICAkZGlnZXN0ID0gW0NvbnZlcnRdOjpUb0Jhc2U2NFN0cmluZygkaG1h
Y1NIQS5Db21wdXRlSGFzaChbU3lzdGVtLlRleHQuRW5jb2RpbmddOjpVbmljb2Rl
LkdldEJ5dGVzKCRhY3RpdmF0aW9uUmVxdWVzdFhtbCkpKQ0KICAgIHJldHVybiBA
Ig0KPHNvYXA6RW52ZWxvcGUgeG1sbnM6c29hcD0iaHR0cDovL3NjaGVtYXMueG1s
c29hcC5vcmcvc29hcC9lbnZlbG9wZS8iIHhtbG5zOnhzaT0iaHR0cDovL3d3dy53
My5vcmcvMjAwMS9YTUxTY2hlbWEtaW5zdGFuY2UiIHhtbG5zOnhzZD0iaHR0cDov
L3d3dy53My5vcmcvMjAwMS9YTUxTY2hlbWEiPg0KICA8c29hcDpCb2R5Pg0KICAg
IDxCYXRjaEFjdGl2YXRlIHhtbG5zPSJodHRwOi8vd3d3Lm1pY3Jvc29mdC5jb20v
QmF0Y2hBY3RpdmF0aW9uU2VydmljZSI+DQogICAgICA8cmVxdWVzdD4NCiAgICAg
ICAgPERpZ2VzdD4kZGlnZXN0PC9EaWdlc3Q+DQogICAgICAgIDxSZXF1ZXN0WG1s
PiRiYXNlNjRSZXF1ZXN0WG1sPC9SZXF1ZXN0WG1sPg0KICAgICAgPC9yZXF1ZXN0
Pg0KICAgIDwvQmF0Y2hBY3RpdmF0ZT4NCiAgPC9zb2FwOkJvZHk+DQo8L3NvYXA6
RW52ZWxvcGU+DQoiQA0KICAgIH0NCiAgICBXcml0ZS1XYXJuaW5nICIkcmVxdWVz
dFR5cGUsICRpbnN0YWxsYXRpb25JZCwgJGV4dGVuZGVkUHJvZHVjdElkIg0KICAg
ICRzb2FwUmVxdWVzdCA9IENyZWF0ZS1Tb2FwUmVxdWVzdCAtcmVxdWVzdFR5cGUg
KFtpbnRdJHJlcXVlc3RUeXBlKSAtaW5zdGFsbGF0aW9uSWQgJGluc3RhbGxhdGlv
bklkIC1leHRlbmRlZFByb2R1Y3RJZCAkZXh0ZW5kZWRQcm9kdWN0SWQNCiAgICAk
d2ViUmVxdWVzdCA9IENyZWF0ZS1XZWJSZXF1ZXN0IC1zb2FwUmVxdWVzdCAkc29h
cFJlcXVlc3QNCiAgICB0cnkgew0KICAgICAgICAkd2ViUmVzcG9uc2UgPSAkd2Vi
UmVxdWVzdC5HZXRSZXNwb25zZSgpDQogICAgICAgICRzdHJlYW1SZWFkZXIgPSBO
ZXctT2JqZWN0IFN5c3RlbS5JTy5TdHJlYW1SZWFkZXIoJHdlYlJlc3BvbnNlLkdl
dFJlc3BvbnNlU3RyZWFtKCkpDQogICAgICAgICRzb2FwUmVzcG9uc2UgPSAkc3Ry
ZWFtUmVhZGVyLlJlYWRUb0VuZCgpDQogICAgICAgICNXcml0ZS1Ib3N0ICJIQU0g
U09BUCBZQU5JVEk6ICRzb2FwUmVzcG9uc2UiIC1Gb3JlZ3JvdW5kQ29sb3IgTWFn
ZW50YQ0KICAgICAgICAkUmVzcG9uc2UgPSBQYXJzZS1Tb2FwUmVzcG9uc2UgLXNv
YXBSZXNwb25zZSAkc29hcFJlc3BvbnNlDQogICAgICAgIHJldHVybiAkUmVzcG9u
c2UNCiAgICB9IGNhdGNoIHsNCiAgICAgICBXcml0ZS1XYXJuaW5nICgkTC5yZXF1
ZXN0RmFpbGVkIC1mICRfLkV4Y2VwdGlvbi5NZXNzYWdlKQ0KICAgIH0NCiAgICBy
ZXR1cm4gMA0KfQ0KIyAtLS0gQ0FMTCBXRUJTRVJWSUNFIEZPTktTxLBZT05VIC0t
LQ0KDQpNYWlu
-----END CERTIFICATE_TSF-----

::===============================================================================================================

:: Deßiütirilmemeli / Don't modify (hwid)

-----BEGIN CERTIFICATE_hwid-----
IyAtLS0gRN1MIEFZQVJMQVJJIC8gTEFOR1VBR0UgU0VUVElOR1MgLS0tDQojIN3+
bGV0aW0gc2lzdGVtaSBVSSBkaWxpbmkga29udHJvbCBldCAvIENoZWNrIHRoZSBP
UyBVSSBsYW5ndWFnZQ0KJEdsb2JhbDpJc1R1cmtpc2ggPSAoR2V0LVVJQ3VsdHVy
ZSkuTmFtZS5TdGFydHNXaXRoKCJ0ciIpDQoNCiMgVPxya+dlIGRpbCBkaXplbGVy
aSAvIFR1cmtpc2ggbGFuZ3VhZ2Ugc3RyaW5ncw0KJHNjcmlwdDpTdHJpbmdzX1RS
ID0gQHsNCiAgICB1bmtub3duU2VydmVyVmVyc2lvbiAgICA9ICJCaWxpbm1leWVu
IFNlcnZlciBT/HL8bfwiDQogICAga21zMzhGYWxsYmFjayAgICAgICAgICAgPSAi
SFdJRCBha3RpdmFzeW9udSBt/G1r/G4gZGXwaWxzZSwgS01TMzgga3VsbGFu/Wxh
Y2FrdP1yLiINCiAgICBldmFsU2VydmVyQWx0ICAgICAgICAgICA9ICJEZfBlcmxl
bmRpcm1lIHZlIFN1bnVjdSBz/HL8bWxlcmkgaedpbiBrb211dCBkb3N5YXP9IGFs
dGVybmF0aWYgefZudGVtbGVyIGt1bGxhbv1yIg0KICAgIHNhbmRib3hGb3VuZCAg
ICAgICAgICAgID0gIkJv/iBoaXptZXQgYnVsdW5kdSEgT2xhc/0gZGVuZW1lIG9y
dGFt/S4iDQogICAgYWN0aXZhdGlvblN0YXJ0ZWQgICAgICAgPSAiQWt0aXZhc3lv
biBp/mxlbWkgYmH+bGFk/SwgbPx0ZmVuIGJla2xleWluLi4uIg0KICAgIGNsaXBV
cE1pc3NpbmcgICAgICAgICAgID0gIkNsaXBVcC5leGUgZWtzaWshIg0KICAgIGRv
d25sb2FkaW5nQ2xpcFVwICAgICAgID0gIkNsaXBVcC5leGUgZG9zeWFz/SB1emFr
IHN1bnVjdWRhbiBpbmRpcmlsaXlvci4iDQogICAgY2xpcFVwU3VjY2VzcyAgICAg
ICAgICAgPSAiRG9zeWEgaW5kaXJpbGRpIHZlIGRv8HJ1bGFuZP0uIEtvbnVtdTog
ezB9Ig0KICAgIGNsaXBVcEZhaWxlZCAgICAgICAgICAgID0gIkRvc3lhIGRv8HJ1
bGFuYW1hZP0gdmUga2FsZP1y/Wxk/S4iDQogICAgY2xpcFVwRG93bmxvYWRFcnJv
ciAgICAgPSAiQ2xpcFVwLmV4ZSBpbmRpcmlsZW1lZGk6IHswfSINCiAgICBidWls
ZERldGVjdGVkICAgICAgICAgICA9ICJUZXNwaXQgZWRpbGVuIHlhcP0gbnVtYXJh
c/06IHswfSINCiAgICBidWlsZERldGVjdEZhaWxlZCAgICAgICA9ICJgblshXSBX
aW5kb3dzIHlhcP0gbnVtYXJhc/0gYWxn/WxhbmFtYWT9LiINCiAgICBidWlsZElu
dmFsaWQgICAgICAgICAgICA9ICJgblshXSBHZedlcnNpeiB5YXD9IG51bWFyYXP9
IGFsZ/1sYW5k/TogMCINCiAgICB1bnN1cHBvcnRlZEJ1aWxkICAgICAgICA9ICJg
blshXSBEZXN0ZWtsZW5tZXllbiBp/mxldGltIHNpc3RlbWkgc/xy/G38IGFsZ/1s
YW5k/TogezB9Ig0KICAgIHNjcmlwdFN1cHBvcnRJbmZvICAgICAgID0gIkJ1IGJl
dGlrIHlhbG79emNhIFdpbmRvd3MgU2VydmVyIDIwMTYgKEJ1aWxkIDE0MzkzKSB2
ZSBzb25yYWtpIHP8cvxtbGVyaSBkZXN0ZWtsZXIuIg0KICAgIHN1cHBvcnRlZFZl
cnNpb25zICAgICAgID0gIkRlc3Rla2xlbmVuIHP8cvxtbGVyOiINCiAgICBzZXJ2
ZXIyMDE2ICAgICAgICAgICAgICA9ICItIFdpbmRvd3MgU2VydmVyIDIwMTYgKEJ1
aWxkIDE0MzkzKykiDQogICAgc2VydmVyMjAxOSAgICAgICAgICAgICAgPSAiLSBX
aW5kb3dzIFNlcnZlciAyMDE5IChCdWlsZCAxNzc2MyspIg0KICAgIHNlcnZlcjIw
MjIgICAgICAgICAgICAgID0gIi0gV2luZG93cyBTZXJ2ZXIgMjAyMiAoQnVpbGQg
MjAzNDgrKSINCiAgICBzZXJ2ZXIyMDI1ICAgICAgICAgICAgICA9ICItIFdpbmRv
d3MgU2VydmVyIDIwMjUgKEJ1aWxkIDI2MTAwKykiDQogICAgd2luMTAxMSAgICAg
ICAgICAgICAgICAgPSAiLSBXaW5kb3dzIDEwLzExIChCdWlsZCAxMDI0MCspIg0K
ICAgIHNlcnZlclZlcnNpb25EZXRlY3RlZCAgID0gInswfSBz/HL8bfwgdGVzcGl0
IGVkaWxkaS4iDQogICAgdXNpbmdLbXMzOCAgICAgICAgICAgICAgPSAiS01TMzgg
efZudGVtaSBrdWxsYW79bGFjYWsuIg0KICAgIGV2YWxEZXRlY3RlZCAgICAgICAg
ICAgID0gIkRl8GVybGVuZGlybWUgc/xy/G38IHRlc3BpdCBlZGlsZGkuIg0KICAg
IHVuc3VwcG9ydGVkV2luQnVpbGQgICAgID0gImBuWyFdIERlc3Rla2xlbm1leWVu
IFdpbmRvd3Mgc/xy/G38OiBCdWlsZCB7MH0iDQogICAgaHdpZFN1cHBvcnRJbmZv
ICAgICAgICAgPSAiSFdJRCBBa3RpdmFzeW9uIHlhbG79emNhIFdpbmRvd3MgMTAv
MTEnZGUgZGVzdGVrbGVuaXIuIg0KICAgIGxpY2Vuc2luZ1NlcnZpY2VFcnJvciAg
ID0gIkxpc2Fuc2xhbWEgaGl6bWV0aSBiaWxnaWxlcmkgYWz9bmFtYWT9LiINCiAg
ICBlZGl0aW9uSWROb3RGb3VuZCAgICAgICA9ICJT/HL8bSBLaW1safBpIERl8Gn+
a2VuaSBidWx1bmFtYWT9Ig0KICAgIGVkaXRpb25EZXRlY3RlZCAgICAgICAgID0g
IlRlc3BpdCBlZGlsZW4gU/xy/G06IHswfSINCiAgICBncmlkVGl0bGUgICAgICAg
ICAgICAgICA9ICJUZXJjaWggZWRpbGVuIPxy/G4v/HL8bmxlcmkgc2XnaW4iDQog
ICAgcHJvZHVjdFNlbGVjdGVkICAgICAgICAgPSAiU2XnaWxlbiD8cvxuOiB7MH0i
DQogICAgcHJvZHVjdElkICAgICAgICAgICAgICAgPSAi3HL8biBJRDogezB9Ig0K
ICAgIGtleVRvVXNlICAgICAgICAgICAgICAgID0gIkt1bGxhbv1sYWNhayBhbmFo
dGFyOiB7MH0iDQogICAgZXJyb3JOb01hdGNoICAgICAgICAgICAgPSAiSEFUQTog
Rf5sZf5lbiD8cvxuIGJ1bHVuYW1hZP0iDQogICAgYXZhaWxhYmxlUHJvZHVjdHMg
ICAgICAgPSAiTWV2Y3V0IPxy/G5sZXI6Ig0KICAgIHByb2R1Y3RMaXN0SXRlbSAg
ICAgICAgID0gIi0gezB9IChJRDogezF9KSINCiAgICBlcnJvckttc0tleSAgICAg
ICAgICAgICA9ICJIQVRBOiBWT0xVTUVfS01TQ0xJRU5UIHP8cvxt/CBp52luIGFu
YWh0YXIgYWz9bmFtYWT9OiB7MH0iDQogICAgZXJyb3JJbnZhbGlkS2V5ICAgICAg
ICAgPSAiSEFUQTogR2XnZXJsaSBhbmFodGFyIGFs/W5hbWFk/SINCiAgICBzZWxl
Y3Rpb25DYW5jZWxsZWQgICAgICA9ICLccvxuIHNl52ltaSBpcHRhbCBlZGlsZGku
Ig0KICAgIGttc1JlZ1NldCAgICAgICAgICAgICAgID0gIktNUyByZWdpc3RyeSBh
eWFybGFy/SB5YXD9bGFuZP1y/Wxk/S4iDQogICAgaW5zdGFsbGluZ0tleSAgICAg
ICAgICAgPSAi3HL8biBhbmFodGFy/SB5/GtsZW5peW9yLi4uIg0KICAgIGNyZWF0
aW5nVGlja2V0ICAgICAgICAgID0gIkdlbnVpbmVUaWNrZXQgZG9zeWFz/SBvbHX+
dHVydWx1eW9yLi4uIg0KICAgIGluc3RhbGxpbmdUaWNrZXQgICAgICAgID0gIkdl
bnVpbmVUaWNrZXQgZG9zeWFz/SB5/GtsZW5peW9yLi4uIg0KICAgIHN0b3BwaW5n
U3Bwc3ZjICAgICAgICAgID0gIlNQUFNWQyBzZXJ2aXNpIGR1cmR1cnVsdXlvci4u
LiINCiAgICByZXN0YXJ0aW5nQ2xpcHN2YyAgICAgICA9ICJDbGlwU1ZDIHNlcnZp
c2kgeWVuaWRlbiBiYf5sYXT9bP15b3IuLi4iDQogICAgYWN0aXZhdGluZyAgICAg
ICAgICAgICAgPSAiQWt0aXZhc3lvbiBp/mxlbWkgZ2Vy52VrbGX+dGlyaWxpeW9y
Li4uIg0KICAgIHJlZnJlc2hpbmdMaWNlbnNlICAgICAgID0gIkxpc2FucyBkdXJ1
bXUgeWVuaWxlbml5b3IuLi4iDQogICAgZXJyb3JBY3RpdmF0aW9uRmFpbGVkICAg
PSAiSEFUQTogRXRraW5sZf50aXJpbGVtZWRpLiDd/mxlbSBpcHRhbCBlZGlsZGku
Ig0KICAgIGVycm9yRGV0YWlsICAgICAgICAgICAgID0gIkhhdGEgZGV0YXn9OiB7
MH0iDQogICAgcmVzdWx0SGVhZGVyICAgICAgICAgICAgPSAiPT09IEFLVN1WQVNZ
T04gU09OVUNVID09PSINCiAgICByZXN1bHRQcm9kdWN0ICAgICAgICAgICA9ICLc
cvxuOiB7MH0iDQogICAgc3RhdHVzMCAgICAgICAgICAgICAgICAgPSAiTGlzYW5z
c/16Ig0KICAgIHN0YXR1czEgICAgICAgICAgICAgICAgID0gIkxpc2Fuc2z9Ig0K
ICAgIHN0YXR1czIgICAgICAgICAgICAgICAgID0gIk9PQiBHcmFjZSINCiAgICBz
dGF0dXMzICAgICAgICAgICAgICAgICA9ICJPT1QgR3JhY2UiDQogICAgc3RhdHVz
NCAgICAgICAgICAgICAgICAgPSAiTm9uLUdlbnVpbmUgR3JhY2UiDQogICAgc3Rh
dHVzNSAgICAgICAgICAgICAgICAgPSAiQmlsZGlyaW0iDQogICAgc3RhdHVzNiAg
ICAgICAgICAgICAgICAgPSAiVXphdP1sbf3+IEdyYWNlIg0KICAgIHN0YXR1c1Vu
a25vd24gICAgICAgICAgID0gIkJpbGlubWV5ZW4gKHswfSkiDQogICAgcmVzdWx0
TGljZW5zZVN0YXR1cyAgICAgPSAiTGlzYW5zIER1cnVtdTogezB9Ig0KICAgIGFj
dGl2YXRpb25UeXBlS21zMzggICAgID0gIkFrdGl2YXN5b24gVPxy/DogS01TMzgi
DQogICAgdmFsaWRVbnRpbCAgICAgICAgICAgICAgPSAiTGlzYW5zIEdl52VybGls
aWs6IHswfSB5/Wz9bmEga2FkYXIiDQogICAgZGF5c1JlbWFpbmluZyAgICAgICAg
ICAgPSAiTGlzYW5zIGthbGFuIEf8biBTYXn9c/06IHswfSBn/G4iDQogICAga21z
MzhGYWlsICAgICAgICAgICAgICAgPSAiS01TMzggRXRraW5sZf50aXJtZSBCYf5h
cv1z/XouIEJpdGn+IHRhcmloaTogezB9Ig0KICAgIHRyeUFnYWluICAgICAgICAg
ICAgICAgID0gIkFrdGl2YXN5b24gaf5sZW1pbmkgZGFoYSBzb25yYSB0ZWtyYXIg
ZGVuZXlpbiINCiAgICBrbXMzOFN1Y2Nlc3MgICAgICAgICAgICA9ICJLTVMzOCBB
a3RpdmFzeW9udSBCYf5hcv1s/SEiDQogICAgYWN0aXZhdGlvblR5cGVId2lkICAg
ICAgPSAiQWt0aXZhc3lvbiBU/HL8OiBIV0lEIChEaWppdGFsIExpc2FucykiDQog
ICAgdmFsaWRQZXJtYW5lbnQgICAgICAgICAgPSAiTGlzYW5zIEdl52VybGlsaWs6
IEtBTElDSSAoRG9uYW79bSBpbGUgYmHwbGFudP1s/SBkaWppdGFsIGxpc2Fucyki
DQogICAgaHdpZFN1Y2Nlc3MgICAgICAgICAgICAgPSAiSFdJRCBBa3RpdmFzeW9u
dSBCYf5hcv1s/SEiDQogICAgdmFsaWRGYWlsZWQgICAgICAgICAgICAgPSAiTGlz
YW5zIEdl52VybGlsaWs6IEJh/mFy/XP9eiINCiAgICBod2lkRmFpbCAgICAgICAg
ICAgICAgICA9ICJIV0lEIEV0a2lubGX+dGlybWVzaSBCYf5hcv1z/XogT2xkdS4i
DQp9DQoNCiMg3W5naWxpemNlIGRpbCBkaXplbGVyaSAvIEVuZ2xpc2ggbGFuZ3Vh
Z2Ugc3RyaW5ncw0KJHNjcmlwdDpTdHJpbmdzX0VOID0gQHsNCiAgICB1bmtub3du
U2VydmVyVmVyc2lvbiAgICA9ICJVbmtub3duIFNlcnZlciBWZXJzaW9uIg0KICAg
IGttczM4RmFsbGJhY2sgICAgICAgICAgID0gIklmIEhXSUQgYWN0aXZhdGlvbiBp
cyBub3QgcG9zc2libGUsIEtNUzM4IHdpbGwgYmUgdXNlZC4iDQogICAgZXZhbFNl
cnZlckFsdCAgICAgICAgICAgPSAiVGhlIHNjcmlwdCB1c2VzIGFsdGVybmF0aXZl
IG1ldGhvZHMgZm9yIEV2YWx1YXRpb24gYW5kIFNlcnZlciB2ZXJzaW9ucyINCiAg
ICBzYW5kYm94Rm91bmQgICAgICAgICAgICA9ICJFbXB0eSBzZXJ2aWNlIGZvdW5k
ISBQb3NzaWJsZSBzYW5kYm94IGVudmlyb25tZW50LiINCiAgICBhY3RpdmF0aW9u
U3RhcnRlZCAgICAgICA9ICJBY3RpdmF0aW9uIHByb2Nlc3Mgc3RhcnRlZCwgcGxl
YXNlIHdhaXQuLi4iDQogICAgY2xpcFVwTWlzc2luZyAgICAgICAgICAgPSAiQ2xp
cFVwLmV4ZSBpcyBtaXNzaW5nISINCiAgICBkb3dubG9hZGluZ0NsaXBVcCAgICAg
ICA9ICJEb3dubG9hZGluZyBDbGlwVXAuZXhlIGZyb20gcmVtb3RlIHNlcnZlci4i
DQogICAgY2xpcFVwU3VjY2VzcyAgICAgICAgICAgPSAiRmlsZSBkb3dubG9hZGVk
IGFuZCB2ZXJpZmllZC4gTG9jYXRpb246IHswfSINCiAgICBjbGlwVXBGYWlsZWQg
ICAgICAgICAgICA9ICJGaWxlIGNvdWxkIG5vdCBiZSB2ZXJpZmllZCBhbmQgd2Fz
IHJlbW92ZWQuIg0KICAgIGNsaXBVcERvd25sb2FkRXJyb3IgICAgID0gIkNvdWxk
IG5vdCBkb3dubG9hZCBDbGlwVXAuZXhlOiB7MH0iDQogICAgYnVpbGREZXRlY3Rl
ZCAgICAgICAgICAgPSAiRGV0ZWN0ZWQgYnVpbGQgbnVtYmVyOiB7MH0iDQogICAg
YnVpbGREZXRlY3RGYWlsZWQgICAgICAgPSAiYG5bIV0gV2luZG93cyBidWlsZCBu
dW1iZXIgY291bGQgbm90IGJlIGRldGVjdGVkLiINCiAgICBidWlsZEludmFsaWQg
ICAgICAgICAgICA9ICJgblshXSBJbnZhbGlkIGJ1aWxkIG51bWJlciBkZXRlY3Rl
ZDogMCINCiAgICB1bnN1cHBvcnRlZEJ1aWxkICAgICAgICA9ICJgblshXSBVbnN1
cHBvcnRlZCBvcGVyYXRpbmcgc3lzdGVtIHZlcnNpb24gZGV0ZWN0ZWQ6IHswfSIN
CiAgICBzY3JpcHRTdXBwb3J0SW5mbyAgICAgICA9ICJUaGlzIHNjcmlwdCBvbmx5
IHN1cHBvcnRzIFdpbmRvd3MgU2VydmVyIDIwMTYgKEJ1aWxkIDE0MzkzKSBhbmQg
bGF0ZXIgdmVyc2lvbnMuIg0KICAgIHN1cHBvcnRlZFZlcnNpb25zICAgICAgID0g
IlN1cHBvcnRlZCB2ZXJzaW9uczoiDQogICAgc2VydmVyMjAxNiAgICAgICAgICAg
ICAgPSAiLSBXaW5kb3dzIFNlcnZlciAyMDE2IChCdWlsZCAxNDM5MyspIg0KICAg
IHNlcnZlcjIwMTkgICAgICAgICAgICAgID0gIi0gV2luZG93cyBTZXJ2ZXIgMjAx
OSAoQnVpbGQgMTc3NjMrKSINCiAgICBzZXJ2ZXIyMDIyICAgICAgICAgICAgICA9
ICItIFdpbmRvd3MgU2VydmVyIDIwMjIgKEJ1aWxkIDIwMzQ4KykiDQogICAgc2Vy
dmVyMjAyNSAgICAgICAgICAgICAgPSAiLSBXaW5kb3dzIFNlcnZlciAyMDI1IChC
dWlsZCAyNjEwMCspIg0KICAgIHdpbjEwMTEgICAgICAgICAgICAgICAgID0gIi0g
V2luZG93cyAxMC8xMSAoQnVpbGQgMTAyNDArKSINCiAgICBzZXJ2ZXJWZXJzaW9u
RGV0ZWN0ZWQgICA9ICJ7MH0gdmVyc2lvbiBkZXRlY3RlZC4iDQogICAgdXNpbmdL
bXMzOCAgICAgICAgICAgICAgPSAiS01TMzggbWV0aG9kIHdpbGwgYmUgdXNlZC4i
DQogICAgZXZhbERldGVjdGVkICAgICAgICAgICAgPSAiRXZhbHVhdGlvbiB2ZXJz
aW9uIGRldGVjdGVkLiINCiAgICB1bnN1cHBvcnRlZFdpbkJ1aWxkICAgICA9ICJg
blshXSBVbnN1cHBvcnRlZCBXaW5kb3dzIHZlcnNpb246IEJ1aWxkIHswfSINCiAg
ICBod2lkU3VwcG9ydEluZm8gICAgICAgICA9ICJIV0lEIEFjdGl2YXRpb24gaXMg
b25seSBzdXBwb3J0ZWQgb24gV2luZG93cyAxMC8xMS4iDQogICAgbGljZW5zaW5n
U2VydmljZUVycm9yICAgPSAiQ291bGQgbm90IHJldHJpZXZlIGxpY2Vuc2luZyBz
ZXJ2aWNlIGluZm9ybWF0aW9uLiINCiAgICBlZGl0aW9uSWROb3RGb3VuZCAgICAg
ICA9ICJFZGl0aW9uIElEIFZhcmlhYmxlIG5vdCBmb3VuZCINCiAgICBlZGl0aW9u
RGV0ZWN0ZWQgICAgICAgICA9ICJEZXRlY3RlZCBFZGl0aW9uOiB7MH0iDQogICAg
Z3JpZFRpdGxlICAgICAgICAgICAgICAgPSAiU2VsZWN0IHByZWZlcnJlZCBwcm9k
dWN0KHMpIg0KICAgIHByb2R1Y3RTZWxlY3RlZCAgICAgICAgID0gIlNlbGVjdGVk
IHByb2R1Y3Q6IHswfSINCiAgICBwcm9kdWN0SWQgICAgICAgICAgICAgICA9ICJQ
cm9kdWN0IElEOiB7MH0iDQogICAga2V5VG9Vc2UgICAgICAgICAgICAgICAgPSAi
S2V5IHRvIHVzZTogezB9Ig0KICAgIGVycm9yTm9NYXRjaCAgICAgICAgICAgID0g
IkVSUk9SOiBObyBtYXRjaGluZyBwcm9kdWN0IGZvdW5kIg0KICAgIGF2YWlsYWJs
ZVByb2R1Y3RzICAgICAgID0gIkF2YWlsYWJsZSBwcm9kdWN0czoiDQogICAgcHJv
ZHVjdExpc3RJdGVtICAgICAgICAgPSAiLSB7MH0gKElEOiB7MX0pIg0KICAgIGVy
cm9yS21zS2V5ICAgICAgICAgICAgID0gIkVSUk9SOiBDb3VsZCBub3QgZ2V0IGtl
eSBmb3IgVk9MVU1FX0tNU0NMSUVOVCB2ZXJzaW9uOiB7MH0iDQogICAgZXJyb3JJ
bnZhbGlkS2V5ICAgICAgICAgPSAiRVJST1I6IENvdWxkIG5vdCBnZXQgdmFsaWQg
a2V5Ig0KICAgIHNlbGVjdGlvbkNhbmNlbGxlZCAgICAgID0gIlByb2R1Y3Qgc2Vs
ZWN0aW9uIGNhbmNlbGxlZC4iDQogICAga21zUmVnU2V0ICAgICAgICAgICAgICAg
PSAiS01TIHJlZ2lzdHJ5IHNldHRpbmdzIGNvbmZpZ3VyZWQuIg0KICAgIGluc3Rh
bGxpbmdLZXkgICAgICAgICAgID0gIkluc3RhbGxpbmcgcHJvZHVjdCBrZXkuLi4i
DQogICAgY3JlYXRpbmdUaWNrZXQgICAgICAgICAgPSAiQ3JlYXRpbmcgR2VudWlu
ZVRpY2tldCBmaWxlLi4uIg0KICAgIGluc3RhbGxpbmdUaWNrZXQgICAgICAgID0g
Ikluc3RhbGxpbmcgR2VudWluZVRpY2tldCBmaWxlLi4uIg0KICAgIHN0b3BwaW5n
U3Bwc3ZjICAgICAgICAgID0gIlN0b3BwaW5nIFNQUFNWQyBzZXJ2aWNlLi4uIg0K
ICAgIHJlc3RhcnRpbmdDbGlwc3ZjICAgICAgID0gIlJlc3RhcnRpbmcgQ2xpcFNW
QyBzZXJ2aWNlLi4uIg0KICAgIGFjdGl2YXRpbmcgICAgICAgICAgICAgID0gIlBl
cmZvcm1pbmcgYWN0aXZhdGlvbi4uLiINCiAgICByZWZyZXNoaW5nTGljZW5zZSAg
ICAgICA9ICJSZWZyZXNoaW5nIGxpY2Vuc2Ugc3RhdHVzLi4uIg0KICAgIGVycm9y
QWN0aXZhdGlvbkZhaWxlZCAgID0gIkVSUk9SOiBDb3VsZCBub3QgYWN0aXZhdGUu
IE9wZXJhdGlvbiBjYW5jZWxsZWQuIg0KICAgIGVycm9yRGV0YWlsICAgICAgICAg
ICAgID0gIkVycm9yIGRldGFpbDogezB9Ig0KICAgIHJlc3VsdEhlYWRlciAgICAg
ICAgICAgID0gIj09PSBBQ1RJVkFUSU9OIFJFU1VMVCA9PT0iDQogICAgcmVzdWx0
UHJvZHVjdCAgICAgICAgICAgPSAiUHJvZHVjdDogezB9Ig0KICAgIHN0YXR1czAg
ICAgICAgICAgICAgICAgID0gIlVubGljZW5zZWQiDQogICAgc3RhdHVzMSAgICAg
ICAgICAgICAgICAgPSAiTGljZW5zZWQiDQogICAgc3RhdHVzMiAgICAgICAgICAg
ICAgICAgPSAiT09CIEdyYWNlIg0KICAgIHN0YXR1czMgICAgICAgICAgICAgICAg
ID0gIk9PVCBHcmFjZSINCiAgICBzdGF0dXM0ICAgICAgICAgICAgICAgICA9ICJO
b24tR2VudWluZSBHcmFjZSINCiAgICBzdGF0dXM1ICAgICAgICAgICAgICAgICA9
ICJOb3RpZmljYXRpb24iDQogICAgc3RhdHVzNiAgICAgICAgICAgICAgICAgPSAi
RXh0ZW5kZWQgR3JhY2UiDQogICAgc3RhdHVzVW5rbm93biAgICAgICAgICAgPSAi
VW5rbm93biAoezB9KSINCiAgICByZXN1bHRMaWNlbnNlU3RhdHVzICAgICA9ICJM
aWNlbnNlIFN0YXR1czogezB9Ig0KICAgIGFjdGl2YXRpb25UeXBlS21zMzggICAg
ID0gIkFjdGl2YXRpb24gVHlwZTogS01TMzgiDQogICAgdmFsaWRVbnRpbCAgICAg
ICAgICAgICAgPSAiTGljZW5zZSBWYWxpZCBVbnRpbDogezB9Ig0KICAgIGRheXNS
ZW1haW5pbmcgICAgICAgICAgID0gIkxpY2Vuc2UgRGF5cyBSZW1haW5pbmc6IHsw
fSBkYXlzIg0KICAgIGttczM4RmFpbCAgICAgICAgICAgICAgID0gIktNUzM4IEFj
dGl2YXRpb24gRmFpbGVkLiBFeHBpcnkgZGF0ZTogezB9Ig0KICAgIHRyeUFnYWlu
ICAgICAgICAgICAgICAgID0gIlRyeSB0aGUgYWN0aXZhdGlvbiBwcm9jZXNzIGFn
YWluIGxhdGVyIg0KICAgIGttczM4U3VjY2VzcyAgICAgICAgICAgID0gIktNUzM4
IEFjdGl2YXRpb24gU3VjY2Vzc2Z1bCEiDQogICAgYWN0aXZhdGlvblR5cGVId2lk
ICAgICAgPSAiQWN0aXZhdGlvbiBUeXBlOiBIV0lEIChEaWdpdGFsIExpY2Vuc2Up
Ig0KICAgIHZhbGlkUGVybWFuZW50ICAgICAgICAgID0gIkxpY2Vuc2UgVmFsaWRp
dHk6IFBFUk1BTkVOVCAoRGlnaXRhbCBsaWNlbnNlIGxpbmtlZCB0byBoYXJkd2Fy
ZSkiDQogICAgaHdpZFN1Y2Nlc3MgICAgICAgICAgICAgPSAiSFdJRCBBY3RpdmF0
aW9uIFN1Y2Nlc3NmdWwhIg0KICAgIHZhbGlkRmFpbGVkICAgICAgICAgICAgID0g
IkxpY2Vuc2UgVmFsaWRpdHk6IEZhaWxlZCINCiAgICBod2lkRmFpbCAgICAgICAg
ICAgICAgICA9ICJIV0lEIEFjdGl2YXRpb24gRmFpbGVkLiINCn0NCg0KIyBLdWxs
YW79bGFjYWsgZGlsaSBzZecgLyBTZWxlY3QgdGhlIGxhbmd1YWdlIHRvIHVzZQ0K
aWYgKCRHbG9iYWw6SXNUdXJraXNoKSB7DQogICAgJEwgPSAkc2NyaXB0OlN0cmlu
Z3NfVFINCn0gZWxzZSB7DQogICAgJEwgPSAkc2NyaXB0OlN0cmluZ3NfRU4NCn0N
CiMgLS0tIETdTCBBWUFSTEFSSSBTT05VIC8gRU5EIE9GIExBTkdVQUdFIFNFVFRJ
TkdTIC0tLQ0KDQoNCmZ1bmN0aW9uIEdldFJhbmRvbUtleSB7DQogICAgcGFyYW0o
W3N0cmluZ10kUHJvZHVjdElEKQ0KICAgICMgS01TIENsaWVudCBhbmFodGFybGFy
/SB2ZXJpdGFiYW79IC0gR2Vuaf5sZXRpbG1p/iBzZXJ2ZXIgZGVzdGXwaQ0KICAg
ICRLTVNLZXlzID0gQHsNCiAgICAgICAgIyBXaW5kb3dzIFNlcnZlciAyMDE2IFN0
YW5kYXJkDQogICAgICAgICc4YzFjNTQxMC05ZjM5LTQ4MDUtOGM5ZC02M2EwNzcw
NjM1OGYnID0gJ1dDMkJRLThOUk0zLUZERFlZLTJCRkdWLUtIS1FZJw0KICAgICAg
ICANCiAgICAgICAgIyBXaW5kb3dzIFNlcnZlciAyMDE2IERhdGFjZW50ZXINCiAg
ICAgICAgJzIxYzU2Nzc5LWI0NDktNGQyMC1hZGZjLWVlY2UwZTFhZDc0YicgPSAn
Q0I3S0YtQldOODQtUjdSMlktNzkzSzItOFhEREcnDQogICAgICAgIA0KICAgICAg
ICAjIFdpbmRvd3MgU2VydmVyIDIwMTYgRXNzZW50aWFscw0KICAgICAgICAnMmI1
YTFiMGYtYTVhYi00YzU0LWFjMmYtYTZkOTQ4MjRhMjgzJyA9ICdKQ0tSRi1OMzdQ
NC1DMkQ4Mi05WVhSVC00TTYzQicNCiAgICAgICAgDQogICAgICAgICMgV2luZG93
cyBTZXJ2ZXIgMjAxOSBTdGFuZGFyZA0KICAgICAgICAnZGUzMmVhZmQtYWFlZS00
NjYyLTk0NDQtYzFiZWZiNDFiZGUyJyA9ICdONjlHNC1CODlKMi00RzhGNC1XV1lD
Qy1KNDY0QycNCiAgICAgICAgDQogICAgICAgICMgV2luZG93cyBTZXJ2ZXIgMjAx
OSBEYXRhY2VudGVyDQogICAgICAgICczNGUxYWU1NS0yN2Y4LTQ5NTAtODg3Ny03
YTAzYmU1ZmIxODEnID0gJ1dNREdOLUc5UFFHLVhWVlhYLVIzWDQzLTYzREZHJw0K
ICAgICAgICANCiAgICAgICAgIyBXaW5kb3dzIFNlcnZlciAyMDE5IEVzc2VudGlh
bHMNCiAgICAgICAgJzAzNGQzY2JiLTVkNGItNDI0NS1iM2Y4LWY4NDU3MTMxNDA3
OCcgPSAnV1ZESE4tODZNN1gtNDY2UDYtVkhYVjctWVk3MjYnDQogICAgICAgIA0K
ICAgICAgICAjIFdpbmRvd3MgU2VydmVyIDIwMjIgU3RhbmRhcmQNCiAgICAgICAg
J2U0OWMwOGU3LWRhODItNDJmOC1iNzQwLTkzNDBkNWU2MTdjMScgPSAnVkRZQk4t
MjdXUFAtVjRIUVQtOVZNRDQtVk1LN0gnDQogICAgICAgIA0KICAgICAgICAjIFdp
bmRvd3MgU2VydmVyIDIwMjIgRGF0YWNlbnRlcg0KICAgICAgICAnNmMwNTBhYTEt
YmI5NC00YzgyLWFjOWUtNzdkNGVjNWRmMWMyJyA9ICdXWDROTS1LWVdZVy1RSkpS
NC1YVjNRQi02Vk0zMycNCiAgICAgICAgDQogICAgICAgICMgV2luZG93cyBTZXJ2
ZXIgMjAyMiBEYXRhY2VudGVyIEF6dXJlIEVkaXRpb24NCiAgICAgICAgJ2E5OWNj
MWYwLTc3MTktNDMwNi05NjQ1LTI5NDEwMmZiZmY5NScgPSAnTlRCVjgtOUs3UTgt
VjI3QzYtTTJCVFYtS0hNWFYnDQogICAgICAgIA0KICAgICAgICAjIFdpbmRvd3Mg
U2VydmVyIDIwMjUgU3RhbmRhcmQgKFByb2plY3RlZCBJRHMpDQogICAgICAgICdm
NWU5NDI5Yy1mNTBiLTRiOTgtYjE1Yy02MDA5NmQ2YTllNmUnID0gJ1RWUkg2LVdI
TlhWLVI5V0czLTlYUkZZLU1ZODMyJw0KICAgICAgICANCiAgICAgICAgIyBXaW5k
b3dzIFNlcnZlciAyMDI1IERhdGFjZW50ZXIgKFByb2plY3RlZCBJRHMpDQogICAg
ICAgICdlZjZjZmM5Zi04YzVkLTQ0YWMtOWFhZC1kZTZhMmVhMGFlMDMnID0gJ0Q3
NjRLLTJORFJHLTQ3VDZRLVA4VDhXLVlQNkRGJw0KICAgICAgICANCiAgICAgICAg
IyBGYWxsYmFjayBhbmFodGFybGFy/Q0KICAgICAgICAnZGVmYXVsdF8yMDE2JyA9
ICdXQzJCUS04TlJNMy1GRERZWS0yQkZHVi1LSEtRWScNCiAgICAgICAgJ2RlZmF1
bHRfMjAxOScgPSAnTjY5RzQtQjg5SjItNEc4RjQtV1dZQ0MtSjQ2NEMnDQogICAg
ICAgICdkZWZhdWx0XzIwMjInID0gJ1ZEWUJOLTI3V1BQLVY0SFFULTlWTUQ0LVZN
SzdIJw0KICAgICAgICAnZGVmYXVsdF8yMDI1JyA9ICdUVlJINi1XSE5YVi1SOVdH
My05WFJGWS1NWTgzMicNCiAgICAgICAgJ2RlZmF1bHQnID0gJ1dDMkJRLThOUk0z
LUZERFlZLTJCRkdWLUtIS1FZJw0KICAgIH0NCiAgICANCiAgICBpZiAoJEtNU0tl
eXMuQ29udGFpbnNLZXkoJFByb2R1Y3RJRCkpIHsNCiAgICAgICAgcmV0dXJuICRL
TVNLZXlzWyRQcm9kdWN0SURdDQogICAgfSBlbHNlIHsNCiAgICAgICAgIyBCdWls
ZCBudW1hcmFz/W5hIGf2cmUgZmFsbGJhY2sNCiAgICAgICAgJGJ1aWxkID0gKEdl
dC1JdGVtUHJvcGVydHkgLVBhdGggIkhLTE06XFNPRlRXQVJFXE1pY3Jvc29mdFxX
aW5kb3dzIE5UXEN1cnJlbnRWZXJzaW9uIiAtZWEgMCkuQ3VycmVudEJ1aWxkDQog
ICAgICAgIFtpbnRdJGJ1aWxkTnVtID0gMA0KICAgICAgICBbaW50XTo6VHJ5UGFy
c2UoJGJ1aWxkLCBbcmVmXSRidWlsZE51bSkgfCBPdXQtTnVsbA0KICAgICAgICAN
CiAgICAgICAgaWYgKCRidWlsZE51bSAtZ2UgMjYxMDApIHsNCiAgICAgICAgICAg
ICMgU2VydmVyIDIwMjUNCiAgICAgICAgICAgIHJldHVybiAkS01TS2V5c1snZGVm
YXVsdF8yMDI1J10NCiAgICAgICAgfQ0KICAgICAgICBlbHNlaWYgKCRidWlsZE51
bSAtZ2UgMjAzNDgpIHsNCiAgICAgICAgICAgICMgU2VydmVyIDIwMjINCiAgICAg
ICAgICAgIHJldHVybiAkS01TS2V5c1snZGVmYXVsdF8yMDIyJ10NCiAgICAgICAg
fQ0KICAgICAgICBlbHNlaWYgKCRidWlsZE51bSAtZ2UgMTc3NjMpIHsNCiAgICAg
ICAgICAgICMgU2VydmVyIDIwMTkNCiAgICAgICAgICAgIHJldHVybiAkS01TS2V5
c1snZGVmYXVsdF8yMDE5J10NCiAgICAgICAgfQ0KICAgICAgICBlbHNlaWYgKCRi
dWlsZE51bSAtZ2UgMTQzOTMpIHsNCiAgICAgICAgICAgICMgU2VydmVyIDIwMTYN
CiAgICAgICAgICAgIHJldHVybiAkS01TS2V5c1snZGVmYXVsdF8yMDE2J10NCiAg
ICAgICAgfQ0KICAgICAgICBlbHNlIHsNCiAgICAgICAgICAgIHJldHVybiAkS01T
S2V5c1snZGVmYXVsdCddDQogICAgICAgIH0NCiAgICB9DQp9DQoNCmZ1bmN0aW9u
IEdldC1TZXJ2ZXJWZXJzaW9uIHsNCiAgICAkYnVpbGQgPSAoR2V0LUl0ZW1Qcm9w
ZXJ0eSAtUGF0aCAiSEtMTTpcU09GVFdBUkVcTWljcm9zb2Z0XFdpbmRvd3MgTlRc
Q3VycmVudFZlcnNpb24iIC1lYSAwKS5DdXJyZW50QnVpbGQNCiAgICBbaW50XSRi
dWlsZE51bSA9IDANCiAgICBbaW50XTo6VHJ5UGFyc2UoJGJ1aWxkLCBbcmVmXSRi
dWlsZE51bSkgfCBPdXQtTnVsbA0KICAgIA0KICAgIGlmICgkYnVpbGROdW0gLWdl
IDI2MTAwKSB7DQogICAgICAgIHJldHVybiAiU2VydmVyIDIwMjUiDQogICAgfQ0K
ICAgIGVsc2VpZiAoJGJ1aWxkTnVtIC1nZSAyMDM0OCkgew0KICAgICAgICByZXR1
cm4gIlNlcnZlciAyMDIyIg0KICAgIH0NCiAgICBlbHNlaWYgKCRidWlsZE51bSAt
Z2UgMTc3NjMpIHsNCiAgICAgICAgcmV0dXJuICJTZXJ2ZXIgMjAxOSINCiAgICB9
DQogICAgZWxzZWlmICgkYnVpbGROdW0gLWdlIDE0MzkzKSB7DQogICAgICAgIHJl
dHVybiAiU2VydmVyIDIwMTYiDQogICAgfQ0KICAgIGVsc2Ugew0KICAgICAgICBy
ZXR1cm4gJEwudW5rbm93blNlcnZlclZlcnNpb24NCiAgICB9DQp9DQoNCmZ1bmN0
aW9uIFJ1bi1IV0lEIHsNCldyaXRlLUhvc3QNCldyaXRlLUhvc3QgJEwua21zMzhG
YWxsYmFjayAtRm9yZWdyb3VuZENvbG9yIFllbGxvdw0KV3JpdGUtSG9zdCAkTC5l
dmFsU2VydmVyQWx0IC1Gb3JlZ3JvdW5kQ29sb3IgWWVsbG93DQpXcml0ZS1Ib3N0
DQpTdGFydC1TbGVlcCAtU2Vjb25kcyAxDQoNCiRzYW5kYm94ID0gR2V0LVNlcnZp
Y2UgLU5hbWUgIlRoZW1lcyIgLUVycm9yQWN0aW9uIFNpbGVudGx5Q29udGludWUN
CmlmICgtbm90ICRzYW5kYm94KSB7DQogICAgV3JpdGUtSG9zdCAkTC5zYW5kYm94
Rm91bmQgLUZvcmVncm91bmRDb2xvciBSZWQNCiAgICBTdGFydC1TbGVlcCAtU2Vj
b25kcyAyDQogICAgcmV0dXJuDQp9DQoNCldyaXRlLUhvc3QgJEwuYWN0aXZhdGlv
blN0YXJ0ZWQgLUZvcmVncm91bmRDb2xvciBXaGl0ZQ0KDQokQ2xpcFVwID0gR2V0
LUNvbW1hbmQgQ2xpcFVwIC1lYSAwDQppZiAoLW5vdCAkQ2xpcFVwKSB7DQogIFdy
aXRlLUhvc3QNCiAgV3JpdGUtSG9zdCAkTC5jbGlwVXBNaXNzaW5nIC1Gb3JlZ3Jv
dW5kQ29sb3IgWWVsbG93DQogIFdyaXRlLUhvc3QNCiAgV3JpdGUtSG9zdCAkTC5k
b3dubG9hZGluZ0NsaXBVcCAtRm9yZWdyb3VuZENvbG9yIFllbGxvdw0KICBXcml0
ZS1Ib3N0DQogIHRyeSB7DQogICBJbnZva2UtV2ViUmVxdWVzdCBodHRwczovL2dp
dGh1Yi5jb20vYWJkdWxsYWgtZXJ0dXJrL3RzZl9vaG9va19hY3RpdmF0aW9uL3Jl
bGVhc2VzL2Rvd25sb2FkL3YxL0NsaXBVcC5leGUgLU91dEZpbGUgIiRlbnY6d2lu
ZGlyXENsaXBVcC5leGUiIC1lYSAwDQogICAjIEludm9rZS1XZWJSZXF1ZXN0IGh0
dHBzOi8vd3d3Lm9mZmljZXJ0b29sLm9yZy9Eb3dubG9hZC9DbGlwVXAuZXhlIC1P
dXRGaWxlICIkZW52OndpbmRpclxDbGlwVXAuZXhlIiAtZWEgMA0KICAgIGlmIChb
SU8uRklMRV06OkV4aXN0cygiJGVudjp3aW5kaXJcQ2xpcFVwLmV4ZSIpKSB7DQog
ICAgICBpZiAoQChHZXQtQXV0aGVudGljb2RlU2lnbmF0dXJlICIkZW52OndpbmRp
clxDbGlwVXAuZXhlIiAtZWEgMCkuU3RhdHVzIC1lcSAnVmFsaWQnKSB7DQogICAg
ICAgIFdyaXRlLUhvc3QNCiAgICAgICAgV3JpdGUtSG9zdCAoJEwuY2xpcFVwU3Vj
Y2VzcyAtZiAiJGVudjp3aW5kaXJcQ2xpcFVwLmV4ZSIpIC1Gb3JlZ3JvdW5kQ29s
b3IgR3JlZW4NCiAgICAgIH0NCiAgICAgIGVsc2Ugew0KICAgICAgICBSZW1vdmUt
SXRlbSAiJGVudjp3aW5kaXJcQ2xpcFVwLmV4ZSIgLUZvcmNlIC1lYSAwDQogICAg
ICAgIFdyaXRlLUhvc3QNCiAgICAgICAgV3JpdGUtSG9zdCAkTC5jbGlwVXBGYWls
ZWQgLUZvcmVncm91bmRDb2xvciBSZWQNCiAgICAgIH0NCiAgICB9DQogIH0NCiAg
Y2F0Y2ggew0KICAgIFdyaXRlLUhvc3QNCiAgICBXcml0ZS1Ib3N0ICgkTC5jbGlw
VXBEb3dubG9hZEVycm9yIC1mICRfLkV4Y2VwdGlvbi5NZXNzYWdlKSAtRm9yZWdy
b3VuZENvbG9yIFJlZA0KICB9DQp9DQoNCiRvc0luZm8gPSBHZXQtQ2ltSW5zdGFu
Y2UgV2luMzJfT3BlcmF0aW5nU3lzdGVtDQokc2VydmVyID0gJG9zSW5mby5DYXB0
aW9uIC1tYXRjaCAiU2VydmVyIg0KJGV2YWx1YXRpb24gPSAkb3NJbmZvLkNhcHRp
b24gLW1hdGNoICJFdmFsdWF0aW9uIg0KDQojIEJ1aWxkIG51bWFyYXP9IGtvbnRy
b2z8DQokYnVpbGQgPSAoR2V0LUl0ZW1Qcm9wZXJ0eSAtUGF0aCAiSEtMTTpcU09G
VFdBUkVcTWljcm9zb2Z0XFdpbmRvd3MgTlRcQ3VycmVudFZlcnNpb24iIC1lYSAw
KS5DdXJyZW50QnVpbGQNCg0KIyBDb252ZXJ0IHRvIGludGVnZXIgKHNhZmVseSkN
CltpbnRdJGJ1aWxkTnVtID0gMA0KaWYgKFtpbnRdOjpUcnlQYXJzZSgkYnVpbGQs
IFtyZWZdJGJ1aWxkTnVtKSkgew0KICAgIFdyaXRlLUhvc3QNCiAgICBXcml0ZS1I
b3N0ICgkTC5idWlsZERldGVjdGVkIC1mICRidWlsZE51bSkgLUZvcmVncm91bmRD
b2xvciBDeWFuDQp9IGVsc2Ugew0KICAgIFdyaXRlLUhvc3QNCiAgICBXcml0ZS1I
b3N0ICRMLmJ1aWxkRGV0ZWN0RmFpbGVkIC1Gb3JlZ3JvdW5kQ29sb3IgUmVkDQog
ICAgU3RhcnQtU2xlZXAgMg0KICAgIHJldHVybg0KfQ0KDQojIENoZWNrIGZvciAw
IG9yIGludmFsaWQgYnVpbGQNCmlmICgkYnVpbGROdW0gLWVxIDApIHsNCiAgICBX
cml0ZS1Ib3N0DQogICAgV3JpdGUtSG9zdCAkTC5idWlsZEludmFsaWQgLUZvcmVn
cm91bmRDb2xvciBSZWQNCiAgICBTdGFydC1TbGVlcCAyDQogICAgcmV0dXJuDQp9
DQoNCiMgR2Vuaf5sZXRpbG1p/iBidWlsZCBkZXN0ZfBpIC0gU2VydmVyIDIwMTYg
KDE0MzkzKSB2ZSBzb25yYXP9DQppZiAoJGJ1aWxkTnVtIC1sdCAxNDM5Mykgew0K
ICAgIFdyaXRlLUhvc3QNCiAgICBXcml0ZS1Ib3N0ICgkTC51bnN1cHBvcnRlZEJ1
aWxkIC1mICRidWlsZE51bSkgLUZvcmVncm91bmRDb2xvciBSZWQNCiAgICBXcml0
ZS1Ib3N0DQogICAgV3JpdGUtSG9zdCAkTC5zY3JpcHRTdXBwb3J0SW5mbyAtRm9y
ZWdyb3VuZENvbG9yIERhcmtZZWxsb3cNCiAgICBXcml0ZS1Ib3N0DQogICAgV3Jp
dGUtSG9zdCAkTC5zdXBwb3J0ZWRWZXJzaW9ucyAtRm9yZWdyb3VuZENvbG9yIEN5
YW4NCiAgICBXcml0ZS1Ib3N0ICRMLnNlcnZlcjIwMTYgLUZvcmVncm91bmRDb2xv
ciBXaGl0ZQ0KICAgIFdyaXRlLUhvc3QgJEwuc2VydmVyMjAxOSAtRm9yZWdyb3Vu
ZENvbG9yIFdoaXRlDQogICAgV3JpdGUtSG9zdCAkTC5zZXJ2ZXIyMDIyIC1Gb3Jl
Z3JvdW5kQ29sb3IgV2hpdGUNCiAgICBXcml0ZS1Ib3N0ICRMLnNlcnZlcjIwMjUg
LUZvcmVncm91bmRDb2xvciBXaGl0ZQ0KICAgIFdyaXRlLUhvc3QgJEwud2luMTAx
MSAtRm9yZWdyb3VuZENvbG9yIFdoaXRlDQogICAgV3JpdGUtSG9zdA0KICAgIFN0
YXJ0LVNsZWVwIDMNCiAgICByZXR1cm4NCn0NCg0KaWYgKCRzZXJ2ZXIpIHsNCiAg
JHNlcnZlclZlcnNpb24gPSBHZXQtU2VydmVyVmVyc2lvbg0KICBXcml0ZS1Ib3N0
DQogIFdyaXRlLUhvc3QgKCRMLnNlcnZlclZlcnNpb25EZXRlY3RlZCAtZiAkc2Vy
dmVyVmVyc2lvbikgLUZvcmVncm91bmRDb2xvciBHcmVlbg0KICBXcml0ZS1Ib3N0
DQogIFdyaXRlLUhvc3QgJEwudXNpbmdLbXMzOCAtRm9yZWdyb3VuZENvbG9yIFll
bGxvdw0KfQ0KZWxzZWlmICgkZXZhbHVhdGlvbikgew0KICBXcml0ZS1Ib3N0DQog
IFdyaXRlLUhvc3QgJEwuZXZhbERldGVjdGVkIC1Gb3JlZ3JvdW5kQ29sb3IgWWVs
bG93DQogIFdyaXRlLUhvc3QNCiAgV3JpdGUtSG9zdCAkTC51c2luZ0ttczM4IC1G
b3JlZ3JvdW5kQ29sb3IgWWVsbG93DQogIFdyaXRlLUhvc3QNCn0NCmVsc2Ugew0K
ICAjIERlc2t0b3Agc/xy/G1sZXIgaedpbiBidWlsZCBrb250cm9s/A0KICBpZiAo
JGJ1aWxkTnVtIC1sdCAxMDI0MCkgew0KICAgIFdyaXRlLUhvc3QNCiAgICBXcml0
ZS1Ib3N0ICgkTC51bnN1cHBvcnRlZFdpbkJ1aWxkIC1mICRidWlsZE51bSkgLUZv
cmVncm91bmRDb2xvciBSZWQNCiAgICBXcml0ZS1Ib3N0DQogICAgV3JpdGUtSG9z
dCAkTC5od2lkU3VwcG9ydEluZm8gLUZvcmVncm91bmRDb2xvciBEYXJrWWVsbG93
DQogICAgV3JpdGUtSG9zdA0KICAgIFN0YXJ0LVNsZWVwIDINCiAgICByZXR1cm4N
CiAgfQ0KfQ0KDQooIkNsaXBTVkMiLCJ3bGlkc3ZjIiwic3Bwc3ZjIiwiS2V5SXNv
IiwiTGljZW5zZU1hbmFnZXIiLCJXaW5tZ210IikgfCBGb3JFYWNoLU9iamVjdCB7
IFN0YXJ0LVNlcnZpY2UgJF8gLWVhIDB9DQoNCnRyeSB7DQogICAgJExpY2Vuc2lu
Z1NlcnZpY2UgPSBHZXQtV21pT2JqZWN0IFNvZnR3YXJlTGljZW5zaW5nU2Vydmlj
ZSAtZWEgMQ0KICAgICRMaWNlbnNpbmdQcm9kdWN0cyA9IEdldC1XbWlPYmplY3Qg
U29mdHdhcmVMaWNlbnNpbmdQcm9kdWN0IC1lYSAxIC1GaWx0ZXIgIkFwcGxpY2F0
aW9uSWQ9JzU1YzkyNzM0LWQ2ODItNGQ3MS05ODNlLWQ2ZWMzZjE2MDU5ZiciDQp9
DQpjYXRjaCB7DQogICAgV3JpdGUtSG9zdA0KICAgIFdyaXRlLUhvc3QgJEwubGlj
ZW5zaW5nU2VydmljZUVycm9yIC1Gb3JlZ3JvdW5kQ29sb3IgUmVkDQogICAgU3Rh
cnQtU2xlZXAgMg0KICAgIHJldHVybg0KfQ0KDQokRWRpdGlvbklEID0gKEdldC1J
dGVtUHJvcGVydHkgLVBhdGggIkhLTE06XFNPRlRXQVJFXE1pY3Jvc29mdFxXaW5k
b3dzIE5UXEN1cnJlbnRWZXJzaW9uIiAtTmFtZSBFZGl0aW9uSUQgLWVhIDApLkVk
aXRpb25JRA0KaWYgKCEkRWRpdGlvbklEKSB7DQogIFdyaXRlLUhvc3QNCiAgV3Jp
dGUtSG9zdCAkTC5lZGl0aW9uSWROb3RGb3VuZCAtRm9yZWdyb3VuZENvbG9yIFJl
ZA0KICBTdGFydC1TbGVlcCAyDQogIHJldHVybg0KfQ0KDQpXcml0ZS1Ib3N0ICgk
TC5lZGl0aW9uRGV0ZWN0ZWQgLWYgJEVkaXRpb25JRCkgLUZvcmVncm91bmRDb2xv
ciBDeWFuDQpXcml0ZS1Ib3N0DQoNCiRoYXNoVGFibGUgPSBAJw0KSUQsS0VZLFNL
VV9JRCxLZXlfcGFydCx2YWx1ZSxTdGF0dXMsVHlwZSxQcm9kdWN0DQo4YjM1MWM5
Yy1mMzk4LTQ1MTUtOTkwMC0wOWRmNDk0MjcyNjIsWEdWUFAtTk1INDctN1RUSEot
VzNGVzctOEhWMkMsNCxYMTktOTk2ODMsSEdOS2prS2NLUUhPNm44c3JNVXJEaC9N
RWxmZkJaYXJMcUNNRDlyV3RnRktmM1l6WU9MRFBFTUdodU8vYXVOTUtDZWlVN2Vi
RmJRQUxTL015WjdUdmlkTVEyZHZ6WGVYWEt6UEJqZndReDU0OVdKVVU3cUFROVR4
ZzljUjlTQVQ4YjEyUHJ5MmlCaytuWldEOVZ0SEsza09uRVlrdnA1V1RDVHNyU2k2
UmU0LDAsT0VNOk5PTlNMUCxFbnRlcnByaXNlDQpjODNjZWYwNy02YjcyLTRiYmMt
YTI4Zi1hMDAzODY4NzI4MzksM1Y2UTYtTlFYQ1gtVjhZWFItOVFDWVYtUVBGQ1Qs
MjcsWDE5LTk4NzQ2LE5IbjJuME4xVWZWZjAwQ2ZhSTVMQ0RNRHNLZFZBV3BEL0hB
ZlVyY1RBS3N3OWQyU2tzNGg1TWh5SC9XVXgrQjZkRmk4b2w3RDNBSG9yUjh5OWRx
VlMxQmQyRmRaTkpsL3RUUjFQR3dZbjZLTDg4TlMxOWFIbUZOZFg4czQ0Mzh2YWEr
VHk4UWs4RURjd20vd3NjQzhsUW1pMy9SZ1VLWWR5R0Z2cGJHU1ZsaywwLFZvbHVt
ZTpNQUssRW50ZXJwcmlzZU4NCjRkZTdjYjY1LWNkZjEtNGRlOS04YWU4LWUzY2Nl
MjdiOWYyYyxWSzdKRy1OUEhUTS1DOTdKTS05TVBHVC0zVjY2VCw0OCxYMTktOTg4
NDEsWWwvak5meEoxU25hSVpDSVo0bTZQZjN5U05vUVhpZk5lcWZsdE5hTmN0eCtv
bndpaXZPeDdxY1NuOGRGdFVSemdNelNPRm5zUlF6YjVJcnZ1cUhveFdXbDFTM0pJ
UW41NkZ2S3N2U3g3YUZYSVgzKzJROThHMWFtUFYvV0VRMHVIQTVkN1lhNkFuK2cw
WjB6UlA3ZXZHb29tVHM0WXV3ZWFXaVpRalF6U3BBLDAsUmV0YWlsLFByb2Zlc3Np
b25hbA0KOWZiYWY1ZDYtNGQ4My00NDIyLTg3MGQtZmRkYTZlNTg1OGFhLDJCODdO
LThLRkhQLURLVjZSLVkyQzhKLVBLQ0tULDQ5LFgxOS05ODg1OSxHZTBtUlFiVzhB
TGs3VDA5VisxazF5ZzY2cW9TMGxoa2dQSVJPT0lPZ3hLbVdQQXZzaUxBWVBLRHFN
NCtuZUZDQS9xZjFkSEZtZGgwVlVyd0ZCUFlzSzI1MVVlV3VFbGo0YlpGVklTTDZn
VXQxZVp3YkdmdjVldXJRMGkrcVppRnYrQ2NRT0VGc2Q1REQ0VXA2eFBMTFFTM25B
WE9ETDVyU3JuMnNIUm9DVlksMCxSZXRhaWwsUHJvZmVzc2lvbmFsTg0KZjc0MmU0
ZmYtOTA5ZC00ZmU5LWFhY2ItMzIzMWQyNGEwYzU4LDRDUFJLLU5NM0szLVg2WFhR
LVJYWDg2LVdYQ0hXLDk4LFgxOS05ODg3Nyx2ZWw0eXRWdG5FOEZodk44N0NmbHo5
c2JoNVF3SEQxWUdPZWVqOVFQN2hGM3ZsQlI0RVgyL1MvMDlnUm5lZVhWYlFuakRP
Q2QyS0ZNS1JVV0hMTTdaaEZCazhBdGxHK2t2VWF3UForQ0lyd3JEM21oaTdOTXY4
VVgveGtMSzNIbkJ1cE1FdUV3c01KZ0NVRDhQbjZvbTFtRWlRZWJIQkFxdTRjVDdH
TjlZMGcsMCxSZXRhaWwsQ29yZU4NCjFkMWJhYzg1LTczNjUtNGZlYS05NDlhLTk2
OTc4ZWM5MWFlMCxOMjQzNC1YOUQ3Vy04UEY2WC04RFY5VC04VFlNRCw5OSxYMTkt
OTk2NTIsTnYxN2VVVHJyMVRtVVg2ZnJsSTdWNjlWUjZ5V2I3YWxwcENGSlBjZGpm
SSt4WDQvQ2YybnAzem03am1DK3p4RmI5bkVMVXM0NzcveWR3MktDQ1hGZk01M2JL
cEJRWktIRTUrTWRHSkd4ZWJPQ2NPdEozaHJrREp0d2xWeFRRbVVnazV4bmxtcGs4
UEhnODJNMnVNNUI3VXNHTHhHS0s0ZDNoaTB2b1N5S2VJLDAsUmV0YWlsLENvcmVD
b3VudHJ5U3BlY2lmaWMNCjNhZTJjYzE0LWFiMmQtNDFmNC05NzJmLTVlMjAxNDI3
NzFkYyxCVDc5US1HN042Ry1QR0JZVy00WVdYNi02RjRCVCwxMDAsWDE5LTk5NjYx
LEZWMkVhby9SNXY4c0dyZlFlT2pRNGRhb2tWbE5PbHFSQ0RaWHVhQzQ1YlFkNVBz
TlUzdDFiNEF3V2VZTThUQXdiSGF1enI0dFBHMFVsc1VxVWlrQ1pIeTBwb1JPeDM1
YkJCTUJ5bTZaYm05d0RCVnlpN25DekJ0d1M4NmVPb25RM2NVNldmWnhoWlJ6ZTBQ
T2RSMzNHM1FUTlByblZJTTJnZjZuWkpZcURPQSwwLFJldGFpbCxDb3JlU2luZ2xl
TGFuZ3VhZ2UNCjJiMWYzNmJiLWMxY2QtNDMwNi1iZjVjLWEwMzY3YzJkOTdkOCxZ
VE1HMy1ONkRLQy1ES0I3Ny03TTlHSC04SFZYNywxMDEsWDE5LTk4ODY4LEdIL2p3
RnhJY2RRaE54SklsRmthOGMxSDQ4UEYweTdUZ0p3YXJ5QVV6cVNLWHluT05MdzdN
VmNpREpGVlhUa0NqYlhTZHhMU1dwUElDNTAveHl5MXJBZjhhQzdXdU4vOWNSTkF2
dEZQQzFJVkFKYU1lcTF2ZjRtQ3FScnJ4SlFQNlpFY3VBZUhGekxlL0xMb3ZHV0Nk
OHJyczZCYkJ3SlhDdkFxWEltdnljUSwwLFJldGFpbCxDb3JlDQoyYTYxMzdmMy03
NWMwLTRmMjYtOGUzZS1kODNkODAyODY1YTQsWEtDTkMtSjI2UTktS0ZIRDItRktU
SFktS0Q3MlksMTE5LFgxOS05OTYwNixoY2k3OElSV0RMQnRkYm5BSUtMRGdWOXdo
WWd0SGMxdVl5cDl5NkZzekU5d1pCRDVOYzhDVUQycEkyczJSUmQzTTA0QzRPN00z
dGlzQjNPdi9YVmpwQWJ4bFgzTVdmVVI1dzRNSDBBcGhidVFYMHA1TXVIRURZeWZx
bFJnQkJSek9LZVBGMDZxZll2UFFNdUVmRHBLQ0tGd05valF4QlY4TzBBcmY1em1y
SXcsMCxPRU06Tk9OU0xQLFBQSVBybw0KZTU1ODQxN2EtNTEyMy00ZjZmLTkxZTct
Mzg1YzFjN2NhOWQ0LFlOTUdRLThSWVYzLTRQR1EzLUM4WFRQLTdDRkJZLDEyMSxY
MTktOTg4ODYseDl0UEZEWm1qWk1mMjl6RmVIVjVTSGJYajhXZDhZQWNDbi8waGJw
TGNJZDREN09XcWtRS1h4WEhJZWdSbHdjV2p0SUkwc1o2V1lCMEhRVjJLSDNMdllS
bldLcEo1U3hlT2dkekJJSjZmaGVnWUdHeWlYc0J2OXNFYjMvemlkUFU2Wks5THVn
VkdBY1JaNkhRT2lYeU93K1lmNUgzNWlNKzJvRFpYU3Bqdkp3LDAsUmV0YWlsLEVk
dWNhdGlvbg0KYzUxOThhNjYtZTQzNS00NDMyLTg5Y2YtZWM3NzdjOWQwMzUyLDg0
TkdGLU1IQlQ2LUZYQlg4LVFXSks3LURSUjhILDEyMixYMTktOTg4OTIsamtMNFla
a21CQ0p0dkwxZlQzMFpQQmNqbXpzaEJTeGp3ckUwUTAwQVoxaFluaHJIK25wem8x
TVBDVDZaUkh3MTlaTFR6N3d6eUJiMHFxY0JWYnRFalpXMFhzMk1ZTHhncml5b09O
a2huUEU2S1NVSkJ3N0MwZW5GVkxIRXFuVnUvbmthT0Zmb2NrTjNiYytFb3V3Nlcy
bG1IamtsUEhjOWM2Q2xvMDRqdWwwLDAsUmV0YWlsLEVkdWNhdGlvbk4NCmY2ZTI5
NDI2LWEyNTYtNDMxNi04OGJmLWNjNWIwZjk1ZWMwYyxQSkI0Ny04UE4yVC1NQ0dE
WS1KVFkzRC1DQkNQViwxMjUsWDIzLTUwMzMxLE9QR2hzeXgrQ3R3N3cvS0xNUk5y
WStmTkJtS1BqVUcwUjlScWtXazRlOGV6K0V4U0p4U0xMZXg1V2hPNVFTTmdYTG1F
cmErY0NzTjZDNjM4YUxqSWRIMi9MN0QrOHovQzZFRGdSdmJITW1pZEhnMWxYMy9P
OGx2MEp1ZEhrR3RISllld2pvcm4veFhHWSsrdk9DVFFkWk5rNnF6RWdtWVN2UGVo
S2ZkZzhqcywxLFZvbHVtZTpNQUssRW50ZXJwcmlzZVMsR2UNCmNjZTlkMmRlLTk4
ZWUtNGNlMi04MTEzLTIyMjYyMGM2NGEyNyxLQ05WSC1ZS1dYOC1HSkpCOS1IOUZE
VC02RjdXMiwxMjUsWDIyLTY2MDc1LEdDcVdtSk9zVFZ1bjl6NFFrRTluMlhxQnZ0
M1pXU1BsOVFtSWg5UTJtWE1HL1FWdDJJRTdTK0VTL05XbHlUU05qTFZ5U3IxRDJz
R2p4Z0V6eTlrTHduN1ZFTlFWSjczNmgxaU9kTWovM3JkcUxNU3BUYTgxMytuUFNR
Z0twcUozdU11dkl2UlAwRmRCN1k0cXQ4cWY5a05LSzI1QTFRa25pb0QvNll1Ykwv
NCwxLFZvbHVtZTpNQUssRW50ZXJwcmlzZVMsVkINCmQwNjkzNGVlLTU0NDgtNGZk
MS05NjRhLWNkMDc3NjE4YWEwNiw0M1RCUS1OSDkySi1YS1RNNy1LVDNLSy1QMzlQ
QiwxMjUsWDIxLTgzMjMzLEVwQjZxT0NvOHBSZ081a0w0dnhFSGNrMkoxdnh5ZDlP
cXZ4VWVuRG5ZTzlBa2NHV2F0L0Q3NFpjRmc1U0ZsSXlhMVU4bDV6dit0c3ZaNHdB
dlExSWFGVzFQd09LSkxPYUdnZWpxWjQxVElNZEZHR3crRytzMVJIc0VucldyM1VP
YWtUb2RieTFhSU1VTW9xZjNOZGFNNWFXRm84Zk9tcVdDNS9MbkNvaWdocywwLE9F
TTpOT05TTFAsRW50ZXJwcmlzZVMsUlM1DQo3MDZlMGNmZC0yM2Y0LTQzYmItYTlh
Zi1hNDkyYjlmMTMwMixOSzk2WS1EOUNEOC1XNDRDUS1SOFlUSy1EWUpXWCwxMjUs
WDIxLTA1MDM1LG50Y0ttYXpJdkxwWk9yeWZ0MjhnV0JIdTFuSFNiUitHcDE0M2Yv
QmlWZStCRDJVakhCWmZTUjFxNDA1eG1RWnN5Z3o2VlJLNit6bThGUFIrKzcxcGtt
QXJnQ0xob2RDUUo1STRtN3JBSk53L1lYOTlwSUxwaGkxeUNSY3ZIc09UR2E4MjVH
VVZYZ2Y1MzB0SFQ2aHIwSFExbEdlR2dHMWhQZWtwcXFCYlRsZywwLE9FTTpOT05T
TFAsRW50ZXJwcmlzZVMsUlMxDQpmYWE1Nzc0OC03NWM4LTQwYTItYjg1MS03MWNl
OTJhYThiNDUsRldON0gtUEY5M1EtNEdHUDgtTThSRjMtTURXV1csMTI1LFgxOS05
OTYxNyxGZTlDRENsaWxyQW13d1Q3WWhmeDY3R2FmV1JRRXB3eWo4UithNGVhVHFi
cFBjQXQ3ZDFodjFyeDhTYTlBem9wRUd4SXJiN0loaVBvRFpzMFhhVDFITjAvb2xK
Si9NbkQ3M0NmQlA0c2RRZExUc1NKRTNkS01XWVRRSHBuanFSYVMvcE5CWVJyOGw5
TXY4eWZjUDh1UzJNaklRMWNSVHFSbUM3V01wU2h5Q2csMCxPRU06Tk9OU0xQLEVu
dGVycHJpc2VTLFRIDQozZDEwMjJkOC05NjlmLTQyMjItYjU0Yi0zMjdmNWE1YWY0
YzksMkRCVzMtTjJQSkctTVZIVzMtRzdUREstOUhLUjQsMTI2LFgyMS0wNDkyMSx6
TFBOdmNsMWlxT2VmeTBWTGcrV1pnTnRSTmh1R3BuOCtCRktqTXFqYU5PU0tpdURj
UjZHTkRTNUZGMUFxazYvZTZzaEorb2hLenV3cm5tWXEzaU5RM0kyTUJsWWpNNWt1
TmZLczhWbDlkQ2pTcFFyLy9HQkdwczZIdEYyeHJHLzJnL3lodFlDN0ZidEdESUUx
NnVPZU5LRmNWZytYTWIwcUhFLzVFdHlmZDgsMCxWb2x1bWU6TUFLLEVudGVycHJp
c2VTTixSUzENCjYwYzI0M2UxLWY5MGItNGExYi1iYTg5LTM4NzI5NDk0OGZiNixO
VFg2Qi1CUllDMi1LNjc4Ni1GNk1WUS1NN1YyWCwxMjYsWDE5LTk4NzcwLGtiWGZl
MHo5VmkxUzB5ZnhNV3pJNStVdFdzSkt6eHM3d0xHVURManJja0ZEbjFiRFFiNE12
dnVDSzF3K1FycTMzbGVtaUdwTkRzcGErZWhYaVlFZVNQRmNDdlVCcG9NbEdCRmZ6
dXJOQ0hXaXYzbzFrM2pCb2F3SnIvVm9Eb1ZaZnhoa3BzMGZWb3ViZjlveTZDNkFn
cmtaN1BqQ2FTNThlZE1jYVVXdllZZywwLFZvbHVtZTpNQUssRW50ZXJwcmlzZVNO
LFRIDQowMWViODUyYy00MjRkLTQwNjAtOTRiOC1jMTBkNzk5ZDczNjQsM1hQNkQt
Q1JORDQtRFJZTTItR004NEQtNEdHOFksMTM5LFgyMy0zNzg2OSxQVlcwWG5SSm5z
V1lqVHF4YjZTdENpMnRnZS91VXdlZ2pkaUZhRlVpWnB3ZEo2MjBSSytNSUFzU3E1
UytlZ1hYeklXTm50b3kyZkI2Qk84RjF3QkZteFAvbW0vM3JuNUMzM2p0RjVRcmJO
cVk3WDlITWJxU2lDN3poczR2NHUyWGE0b1pReDhKUWt3cjhRMmMvTmdIck9KS0tS
QVNzU2NraHVueForV1ZFdU0sMSxSZXRhaWwsUHJvZmVzc2lvbmFsQ291bnRyeVNw
ZWNpZmljLFpuDQplYjZkMzQ2Zi0xYzYwLTQ2NDMtYjk2MC00MGVjMzE1OTZjNDUs
RFhHN0MtTjM2QzQtQzRIVEctWDRUM1gtMllWNzcsMTYxLFgyMS00MzYyNixNYVZx
VGtSckduT3FZaXpsMTV3aENPS1d6eDAxK0JaVFZBYWx2RXVIWE0rV1Y1NWpuSWZo
V21kL3UxR3FDZDVPcGxxWGRVOTU5em1pcEsySXdndTJudy9nOTFuVy8vc1FpTi9j
VWN2ZzFMeG82cEMzZ0FvMUFqVHBIbUdJSWY5WGxaTVlsRCtWbDZnWHNpL0F1d2gz
eXJTU0ZoNXM3Z09jelpvRFRxUXdIWEEsMCxSZXRhaWwsUHJvZmVzc2lvbmFsV29y
a3N0YXRpb24NCjg5ZTg3NTEwLWJhOTItNDVmNi04MzI5LTNhZmE5MDVlM2U4MyxX
WVBOUS04QzQ2Ny1WMlc2Si1UWDRXWC1XVDJSUSwxNjIsWDIxLTQzNjQ0LEpWR1Fv
d0xpQ2NQdEdZOW5kYkJEVityVHUvcTVsam1RVHdRV1pnQklRc3JBZVFqTEQ4akxF
ay9xc2U3cmlaN3RNVDZQS0ZWTlhlV3FGN1BoTEFtQUNiRThPM0x2cDY1WE1kL09t
bDlEYXluajUvNG43dW5zZmZGSElISDhUR3lPNWo3eGI0ZGtGTnFDNVRYM1A4LzFn
UUVrVElkWkVPVFFRWEZ1MEwyU1A1YywwLFJldGFpbCxQcm9mZXNzaW9uYWxXb3Jr
c3RhdGlvbk4NCjYyZjBjMTAwLTljNTMtNGUwMi1iODg2LWEzNTI4ZGRmZTdmNiw4
UFRUNi1STlc0Qy02VjdKMi1DMkQzWC1NSEJQQiwxNjQsWDIxLTA0OTU1LENFRGd4
SThmL2Z4TUJpd21lWHc1T2Y1NURHMzJzYkdBTHpIaWhYa2RiWVREYUUzcFkzN29B
QTR6d0dIQUx6QUZOL3QyNTRRSW1HUFlSNmhBVGdsK0NwODA0ZjdzZXJKcWlMZVhZ
OTY1Wnk2N0k0Q0tJTUJtNDlsekhMRkplRG5WVGpEQjB3VnlOMjlwdmdPMytITGha
MjJLWUNwa1JIRkZNeTJPS3hTNjhZYywwLFJldGFpbCxQcm9mZXNzaW9uYWxFZHVj
YXRpb24NCjEzYTM4Njk4LTRhNDktNGI5ZS04ZTgzLTk4ZmU1MTExMDk1MyxHSlRZ
Ti1IRE1RWS1GUlI3Ni1IVkdDNy1RUEY4UCwxNjUsWDIxLTA0OTU2LHIzNXpwOU9m
eEtTQmNUeEtXb24zekZ0Yk9pQ3VmQVBvNnhSR1k1REpxQ1JGS2RCMGpnWmFsTlFp
dHZqbWFaL1JsZXoydmpSSm5FYXJ0NExydnlXNGQ5cnJ1a0FqUjMrYzNVa2VUS3dv
RDNxQmw5QWRSSmJYQ2EyQmRzb1hKczFXVlM0dzRMdVZ6cEIvU1pEdWdnWnQwRjJE
bE1CNDI3RjVhZmxvb2svbjFwWSwwLFJldGFpbCxQcm9mZXNzaW9uYWxFZHVjYXRp
b25ODQpkZjk2MDIzYi1kY2Q5LTRiZTItYWZhMC1jNmM4NzExNTllYmUsTkpDRjct
UFc4UVQtMzMyNEQtNjg4SlgtMllWNjYsMTc1LFgyMS00MTI5NSxyVnBldFlVbWlS
QjQ4WUpmQ3ZKSGlhWmFwSjBiTzhnUURSb3FsK3JxNUlvYmlTUnUvL2VmVjFWWHFW
cEJrd0lMUVJLZ0tJVk9OU1RVRjV5MlRTeGxETGJEU1BLcDdVSGZiejE3ZzZ2UktM
d09hbWVZRXowWmNLM05UYkFwTi9jTWxqSHZ2Ri9tQmFnMStzSGpXdStlb0Z6azhI
ODlrOW53OExNZVZPUEpSRGMsMCxSZXRhaWwsU2VydmVyUmRzaA0KZDRlZjcyODIt
M2QyYy00Y2YwLTk5NzYtODg1NGU2NGE4ZDFlLFYzV1ZXLU4yUFYyLUNHV0MzLTM0
UUdGLVZNSjJDLDE3OCxYMjEtMzI5ODMsWHptZTloRFpSNkgwWXgwZGVVUlZkRTZM
aVRPa1ZxV25nNVcvT1Ria3hSYzBycSttU1lwby9mL3lxaHR3WWxya0JQV3gxNllv
azVCdmNiMzR2YktIdkVBdHhmWXA0dGUyMHVleEx6Vk90QmNvZUVvekFSdjRXLzZN
aFlmbCtsbFp0UjVlZnNrdGo0TjQvRzRzVmJ1R3ZaOW56TmZRTzlUd1Y2TkdnR0Vq
MkVjLDAsUmV0YWlsLENsb3VkDQphZjVjOTM4MS05MjQwLTQxN2QtOGQzNS1lYjQw
Y2QwM2U0ODQsTkg5SjMtNjhXSzctNkZCOTMtNEszREYtREo0RjYsMTc5LFgyMS0z
Mjk4NyxRR1JEWk9VL1ZaaFlMT1NkcDJ4RG5GczhISW5OWmN0Y1FsV0NJck9SVm54
VFFyNTVJSndONHZLM1BKSGprZlJMUS9iZ1VyY0VJaHlGYkFOcVpGVXE4eUQxWU51
YmIyYmpOT1JnSS9tOHU4NU85VjduREd0eHpPL3ZpRUJTV3lFSG5yekxLS1dZcWtS
UUtiYlNXM3VuZ2FaUjBUaTVPMm1BVUk0SHpBRmVqNTAsMCxSZXRhaWwsQ2xvdWRO
DQo4YWI5YmRkMS0xZjY3LTQ5OTctODJkOS04ODc4NTIwODM3ZDksWFFRWVctTkZG
TVctWEpQQkgtSzg3MzItQ0tGRkQsMTg4LFgyMS05OTM3OCxkankwb2QwdXVLZDJy
cklsK1YxLzIrTWVSbHROZ1c3RkVlVE5Rc1BNa1ZTTDc1TkJwaGdvc280dVMwSlB2
MkQ3WTFpRUV2bVZxNkc4NDJLeXQ1MlFPd1hnRldtUC9JUTZTcTFkcitmSEsvNEV0
N2JFUHJyR0JFWm9DZldxazBrZGNaUlBCaWoyS042cUNSV2hyazFoWDJnK1U0MHNt
eC9FWUNMR2g5SENpMjQsMCxPRU06RE0sSW9URW50ZXJwcmlzZQ0KZWQ2NTUwMTYt
YTllOC00NDM0LTk1ZDktNDM0NTM1MmMyNTUyLFFQTTZOLTdKMldKLVA4OEhILVAz
WVJILVlZNzRILDE5MSxYMjEtOTk2ODIscUhzL1B6ZmhZV2R0U3lzMmVkemN6NGgr
UXM4YURxYjhCSWlRL21KLyswdXlvSmgxZml0YlJDSWdpRmgyV0FHWlhqZGdCOGha
ZWhlTndIaWJkOENoWGFYZzR1KzBYbE9kRmxhRFRnVFhibGppOGZqRVR6REJrOWFH
a2VNQ3Z5VlhSdVVZaFRTZHA4M0lxR0h6N1h1THdOMnAvNkFVQXJ4OUpaQ29MR1Y4
ajN3LDAsT0VNOk5PTlNMUCxJb1RFbnRlcnByaXNlUyxWQg0KNmM0ZGUxYjgtMjRi
Yi00YzE3LTlhNzctN2I5Mzk0MTRjMjk4LENHSzQyLUdZTjZZLVZEMjJCLUJYOThX
LUo4SlhELDE5MSxYMjMtMTI2MTcsSi9mcElSeW5zVlFYYnA0cVpOS3A2UnZPZ1ov
UDJrbElMVUtRZ3VNbGN3ckJaeWJ3TmtIZy9rTTVMTk9GL2FEekVrdGJQbkxuWDQw
R0V2S2tZVDYvcVA0Y01obi9TT1kwL2hZT2tJZFIzNGlsek5sVk5xNXhQN0NNakNq
YVVZSmUrNnlkSFBLNkZwT3VFb1dPWVlQNUJaRU5LTkd5Qnk0dzRzaGtNQXcxMW1B
LDAsT0VNOk5PTlNMUCxJb1RFbnRlcnByaXNlUyxHZQ0KZDRiZGM2NzgtMGE0Yi00
YTMyLWE1YjMtYWFhMjRjM2IwZjI0LEs5VktOLTNCR1dWLVk2MjRXLU1DUk1RLUJI
RENELDIwMixYMjItNTM4ODQsa3lvTngyczkzVTZPVVNrbEIxeG4rR1hjd0NKTzFR
VEV0QUNZbkNoaThhWFNveEdRNkgyeEhmVWRIVkN3VUExT1IwVWVOY1JyTW1PelpC
T0VVQnRkb0dXU1lQZzlBTWp2eGx4cTlKT3pZQUgrRzZsVDBVYkNXZ01TR0dycWRj
SWZtc2h5RWFrM2FVbXNaSzZsK3VJQUZDQ1paL0hiYkNSa2tIQzVyV0tzdE1JLDAs
UmV0YWlsLENsb3VkRWRpdGlvbk4NCjkyZmI4NzI2LTkyYTgtNGZmYy05NGNlLWY4
MmUwNzQ0NDY1MyxLWTdQTi1WUjZSWC04M1c2WS02RERZUS1UNlI0VywyMDMsWDIy
LTUzODQ3LGdENkhuVDRqUDRyY051OXU4M2d2RGlRcTF4czdRU3VqY0RibzYwRGk1
aVNWYTkvaWhaN25saG5BMGVERVpmbm9EWHJpUmlQUHFjMDlUNkFoU25GeExZaXRB
a091UEpxTDVVTW9iSXJhYjlkd1RLbG93cUZvbHhvSGhMT080VjkySHN2bi85Skx5
N3JFem9pQVdIaFgvMGNwTXIzRkN6VllQZVVXMU95TFQxQSwwLFJldGFpbCxDbG91
ZEVkaXRpb24NCjVhODUzMDBhLWJmY2UtNDc0Zi1hYzA3LWEzMDk4M2UzZmI5MCxO
OTc5Sy1YV0Q3Ny1ZVzNHQi1IQkdINi1EMzJNSCwyMDUsWDIzLTE1MDQyLGJsWm9w
a1V1YXlDVGdaS0g0Yk9GaWlzSDlHVEFIRzUvanM2VVgvcWNNV1djM3NXTnhLU1gx
T0xwMWszaDhYeDFjRnV2ZkcvZk5Bdy9JODNzc0V0UFkrQTBHeDFKRjRRcFJxc0dP
cUo1cnVRMnRHVzU2Q0pjQ1ZIa0IraTQ2bkpBRDc1OWdZbXkzcEVZTVFibXBXYmhM
eDNNSjZrdnd4S2ZVKzBWQ2lvOGs1MCwwLE9FTTpETSxJb1RFbnRlcnByaXNlU0sN
CjgwMDgzZWFlLTcwMzEtNDM5NC05ZTg4LTQ5MDE5NzNkNTZmZSxQOFE3VC1XTks3
WC1QTUZYWS1WWEhCRy1SUks2OSwyMDYsWDIzLTYyMDg0LGhhYlVKMGhoQUcwUDhp
SUthUlE3NC93WlFIeUFkRmx3SG1yZWpOak9TUkcwOEplcWlsSmxUTTZWOEc5VUVS
TEo5Mi91TURWSElWT1BYZk44WmRoOEp1WU84b2ZsUG5xeW1JUm1mZi9wVStHcGI4
NzFqVjJKREE0Q2Z0NWdtbitpY3RLb040Vm9TZkVaUlIrUjVoekYyRnNvQ0V4RE5O
dzZnTGRqdGlYOTR1QSwwLE9FTTpETSxJb1RFbnRlcnByaXNlSw0KJ0ANCiRjdXN0
b21PYmplY3RBcnJheSA9ICRoYXNoVGFibGUgfCBDb252ZXJ0RnJvbS1Dc3YNCiRT
dXBwb3J0ZWRQcm9kdWN0cyA9ICRMaWNlbnNpbmdQcm9kdWN0cyB8IA0KICAgIFdo
ZXJlLU9iamVjdCB7ICRjdXN0b21PYmplY3RBcnJheS5JRCAtY29udGFpbnMgJF8u
SUQgfQ0KDQppZiAoJHNlcnZlciAtb3IgJGV2YWx1YXRpb24gLW9yICEkU3VwcG9y
dGVkUHJvZHVjdHMpIHsNCiAgdHJ5IHsNCiAgICAkcHJvZHVjdCA9ICRMaWNlbnNp
bmdQcm9kdWN0cyB8IFdoZXJlLU9iamVjdCBEZXNjcmlwdGlvbiAtTWF0Y2ggJ1ZP
TFVNRV9LTVNDTElFTlQnIHwgV2hlcmUtT2JqZWN0IExpY2Vuc2VGYW1pbHkgLUVR
ICRFZGl0aW9uSUQNCiAgICBpZiAoLW5vdCAkcHJvZHVjdCkgew0KICAgICAgJGF2
YWlsYWJsZVByb2R1Y3RzID0gJExpY2Vuc2luZ1Byb2R1Y3RzIHwgV2hlcmUtT2Jq
ZWN0IERlc2NyaXB0aW9uIC1NYXRjaCAnVk9MVU1FX0tNU0NMSUVOVCcgfCBXaGVy
ZS1PYmplY3QgeyAkXy5MaWNlbnNlRmFtaWx5IH0NCiAgICAgIGlmICgkYXZhaWxh
YmxlUHJvZHVjdHMuQ291bnQgLWd0IDEpIHsNCiAgICAgICAgJHByb2R1Y3QgPSAk
YXZhaWxhYmxlUHJvZHVjdHMgfCBPdXQtR3JpZFZpZXcgLVRpdGxlICRMLmdyaWRU
aXRsZSAtT3V0cHV0TW9kZSBTaW5nbGUNCiAgICAgIH0NCiAgICAgIGVsc2VpZiAo
JGF2YWlsYWJsZVByb2R1Y3RzLkNvdW50IC1lcSAxKSB7DQogICAgICAgICRwcm9k
dWN0ID0gJGF2YWlsYWJsZVByb2R1Y3RzDQogICAgICB9DQogICAgfQ0KICAgIGlm
ICgkcHJvZHVjdCl7DQogICAgICBXcml0ZS1Ib3N0ICgkTC5wcm9kdWN0U2VsZWN0
ZWQgLWYgJHByb2R1Y3QuTmFtZSkgLUZvcmVncm91bmRDb2xvciBHcmVlbg0KICAg
ICAgV3JpdGUtSG9zdCAoJEwucHJvZHVjdElkIC1mICRwcm9kdWN0LklEKSAtRm9y
ZWdyb3VuZENvbG9yIEN5YW4NCiAgICAgICRWb2xfS2V5ID0gR2V0UmFuZG9tS2V5
IC1Qcm9kdWN0SUQgJHByb2R1Y3QuSUQNCiAgICAgIFdyaXRlLUhvc3QgKCRMLmtl
eVRvVXNlIC1mICRWb2xfS2V5KSAtRm9yZWdyb3VuZENvbG9yIFllbGxvdw0KICAg
IH0NCiAgICBlbHNlIHsNCiAgICAgIFdyaXRlLUhvc3QNCiAgICAgIFdyaXRlLUhv
c3QgJEwuZXJyb3JOb01hdGNoIC1Gb3JlZ3JvdW5kQ29sb3IgUmVkDQogICAgICBX
cml0ZS1Ib3N0ICRMLmF2YWlsYWJsZVByb2R1Y3RzIC1Gb3JlZ3JvdW5kQ29sb3Ig
WWVsbG93DQogICAgICAkTGljZW5zaW5nUHJvZHVjdHMgfCBXaGVyZS1PYmplY3Qg
RGVzY3JpcHRpb24gLU1hdGNoICdWT0xVTUVfS01TQ0xJRU5UJyB8IEZvckVhY2gt
T2JqZWN0IHsNCiAgICAgICAgV3JpdGUtSG9zdCAoJEwucHJvZHVjdExpc3RJdGVt
IC1mICRfLk5hbWUsICRfLklEKSAtRm9yZWdyb3VuZENvbG9yIFdoaXRlDQogICAg
ICB9DQogICAgfQ0KICB9IGNhdGNoIHsNCiAgICBXcml0ZS1Ib3N0ICgkTC5lcnJv
ckttc0tleSAtZiAkXy5FeGNlcHRpb24uTWVzc2FnZSkgLUZvcmVncm91bmRDb2xv
ciBSZWQNCiAgICByZXR1cm4NCiAgfQ0KICBpZiAoW1NUUklOR106OklzTnVsbE9y
V2hpdGVTcGFjZSgkVm9sX0tleSkgLW9yIFtTVFJJTkddOjpJc051bGxPckVtcHR5
KCgkVm9sX0tleSkpKSB7DQogICAgV3JpdGUtSG9zdCAkTC5lcnJvckludmFsaWRL
ZXkgLUZvcmVncm91bmRDb2xvciBSZWQNCiAgICByZXR1cm4NCiAgfQ0KfQ0KZWxz
ZSB7DQogICRmaWx0ZXIgPSAoJFN1cHBvcnRlZFByb2R1Y3RzLklEIHwgRm9yRWFj
aC1PYmplY3QgeyRffSkgLWpvaW4gInwiDQogICRwcm9kdWN0cyA9ICRjdXN0b21P
YmplY3RBcnJheSB8IFdoZXJlLU9iamVjdCB7ICRfLklEIC1tYXRjaCAkZmlsdGVy
IH0gfCBXaGVyZS1PYmplY3QgeyRfLlN0YXR1cyAtZXEgMCB9DQoNCiAgJHByb2R1
Y3QgPSAkbnVsbA0KICAkcHJvZHVjdCA9ICRwcm9kdWN0cyB8IFdoZXJlLU9iamVj
dCB7JF8uUHJvZHVjdCAtbWF0Y2ggJEVkaXRpb25JRH0gfCBTZWxlY3QtT2JqZWN0
IC1GaXJzdCAxDQogIGlmICgtbm90ICRwcm9kdWN0KSB7DQogICAgJHByb2R1Y3Qg
PSAkcHJvZHVjdHMgfCBPdXQtR3JpZFZpZXcgLVRpdGxlICRMLmdyaWRUaXRsZSAt
T3V0cHV0TW9kZSBTaW5nbGUNCiAgfQ0KDQogIGlmICgtbm90ICRwcm9kdWN0KSB7
DQogICAgV3JpdGUtSG9zdCAkTC5zZWxlY3Rpb25DYW5jZWxsZWQgLUZvcmVncm91
bmRDb2xvciBZZWxsb3cNCiAgICByZXR1cm4NCiAgfQ0KfQ0KDQokb3V0cHV0UGF0
aCA9IEpvaW4tUGF0aCAiQzpcUHJvZ3JhbURhdGFcTWljcm9zb2Z0XFdpbmRvd3Nc
Q2xpcFNWQ1xHZW51aW5lVGlja2V0IiAiR2VudWluZVRpY2tldC54bWwiDQppZiAo
JFZvbF9LZXkpIHsNCiAgJHNpZ25hdHVyZSA9ICc8P3htbCB2ZXJzaW9uPSIxLjAi
IGVuY29kaW5nPSJ1dGYtOCI/PjxnZW51aW5lQXV0aG9yaXphdGlvbiB4bWxucz0i
aHR0cDovL3d3dy5taWNyb3NvZnQuY29tL0RSTS9TTC9HZW51aW5lQXV0aG9yaXph
dGlvbi8xLjAiPjx2ZXJzaW9uPjEuMDwvdmVyc2lvbj48Z2VudWluZVByb3BlcnRp
ZXMgb3JpZ2luPSJzcHBjbGllbnQiPjxwcm9wZXJ0aWVzPk9BM3hPcmlnaW5hbFBy
b2R1Y3RJZD07T0EzeE9yaWdpbmFsUHJvZHVjdEtleT07U2Vzc2lvbklkPVR3QlRB
RTBBWVFCcUFHOEFjZ0JXQUdVQWNnQnpBR2tBYndCdUFEMEFOUUE3QUU4QVV3Qk5B
R2tBYmdCdkFISUFWZ0JsQUhJQWN3QnBBRzhBYmdBOUFERUFPd0JQQUZNQVVBQnNB
R0VBZEFCbUFHOEFjZ0J0QUVrQVpBQTlBRElBT3dCUUFGQUFQUUF3QURzQVJ3QldB
RXdBU3dCRkFIZ0FjQUE5QURJQU1BQXpBRGdBTFFBd0FERUFMUUF4QURrQVZBQXdB
RE1BT2dBeEFEUUFPZ0F3QURjQVdnQTdBRVFBYndCM0FHNEFiQUJsQUhZQVpRQnNB
RWNBWlFCdUFIVUFhUUJ1QUdVQVV3QjBBR0VBZEFCbEFEMEFNUUE3QUFBQTtUaW1l
U3RhbXBDbGllbnQ9MjAyMi0xMC0xMVQxMjowMDowMFo8L3Byb3BlcnRpZXM+PHNp
Z25hdHVyZXM+PHNpZ25hdHVyZSBuYW1lPSJjbGllbnRMb2NrYm94S2V5IiBtZXRo
b2Q9InJzYS1zaGEyNTYiPkM1MmlHRW9IKzFWcXpJNmtFQXFPaFV5cld1RU9ibml2
emFWanllZjhXcUl0VllkL3hHRFRaWjNia3hBSTloVHBvYlBGTkp5Sng2YTN1cmlY
cTNIVmQ3bWxYZlNVSzl5ZGVvVWRHNGVxTWVMd2t4ZWI2alFXSnpMT3o0MXJGVlNN
dEJMMGUreWNDQVRlYlRhWFM0dXZGWWFESERkUHcybEtZOEFEajNNTGdzQT08L3Np
Z25hdHVyZT48L3NpZ25hdHVyZXM+PC9nZW51aW5lUHJvcGVydGllcz48L2dlbnVp
bmVBdXRob3JpemF0aW9uPicNCn0NCg0KaWYgKC1ub3QgJFZvbF9LZXkpIHsNCiAg
ICAkc3RyaW5nID0gJ09TTWFqb3JWZXJzaW9uPTU7T1NNaW5vclZlcnNpb249MTtP
U1BsYXRmb3JtSWQ9MjtQUD0wO1Bmbj1NaWNyb3NvZnQuV2luZG93cy4nKyQoJHBy
b2R1Y3QuU0tVX0lEKSsnLicrJCgkcHJvZHVjdC5LZXlfcGFydCkrDQogICAgICAg
ICdfOHdla3liM2Q4YmJ3ZTtQS2V5SUlEPTQ2NTE0NTIxNzEzMTMxNDMwNDI2NDMz
OTQ4MTExNzg2MjI2NjI0MjAzMzQ1NzI2MDMxMTgxOTY2NDczNTI4MDsnDQogICAg
JHN0cmluZyArPSBbY2hhcl0wDQogICAgJGVuY29kZWQgPSBbY29udmVydF06OlRv
QmFzZTY0U3RyaW5nKFtUZXh0LkVuY29kaW5nXTo6VW5pY29kZS5HZXRCeXRlcygk
c3RyaW5nKSkNCg0KICAgICRzaWduYXR1cmUgPSAnPD94bWwgdmVyc2lvbj0iMS4w
IiBlbmNvZGluZz0idXRmLTgiPz48Z2VudWluZUF1dGhvcml6YXRpb24geG1sbnM9
Imh0dHA6Ly93d3cubWljcm9zb2Z0LmNvbS9EUk0vU0wvR2VudWluZUF1dGhvcml6
YXRpb24vMS4wIj4nKw0KICAgICAgJzx2ZXJzaW9uPjEuMDwvdmVyc2lvbj48Z2Vu
dWluZVByb3BlcnRpZXMgb3JpZ2luPSJzcHBjbGllbnQiPjxwcm9wZXJ0aWVzPk9B
M3hPcmlnaW5hbFByb2R1Y3RJZD07T0EzeE9yaWdpbmFsUHJvZHVjdEtleT07U2Vz
c2lvbklkPScgKw0KICAgICAgJGVuY29kZWQgKyAnO1RpbWVTdGFtcENsaWVudD0y
MDIyLTEwLTExVDEyOjAwOjAwWjwvcHJvcGVydGllcz48c2lnbmF0dXJlcz48c2ln
bmF0dXJlIG5hbWU9ImNsaWVudExvY2tib3hLZXkiIG1ldGhvZD0icnNhLXNoYTI1
NiI+JyArDQogICAgICAkcHJvZHVjdC52YWx1ZSArICc9PC9zaWduYXR1cmU+PC9z
aWduYXR1cmVzPjwvZ2VudWluZVByb3BlcnRpZXM+PC9nZW51aW5lQXV0aG9yaXph
dGlvbj4nDQogICAgJGdlb05hbWUgPSAoR2V0LUl0ZW1Qcm9wZXJ0eSAtUGF0aCAi
SEtDVTpcQ29udHJvbCBQYW5lbFxJbnRlcm5hdGlvbmFsXEdlbyIgLWVhIDApLk5h
bWUNCiAgICAkZ2VvTmF0aW9uID0gKEdldC1JdGVtUHJvcGVydHkgLVBhdGggIkhL
Q1U6XENvbnRyb2wgUGFuZWxcSW50ZXJuYXRpb25hbFxHZW8iIC1lYSAwKS5OYXRp
b24NCn0NCg0KJHRkaXIgPSAiJGVudjpQcm9ncmFtRGF0YVxNaWNyb3NvZnRcV2lu
ZG93c1xDbGlwU1ZDXEdlbnVpbmVUaWNrZXQiDQoNCiMgRfBlciB5b2tzYSBkaXpp
biBvbHX+dHVyDQppZiAoLW5vdCAoVGVzdC1QYXRoIC1QYXRoICR0ZGlyKSkgew0K
ICAgIE5ldy1JdGVtIC1JdGVtVHlwZSBEaXJlY3RvcnkgLVBhdGggJHRkaXIgLUZv
cmNlIHwgT3V0LU51bGwNCn0NCg0KIyBEaXppbmRla2kgIkdlbnVpbmUiIGlsZSBi
Yf5sYXlhbiBkb3N5YWxhcv0gc2lsDQpHZXQtQ2hpbGRJdGVtIC1QYXRoICR0ZGly
IC1GaWx0ZXIgIkdlbnVpbmUqIiAtRmlsZSAtRXJyb3JBY3Rpb24gU2lsZW50bHlD
b250aW51ZSB8IFJlbW92ZS1JdGVtIC1Gb3JjZSAtRXJyb3JBY3Rpb24gU2lsZW50
bHlDb250aW51ZQ0KDQojIERpemluZGVraSAueG1sIGRvc3lhbGFy/W79IHNpbA0K
R2V0LUNoaWxkSXRlbSAtUGF0aCAkdGRpciAtRmlsdGVyICIqLnhtbCIgLUZpbGUg
LUVycm9yQWN0aW9uIFNpbGVudGx5Q29udGludWUgfCBSZW1vdmUtSXRlbSAtRm9y
Y2UgLUVycm9yQWN0aW9uIFNpbGVudGx5Q29udGludWUNCg0KIyBNaWdyYXRpb24g
a2xhc/Zy/G5kZWtpIHT8bSBkb3N5YWxhcv0gc2lsDQokbWlncmF0aW9uUGF0aCA9
ICIkZW52OlByb2dyYW1EYXRhXE1pY3Jvc29mdFxXaW5kb3dzXENsaXBTVkNcSW5z
dGFsbFxNaWdyYXRpb24iDQppZiAoVGVzdC1QYXRoIC1QYXRoICRtaWdyYXRpb25Q
YXRoKSB7DQogICAgR2V0LUNoaWxkSXRlbSAtUGF0aCAkbWlncmF0aW9uUGF0aCAt
RmlsZSAtRXJyb3JBY3Rpb24gU2lsZW50bHlDb250aW51ZSB8IFJlbW92ZS1JdGVt
IC1Gb3JjZSAtRXJyb3JBY3Rpb24gU2lsZW50bHlDb250aW51ZQ0KfQ0KDQppZiAo
JFZvbF9LZXkpIHsNCiAgICAjIEthef10IGRlZnRlcmkgYW5haHRhcmxhcv1u/SBz
aWwNCiAgICBSZW1vdmUtSXRlbSAtUGF0aCAiSEtMTTpcU09GVFdBUkVcTWljcm9z
b2Z0XFdpbmRvd3MgTlRcQ3VycmVudFZlcnNpb25cU29mdHdhcmVQcm90ZWN0aW9u
UGxhdGZvcm1cNTVjOTI3MzQtZDY4Mi00ZDcxLTk4M2UtZDZlYzNmMTYwNTlmIiAt
Rm9yY2UgLVJlY3Vyc2UgLWVhIDANCiAgICBSZW1vdmUtSXRlbSAtUGF0aCAiSEtV
OlxTLTEtNS0yMFxTT0ZUV0FSRVxNaWNyb3NvZnRcV2luZG93cyBOVFxDdXJyZW50
VmVyc2lvblxTb2Z0d2FyZVByb3RlY3Rpb25QbGF0Zm9ybVw1NWM5MjczNC1kNjgy
LTRkNzEtOTgzZS1kNmVjM2YxNjA1OWYiIC1Gb3JjZSAtUmVjdXJzZSAtZWEgMA0K
DQogICAgIyBZZW5pIGdpcmn+bGVyIGnnaW4ga2F5/XQgeW9sdQ0KICAgICRyZWdQ
YXRoID0gIkhLTE06XFNPRlRXQVJFXE1pY3Jvc29mdFxXaW5kb3dzIE5UXEN1cnJl
bnRWZXJzaW9uXFNvZnR3YXJlUHJvdGVjdGlvblBsYXRmb3JtXDU1YzkyNzM0LWQ2
ODItNGQ3MS05ODNlLWQ2ZWMzZjE2MDU5ZlwkKCRwcm9kdWN0LklEKSINCg0KICAg
ICMgWWVuaSBrYXn9dCBkZfBlcmxlcmkgb2x1/nR1cg0KICAgIE5ldy1JdGVtIC1Q
YXRoICRyZWdQYXRoIC1Gb3JjZSAtZWEgMCB8IE91dC1OdWxsDQogICAgTmV3LUl0
ZW1Qcm9wZXJ0eSAtUGF0aCAkcmVnUGF0aCAtTmFtZSAiS2V5TWFuYWdlbWVudFNl
cnZpY2VOYW1lIiAtUHJvcGVydHlUeXBlIFN0cmluZyAtVmFsdWUgIjEyNy4wLjAu
MiIgLUZvcmNlIC1lYSAwIHwgT3V0LU51bGwNCiAgICBOZXctSXRlbVByb3BlcnR5
IC1QYXRoICRyZWdQYXRoIC1OYW1lICJLZXlNYW5hZ2VtZW50U2VydmljZVBvcnQi
IC1Qcm9wZXJ0eVR5cGUgU3RyaW5nIC1WYWx1ZSAiMTY4OCIgLUZvcmNlIC1lYSAw
IHwgT3V0LU51bGwNCiAgICANCiAgICBXcml0ZS1Ib3N0ICRMLmttc1JlZ1NldCAt
Rm9yZWdyb3VuZENvbG9yIEdyZWVuDQp9DQoNCnRyeSB7DQogICAgaWYgKCRnZW9O
YW1lIC1hbmQgJGdlb05hdGlvbiAtYW5kICgkZ2VvTmFtZSAtbmUgJ1VTJykpew0K
ICAgICAgU2V0LVdpbkhvbWVMb2NhdGlvbiAtR2VvSWQgMjQ0IC1lYSAwIA0KICAg
IH0NCiAgICANCiAgICBXcml0ZS1Ib3N0ICRMLmluc3RhbGxpbmdLZXkgLUZvcmVn
cm91bmRDb2xvciBZZWxsb3cNCiAgICBpZiAoJFZvbF9LZXkpIHsNCiAgICAgICRM
aWNlbnNpbmdTZXJ2aWNlLkluc3RhbGxQcm9kdWN0S2V5KCRWb2xfS2V5KSB8IE91
dC1OdWxsDQogICAgfQ0KICAgIGVsc2Ugew0KICAgICAgJExpY2Vuc2luZ1NlcnZp
Y2UuSW5zdGFsbFByb2R1Y3RLZXkoJHByb2R1Y3QuS2V5KSB8IE91dC1OdWxsDQog
ICAgfQ0KICAgIA0KICAgIFdyaXRlLUhvc3QgJEwuY3JlYXRpbmdUaWNrZXQgLUZv
cmVncm91bmRDb2xvciBZZWxsb3cNCiAgICBbU3lzdGVtLklPLkZpbGVdOjpXcml0
ZUFsbFRleHQoJG91dHB1dFBhdGgsICRzaWduYXR1cmUsIFtTeXN0ZW0uVGV4dC5F
bmNvZGluZ106OlVURjgpDQogICAgDQogICAgV3JpdGUtSG9zdCAkTC5pbnN0YWxs
aW5nVGlja2V0IC1Gb3JlZ3JvdW5kQ29sb3IgWWVsbG93DQogICAgV3JpdGUtSG9z
dA0KICAgIGNsaXB1cCAtdiAtbw0KICAgIFtTeXN0ZW0uSU8uRmlsZV06OldyaXRl
QWxsVGV4dCgkb3V0cHV0UGF0aCwgJHNpZ25hdHVyZSwgW1N5c3RlbS5UZXh0LkVu
Y29kaW5nXTo6VVRGOCkNCiAgICANCiAgICBpZiAoJFZvbF9LZXkpIHsNCiAgICAg
IFdyaXRlLUhvc3QNCiAgICAgIFdyaXRlLUhvc3QgJEwuc3RvcHBpbmdTcHBzdmMg
LUZvcmVncm91bmRDb2xvciBZZWxsb3cNCiAgICAgIFN0b3AtU2VydmljZSBzcHBz
dmMgLWZvcmNlIC1lYSAwIA0KICAgIH0NCiAgICANCiAgICBXcml0ZS1Ib3N0DQog
ICAgV3JpdGUtSG9zdCAkTC5yZXN0YXJ0aW5nQ2xpcHN2YyAtRm9yZWdyb3VuZENv
bG9yIFllbGxvdw0KICAgIFJlc3RhcnQtU2VydmljZSBDbGlwU1ZDDQogICAgU3Rh
cnQtU2xlZXAgMg0KICAgIA0KICAgIFdyaXRlLUhvc3QgJEwuYWN0aXZhdGluZyAt
Rm9yZWdyb3VuZENvbG9yIFllbGxvdw0KICAgIGlmICgkVm9sX0tleSkgew0KICAg
ICAgQCgkTGljZW5zaW5nUHJvZHVjdHMgfCBXaGVyZS1PYmplY3QgSUQgLU1hdGNo
ICRwcm9kdWN0LklEKS5SZUFybXNrdSgpIHwgT3V0LU51bGwgDQogICAgfQ0KICAg
IGVsc2Ugew0KICAgICAgQCgkTGljZW5zaW5nUHJvZHVjdHMgfCBXaGVyZS1PYmpl
Y3QgSUQgLU1hdGNoICRwcm9kdWN0LklEKS5BY3RpdmF0ZSgpIHwgT3V0LU51bGwN
CiAgICB9DQogICAgU3RhcnQtU2xlZXAgNA0KICAgIA0KICAgIFdyaXRlLUhvc3Qg
JEwucmVmcmVzaGluZ0xpY2Vuc2UgLUZvcmVncm91bmRDb2xvciBZZWxsb3cNCiAg
ICAkTGljZW5zaW5nU2VydmljZS5SZWZyZXNoTGljZW5zZVN0YXR1cygpIHwgT3V0
LU51bGwNCn0NCmNhdGNoIHsNCiAgICBXcml0ZS1Ib3N0ICRMLmVycm9yQWN0aXZh
dGlvbkZhaWxlZCAtRm9yZWdyb3VuZENvbG9yIFJlZA0KICAgIFdyaXRlLUhvc3Qg
KCRMLmVycm9yRGV0YWlsIC1mICRfLkV4Y2VwdGlvbi5NZXNzYWdlKSAtRm9yZWdy
b3VuZENvbG9yIFJlZA0KICAgIFN0YXJ0LVNsZWVwIC1TZWNvbmRzIDMNCiAgICBy
ZXR1cm4NCn0NCkZpbmFsbHkgew0KICBpZiAoJGdlb05hdGlvbikgew0KICAgIFNl
dC1XaW5Ib21lTG9jYXRpb24gLUdlb0lkICRnZW9OYXRpb24gLWVhIDAgfQ0KfQ0K
DQokSUQgPSAkcHJvZHVjdC5JRA0KJExpY2Vuc2luZ1Byb2R1Y3RzID0gR2V0LVdt
aU9iamVjdCBTb2Z0d2FyZUxpY2Vuc2luZ1Byb2R1Y3QgLWVhIDEgLUZpbHRlciAi
QXBwbGljYXRpb25JZD0nNTVjOTI3MzQtZDY4Mi00ZDcxLTk4M2UtZDZlYzNmMTYw
NTlmJyINCiRQcm9kdWN0ID0gJExpY2Vuc2luZ1Byb2R1Y3RzIHwgV2hlcmUtT2Jq
ZWN0IElEIC1FUSAkSUQNCg0KV3JpdGUtSG9zdA0KV3JpdGUtSG9zdCAkTC5yZXN1
bHRIZWFkZXIgLUZvcmVncm91bmRDb2xvciBDeWFuDQpXcml0ZS1Ib3N0ICgkTC5y
ZXN1bHRQcm9kdWN0IC1mICRQcm9kdWN0Lk5hbWUpIC1Gb3JlZ3JvdW5kQ29sb3Ig
V2hpdGUNCg0KIyBMaXNhbnMgZHVydW11IGtvbnRyb2z8DQokTGljZW5zZVN0YXR1
c1RleHQgPSBzd2l0Y2ggKCRQcm9kdWN0LkxpY2Vuc2VTdGF0dXMpIHsNCiAgICAw
IHsgJEwuc3RhdHVzMCB9DQogICAgMSB7ICRMLnN0YXR1czEgfQ0KICAgIDIgeyAk
TC5zdGF0dXMyIH0NCiAgICAzIHsgJEwuc3RhdHVzMyB9DQogICAgNCB7ICRMLnN0
YXR1czQgfQ0KICAgIDUgeyAkTC5zdGF0dXM1IH0NCiAgICA2IHsgJEwuc3RhdHVz
NiB9DQogICAgZGVmYXVsdCB7ICRMLnN0YXR1c1Vua25vd24gLWYgJFByb2R1Y3Qu
TGljZW5zZVN0YXR1cyB9DQp9DQoNCldyaXRlLUhvc3QgKCRMLnJlc3VsdExpY2Vu
c2VTdGF0dXMgLWYgJExpY2Vuc2VTdGF0dXNUZXh0KSAtRm9yZWdyb3VuZENvbG9y
ICQoaWYgKCRQcm9kdWN0LkxpY2Vuc2VTdGF0dXMgLWVxIDEpIHsgIkdyZWVuIiB9
IGVsc2UgeyAiUmVkIiB9KQ0KDQojIEhXSUQgdnMgS01TMzggYWt0aXZhc3lvbiB0
/HL8IGJlbGlybGVtZQ0KaWYgKCRWb2xfS2V5KSB7DQogICAgIyBLTVMzOCBha3Rp
dmFzeW9uIChTZXJ2ZXIvVm9sdW1lIHP8cvxtbGVyIGnnaW4pDQogICAgJFVwVG8g
PSAoR2V0LWRhdGUpLlllYXIgKyAoW01BVEhdOjpGbG9vcigkUHJvZHVjdC5HcmFj
ZVBlcmlvZFJlbWFpbmluZyAvICg2MCAqIDI0ICogMzY1KSkpDQogICAgV3JpdGUt
SG9zdCAkTC5hY3RpdmF0aW9uVHlwZUttczM4IC1Gb3JlZ3JvdW5kQ29sb3IgWWVs
bG93DQogICAgV3JpdGUtSG9zdCAoJEwudmFsaWRVbnRpbCAtZiAkVXBUbykgLUZv
cmVncm91bmRDb2xvciBXaGl0ZQ0KICAgICMgRWsgYmlsZ2lsZXIgdmUgZ3JhY2Ug
c/xyZXNpDQogICAgaWYgKCRQcm9kdWN0LkdyYWNlUGVyaW9kUmVtYWluaW5nIC1n
dCAwKSB7DQogICAgICAgICRyZW1haW5pbmdEYXlzID0gW01BVEhdOjpGbG9vcigk
UHJvZHVjdC5HcmFjZVBlcmlvZFJlbWFpbmluZyAvICg2MCAqIDI0KSkNCiAgICAg
ICAgaWYgKCRyZW1haW5pbmdEYXlzIC1ndCAwKSB7DQogICAgICAgICAgICBXcml0
ZS1Ib3N0ICgkTC5kYXlzUmVtYWluaW5nIC1mICRyZW1haW5pbmdEYXlzKSAtRm9y
ZWdyb3VuZENvbG9yIEN5YW4NCiAgICAgICAgfQ0KICAgIH0gICAgDQogICAgaWYg
KCRVcFRvIC1sZSAyMDM2KSB7DQogICAgICAgIFdyaXRlLUhvc3QNCiAgICAgICAg
V3JpdGUtSG9zdCAoJEwua21zMzhGYWlsIC1mICRVcFRvKSAtRm9yZWdyb3VuZENv
bG9yIFJlZA0KICAgICAgICBXcml0ZS1Ib3N0ICRMLnRyeUFnYWluIC1Gb3JlZ3Jv
dW5kQ29sb3IgUmVkDQogICAgICAgIFdyaXRlLUhvc3QNCiAgICAgICAgUmVtb3Zl
LUl0ZW0gLVBhdGggIkhLTE06XFNPRlRXQVJFXE1pY3Jvc29mdFxXaW5kb3dzIE5U
XEN1cnJlbnRWZXJzaW9uXFNvZnR3YXJlUHJvdGVjdGlvblBsYXRmb3JtXDU1Yzky
NzM0LWQ2ODItNGQ3MS05ODNlLWQ2ZWMzZjE2MDU5ZiIgLUZvcmNlIC1SZWN1cnNl
IC1lYSAwDQogICAgICAgIFJlbW92ZS1JdGVtIC1QYXRoICJIS1U6XFMtMS01LTIw
XFNPRlRXQVJFXE1pY3Jvc29mdFxXaW5kb3dzIE5UXEN1cnJlbnRWZXJzaW9uXFNv
ZnR3YXJlUHJvdGVjdGlvblBsYXRmb3JtXDU1YzkyNzM0LWQ2ODItNGQ3MS05ODNl
LWQ2ZWMzZjE2MDU5ZiIgLUZvcmNlIC1SZWN1cnNlIC1lYSAwDQogICAgfQ0KICAg
IGVsc2Ugew0KICAgICAgICBXcml0ZS1Ib3N0DQogICAgICAgIFdyaXRlLUhvc3Qg
JEwua21zMzhTdWNjZXNzIC1Gb3JlZ3JvdW5kQ29sb3IgR3JlZW4NCiAgICB9DQp9
DQplbHNlIHsNCiAgICAjIEhXSUQgYWt0aXZhc3lvbiAoRGVza3RvcCBz/HL8bWxl
ciBp52luKQ0KICAgIFdyaXRlLUhvc3QgJEwuYWN0aXZhdGlvblR5cGVId2lkIC1G
b3JlZ3JvdW5kQ29sb3IgWWVsbG93DQogICAgDQogICAgaWYgKCRQcm9kdWN0Lkxp
Y2Vuc2VTdGF0dXMgLWVxIDEpIHsNCiAgICAgICAgV3JpdGUtSG9zdCAkTC52YWxp
ZFBlcm1hbmVudCAtRm9yZWdyb3VuZENvbG9yIEdyZWVuDQogICAgICAgIFdyaXRl
LUhvc3QNCiAgICAgICAgV3JpdGUtSG9zdCAkTC5od2lkU3VjY2VzcyAtRm9yZWdy
b3VuZENvbG9yIEdyZWVuDQogICAgfQ0KICAgIGVsc2Ugew0KICAgICAgICBXcml0
ZS1Ib3N0ICRMLnZhbGlkRmFpbGVkIC1Gb3JlZ3JvdW5kQ29sb3IgUmVkDQogICAg
ICAgIFdyaXRlLUhvc3QNCiAgICAgICAgV3JpdGUtSG9zdCAkTC5od2lkRmFpbCAt
Rm9yZWdyb3VuZENvbG9yIFJlZA0KICAgICAgICBXcml0ZS1Ib3N0ICRMLnRyeUFn
YWluIC1Gb3JlZ3JvdW5kQ29sb3IgUmVkDQogICAgfQ0KfQ0KV3JpdGUtSG9zdA0K
U3RhcnQtU2xlZXAgMg0KfQ0KDQpSdW4tSFdJRA==
-----END CERTIFICATE_hwid-----

::===============================================================================================================

:: Deßiütirilmemeli / Don't modify (Ohook)

-----BEGIN CERTIFICATE_OHOOK-----
77u/W0NtZGxldEJpbmRpbmcoKV0NCnBhcmFtKA0KICAgIFtzd2l0Y2hdJHIgICMg
LXIgcGFyYW1ldHJlc2k6IHZlcmlsaXJzZSwgc2FkZWNlIFJlbW92ZSgpIGnFn2xl
dmkgw6dhbMSxxZ90xLFyxLFsxLFyIChLYWxkxLFybWEgacWfbGVtaSkNCikNCg0K
IyAtLS0gRMSwTCBBWUFSTEFSSSAvIExBTkdVQUdFIFNFVFRJTkdTIC0tLQ0KIyDE
sMWfbGV0aW0gc2lzdGVtaSBVSSBkaWxpbmkga29udHJvbCBldCAvIENoZWNrIHRo
ZSBPUyBVSSBsYW5ndWFnZQ0KJEdsb2JhbDpJc1R1cmtpc2ggPSAoR2V0LVVJQ3Vs
dHVyZSkuTmFtZS5TdGFydHNXaXRoKCJ0ciIpDQoNCiMgVMO8cmvDp2UgZGlsIGRp
emVsZXJpIC8gVHVya2lzaCBsYW5ndWFnZSBzdHJpbmdzDQokc2NyaXB0OlN0cmlu
Z3NfVFIgPSBAew0KICAgIHdtaUVycm9yICAgICAgICAgICAgICAgICAgPSAiV01J
IGhpem1ldGluZSBlcmnFn2ltZGUgaGF0YTogezB9Ig0KICAgIHJlZ0Vycm9yICAg
ICAgICAgICAgICAgICAgPSAiS2F5xLF0IGRlZnRlcmluZSBlcmnFn2ltZGUgaGF0
YTogezB9Ig0KICAgIGtleUluc3RhbGxlZCAgICAgICAgICAgICAgPSAiQW5haHRh
ciB5w7xrbGVuZGk6IHswfSINCiAgICBrZXlJbnN0YWxsRmFpbGVkICAgICAgICAg
ID0gIkFuYWh0YXIgecO8a2xlbWUgYmHFn2FyxLFzxLF6IG9sZHU6IHswfTogezF9
Ig0KICAgIHByb2RJZE5vdEZvdW5kICAgICAgICAgICAgPSAiSEFUQTogUHJvZHVj
dFJlbGVhc2VJZCBidWx1bmFtYWTEsS4iDQogICAgc3ltbGlua0V4aXN0cyAgICAg
ICAgICAgICA9ICJTZW1ib2xpayBiYcSfbGFudMSxIHphdGVuIG1ldmN1dDogezB9
LiBLYWxkxLFyxLFsbWF5YSDDp2FsxLHFn8SxbMSxeW9yLi4uIg0KICAgIHN5bWxp
bmtSZW1vdmVTdWNjZXNzICAgICAgPSAiTWV2Y3V0IHNlbWJvbGlrIGJhxJ9sYW50
xLEgYmHFn2FyxLF5bGEga2FsZMSxcsSxbGTEsS4iDQogICAgc3ltbGlua1JlbW92
ZUZhaWxlZCAgICAgICA9ICJNZXZjdXQgc2VtYm9saWsgYmHEn2xhbnTEsSBrYWxk
xLFyxLFsYW1hZMSxOiB7MH0iDQogICAgc3ltbGlua05vdEZvdW5kICAgICAgICAg
ICA9ICJ7MH0gc2VtYm9saWsgYmHEn2xhbnTEsXPEsSBidWx1bmFtYWTEsS4iDQog
ICAgYnl0ZXNXcml0ZVN1Y2Nlc3MgICAgICAgICA9ICJCYXl0IGRpemlzaSB7MH0g
a29udW11bmEgYmHFn2FyxLF5bGEgeWF6xLFsZMSxLiINCiAgICBieXRlc1dyaXRl
RmFpbGVkICAgICAgICAgID0gIkJheXQgZGl6aXNpIHswfSBrb251bXVuYSB5YXrE
sWxhbWFkxLE6IHsxfSINCiAgICBmaWxlSW5Vc2UgICAgICAgICAgICAgICAgID0g
IkRvc3lhIGt1bGxhbsSxbWRhIHZleWEga2lsaXRsaS4gR2XDp2ljaSBiaXIgZG9z
eWF5YSB0YcWfxLFubWF5YSDDp2FsxLHFn8SxbMSxeW9yLi4uIg0KICAgIGZpbGVN
b3ZlU3VjY2VzcyAgICAgICAgICAgPSAiRG9zeWEgZ2XDp2ljaSBrb251bWEgdGHF
n8SxbmTEsTogezB9Ig0KICAgIGJ5dGVzV3JpdGVBZnRlck1vdmUgICAgICAgPSAi
RG9zeWEgdGHFn8SxbmTEsWt0YW4gc29ucmEgYmF5dCBkaXppc2kgezB9IGtvbnVt
dW5hIGJhxZ9hcsSxeWxhIHlhesSxbGTEsS4iDQogICAgZmlsZU1vdmVPcldyaXRl
RmFpbGVkICAgICA9ICJEb3N5YSB0YcWfxLFuYW1hZMSxIHZleWEgeWF6bWEgacWf
bGVtaSB0ZWtyYXIgZGVuZW5lbWVkaTogezB9Ig0KICAgIHN5bWxpbmtDcmVhdGVT
dWNjZXNzICAgICAgPSAiU2VtYm9saWsgYmHEn2xhbnTEsSB7MH0gYmHFn2FyxLF5
bGEgb2x1xZ90dXJ1bGR1LiINCiAgICBzeW1saW5rQWxyZWFkeUV4aXN0cyAgICAg
ID0gIlNlbWJvbGlrIGJhxJ9sYW50xLEgezB9IHphdGVuIG1ldmN1dC4iDQogICAg
c3ltbGlua0NyZWF0ZUZhaWxlZCAgICAgICA9ICJTZW1ib2xpayBiYcSfbGFudMSx
IHswfSBrb251bXVuZGEgb2x1xZ90dXJ1bGFtYWTEsTogezB9Ig0KICAgIHJlZ0tl
eU5vdEZvdW5kQ3JlYXRpbmcgICAgPSAiS2F5xLF0IGRlZnRlcmkgYW5haHRhcsSx
ICd7MH0nIGJ1bHVuYW1hZMSxLiBPbHXFn3R1cnVsdXlvci4iDQogICAgcmVnVmFs
dWVTZXQgICAgICAgICAgICAgICA9ICJLYXnEsXQgZGVmdGVyaSBkZcSfZXJpICd7
MH0nICd7MX0nIGtvbnVtdW5kYSBheWFybGFuxLF5b3IuIg0KICAgIHJ1bkFzQWRt
aW4gICAgICAgICAgICAgICAgPSAiTMO8dGZlbiBQb3dlclNoZWxsJ2kgWcO2bmV0
aWNpIG9sYXJhayDDp2FsxLHFn3TEsXLEsW4gKFJ1biBhcyBBZG1pbmlzdHJhdG9y
KS4iDQogICAgaG9va05vdEZvdW5kV2FybmluZyAgICAgICA9ICJVWUFSSTogT2Zm
aWNlIEhvb2sgRExMIChzcHBjLmRsbCkgdmV5YSBTZW1ib2xpayBCYcSfbGFudMSx
IChzcHBjcy5kbGwpIGJ1bHVuYW1hZMSxLiINCiAgICBob29rTm90SW5zdGFsbGVk
ICAgICAgICAgID0gIk9mZmljZSBIb29rIHphdGVuIGt1cnVsbWFtxLHFny4gS2Fs
ZMSxcm1hIGnFn2xlbWkgaXB0YWwgZWRpbGRpLiINCiAgICByZW1vdmVTdGFydGVk
ICAgICAgICAgICAgID0gIk9mZmljZSBIb29rIGthbGTEsXJtYSBpxZ9sZW1pIGJh
xZ9sYXTEsWzEsXlvci4uLiINCiAgICBjbG9zaW5nUHJvY2VzcyAgICAgICAgICAg
ID0gIkthcGF0xLFsxLF5b3I6IHswfSAoSWQ9ezF9KSINCiAgICBvc3BwTm90Rm91
bmQgICAgICAgICAgICAgID0gIk9TUFAuVkJTIGJ1bHVuYW1hZMSxLiBPZmZpY2Ug
Q2xpY2stdG8tUnVuIGt1cnVsdW11IHZleWEgT2ZmaWNlIHPDvHLDvG3DvCBmYXJr
bMSxIGJpciB5ZXJkZSBvbGFiaWxpci4iDQogICAgb3NwcEZvdW5kICAgICAgICAg
ICAgICAgICA9ICJPU1BQLlZCUyBidWx1bmR1OiB7MH0iDQogICAgZ2V0dGluZ0tl
eXMgICAgICAgICAgICAgICA9ICJZw7xrbMO8IGFuYWh0YXJsYXLEsW4gc29uIDUg
aGFuZXNpIHRlc3BpdCBlZGlsaXlvci4uLiINCiAgICBrZXlTdWZmaXhOb3RGb3Vu
ZCAgICAgICAgID0gIk9TUFAgw6fEsWt0xLFzxLFuZGEgYW5haHRhciBzb24gZWtp
IGJ1bHVuYW1hZMSxLiINCiAgICBvc3BwT3V0cHV0U2hvcnQgICAgICAgICAgID0g
Ik9TUFAgL2RzdGF0dXMgw6fEsWt0xLFzxLEgKGvEsXNhKToiDQogICAga2V5c1Rv
UmVtb3ZlICAgICAgICAgICAgICA9ICJLYWxkxLFyxLFsYWNhayBhbmFodGFyIHNv
biBla2xlcmk6IHswfSINCiAgICB1bnBrZXlBdHRlbXB0ICAgICAgICAgICAgID0g
IkFuYWh0YXIgc29uIGVraSAnezB9JyBpw6dpbiAvdW5wa2V5IGRlbmVtZXNpLi4u
Ig0KICAgIHVucGtleUZhaWxlZCAgICAgICAgICAgICAgPSAiT1NQUCBpbGUgYW5h
aHRhcsSxIGthbGTEsXJtYSBkZW5lbWVzaSBiYcWfYXLEsXPEsXogb2xkdTogezB9
Ig0KICAgIHJlbWhzdEF0dGVtcHQgICAgICAgICAgICAgPSAiT1NQUCBpbGUgaG9z
dCBrYWxkxLFybWEgZGVuZW1lc2k6IC9yZW1oc3QiDQogICAgd21pQ2hlY2sgICAg
ICAgICAgICAgICAgICA9ICJXTUkgYXJhY8SxbMSxxJ/EsXlsYSBPZmZpY2Ugw7xy
w7xubGVyaSBrb250cm9sIGVkaWxpeW9yLi4uIg0KICAgIHdtaVByb2R1Y3RJbmZv
ICAgICAgICAgICAgPSAiV01JOiB7MH0gLSBLxLFzbWlBbmFodGFyOiB7MX0iDQog
ICAgd21pVW5pbnN0YWxsQ2FsbGVkICAgICAgICA9ICJXTUkgVW5pbnN0YWxsKCkg
w6dhxJ9yxLFsZMSxIChzb251w6dsYXLEsSBrb250cm9sIGVkaW4pLiINCiAgICB3
bWlVbmluc3RhbGxGYWlsZWQgICAgICAgID0gIldNSSBVbmluc3RhbGwoKSBiYcWf
YXLEsXPEsXogb2xkdTogezB9Ig0KICAgIHdtaUNoZWNrRXJyb3IgICAgICAgICAg
ICAgPSAiV01JIGtvbnRyb2zDvCBzxLFyYXPEsW5kYSBoYXRhOiB7MH0iDQogICAg
c3ltbGlua1JlbW92ZWQgICAgICAgICAgICA9ICJTZW1ib2xpayBiYcSfbGFudMSx
IGthbGTEsXLEsWxkxLE6IHswfSINCiAgICBzeW1saW5rUmVtb3ZlRmFpbCAgICAg
ICAgID0gIlNlbWJvbGlrIGJhxJ9sYW50xLEga2FsZMSxcsSxbGFtYWTEsTogezB9
Ig0KICAgIHN5bWxpbmtOb3RFeGlzdCAgICAgICAgICAgPSAiU2VtYm9saWsgYmHE
n2xhbnTEsSBtZXZjdXQgZGXEn2lsOiB7MH0iDQogICAgZGxsUmVtb3ZlZCAgICAg
ICAgICAgICAgICA9ICJIb29rIERMTCBrYWxkxLFyxLFsZMSxOiB7MH0iDQogICAg
ZGxsUmVtb3ZlRmFpbCAgICAgICAgICAgICA9ICJIb29rIERMTCBrYWxkxLFyxLFs
YW1hZMSxOiB7MH0iDQogICAgZGxsTm90RXhpc3QgICAgICAgICAgICAgICA9ICJI
b29rIERMTCBtZXZjdXQgZGXEn2lsOiB7MH0iDQogICAgZGxsQ2xlYW51cEVycm9y
ICAgICAgICAgICA9ICJETEwvc2VtYm9saWsgYmHEn2xhbnTEsSB0ZW1pemxpxJ9p
IHPEsXJhc8SxbmRhIGhhdGE6IHswfSINCiAgICByZWdDbGVhbmVkICAgICAgICAg
ICAgICAgID0gIkthecSxdCBkZWZ0ZXJpIHRlbWl6bGVuZGk6IHswfSINCiAgICBy
ZWdLZXlOb3RGb3VuZCAgICAgICAgICAgID0gIkthecSxdCBkZWZ0ZXJpIGFuYWh0
YXLEsSBidWx1bmFtYWTEsTogezB9Ig0KICAgIHJlZ0NsZWFuRXJyb3IgICAgICAg
ICAgICAgPSAiS2F5xLF0IGRlZnRlcmkgdGVtaXpsZW1lIGhhdGFzxLE6IHswfSIN
CiAgICByZW1vdmVDb21wbGV0ZSAgICAgICAgICAgID0gIk9mZmljZSBIb29rIGth
bGTEsXLEsWxkxLEuIg0KICAgIHRpdGxlUmVtb3ZlICAgICAgICAgICAgICAgPSAi
ICAgICBPZmZpY2UgSG9vayBETEwgS2FsZMSxcm1hIMSwxZ9sZW1pIg0KICAgIHJl
bW92ZUVycm9yICAgICAgICAgICAgICAgPSAiUmVtb3ZlIGnFn2xldmkgc8SxcmFz
xLFuZGEgYmlyIGhhdGEgb2x1xZ90dTogezB9Ig0KICAgIHRpdGxlSW5zdGFsbCAg
ICAgICAgICAgICAgPSAiICAgICBPZmZpY2UgSG9vayBETEwgS3VydWx1bXUiDQog
ICAgc2NyaXB0Q29tcGxldGUgICAgICAgICAgICA9ICIgICAgIEJldGlrIMOnYWzE
scWfdMSxcm1hc8SxIHRhbWFtbGFuZMSxLiINCn0NCg0KIyDEsG5naWxpemNlIGRp
bCBkaXplbGVyaSAvIEVuZ2xpc2ggbGFuZ3VhZ2Ugc3RyaW5ncw0KJHNjcmlwdDpT
dHJpbmdzX0VOID0gQHsNCiAgICB3bWlFcnJvciAgICAgICAgICAgICAgICAgID0g
IkVycm9yIGFjY2Vzc2luZyBXTUkgc2VydmljZTogezB9Ig0KICAgIHJlZ0Vycm9y
ICAgICAgICAgICAgICAgICAgPSAiRXJyb3IgYWNjZXNzaW5nIHJlZ2lzdHJ5OiB7
MH0iDQogICAga2V5SW5zdGFsbGVkICAgICAgICAgICAgICA9ICJLZXkgaW5zdGFs
bGVkOiB7MH0iDQogICAga2V5SW5zdGFsbEZhaWxlZCAgICAgICAgICA9ICJGYWls
ZWQgdG8gaW5zdGFsbCBrZXk6IHswfTogezF9Ig0KICAgIHByb2RJZE5vdEZvdW5k
ICAgICAgICAgICAgPSAiRVJST1I6IFByb2R1Y3RSZWxlYXNlSWQgbm90IGZvdW5k
LiINCiAgICBzeW1saW5rRXhpc3RzICAgICAgICAgICAgID0gIlN5bWJvbGljIGxp
bmsgYWxyZWFkeSBleGlzdHM6IHswfS4gQXR0ZW1wdGluZyB0byByZW1vdmUuLi4i
DQogICAgc3ltbGlua1JlbW92ZVN1Y2Nlc3MgICAgICA9ICJTdWNjZXNzZnVsbHkg
cmVtb3ZlZCBleGlzdGluZyBzeW1ib2xpYyBsaW5rLiINCiAgICBzeW1saW5rUmVt
b3ZlRmFpbGVkICAgICAgID0gIkZhaWxlZCB0byByZW1vdmUgZXhpc3Rpbmcgc3lt
Ym9saWMgbGluazogezB9Ig0KICAgIHN5bWxpbmtOb3RGb3VuZCAgICAgICAgICAg
PSAiU3ltYm9saWMgbGluayB7MH0gbm90IGZvdW5kLiINCiAgICBieXRlc1dyaXRl
U3VjY2VzcyAgICAgICAgID0gIlN1Y2Nlc3NmdWxseSB3cm90ZSBieXRlIGFycmF5
IHRvIHswfS4iDQogICAgYnl0ZXNXcml0ZUZhaWxlZCAgICAgICAgICA9ICJGYWls
ZWQgdG8gd3JpdGUgYnl0ZSBhcnJheSB0byB7MH06IHsxfSINCiAgICBmaWxlSW5V
c2UgICAgICAgICAgICAgICAgID0gIkZpbGUgaXMgaW4gdXNlIG9yIGxvY2tlZC4g
QXR0ZW1wdGluZyB0byBtb3ZlIHRvIGEgdGVtcG9yYXJ5IGZpbGUuLi4iDQogICAg
ZmlsZU1vdmVTdWNjZXNzICAgICAgICAgICA9ICJGaWxlIG1vdmVkIHRvIHRlbXBv
cmFyeSBsb2NhdGlvbjogezB9Ig0KICAgIGJ5dGVzV3JpdGVBZnRlck1vdmUgICAg
ICAgPSAiU3VjY2Vzc2Z1bGx5IHdyb3RlIGJ5dGUgYXJyYXkgdG8gezB9IGFmdGVy
IG1vdmluZyBmaWxlLiINCiAgICBmaWxlTW92ZU9yV3JpdGVGYWlsZWQgICAgID0g
IkZhaWxlZCB0byBtb3ZlIGZpbGUgb3IgcmV0cnkgd3JpdGUgb3BlcmF0aW9uOiB7
MH0iDQogICAgc3ltbGlua0NyZWF0ZVN1Y2Nlc3MgICAgICA9ICJTdWNjZXNzZnVs
bHkgY3JlYXRlZCBzeW1ib2xpYyBsaW5rIHswfS4iDQogICAgc3ltbGlua0FscmVh
ZHlFeGlzdHMgICAgICA9ICJTeW1ib2xpYyBsaW5rIHswfSBhbHJlYWR5IGV4aXN0
cy4iDQogICAgc3ltbGlua0NyZWF0ZUZhaWxlZCAgICAgICA9ICJGYWlsZWQgdG8g
Y3JlYXRlIHN5bWJvbGljIGxpbmsgYXQgezB9OiB7MX0iDQogICAgcmVnS2V5Tm90
Rm91bmRDcmVhdGluZyAgICA9ICJSZWdpc3RyeSBrZXkgJ3swfScgbm90IGZvdW5k
LiBDcmVhdGluZyBpdC4iDQogICAgcmVnVmFsdWVTZXQgICAgICAgICAgICAgICA9
ICJTZXR0aW5nIHJlZ2lzdHJ5IHZhbHVlICd7MH0nIGF0ICd7MX0nLiINCiAgICBy
dW5Bc0FkbWluICAgICAgICAgICAgICAgID0gIlBsZWFzZSBydW4gUG93ZXJTaGVs
bCBhcyBBZG1pbmlzdHJhdG9yLiINCiAgICBob29rTm90Rm91bmRXYXJuaW5nICAg
ICAgID0gIldBUk5JTkc6IE9mZmljZSBIb29rIERMTCAoc3BwYy5kbGwpIG9yIFN5
bWJvbGljIExpbmsgKHNwcGNzLmRsbCkgbm90IGZvdW5kLiINCiAgICBob29rTm90
SW5zdGFsbGVkICAgICAgICAgID0gIk9mZmljZSBIb29rIGlzIG5vdCBpbnN0YWxs
ZWQuIENhbmNlbGxhdGlvbiBvZiByZW1vdmFsIG9wZXJhdGlvbi4iDQogICAgcmVt
b3ZlU3RhcnRlZCAgICAgICAgICAgICA9ICJTdGFydGluZyBPZmZpY2UgSG9vayBy
ZW1vdmFsIHByb2Nlc3MuLi4iDQogICAgY2xvc2luZ1Byb2Nlc3MgICAgICAgICAg
ICA9ICJDbG9zaW5nOiB7MH0gKElkPXsxfSkiDQogICAgb3NwcE5vdEZvdW5kICAg
ICAgICAgICAgICA9ICJPU1BQLlZCUyBub3QgZm91bmQuIE9mZmljZSBDbGljay10
by1SdW4gaW5zdGFsbGF0aW9uIG9yIE9mZmljZSB2ZXJzaW9uIG1heSBiZSBpbiBh
IGRpZmZlcmVudCBsb2NhdGlvbi4iDQogICAgb3NwcEZvdW5kICAgICAgICAgICAg
ICAgICA9ICJPU1BQLlZCUyBmb3VuZDogezB9Ig0KICAgIGdldHRpbmdLZXlzICAg
ICAgICAgICAgICAgPSAiRGV0ZWN0aW5nIGxhc3QgNSBjaGFyYWN0ZXJzIG9mIGlu
c3RhbGxlZCBrZXlzLi4uIg0KICAgIGtleVN1ZmZpeE5vdEZvdW5kICAgICAgICAg
PSAiTm8ga2V5IHN1ZmZpeCBmb3VuZCBpbiBPU1BQIG91dHB1dC4iDQogICAgb3Nw
cE91dHB1dFNob3J0ICAgICAgICAgICA9ICJPU1BQIC9kc3RhdHVzIG91dHB1dCAo
c2hvcnQpOiINCiAgICBrZXlzVG9SZW1vdmUgICAgICAgICAgICAgID0gIktleSBz
dWZmaXhlcyB0byByZW1vdmU6IHswfSINCiAgICB1bnBrZXlBdHRlbXB0ICAgICAg
ICAgICAgID0gIkF0dGVtcHRpbmcgL3VucGtleSBmb3Iga2V5IHN1ZmZpeCAnezB9
Jy4uLiINCiAgICB1bnBrZXlGYWlsZWQgICAgICAgICAgICAgID0gIkZhaWxlZCB0
byByZW1vdmUga2V5IHdpdGggT1NQUDogezB9Ig0KICAgIHJlbWhzdEF0dGVtcHQg
ICAgICAgICAgICAgPSAiQXR0ZW1wdGluZyB0byByZW1vdmUgaG9zdCB3aXRoIE9T
UFA6IC9yZW1oc3QiDQogICAgd21pQ2hlY2sgICAgICAgICAgICAgICAgICA9ICJD
aGVja2luZyBPZmZpY2UgcHJvZHVjdHMgdmlhIFdNSS4uLiINCiAgICB3bWlQcm9k
dWN0SW5mbyAgICAgICAgICAgID0gIldNSTogezB9IC0gUGFydGlhbEtleTogezF9
Ig0KICAgIHdtaVVuaW5zdGFsbENhbGxlZCAgICAgICAgPSAiV01JIFVuaW5zdGFs
bCgpIGNhbGxlZCAoY2hlY2sgcmVzdWx0cykuIg0KICAgIHdtaVVuaW5zdGFsbEZh
aWxlZCAgICAgICAgPSAiV01JIFVuaW5zdGFsbCgpIGZhaWxlZDogezB9Ig0KICAg
IHdtaUNoZWNrRXJyb3IgICAgICAgICAgICAgPSAiRXJyb3IgZHVyaW5nIFdNSSBj
aGVjazogezB9Ig0KICAgIHN5bWxpbmtSZW1vdmVkICAgICAgICAgICAgPSAiU3lt
Ym9saWMgbGluayByZW1vdmVkOiB7MH0iDQogICAgc3ltbGlua1JlbW92ZUZhaWwg
ICAgICAgICA9ICJGYWlsZWQgdG8gcmVtb3ZlIHN5bWJvbGljIGxpbms6IHswfSIN
CiAgICBzeW1saW5rTm90RXhpc3QgICAgICAgICAgID0gIlN5bWJvbGljIGxpbmsg
ZG9lcyBub3QgZXhpc3Q6IHswfSINCiAgICBkbGxSZW1vdmVkICAgICAgICAgICAg
ICAgID0gIkhvb2sgRExMIHJlbW92ZWQ6IHswfSINCiAgICBkbGxSZW1vdmVGYWls
ICAgICAgICAgICAgID0gIkZhaWxlZCB0byByZW1vdmUgSG9vayBETEw6IHswfSIN
CiAgICBkbGxOb3RFeGlzdCAgICAgICAgICAgICAgID0gIkhvb2sgRExMIGRvZXMg
bm90IGV4aXN0OiB7MH0iDQogICAgZGxsQ2xlYW51cEVycm9yICAgICAgICAgICA9
ICJFcnJvciBkdXJpbmcgRExML3N5bWJvbGljIGxpbmsgY2xlYW51cDogezB9Ig0K
ICAgIHJlZ0NsZWFuZWQgICAgICAgICAgICAgICAgPSAiUmVnaXN0cnkgY2xlYW5l
ZDogezB9Ig0KICAgIHJlZ0tleU5vdEZvdW5kICAgICAgICAgICAgPSAiUmVnaXN0
cnkga2V5IG5vdCBmb3VuZDogezB9Ig0KICAgIHJlZ0NsZWFuRXJyb3IgICAgICAg
ICAgICAgPSAiUmVnaXN0cnkgY2xlYW5pbmcgZXJyb3I6IHswfSINCiAgICByZW1v
dmVDb21wbGV0ZSAgICAgICAgICAgID0gIk9mZmljZSBIb29rIHJlbW92ZWQuIg0K
ICAgIHRpdGxlUmVtb3ZlICAgICAgICAgICAgICAgPSAiICAgICBPZmZpY2UgSG9v
ayBETEwgUmVtb3ZhbCBQcm9jZXNzIg0KICAgIHJlbW92ZUVycm9yICAgICAgICAg
ICAgICAgPSAiQW4gZXJyb3Igb2NjdXJyZWQgZHVyaW5nIHRoZSBSZW1vdmUgZnVu
Y3Rpb246IHswfSINCiAgICB0aXRsZUluc3RhbGwgICAgICAgICAgICAgID0gIiAg
ICAgT2ZmaWNlIEhvb2sgRExMIEluc3RhbGxhdGlvbiINCiAgICBzY3JpcHRDb21w
bGV0ZSAgICAgICAgICAgID0gIiAgICAgU2NyaXB0IGV4ZWN1dGlvbiBjb21wbGV0
ZWQuIg0KfQ0KDQojIEt1bGxhbsSxbGFjYWsgZGlsaSBzZcOnIC8gU2VsZWN0IHRo
ZSBsYW5ndWFnZSB0byB1c2UNCmlmICgkR2xvYmFsOklzVHVya2lzaCkgew0KICAg
ICRMID0gJHNjcmlwdDpTdHJpbmdzX1RSDQp9IGVsc2Ugew0KICAgICRMID0gJHNj
cmlwdDpTdHJpbmdzX0VODQp9DQojIC0tLSBExLBMIEFZQVJMQVJJIFNPTlUgLyBF
TkQgT0YgTEFOR1VBR0UgU0VUVElOR1MgLS0tDQoNCg0KIyBIYXNoIHRhYmxvc3Ug
b2x1xZ90dXJtYWsgacOnaW4gQW5haHRhckJsb8SfdSBpxZ9sZXZpbmkgdGFuxLFt
bGENCiRLZXlCbG9jayA9IEAnDQpTS1UsS0VZDQpPMzY1QnVzaW5lc3NSZXRhaWws
WTlORjktTTJRV0QtRkY2UkotUUpXMzYtUlJGMlQNCk8zNjVFZHVDbG91ZFJldGFp
bCxXNjJOUS0yNjdRUi1SVEY3NC1QRjJNSC1KUU1USA0KTzM2NUhvbWVQcmVtUmV0
YWlsLDNOTURDLUc3QzNXLTY4UkdQLUNCNE1ILTRDWENIDQpPMzY1UHJvUGx1c1Jl
dGFpbCxIOEROOC1ZMllQMy1DUjlKVC1ESERSOS1DN0dQMw0KTzM2NVNtYWxsQnVz
UHJlbVJldGFpbCwyUUNOQi1STURLSi1HQzhQQi03UUdRVi03UVRRSg0KTzM2NUFw
cHNCYXNpY1JldGFpbCwzSFlKTi05S0c5OS1GOFZHOS1WM0RUOC1KRk1IVg0KQWNj
ZXNzUmV0YWlsLFdISzROLVlRR0hCLVhXWENDLUczSFlDLTZKRjk0DQpBY2Nlc3NS
dW50aW1lUmV0YWlsLFJOQjdWLVA0OEY0LTNGWVk2LTJQM1IzLTYzQlFWDQpFeGNl
bFJldGFpbCxSS0pCTi1WV1RNMi1CREtYWC1SS1FGRC1KVFlRMg0KSG9tZUJ1c2lu
ZXNzUGlwY1JldGFpbCwyV1FORi1HQks0Qi1YVkc2Ri1CQk1YNy1NNEYyWQ0KSG9t
ZUJ1c2luZXNzUmV0YWlsLEhNNkZNLU5WRjc4LUtWOVBNLUYzNkI4LUQ5TVhEDQpI
b21lU3R1ZGVudEFSTVJldGFpbCxQQlFQSi1OQzIySy02OU1YRC1LV01SRi1XRkc3
Nw0KSG9tZVN0dWRlbnRQbHVzQVJNUmV0YWlsLDZGMk5ZLTdSVFg0LU1EOUtNLVRK
NDNILTk0VEJUDQpIb21lU3R1ZGVudFJldGFpbCxQTlBSVi1GMjYyNy1ROEpWQy0z
REdSOS1XVFlSSw0KSG9tZVN0dWRlbnRWTmV4dFJldGFpbCxZV0Q0Ui1DTktWVC1W
RzhWSi05MzMzQi1SQzNCOA0KTW9uZG9SZXRhaWwsVk5XSEYtRktGQlctUTJSR0Qt
SFlIV0YtUjNISDINCk9uZU5vdGVGcmVlUmV0YWlsLFhZTlRHLVI5NkZZLTM2OUhY
LVlGUEhZLUY5Q1BNDQpPbmVOb3RlUmV0YWlsLEZYRjZGLUNOQzI2LVc2NDNDLUs2
S0I3LTZYWFczDQpPdXRsb29rUmV0YWlsLDdONEtHLVAyUURILTg2VjlDLURKRlZG
LTM2OVc5DQpQZXJzb25hbFBpcGNSZXRhaWwsOUNZQjMtTkZNUlctWUZERzYtWEM3
VEYtQlkzNkoNClBlcnNvbmFsUmV0YWlsLEZUN1ZGLVhCTjkyLUhQREpWLVJITUJZ
LTZWS0JGDQpQb3dlclBvaW50UmV0YWlsLE43R0NCLVdRVDdLLVFSSFdHLVRUUFlE
LTdUOVhGDQpQcm9QbHVzUmV0YWlsLEdNNDNOLUY3NDJRLTZKRERLLU02MjJKLUo4
R0RWDQpQcm9mZXNzaW9uYWxQaXBjUmV0YWlsLENGOURELTZDTlcyLUJKV0pRLUNW
Q0ZYLVk3VFhEDQpQcm9mZXNzaW9uYWxSZXRhaWwsTlhGVEstWUQ5WTctWDlNTUot
OUJXTTYtSjJRVkgNClByb2plY3RQcm9SZXRhaWwsV1BZOE4tUERQWTQtRkM3VEYt
S01QN1AtS1dZRlkNClByb2plY3RTdGRSZXRhaWwsTlRIUVQtVktLNlctQlJCODct
SFYzNDYtWTk2VzgNClB1Ymxpc2hlclJldGFpbCxXS1dORC1YNkc5Ry1DRE1UVi1D
UEdZSi02TVZCRg0KU2t5cGVTZXJ2aWNlQnlwYXNzUmV0YWlsLDZNRE40LVdGM0ZW
LTRXSDNRLVc2OTlWLVJHQ01ZDQpTa3lwZWZvckJ1c2luZXNzRW50cnlSZXRhaWws
NE40RDgtM0o3WTMtWVlXN0MtNzNIRDItVjhSSFkNClNreXBlZm9yQnVzaW5lc3NS
ZXRhaWwsUEJKNzktNzdOWTQtVlJHRkctWThXWUMtQ0tDUkMNClN0YW5kYXJkUmV0
YWlsLDJGUFdOLTRINkNNLUtEOFFRLThIQ0hDLVA5WFlXDQpWaXNpb1Byb1JldGFp
bCxOVksyRy0yTVk0Ry03SlgyUC03RDZGMi1WRlFCUg0KVmlzaW9TdGRSZXRhaWws
TkNSQjctVlA0OEYtNDNGWVktNjJQM1ItMzY3V0sNCldvcmRSZXRhaWwsUDhLODIt
TlE3R0ctSktZOFQtNlZIVlktODhHR0QNCkFjY2VzczIwMTlSZXRhaWwsV1JZSjYt
RzNOUDctN1ZIOTQtOFg3S1AtSkI3SEMNCkFjY2Vzc1J1bnRpbWUyMDE5UmV0YWls
LEZHUU5KLUpXSkNHLTdROE1HLVJNUkdKLTlUUVZGDQpFeGNlbDIwMTlSZXRhaWws
S0JQTlctNjRDTU0tOEtXQ0ItMjNGNDQtOEI3SE0NCkhvbWVCdXNpbmVzczIwMTlS
ZXRhaWwsUUJOMlktOUIyODQtOUtXNzgtSzQ4UEItUjYyWVQNCkhvbWVTdHVkZW50
QVJNMjAxOVJldGFpbCxESlROWS00SERXTS1URFdCMi04UFdDMi1XMlJSVA0KSG9t
ZVN0dWRlbnRQbHVzQVJNMjAxOVJldGFpbCxOTThXVC1DRkhCMi1RQkdYSy1KOFc2
Si1HVks4Rg0KSG9tZVN0dWRlbnQyMDE5UmV0YWlsLFhOV1BNLTMyWFFDLVk3UUpD
LVFHR0JWLVlZN0pLDQpPdXRsb29rMjAxOVJldGFpbCxXUjQzRC1OTVdRUS1IQ1FS
Mi1WS1hEUi0zN0I3SA0KUGVyc29uYWwyMDE5UmV0YWlsLE5NQlk4LVYzQ1Y3LUJY
Nks2LTI5MjJZLTQzTTdUDQpQb3dlclBvaW50MjAxOVJldGFpbCxITjI3Sy1KSEo4
Ui03VDdLSy1XSllDMy1GTTdNTQ0KUHJvUGx1czIwMTlSZXRhaWwsQk40WEotUjlE
WVktOTZXNDgtWUs4RE0tTVk3UFkNClByb2Zlc3Npb25hbDIwMTlSZXRhaWwsOU5Y
REstTVJZOTgtMlZKVjgtR0Y3M0otVFE5RksNClByb2plY3RQcm8yMDE5UmV0YWls
LEpEVE5DLVBQNzdULVQ5SDJXLUc0SjJKLVZIOEpLDQpQcm9qZWN0U3RkMjAxOVJl
dGFpbCxSM0pOVC04UEJEUC1NVFdDSy1WRDJWOC1ITUtGOQ0KUHVibGlzaGVyMjAx
OVJldGFpbCw0UUMzNi1OVzNZSC1EMlk5RC1SSlBDNy1WVkI5RA0KU2t5cGVmb3JC
dXNpbmVzczIwMTlSZXRhaWwsSkJES0YtNk5DRDYtNDlLM0ctMlRWNzktQktQNzMN
ClNreXBlZm9yQnVzaW5lc3NFbnRyeTIwMTlSZXRhaWwsTjk3MjItQlY5SDYtV1RK
VFQtRlBCOTMtOTc4TUsNClN0YW5kYXJkMjAxOVJldGFpbCxOREdWTS1NRDI3SC0y
WEhWQy1LRERYMi1ZS1A3NA0KVmlzaW9Qcm8yMDE5UmV0YWlsLDJOV1ZXLVFHRjRU
LTlDUE1CLVdZRFE5LTdYUDc5DQpWaXNpb1N0ZDIwMTlSZXRhaWwsMjYzV0stM043
OTctN1I0MzctMjhCS0ctM1Y4TTgNCldvcmQyMDE5UmV0YWlsLEpYUjhILU5KM01L
LVg2Nlc4LTc4Q1dELVFSVlIyDQpBY2Nlc3MyMDIxUmV0YWlsLFAyODZCLU4zWFlQ
LTM2UVJRLTI5Q01QLVJWWDlNDQpBY2Nlc3NSdW50aW1lMjAyMVJldGFpbCxNTlg5
RC1QQjgzNC1WQ0dZMi1LMlJXMi0yRFAzRA0KRXhjZWwyMDIxUmV0YWlsLFY2UUZC
LTdON0c5LVBGN1c5LU04RlFNLU1ZOEc5DQpIb21lQnVzaW5lc3MyMDIxUmV0YWls
LEpNOTlOLTRNTUQ4LURRQ0dKLVZNWUZZLVI2M1lLDQpIb21lU3R1ZGVudDIwMjFS
ZXRhaWwsTjNDV0QtMzhYVkgtS1JYMlktWVJQNzQtNlJCQjINCk9uZU5vdGVGcmVl
MjAyMVJldGFpbCxDTk0zVy1WOTRHQi1RSlFISC1CRFEzSi0zM1k4SA0KT25lTm90
ZTIwMjFSZXRhaWwsTkIyVFEtM1k3OUMtNzdDNk0tUU1ZN0gtN1FZOFANCk91dGxv
b2syMDIxUmV0YWlsLDROQ1dSLTlWOTJZLTM0VkIyLVJQVEhSLVlUR1I3DQpQZXJz
b25hbDIwMjFSZXRhaWwsUlJSWUItRE43NDktR0NQVzQtOUg2VkstSENIUFQNClBv
d2VyUG9pbnQyMDIxUmV0YWlsLDNLWFhRLVBWTjJDLThQN1lZLUhDVjg4LUdWTTk2
DQpQcm9QbHVzMjAyMVJldGFpbCw4V1hUUC1NTjYyOC1LWTQ0Ry1WSldDSy1DN1BD
Rg0KUHJvZmVzc2lvbmFsMjAyMVJldGFpbCxESlBIVi1OQ0pWNi1HV1BUNi1LMjZK
WC1DN1BCRw0KUHJvamVjdFBybzIwMjFSZXRhaWwsUUtITlgtTTlHR0gtVDNRTVct
WVBLNFEtUVJXTVYNClByb2plY3RTdGQyMDIxUmV0YWlsLDJCOTZWLVg5TkpZLVdG
QlJDLVE4TVAyLTdDSFJSDQpQdWJsaXNoZXIyMDIxUmV0YWlsLENETkZHLTc3VDhE
LVZLUUpYLUI3S1QzLUtLMjhWDQpTa3lwZWZvckJ1c2luZXNzMjAyMVJldGFpbCxE
VkJYTi1IRlQ0My1DVlBSUS1KODlURi1WTU1IRw0KU3RhbmRhcmQyMDIxUmV0YWls
LEhYTlhCLUo0SkdNLVRDRjQ0LTJYMkNWLUZKVlZIDQpWaXNpb1BybzIwMjFSZXRh
aWwsVDZQMjYtTkpWQlItNzZCSzgtV0JDRFktVFgzQkMNClZpc2lvU3RkMjAyMVJl
dGFpbCw4OU5ZWS1LQjkzUi03WDIyRi05M1FERi1ESjZZTQ0KV29yZDIwMjFSZXRh
aWwsVk5DQzQtQ0pRVkstQktYMzQtNzdZOEgtQ1lYTVINCkFjY2VzczIwMjRSZXRh
aWwsUDZOTVctSk1UUkMtUjZNUTYtSEgzRjItQlRIS0INCkV4Y2VsMjAyNFJldGFp
bCw4MkNOSi1XODJUVy1CWTIzVy1CVko2Vy1XNDhHUA0KSG9tZTIwMjRSZXRhaWws
TjY5WDctNzNLUFQtODk5RkQtUDhIUTQtUUdUUDQNCkhvbWVCdXNpbmVzczIwMjRS
ZXRhaWwsUFJLUU0tWU5QUVItNzdRVDYtMzI4RDctQkQyMjMNCk91dGxvb2syMDI0
UmV0YWlsLDJDRks0LU40NEtHLTdYRzg5LUNXREc2LVA3UDI3DQpQb3dlclBvaW50
MjAyNFJldGFpbCxDVDJLVC1HVE5XSC05SEZHVy1KMlBXSi1YVzdLSg0KUHJvamVj
dFBybzIwMjRSZXRhaWwsR05KNlAtWTRSQk0tQzMyV1ctMlZKS0otTVRIS0sNClBy
b2plY3RTdGQyMDI0UmV0YWlsLEMyUE5NLTJHUUZDLUNZM1hSLVdYQ1A0LUdYM1hN
DQpQcm9QbHVzMjAyNFJldGFpbCxWV0NOWC03RktCRC1GSEpZRy1YQlI0Qi04OEtD
Ng0KVmlzaW9Qcm8yMDI0UmV0YWlsLEhHUkJYLU42OFFGLTZEWThKLUNHWDRXLVhX
N0tQDQpWaXNpb1N0ZDIwMjRSZXRhaWwsVkJYUEotMzhOUjMtQzRES0YtQzhSVDct
UkdIS1ENCldvcmQyMDI0UmV0YWlsLFhOMzNSLVJQNjc2LUdNWTJGLVQzTUg3LUdD
VktSDQpFeGNlbFZvbHVtZSw5QzJQSy1OV1RWQi1KTVBXOC1CRlQyOC03RlRCRg0K
RXhjZWwyMDE5Vm9sdW1lLFRNSldULVlZTk1CLTNCS1RGLTY0NEZDLVJWWEJEDQpF
eGNlbDIwMjFWb2x1bWUsTldHM1gtODdDOUstVEM3WVktQkMyRzctRzZSVkMNCkV4
Y2VsMjAyNFZvbHVtZSxGNERZTi04OUJQMi1XUVRXSi1HUjhZQy1DS0dKRw0KUG93
ZXJQb2ludFZvbHVtZSxKN01RUC1ITko0WS1XSjdZTS1QRllHRi1CWTZDNg0KUG93
ZXJQb2ludDIwMTlWb2x1bWUsUlJOQ1gtQzY0SFktVzJNTTctTUNIOUctVEpITVEN
ClBvd2VyUG9pbnQyMDIxVm9sdW1lLFRZN1hGLU5GUkJSLUtKNDRDLUc4M0tGLUdY
MjdLDQpQb3dlclBvaW50MjAyNFZvbHVtZSxDVzk0Ti1LNkdKSC05Q1RYWS1NRzJW
Qy1GWUNXUA0KUHJvUGx1c1ZvbHVtZSxYUU5WSy04SllEQi1XSjlXMy1ZSjhZUi1X
Rkc5OQ0KUHJvUGx1czIwMTlWb2x1bWUsTk1NS0otNlJLNEYtS01KVlgtOEQ5TUot
Nk1XS1ANClByb1BsdXMyMDIxVm9sdW1lLEZYWVRLLU5KSjhDLUdCNkRXLTNEWVFU
LTZGN1RIDQpQcm9QbHVzMjAyNFZvbHVtZSxYSjJYTi1GVzhSSy1QNEhNUC1ES0RC
Vi1HQ1ZHQg0KUHJvamVjdFByb1ZvbHVtZSxZRzlOVy0zSzM5Vi0yVDNISi05M0Yz
US1HODNLVA0KUHJvamVjdFBybzIwMTlWb2x1bWUsQjROUFItM0ZLSzctVDJNQlYt
RlJRNFctUEtEMkINClByb2plY3RQcm8yMDIxVm9sdW1lLEZUTldULUM2V0JULThI
TUdGLUs5UFJYLVFWOUg4DQpQcm9qZWN0UHJvMjAyNFZvbHVtZSxGUVEyMy1ONFlD
WS03M0hRMy1GTTlXQy03NkhGNA0KUHJvamVjdFN0ZFZvbHVtZSxHTkZIUS1GNllR
TS1LUURHSi0zMjdYWC1LUUJWQw0KUHJvamVjdFN0ZDIwMTlWb2x1bWUsQzRGN1At
TkNQOEMtNkNRUFQtTVFIVjktSlhEMk0NClByb2plY3RTdGQyMDIxVm9sdW1lLEoy
SkRDLU5KQ1lZLTlSR1E0LVlYV01ILVQzRDRUDQpQcm9qZWN0U3RkMjAyNFZvbHVt
ZSxQRDNUVC1OVEhRUS1WQzdDWS1NRlhLMy1HODdGOA0KUHVibGlzaGVyVm9sdW1l
LEY0N01NLU4zWEpQLVRRWEo5LUJQOTlELThLODM3DQpQdWJsaXNoZXIyMDE5Vm9s
dW1lLEcyS1dYLTNOVzZQLVBZOTNSLUpYSzJULUM5WTlWDQpQdWJsaXNoZXIyMDIx
Vm9sdW1lLDJNVzlELU40QlhNLTlWQlBHLVE3VzZNLUtGQkdRDQpTa3lwZWZvckJ1
c2luZXNzVm9sdW1lLDg2OU5RLUZKNjlLLTQ2NkhXLVFZQ1AyLUREQlY2DQpTa3lw
ZWZvckJ1c2luZXNzMjAxOVZvbHVtZSxOQ0ozMy1KSEJCWS1IVEs5OC1NWUNWOC1I
TUtISg0KU2t5cGVmb3JCdXNpbmVzczIwMjFWb2x1bWUsSFdDWE4tSzNXQlQtV0pC
S1ktUjhCRDktWEsyOVANClNreXBlZm9yQnVzaW5lc3MyMDI0Vm9sdW1lLDROS0hG
LTlIQlFGLVEzQjZDLTdZVjM0LUY2NFAzDQpTdGFuZGFyZFZvbHVtZSxKTlJHTS1X
SERXWC1GSkpHMy1LNDdRVi1EUlRGTQ0KU3RhbmRhcmQyMDE5Vm9sdW1lLDZOV1dK
LVlRV01SLVFLR0NCLTZUTUIzLTlEOUhLDQpTdGFuZGFyZDIwMjFWb2x1bWUsS0RY
N1gtQk5WUjgtVFhYR1gtNFE3WTgtNzhWVDMNClN0YW5kYXJkMjAyNFZvbHVtZSxW
MjhONC1KRzIySy1XNjZQOC1WVE1HSy1INkhHUg0KVmlzaW9Qcm9Wb2x1bWUsUEQz
UEMtUkhOR1YtRlhKMjktOEpLN0QtUkpSSksNClZpc2lvUHJvMjAxOVZvbHVtZSw5
QkdOUS1LMzdZUi1SUUhGMi0zOFJRMy03VkNCQg0KVmlzaW9Qcm8yMDIxVm9sdW1l
LEtOSDhELUZHSFQ0LVQ4UkszLUNURFlKLUsySFQ0DQpWaXNpb1BybzIwMjRWb2x1
bWUsQjdUTjgtRko4VjMtN1FZQ1AtSFFQTVYtWVk4OUcNClZpc2lvU3RkVm9sdW1l
LDdXSFdOLTRUN01QLUc5NkpGLUczM0tSLVc4R0Y0DQpWaXNpb1N0ZDIwMTlWb2x1
bWUsN1RRTlEtSzNZUVEtM1BGSDctQ0NQUE0tWDRWUTINClZpc2lvU3RkMjAyMVZv
bHVtZSxNSlZOWS1CWVdQWS1DV1Y2Si0yUktSVC00TThRRw0KVmlzaW9TdGQyMDI0
Vm9sdW1lLEpNTVZZLVhGTlFDLUtLNEhLLTlIN1IzLVdRUVRWDQpXb3JkVm9sdW1l
LFdYWTg0LUpOMlE5LVJCQ0NRLTNRM0ozLTNQRko2DQphY2Nlc3NWb2x1bWUsR05I
OVktRDJKNFQtRkpIR0ctUVJWSDctUVBGRFcNCmFjY2VzczIwMTlWb2x1bWUsOU45
UFQtMjdWNFktVkoyUEQtWVhGTUYtWVRGUVQNCmFjY2VzczIwMjFWb2x1bWUsV004
WUctWU5HREQtNEpIREMtUEczRjQtRkM0VDQNCmFjY2VzczIwMjRWb2x1bWUsODJG
VFItTkNIUjctVzM5NDQtTUdSSE0tSk1DV0QNCm1vbmRvVm9sdW1lLEhGVE5ELVc5
TUs0LThCN01KLUI2QzRHLVhRQlIyDQpvdXRsb29rVm9sdW1lLFI2OUtLLU5UUEtG
LTdNM1E0LVFZQkhXLTZNVDlCDQpvdXRsb29rMjAxOVZvbHVtZSw3SEQ3Sy1ONFBW
Sy1CSEJDUS1ZV1FSVy1YVzRWSw0Kb3V0bG9vazIwMjFWb2x1bWUsQzlGTTYtM043
MkYtSEZKWEItVE0zVjktVDg2UjkNCm91dGxvb2syMDI0Vm9sdW1lLEQyRjhELU4z
UTNCLUoyOFBWLVgyN0hELVJKV0I5DQp3b3JkMjAxOVZvbHVtZSxQQlgzRy1OV01U
Ni1RN1hCVy1QWUpHRy1XWEQzMw0Kd29yZDIwMjFWb2x1bWUsVE44SDktTTM0RDMt
WTY0VjktVFI3MlYtWDc5S1YNCndvcmQyMDI0Vm9sdW1lLE1RODROLTdWWURNLUZY
VjdDLTZLN0NDLVZGVzlKDQpQcm9qZWN0UHJvWFZvbHVtZSxXR1QyNC1IQ05NRi1G
UTdYSC02TThLNy1EUlRXOQ0KUHJvamVjdFN0ZFZvbHVtZSxHTkZIUS1GNllRTS1L
UURHSi0zMjdYWC1LUUJWQw0KUHJvamVjdFN0ZFhWb2x1bWUsRDhOUlEtSlRZTTMt
N0oyRFgtNjQ2Q1QtNjgzNk0NClZpc2lvUHJvWFZvbHVtZSw2OVdYTi1NQllWNi0y
MlBRRy0zV0dISy1STTZYQw0KVmlzaW9TdGRWb2x1bWUsN1dIV04tNFQ3TVAtRzk2
SkYtRzMzS1ItVzhHRjQNClZpc2lvU3RkWFZvbHVtZSxOWTQ4Vi1QUFlZSC0zRjRQ
WC1YSlJLSi1XNDQyMw0KUHJvUGx1c1NQTEEyMDIxVm9sdW1lLEpSSk5KLTMzTTdD
LVI3M1gzLVA5WEY3LVI5RjZNDQpTdGFuZGFyZFNQTEEyMDIxVm9sdW1lLEJRV0RX
LU5KOVlGLVA3WTc5LUg2RENULU1LUTlDDQonQCB8IENvbnZlcnRGcm9tLUNzdg0K
DQojIEt1cnVsdW0gacWfbGV2aQ0KZnVuY3Rpb24gSW5zdGFsbCB7DQojIEJldGnE
n2kgw6dhbMSxxZ90xLFybWFkYW4gw7ZuY2UgV01JIGhpem1ldGluaW4ga3VsbGFu
xLFsYWJpbGlyIG9sZHXEn3VuZGFuIGVtaW4gb2wNCnRyeSB7DQogICAgJHdtaVNl
cnZpY2UgPSBHZXQtV21pT2JqZWN0IC1DbGFzcyBTb2Z0d2FyZUxpY2Vuc2luZ1Nl
cnZpY2UgLUVycm9yQWN0aW9uIFN0b3ANCn0gY2F0Y2ggew0KICAgIFdyaXRlLUhv
c3QgKCRMLndtaUVycm9yIC1mICRfKQ0KICAgIFN0YXJ0LVNsZWVwIDQNCiAgICBy
ZXR1cm4NCn0NCg0KIyBLYXnEsXQgZGVmdGVyaSB5b2x1IHZlIGRlxJ9lcmluaSB0
YW7EsW1sYQ0KJHJlZ1BhdGggPSAiSEtMTTpcU09GVFdBUkVcTWljcm9zb2Z0XE9m
ZmljZVxDbGlja1RvUnVuXENvbmZpZ3VyYXRpb24iDQoNCiMgUHJvZHVjdFJlbGVh
c2VJZHMga2F5xLF0IGRlZnRlcmkgZGXEn2VyaW5pIGFsIHZlIGnFn2xlDQp0cnkg
ew0KICAgICRwcm9kdWN0UmVsZWFzZUlkcyA9IChHZXQtSXRlbVByb3BlcnR5IC1Q
YXRoICRyZWdQYXRoIC1lYSAwKS5Qcm9kdWN0UmVsZWFzZUlkcw0KfSBjYXRjaCB7
DQogICAgV3JpdGUtSG9zdCAoJEwucmVnRXJyb3IgLWYgJF8pDQogICAgU3RhcnQt
U2xlZXAgNA0KICAgIHJldHVybg0KfSAgICANCmlmICgkcHJvZHVjdFJlbGVhc2VJ
ZHMpIHsNCiAgICAkcHJvZHVjdFJlbGVhc2VJZHMgLXNwbGl0ICcsJyB8IEZvckVh
Y2gtT2JqZWN0IHsNCiAgICAgICAgJHByb2R1Y3RLZXkgPSAkXy5UcmltKCkNCiAg
ICAgICAgJHBLZXkgPSAkS2V5QmxvY2sgfCA/IFNLVSAtRVEgJHByb2R1Y3RLZXkg
fCBTZWxlY3QgLUV4cGFuZFByb3BlcnR5IEtFWQ0KICAgICAgICBpZiAoJHBLZXkp
IHsNCiAgICAgICAgICAgIHRyeSB7DQogICAgICAgICAgICAgICAgJHdtaVNlcnZp
Y2UuSW5zdGFsbFByb2R1Y3RLZXkoJHBLZXkpIHwgT3V0LU51bGwNCiAgICAgICAg
ICAgICAgICBXcml0ZS1Ib3N0ICgkTC5rZXlJbnN0YWxsZWQgLWYgJHByb2R1Y3RL
ZXkpDQogICAgICAgICAgICB9IGNhdGNoIHsNCiAgICAgICAgICAgICAgICBXcml0
ZS1Ib3N0ICgkTC5rZXlJbnN0YWxsRmFpbGVkIC1mICRwcm9kdWN0S2V5LCAkXykN
CiAgICAgICAgICAgICAgICBTdGFydC1TbGVlcCA0DQogICAgICAgICAgICAgICAg
cmV0dXJuDQogICAgICAgICAgICB9DQogICAgICAgIH0NCiAgICB9DQp9IGVsc2Ug
ew0KICAgIFdyaXRlLUhvc3QgJEwucHJvZElkTm90Rm91bmQgLUZvcmVncm91bmRD
b2xvciBSZWQNCiAgICBTdGFydC1TbGVlcCAyDQogICAgcmV0dXJuDQp9DQoNCiMg
QmFzZTY0IGlsZSBrb2RsYW5txLHFnyBETEwgacOnZXJpxJ9pDQokYmFzZTY0ID0g
QCcNCkg0c0lBQUFBQUFBRUFPMWFXMndjVnhuKzE1Y2tidXhjSUduVE5tazJ3VW1j
dEZuczFBR25vYWszdTNaMjZUcmVlSDFwa3FieFpQZDRQZlY2WmpJejY5b1ZTS1Vo
Z090YWl1QUZWYW9Lb2hWQ1FxSVBSVVFrU0ZhREduZ0lCWmtuSGtCcWtVaVVTZzBD
SGxBRXkzZG16bmhuWi9ZU2dkS295TWYrWnM3NS9zczUvejluejV6WjJiNFRGNmll
aUJxQVFvSG9JdG1sbTJxWGw0QTFXMysraHQ1cHVyYnRZaUJ4YmR2Z3VHd0VOVjNO
NnRKa01DMHBpbW9HejdDZ25sZUNzaEtNOXFlQ2sycUdoVnBhN21zVlBwSTlSSmx2
ckNUMThDM20rTDFGb2UycjYrcjJVQjBhajlqY1A5Zmh3RUhmN3VDMFZhK3p4ODNM
Q3NmNGdoMk04aG9YandhSWdqYS96bEZZNTJtTGFwSm9ubGMwVkFOMmNOTThNZTFF
cmZTL2wyL0JiMWNWZWNoazB5YUp2a1ZzUzhHSkVpUWFEZWtaeVpSRVZFR2h0NkpV
cnh2L0ljM1dzOGJlTHZSV2xkR2Jkdm5yRm5yM2xkRmp0cDZWSStTS1BnTTBsOUdU
YlQwckRrMzRlOFNudHhEU0RUMU5Jc2N2aVZpRGZuKzBYTzVxU2NYT2ZkVGRzZERE
LzM4ZG00MjJkc1htK1FHMU5sN3I1TFZnRklmT3hIempiOVlTWGI4QnM5aGNBa3B6
VzA2TkVwMWZ5TytJem5IVitZMC9nMEpoNDhpb28zRit3V3dxTEY3a2srRm1RMkd4
WXlGMjdwZmRKNitFaDhLRFF5UER2UE91amtKaTdzZXQvR09ibUh1ejlidjhQSnRy
RGNabXJ5Vm1NNjF0MTE4R00vc2VPamtVUHZoVk1ycGlFMzlxaTg5dGFJMEYvbkR1
eFhWa2JvL04zcmkrdjFBb1FPWCtlUDNtVm5SeU5iS09keG1iald3Q2dySEMxWnZ2
enQ1QzMxMG5uenQ5S3Z4cytOUVZhMHhYTGhSMnZIWWFpOGFGdFZ1L2J1WEQzMzdl
YWhkMm5MRFBvamo1ODdZL2JlVW9TVFJKZk9rOVFqcnFhV0kxYlpiTC8xSEJlajdG
MS9SdSs4enZzNnU2N1hNQjJOeDliNGUzWE81dUNUVFdVYU1lYUE4MHI2VG1NNnZh
VjQ2dTBCcVREUXQxdjRYc1hnOXV1WHdpeGRsN3Z6ZGdYL09JUUJ2MmVaM0hzRFNB
ZngvNEdHaE1FZTBHVGdIZkIyNEFEd3dTN1FleXdPdkFoOERlSVNJSmVBTllCRnFH
aVE0Q1o0R2ZBTzhEdDRmdE5lZllDTVlBdkFFc0F1dWZJZW9EVk9BdDRCclFlSndv
REV3Q1B3UXVBYmVCQXllSStvRTg4RHF3Q0t3OFNmUWtJQU52QVI4Q0xjOUNGNWdG
Zmdlc1AwVjBIUGdCOEZmZzRlZHdCd1MrQ1Z3Qy9nSThpanYrU2VDbndFMWcxeWpp
Qmo1QUh2NEZQSVRZZTRHWGdWOEI5WWg3TjNBTU9BOWNBVllqOWk4RDU0REx3TitB
WFlqN09QQWQ0RjNnT3ZBZzR1NEEwc0Fyd0dYZ0g4QSt4QzRCODhCbDRDTmdKK0kr
QWN3RDd3Qi9CTFlnN2lNQUExNEZMZ0czZ0IySWZSaDRCYmdLM0FaMkl2NE04RGJ3
ZDZBTDhYOE51QVkwSWU1TzRIbmdUZUQzUUROaTd3WG1nRVdnR1Rub0FhWkgrYXdK
WUl0ZmorMTdJeDVEVnVJUm93bVBENnZ4YU5CQ2EyZ3RiaS9yOGFqd1dkcEFHK2wr
ZW9BMjBZUDBFRDFNbTJrTEhndTJZc3UvamJiVDUvQ2Nzb04yMGk1cW85MjBoeDZs
eDJndmhlanplSFRwb0gzME9IWFNmdm9DZlJIUFVBZm9DVHBJWDZJbjZSQTloZHRX
bUE2VG9XbnBVQ2FYbzFReUdVbUZVb21JbE11bG1EN0ZkQ3B0T1BLY2FqQmFPanVz
cWhqNVNUWWdaOGROOGphRlRwUnBxaUdiZlRLZWNVMVpWUTduMUROVWlTNjE2Ujhi
eThrS2c5c3hXWiswMU9JWnFpVytBeDg5MHpXOGNJVlNQeWxUMWRtZ09zRVVLc3NK
N1Y1Wlp6MVRUT0hwY05XRjlJaGtqalBkbTRxeWJHVUxhL0FWZU1lS0tRd0NKbUtM
SzRhSlMxcE1ZQTM1blhpeFIxRkxZOG1UR1U2YjhoUkx5R21tR0ZBY1U2a1M3YkxS
dEp5Y3R0MUJKSzRPVlpXVnRVNnFxTTM0REIzYVpaTkhXaFZUeUFlWWtjK1pWRVZT
dE94UjB2cU1ackpNTWg0VnVmRnhSVzBrTG04bHpCTlZPYjVvSmZJTGY3cWF5YWZO
cDlsTVBHTlFWVm5SV2lTWlNocytlYStjWTJLU2VDbWZybS84MVhsWnlhWk15Y3di
RmVKTFdvT21rcnBINm5Yc0kxMzYxdFgxVy9qcEtqYlJrZjZCYUFWRElYTloyNmxQ
VGVUOXZaWVhGVzFUaVhnMElSdGl0aFZiTGcyc3lFaWp6M1U1WGxpSlNWRzg4bDZp
VkErRFZNZjZ4NUo1UFQwdXVmVjlncXAyMXZTdkxISnNEVEhaRTJwYXl0azJQa3Jv
SmxRcDQvM2N5b3pQL0lvU1lkbXZXUXUyZlJKY2t1a0djbHZlWVRWaHFmM0FZQ29w
emVRd2dIN2NLWFU1dzZpcVRGZ1BzTEErU1V2bkpUWUxNNlk3OXc1UDI2T1Z6T1d6
c2tKK1F1aWx2T3RWbEgvSFdKRXZXa1h5dWc1cGNRMmhTblRScHV4YVZvRVhWa09L
N0oyWmZzcXI2NStkbFVWTHRybUtNNmVLYk1sYTkxd1ZIK1BUWExveWZrcm9hcTRy
d0VTT0J1WDBCRE54VTlGVU94dDNvdVQ0TzR4K2xCS2RRVjFTRENrdExrVXRCY2RQ
Sk1jazNib2ZpN3Rxa3IrWFlBWlBWaldoWXk4MlJWSDFCU1hIcGxpdXBFZXFyZUR4
WSsycmlqMjZrMU5Mdy9Ia2JFODhpcEZ4ZnFOVXNwYXYyanBGYjg2VUZ2czJIK1BY
dEJZeUtrZTVkTVdNRDZmUDVtV0VKWFkwVkYzb3N1OUxKZVZNNmNldlBPMjJrZExq
R016UWthRjRsTXBSTGwxUGFvNWc4cGl1RVZZV096N2lZU0ZtWWdXaDh1U1N2aUVX
bkRLYm1pZ2JrN0Qxc3BlbU85WjBQRU9heHFRZDdrdktHdXREVGJKblFYbmVzVXFK
ZldxWnowVkZrV003cU12WkxOUEZUWHBFMVNlc1I2d0t2R00xbkNpVE1UKzVYRDd4
a3RTSzllQlorejNsdUl0ckIvYzl0S2RkWEJUYzI2NjJ1eXdJL2dPdi9HeHBzOW5U
L20vdDZtcHV5QVBWZHF4MHZkNWF3SHAxeHVoWUlHWHErRDhhSDdIZlhRTDhtd1hE
K21xQmFBUGFUL2NNSE8xSlBMNVBVTlNtOFhkb2laRndNdTVRbitJU3NGNDliN0xm
eUpidy9IdkI5ako4VXdOUkRMVm5JTmxjWDVSc3J1L0VjWmhTZEJySEhocEFMVTc5
ZEJUdE9JNjlxUFB5aTRhUC84MzlOQXE3eHRJT3FBRi9kUjd1SzNYY0lrVW02U1NU
UWxsNGt5bEhESjRWR2lPVmo4ZlNhYWRPNElCMTdpRStvaGRwTC9nSWRDWnhlU1hv
ejdqZWdSR0Z3WENaQkg4cTVjbWdJSHBTNGRXa0Y4RHEwQXRTRkVjVDRQMnIxbnN6
MDZvcGtFVXNSdlB3dkJ5aTFlamJHU3YzWVZEYThxR1Y2S2swRHFnMFlmV2R4Ri9F
NHR0cGxjdCsyT3JmY05tMVU0ajJBKzBXaVBZZ213RXJKL1pZRlN1cVlyUUcrdFVv
YmRtK2l1d0VLQUUrYTJueEtEVGtobzh1aS9Id3hmbEhHTTgrZU40SDNlQmR6TlFU
MUlTeDlJdStaVEZ1SjI3Rk4vNFFaU0N4UDN1UDBRcllKbUdyZ3MxRGFwWmMzMkp1
Q1ZHczh1bDZzK3JOYWRTYTljTldmUDVaeDM5dndYL0lNR2hGcE1CUHpqTUhtaHIr
N1BsVng3MHQvd0h4ZjV6c0FDUUFBQT09DQonQA0KDQojIEFkxLFtIDE6IEJhc2U2
NCBkaXplc2luaSB0ZWtyYXIgYmlyIGJheXQgZGl6aXNpbmUgZMO2bsO8xZ90w7xy
DQokY29tcHJlc3NlZERsbEJ5dGVzID0gW0NvbnZlcnRdOjpGcm9tQmFzZTY0U3Ry
aW5nKCRiYXNlNjQpDQoNCiMgQWTEsW0gMjogQmF5dCBkaXppc2luZGVuIGJpciBC
ZWxsZWsgQWvEscWfxLEgKE1lbW9yeVN0cmVhbSkgb2x1xZ90dXINCiRjb21wcmVz
c2VkU3RyZWFtID0gW1N5c3RlbS5JTy5NZW1vcnlTdHJlYW1dOjpuZXcoJGNvbXBy
ZXNzZWREbGxCeXRlcykNCg0KIyBBZMSxbSAzOiBHWmlwIGt1bGxhbmFyYWsgYmF5
dCBkaXppc2luaW4gc8Sxa8SxxZ90xLFybWFzxLFuxLEgYcOnDQokZ3ppcFN0cmVh
bSA9IE5ldy1PYmplY3QgU3lzdGVtLklPLkNvbXByZXNzaW9uLkdaaXBTdHJlYW0o
JGNvbXByZXNzZWRTdHJlYW0sIFtTeXN0ZW0uSU8uQ29tcHJlc3Npb24uQ29tcHJl
c3Npb25Nb2RlXTo6RGVjb21wcmVzcykNCiRkZWNvbXByZXNzZWRTdHJlYW0gPSBO
ZXctT2JqZWN0IFN5c3RlbS5JTy5NZW1vcnlTdHJlYW0NCg0KIyBTxLFrxLHFn3TE
sXJtYXPEsSBhw6fEsWxtxLHFnyB2ZXJpeWkgeWVuaSBiaXIgQmVsbGVrIEFrxLHF
n8SxbmEga29weWFsYQ0KJGd6aXBTdHJlYW0uQ29weVRvKCRkZWNvbXByZXNzZWRT
dHJlYW0pDQokZ3ppcFN0cmVhbS5DbG9zZSgpDQoNCiMgQWTEsW0gNDogU8Sxa8Sx
xZ90xLFybWFzxLEgYcOnxLFsbcSxxZ8gYmF5dCBkaXppc2luaSBhbA0KJGRlY29t
cHJlc3NlZERsbEJ5dGVzID0gJGRlY29tcHJlc3NlZFN0cmVhbS5Ub0FycmF5KCkN
CiAgICANCiMgUHJvZ3JhbURvc3lhbGFyxLEgb3J0YW0gZGXEn2nFn2tlbml5bGUg
w6fEsWt0xLEgZG9zeWEgeW9sdW51IHRhbsSxbWxhDQokc3BwYyA9IFtTeXN0ZW0u
SU8uUGF0aF06OkNvbWJpbmUoJGVudjpQcm9ncmFtRmlsZXMsICJNaWNyb3NvZnQg
T2ZmaWNlXHJvb3RcdmZzXFN5c3RlbVxzcHBjLmRsbCIpDQoNCiMgU2VtYm9saWsg
YmHEn2xhbnTEsSB2ZSBoZWRlZiB5b2xsYXLEsW7EsSB0YW7EsW1sYQ0KJHNwcGNz
ID0gW1N5c3RlbS5JTy5QYXRoXTo6Q29tYmluZSgkZW52OlByb2dyYW1GaWxlcywg
Ik1pY3Jvc29mdCBPZmZpY2Vccm9vdFx2ZnNcU3lzdGVtXHNwcGNzLmRsbCIpDQok
U3lzdGVtMzIgPSBbU3lzdGVtLklPLlBhdGhdOjpDb21iaW5lKCRlbnY6d2luZGly
LCAiU3lzdGVtMzJcc3BwYy5kbGwiKQ0KDQojIEFkxLFtIDE6IFNlbWJvbGlrIGJh
xJ9sYW50xLFuxLFuIHZhcmzEscSfxLFuxLEga29udHJvbCBldCB2ZSBnZXJla2ly
c2Uga2FsZMSxcg0KaWYgKFRlc3QtUGF0aCAtUGF0aCAkc3BwY3MpIHsNCiAgICBX
cml0ZS1Ib3N0ICgkTC5zeW1saW5rRXhpc3RzIC1mICRzcHBjcykNCg0KICAgIHRy
eSB7DQogICAgICAgICMgTWV2Y3V0IHNlbWJvbGlrIGJhxJ9sYW50xLF5xLEga2Fs
ZMSxcg0KICAgICAgICBSZW1vdmUtSXRlbSAtUGF0aCAkc3BwY3MgLUZvcmNlDQog
ICAgICAgIFdyaXRlLUhvc3QgJEwuc3ltbGlua1JlbW92ZVN1Y2Nlc3MNCiAgICB9
IGNhdGNoIHsNCiAgICAgICAgV3JpdGUtSG9zdCAoJEwuc3ltbGlua1JlbW92ZUZh
aWxlZCAtZiAkXykNCiAgICB9DQp9IGVsc2Ugew0KICAgIFdyaXRlLUhvc3QgKCRM
LnN5bWxpbmtOb3RGb3VuZCAtZiAkc3BwY3MpDQp9DQoNCnRyeSB7DQogICAgIyBC
YXl0IGRpemlzaW5pIGRvc3lheWEgeWF6bWF5YSDDp2FsxLHFnw0KICAgIFtTeXN0
ZW0uSU8uRmlsZV06OldyaXRlQWxsQnl0ZXMoJHNwcGMsICRkZWNvbXByZXNzZWRE
bGxCeXRlcykNCiAgICBXcml0ZS1Ib3N0ICgkTC5ieXRlc1dyaXRlU3VjY2VzcyAt
ZiAkc3BwYykNCn0NCmNhdGNoIHsNCiAgICBXcml0ZS1Ib3N0ICgkTC5ieXRlc1dy
aXRlRmFpbGVkIC1mICRzcHBjLCAkXykNCg0KICAgICMgRG9zeWFuxLFuIGt1bGxh
bsSxbWRhIG9sZHXEn3UgZHVydW11IGVsZSBhbG1hayBpw6dpbiBpw6cgdHJ5LWNh
dGNoIGJsb8SfdQ0KICAgIHRyeSB7DQogICAgICAgIFdyaXRlLUhvc3QgJEwuZmls
ZUluVXNlDQoNCiAgICAgICAgIyBHZcOnaWNpIGtsYXPDtnJkZSByYXN0Z2VsZSBi
aXIgaXNpbWxlIGdlw6dpY2kgZG9zeWEgYWTEsSBvbHXFn3R1cg0KICAgICAgICAk
dGVtcERpciA9IFtTeXN0ZW0uSU8uUGF0aF06OkdldFRlbXBQYXRoKCkNCiAgICAg
ICAgJHRlbXBGaWxlTmFtZSA9IFtTeXN0ZW0uSU8uUGF0aF06OkNvbWJpbmUoJHRl
bXBEaXIsIFtTeXN0ZW0uR3VpZF06Ok5ld0d1aWQoKS5Ub1N0cmluZygpICsgIi5i
YWsiKQ0KDQogICAgICAgICMgRG9zeWF5xLEgcmFzdGdlbGUgYmlyIGlzaW1sZSBn
ZcOnaWNpIGtvbnVtYSB0YcWfxLENCiAgICAgICAgTW92ZS1JdGVtIC1QYXRoICRz
cHBjIC1EZXN0aW5hdGlvbiAkdGVtcEZpbGVOYW1lIC1Gb3JjZQ0KICAgICAgICBX
cml0ZS1Ib3N0ICgkTC5maWxlTW92ZVN1Y2Nlc3MgLWYgJHRlbXBGaWxlTmFtZSkN
Cg0KICAgICAgICAjIERvc3lhIHRhxZ/EsW5kxLFrdGFuIHNvbnJhIHlhem1hIGnF
n2xlbWluaSB0ZWtyYXIgZGVuZQ0KICAgICAgICBbU3lzdGVtLklPLkZpbGVdOjpX
cml0ZUFsbEJ5dGVzKCRzcHBjLCAkZGVjb21wcmVzc2VkRGxsQnl0ZXMpDQogICAg
ICAgIFdyaXRlLUhvc3QgKCRMLmJ5dGVzV3JpdGVBZnRlck1vdmUgLWYgJHNwcGMp
DQoNCiAgICB9IGNhdGNoIHsNCiAgICAgICAgV3JpdGUtSG9zdCAoJEwuZmlsZU1v
dmVPcldyaXRlRmFpbGVkIC1mICRfKQ0KICAgIH0NCn0NCg0KIyBBZMSxbSAzOiBT
ZW1ib2xpayBiYcSfbGFudMSxbsSxbiB2YXJsxLHEn8SxbsSxIGtvbnRyb2wgZXQg
dmUgZ2VyZWtpcnNlIG9sdcWfdHVyDQp0cnkgew0KICAgIGlmICgtbm90IChUZXN0
LVBhdGggLVBhdGggJHNwcGNzKSkgew0KICAgICAgICAjIFNlbWJvbGlrIGJhxJ9s
YW50xLF5xLEgc2FkZWNlIG1ldmN1dCBkZcSfaWxzZSBvbHXFn3R1cg0KICAgICAg
ICBOZXctSXRlbSAtUGF0aCAkc3BwY3MgLUl0ZW1UeXBlIFN5bWJvbGljTGluayAt
VGFyZ2V0ICRTeXN0ZW0zMiB8IE91dC1OdWxsDQogICAgICAgIFdyaXRlLUhvc3Qg
KCRMLnN5bWxpbmtDcmVhdGVTdWNjZXNzIC1mICRzcHBjcykNCiAgICB9IGVsc2Ug
ew0KICAgICAgICBXcml0ZS1Ib3N0ICgkTC5zeW1saW5rQWxyZWFkeUV4aXN0cyAt
ZiAkc3BwY3MpDQogICAgfQ0KfSBjYXRjaCB7DQogICAgV3JpdGUtSG9zdCAoJEwu
c3ltbGlua0NyZWF0ZUZhaWxlZCAtZiAkc3BwY3MsICRfKQ0KfQ0KICAgIA0KIyBI
ZWRlZiBrYXnEsXQgZGVmdGVyaSBhbmFodGFyIHlvbHVudSB0YW7EsW1sYQ0KJFJl
Z1BhdGggPSAiSEtDVTpcU29mdHdhcmVcTWljcm9zb2Z0XE9mZmljZVwxNi4wXENv
bW1vblxMaWNlbnNpbmdcUmVzaWxpZW5jeSINCg0KIyBEZcSfZXIgYWTEsSB2ZSB2
ZXJpc2luaSB0YW7EsW1sYQ0KJFZhbHVlTmFtZSA9ICJUaW1lT2ZMYXN0SGVhcnRi
ZWF0RmFpbHVyZSINCiRWYWx1ZURhdGEgPSAiMjA0MC0wMS0wMVQwMDowMDowMFoi
DQoNCiMgS2F5xLF0IGRlZnRlcmkgYW5haHRhcsSxbsSxbiB2YXJsxLHEn8SxbsSx
IGtvbnRyb2wgZXQuIFlva3NhIG9sdcWfdHVyLg0KIyBOZXctSXRlbSDDvHplcmlu
ZGVraSAtRm9yY2UgcGFyYW1ldHJlc2ksIHRhbSB5b2x1biBnZXJla3RpxJ9pbmRl
IG9sdcWfdHVydWxtYXPEsW7EsSBzYcSfbGFyLg0KaWYgKC1ub3QgKFRlc3QtUGF0
aCAtUGF0aCAkUmVnUGF0aCkpIHsNCiAgICBXcml0ZS1ob3N0ICgkTC5yZWdLZXlO
b3RGb3VuZENyZWF0aW5nIC1mICRSZWdQYXRoKQ0KICAgICMgQW5haHRhcsSxIHZl
IGVrc2lrIMO8c3QgYW5haHRhcmxhcsSxIG9sdcWfdHVybWFrIGnDp2luIC1Gb3Jj
ZSBrdWxsYW4NCiAgICAjIE5ldy1JdGVtJ2RhbiBnZWxlbiDDp8Sxa3TEsSBuZXNu
ZXNpbmkgZ2l6bGVtZWsgacOnaW4gT3V0LU51bGwga3VsbGFuxLFsxLFyDQogICAg
TmV3LUl0ZW0gLVBhdGggJFJlZ1BhdGggLUZvcmNlIHwgT3V0LU51bGwNCn0NCg0K
IyBNZXZjdXQgKHZleWEgeWVuaSBvbHXFn3R1cnVsYW4pIGFuYWh0YXIgacOnaW5k
ZSBrYXnEsXQgZGVmdGVyaSBkZcSfZXJpbmkgYXlhcmxhLg0KIyBTZXQtSXRlbVBy
b3BlcnR5IMO8emVyaW5kZWtpIC1Gb3JjZSBwYXJhbWV0cmVzaSwgZGXEn2VyaW4g
eW9rc2Egb2x1xZ90dXJ1bG1hc8SxbsSxLCB2YXJzYSBnw7xuY2VsbGVubWVzaW5p
IHNhxJ9sYXIuDQpXcml0ZS1ob3N0ICgkTC5yZWdWYWx1ZVNldCAtZiAkVmFsdWVO
YW1lLCAkUmVnUGF0aCkNClNldC1JdGVtUHJvcGVydHkgLVBhdGggJFJlZ1BhdGgg
LU5hbWUgJFZhbHVlTmFtZSAtVmFsdWUgJFZhbHVlRGF0YSAtVHlwZSBTdHJpbmcg
LUZvcmNlDQp9DQoNCiMgS2FsZMSxcm1hIGnFn2xldmkNCmZ1bmN0aW9uIFJlbW92
ZSB7DQogICAgIyBZw7ZuZXRpY2kga29udHJvbMO8DQogICAgaWYgKC1ub3QgKFti
b29sXSAoTmV3LU9iamVjdCBTZWN1cml0eS5QcmluY2lwYWwuV2luZG93c1ByaW5j
aXBhbChbU2VjdXJpdHkuUHJpbmNpcGFsLldpbmRvd3NJZGVudGl0eV06OkdldEN1
cnJlbnQoKSkpLklzSW5Sb2xlKFtTZWN1cml0eS5QcmluY2lwYWwuV2luZG93c0J1
aWx0SW5Sb2xlXTo6QWRtaW5pc3RyYXRvcikpKSB7DQogICAgICAgIFdyaXRlLUhv
c3QgJEwucnVuQXNBZG1pbiAtRm9yZWdyb3VuZENvbG9yIFJlZA0KICAgICAgICBy
ZXR1cm4NCiAgICB9DQoNCiAgICAjIERvc3lhIHlvbGxhcsSxbsSxIHRhbsSxbWxh
IChIb29rJ3VuIGt1cnVsdXAga3VydWxtYWTEscSfxLFuxLEga29udHJvbCBldG1l
ayBpw6dpbikNCiAgICAjIEhvb2sgRExMJ2luaW4geW9sdQ0KICAgICRzcHBjID0g
W1N5c3RlbS5JTy5QYXRoXTo6Q29tYmluZSgkZW52OlByb2dyYW1GaWxlcywgIk1p
Y3Jvc29mdCBPZmZpY2Vccm9vdFx2ZnNcU3lzdGVtXHNwcGMuZGxsIikNCiAgICAj
IFNlbWJvbGlrIEJhxJ9sYW50xLFuxLFuIHlvbHUNCiAgICAkc3BwY3MgPSBbU3lz
dGVtLklPLlBhdGhdOjpDb21iaW5lKCRlbnY6UHJvZ3JhbUZpbGVzLCAiTWljcm9z
b2Z0IE9mZmljZVxyb290XHZmc1xTeXN0ZW1cc3BwY3MuZGxsIikNCiAgICANCiAg
ICAjIEtvbnRyb2wgQWTEsW3EsTogSG9vayBiaWxlxZ9lbmxlcmluaW4gdmFybMSx
xJ/EsW7EsSBrb250cm9sIGV0DQogICAgaWYgKC1ub3QgKFRlc3QtUGF0aCAtUGF0
aCAkc3BwYykgLWFuZCAtbm90IChUZXN0LVBhdGggLVBhdGggJHNwcGNzKSkgew0K
ICAgICAgICBXcml0ZS1Ib3N0ICRMLmhvb2tOb3RGb3VuZFdhcm5pbmcgLUZvcmVn
cm91bmRDb2xvciBZZWxsb3cNCiAgICAgICAgV3JpdGUtSG9zdCAkTC5ob29rTm90
SW5zdGFsbGVkIC1Gb3JlZ3JvdW5kQ29sb3IgWWVsbG93DQogICAgICAgIFN0YXJ0
LVNsZWVwIDINCiAgICAgICAgcmV0dXJuICMgSG9vayBrdXJ1bHUgZGXEn2lsc2Ug
UmVtb3ZlIGnFn2xldmluaSBzb25sYW5kxLFyDQogICAgfQ0KDQogICAgV3JpdGUt
SG9zdCAkTC5yZW1vdmVTdGFydGVkIC1Gb3JlZ3JvdW5kQ29sb3IgQ3lhbg0KICAg
IA0KICAgICMgMSkgT2ZmaWNlIGnFn2xlbWxlcmluaSBrYXBhdCAoV0lOV09SRCwg
RVhDRUwsIE9VVExPT0ssIHZiLikNCiAgICAkb2ZmaWNlUHJvY2Vzc2VzID0gQCgn
V0lOV09SRCcsJ0VYQ0VMJywnUE9XRVJQTlQnLCdPVVRMT09LJywnTVNQVUInLCdP
TkVOT1RFJywnVklTSU8nLCdXUFMnLCdMeW5jJykNCiAgICBmb3JlYWNoICgkcCBp
biAkb2ZmaWNlUHJvY2Vzc2VzKSB7DQogICAgICAgIHRyeSB7DQogICAgICAgICAg
ICBHZXQtUHJvY2VzcyAtTmFtZSAkcCAtRXJyb3JBY3Rpb24gU2lsZW50bHlDb250
aW51ZSB8IEZvckVhY2gtT2JqZWN0IHsNCiAgICAgICAgICAgICAgICBXcml0ZS1I
b3N0ICgkTC5jbG9zaW5nUHJvY2VzcyAtZiAkXy5OYW1lLCAkXy5JZCkNCiAgICAg
ICAgICAgICAgICBTdG9wLVByb2Nlc3MgLUlkICRfLklkIC1Gb3JjZSAtRXJyb3JB
Y3Rpb24gU2lsZW50bHlDb250aW51ZQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9
IGNhdGNoIHsgfQ0KICAgIH0NCiAgICBTdGFydC1TbGVlcCAtU2Vjb25kcyAyDQoN
CiAgICAjIDIpIE9TUFAuVkJTJ2kgYnVsDQogICAgJHBvc3NpYmxlUm9vdHMgPSBA
KA0KICAgICAgICAiJGVudjpQcm9ncmFtRmlsZXNcTWljcm9zb2Z0IE9mZmljZSIs
DQogICAgICAgICIkZW52OlByb2dyYW1GaWxlc1xNaWNyb3NvZnQgT2ZmaWNlXHJv
b3RcT2ZmaWNlMTYiLA0KICAgICAgICAiJGVudjpQcm9ncmFtRmlsZXNcTWljcm9z
b2Z0IE9mZmljZVxPZmZpY2UxNiIsDQogICAgICAgICIkZW52OlByb2dyYW1GaWxl
cyh4ODYpXE1pY3Jvc29mdCBPZmZpY2UiLA0KICAgICAgICAiJGVudjpQcm9ncmFt
RmlsZXMoeDg2KVxNaWNyb3NvZnQgT2ZmaWNlXHJvb3RcT2ZmaWNlMTYiLA0KICAg
ICAgICAiJGVudjpQcm9ncmFtRmlsZXMoeDg2KVxNaWNyb3NvZnQgT2ZmaWNlXE9m
ZmljZTE2Ig0KICAgICkgfCBXaGVyZS1PYmplY3QgeyBUZXN0LVBhdGggJF8gfSAj
IE1ldmN1dCBvbGFuIGvDtmsgeW9sbGFyxLEgZmlsdHJlbGUNCg0KICAgICRvc3Bw
UGF0aHMgPSBAKCkNCiAgICBmb3JlYWNoICgkcm9vdCBpbiAkcG9zc2libGVSb290
cykgew0KICAgICAgICB0cnkgew0KICAgICAgICAgICAgIyBPU1BQLlZCUyBkb3N5
YXPEsW7EsSBidWwNCiAgICAgICAgICAgICRmb3VuZCA9IEdldC1DaGlsZEl0ZW0g
LVBhdGggJHJvb3QgLUZpbHRlciAiT1NQUC5WQlMiIC1SZWN1cnNlIC1FcnJvckFj
dGlvbiBTaWxlbnRseUNvbnRpbnVlIHwgU2VsZWN0LU9iamVjdCAtRmlyc3QgMQ0K
ICAgICAgICAgICAgaWYgKCRmb3VuZCkgeyAkb3NwcFBhdGhzICs9ICRmb3VuZC5G
dWxsTmFtZSB9DQogICAgICAgIH0gY2F0Y2ggeyB9DQogICAgfQ0KDQogICAgaWYg
KCRvc3BwUGF0aHMuQ291bnQgLWVxIDApIHsNCiAgICAgICAgV3JpdGUtSG9zdCAk
TC5vc3BwTm90Rm91bmQgLUZvcmVncm91bmRDb2xvciBZZWxsb3cNCiAgICB9IGVs
c2Ugew0KICAgICAgICAjIEt1bGxhbsSxbGFjYWsgT1NQUC5WQlMgKGJ1bHVuYW4g
aWxrIGRvc3lhKQ0KICAgICAgICAkb3NwcCA9ICRvc3BwUGF0aHNbMF0NCiAgICAg
ICAgV3JpdGUtSG9zdCAoJEwub3NwcEZvdW5kIC1mICRvc3BwKSAtRm9yZWdyb3Vu
ZENvbG9yIEdyZWVuDQoNCiAgICAgICAgIyAzKSAvZHN0YXR1cyBrdWxsYW5hcmFr
IHnDvGtsw7wgYW5haHRhcmxhcsSxbiBzb24gNSBoYW5lc2luaSBhbA0KICAgICAg
ICBXcml0ZS1Ib3N0ICRMLmdldHRpbmdLZXlzIC1Gb3JlZ3JvdW5kQ29sb3IgQ3lh
bg0KICAgICAgICAkZHN0YXR1cyA9ICYgY3NjcmlwdC5leGUgLy9Ob0xvZ28gJG9z
cHAgL2RzdGF0dXMgMj4mMQ0KICAgICAgICBpZiAoLW5vdCAkZHN0YXR1cykgeyAk
ZHN0YXR1cyA9IEAoKSB9ICMgQm/Fn3NhIGJvxZ8gZGl6aSB5YXANCg0KICAgICAg
ICAjICJTb24gNSIgdmV5YSAiS8Sxc21pIMOccsO8biBBbmFodGFyxLEiIHNhdMSx
cmxhcsSxbsSxIMOnxLFrYXINCiAgICAgICAgJGtleVN1ZmZpeGVzID0gQCgpDQog
ICAgICAgIGZvcmVhY2ggKCRsaW5lIGluICRkc3RhdHVzKSB7DQogICAgICAgICAg
ICAjIFlheWfEsW4gZm9ybWF0OiAiTGFzdCA1IGNoYXJhY3RlcnMgb2YgaW5zdGFs
bGVkIHByb2R1Y3Qga2V5OiBYWFhYWCINCiAgICAgICAgICAgICMgVkVZQSBUw7xy
a8OnZTogIlnDvGtsw7wgw7xyw7xuIGFuYWh0YXLEsW7EsW4gc29uIDUga2FyYWt0
ZXJpOiBYWFhYWCINCiAgICAgICAgICAgIGlmICgkbGluZSAtbWF0Y2ggIihMYXN0
IDUgY2hhcmFjdGVycyBvZiBpbnN0YWxsZWQgcHJvZHVjdCBrZXl8WcO8a2zDvCDD
vHLDvG4gYW5haHRhcsSxbsSxbiBzb24gNSBrYXJha3RlcmkpXHMqOj9ccyooW0Et
WjAtOV17NX0pIikgew0KICAgICAgICAgICAgICAgICRrZXlTdWZmaXhlcyArPSAk
bWF0Y2hlc1syXQ0KICAgICAgICAgICAgfSBlbHNlaWYgKCRsaW5lIC1tYXRjaCAi
KFBhcnRpYWwgS2V5fEvEsXNtaSBBbmFodGFyKTpccyooW0EtWjAtOV17NX0pIikg
ew0KICAgICAgICAgICAgICAgICRrZXlTdWZmaXhlcyArPSAkbWF0Y2hlc1syXQ0K
ICAgICAgICAgICAgfSBlbHNlaWYgKCRsaW5lIC1tYXRjaCAiKEluc3RhbGxlZCBQ
cm9kdWN0IEtleXxZw7xrbMO8IMOccsO8biBBbmFodGFyxLEpXHMqOlxzKihbQS1a
MC05XC1cc10rKSIpIHsNCiAgICAgICAgICAgICAgICAjIEJhesSxIGR1cnVtbGFy
ZGEgdGFtIGFuYWh0YXIgc2F0xLFyxLEgZ8O2csO8bmViaWxpcjsgc29uIDUga2Fy
YWt0ZXJpIGFsDQogICAgICAgICAgICAgICAgJHJhdyA9ICRtYXRjaGVzWzJdIC1y
ZXBsYWNlICdccycsJycNCiAgICAgICAgICAgICAgICBpZiAoJHJhdy5MZW5ndGgg
LWdlIDUpIHsgJGtleVN1ZmZpeGVzICs9ICRyYXcuU3Vic3RyaW5nKCRyYXcuTGVu
Z3RoLTUsNSkgfQ0KICAgICAgICAgICAgfQ0KICAgICAgICB9DQoNCiAgICAgICAg
JGtleVN1ZmZpeGVzID0gJGtleVN1ZmZpeGVzIHwgU29ydC1PYmplY3QgLVVuaXF1
ZSAjIFRla3JhcmxhcsSxIGthbGTEsXINCg0KICAgICAgICBpZiAoJGtleVN1ZmZp
eGVzLkNvdW50IC1lcSAwKSB7DQogICAgICAgICAgICBXcml0ZS1Ib3N0ICRMLmtl
eVN1ZmZpeE5vdEZvdW5kIC1Gb3JlZ3JvdW5kQ29sb3IgWWVsbG93DQogICAgICAg
ICAgICBXcml0ZS1Ib3N0ICRMLm9zcHBPdXRwdXRTaG9ydA0KICAgICAgICAgICAg
JGRzdGF0dXMgfCBTZWxlY3QtT2JqZWN0IC1GaXJzdCA0MCB8IEZvckVhY2gtT2Jq
ZWN0IHsgV3JpdGUtSG9zdCAkXyB9DQogICAgICAgIH0gZWxzZSB7DQogICAgICAg
ICAgICBXcml0ZS1Ib3N0ICgkTC5rZXlzVG9SZW1vdmUgLWYgKCRrZXlTdWZmaXhl
cyAtam9pbiAnLCAnKSkgLUZvcmVncm91bmRDb2xvciBDeWFuDQoNCiAgICAgICAg
ICAgIGZvcmVhY2ggKCRzdWYgaW4gJGtleVN1ZmZpeGVzKSB7DQogICAgICAgICAg
ICAgICAgdHJ5IHsNCiAgICAgICAgICAgICAgICAgICAgV3JpdGUtSG9zdCAoJEwu
dW5wa2V5QXR0ZW1wdCAtZiAkc3VmKSAtRm9yZWdyb3VuZENvbG9yIFllbGxvdw0K
ICAgICAgICAgICAgICAgICAgICAkdW5wID0gJiBjc2NyaXB0LmV4ZSAvL05vTG9n
byAkb3NwcCAvdW5wa2V5OiRzdWYgMj4mMQ0KICAgICAgICAgICAgICAgICAgICAk
dW5wIHwgRm9yRWFjaC1PYmplY3QgeyBXcml0ZS1Ib3N0ICRfIH0NCiAgICAgICAg
ICAgICAgICAgICAgU3RhcnQtU2xlZXAgLU1pbGxpc2Vjb25kcyAzMDANCiAgICAg
ICAgICAgICAgICB9IGNhdGNoIHsNCiAgICAgICAgICAgICAgICAgICAgV3JpdGUt
SG9zdCAoJEwudW5wa2V5RmFpbGVkIC1mICRfKSAtRm9yZWdyb3VuZENvbG9yIFJl
ZA0KICAgICAgICAgICAgICAgIH0NCiAgICAgICAgICAgIH0NCg0KICAgICAgICAg
ICAgIyAvcmVtaHN0IChiYXLEsW5kxLFyxLFsYW4gZXRraW5sZcWfdGlybWUga2Fs
ZMSxcm1hKSBkYSBkZW5lbmViaWxpciAoaXN0ZcSfZSBiYcSfbMSxKQ0KICAgICAg
ICAgICAgdHJ5IHsNCiAgICAgICAgICAgICAgICBXcml0ZS1Ib3N0ICRMLnJlbWhz
dEF0dGVtcHQgLUZvcmVncm91bmRDb2xvciBZZWxsb3cNCiAgICAgICAgICAgICAg
ICAkcmVtID0gJiBjc2NyaXB0LmV4ZSAvL05vTG9nbyAkb3NwcCAvcmVtaHN0IDI+
JjENCiAgICAgICAgICAgICAgICAkcmVtIHwgRm9yRWFjaC1PYmplY3QgeyBXcml0
ZS1Ib3N0ICRfIH0NCiAgICAgICAgICAgIH0gY2F0Y2ggeyB9DQogICAgICAgIH0N
CiAgICB9DQoNCiAgICBTdGFydC1TbGVlcCAtU2Vjb25kcyAxDQoNCiAgICAjIDQp
IEFsdGVybmF0aWY6IFdNSSBhcmFjxLFsxLHEn8SxeWxhIFNvZnR3YXJlTGljZW5z
aW5nUHJvZHVjdCAtIChlayBiaWxnaSB0b3BsYW1hLCBrYWxkxLFybWEgZGVuZW1l
c2kpDQogICAgdHJ5IHsNCiAgICAgICAgV3JpdGUtSG9zdCAkTC53bWlDaGVjayAt
Rm9yZWdyb3VuZENvbG9yIEN5YW4NCiAgICAgICAgJHdtaU9mZmljZSA9IEdldC1X
bWlPYmplY3QgLU5hbWVzcGFjZSAicm9vdFxjaW12MiIgLUNsYXNzIFNvZnR3YXJl
TGljZW5zaW5nUHJvZHVjdCAtRXJyb3JBY3Rpb24gU2lsZW50bHlDb250aW51ZSB8
DQogICAgICAgICAgICBXaGVyZS1PYmplY3QgeyAkXy5OYW1lIC1hbmQgKCRfLk5h
bWUgLW1hdGNoICdPZmZpY2UnIC1vciAkXy5OYW1lIC1tYXRjaCAnTWljcm9zb2Z0
IE9mZmljZScpIC1hbmQgJF8uUGFydGlhbFByb2R1Y3RLZXkgfQ0KICAgICAgICBm
b3JlYWNoICgkcCBpbiAkd21pT2ZmaWNlKSB7DQogICAgICAgICAgICBXcml0ZS1I
b3N0ICgkTC53bWlQcm9kdWN0SW5mbyAtZiAkcC5OYW1lLCAkcC5QYXJ0aWFsUHJv
ZHVjdEtleSkgLUZvcmVncm91bmRDb2xvciBHcmF5DQogICAgICAgICAgICB0cnkg
ew0KICAgICAgICAgICAgICAgICMgVW5pbnN0YWxsKCkgZ2VuZWxsaWtsZSDDp2Fs
xLHFn21heWFiaWxpciwgYW5jYWsgZGVuaXlvcnV6DQogICAgICAgICAgICAgICAg
JHAuVW5pbnN0YWxsKCkgfCBPdXQtTnVsbA0KICAgICAgICAgICAgICAgIFdyaXRl
LUhvc3QgJEwud21pVW5pbnN0YWxsQ2FsbGVkIC1Gb3JlZ3JvdW5kQ29sb3IgR3Jl
ZW4NCiAgICAgICAgICAgIH0gY2F0Y2ggew0KICAgICAgICAgICAgICAgIFdyaXRl
LUhvc3QgKCRMLndtaVVuaW5zdGFsbEZhaWxlZCAtZiAkXykgLUZvcmVncm91bmRD
b2xvciBZZWxsb3cNCiAgICAgICAgICAgIH0NCiAgICAgICAgfQ0KICAgIH0gY2F0
Y2ggew0KICAgICAgICBXcml0ZS1Ib3N0ICgkTC53bWlDaGVja0Vycm9yIC1mICRf
KSAtRm9yZWdyb3VuZENvbG9yIFllbGxvdw0KICAgIH0NCg0KICAgIFN0YXJ0LVNs
ZWVwIC1TZWNvbmRzIDENCg0KICAgICMgNSkgSG9vayBETEwgLyBzZW1ib2xpayBi
YcSfbGFudMSxIC8ga2F5xLF0IGRlZnRlcmkgdGVtaXpsacSfaSAobWV2Y3V0IGtv
ZHVudXphIGJlbnplcikNCiAgICB0cnkgew0KICAgICAgICAjICRzcHBjIHZlICRz
cHBjcyB5b2xsYXLEsSB6YXRlbiB5dWthcsSxZGEgdGFuxLFtbMSxDQogICAgICAg
ICRTeXN0ZW0zMiA9IFtTeXN0ZW0uSU8uUGF0aF06OkNvbWJpbmUoJGVudjp3aW5k
aXIsICJTeXN0ZW0zMlxzcHBjLmRsbCIpDQoNCiAgICAgICAgaWYgKFRlc3QtUGF0
aCAtUGF0aCAkc3BwY3MpIHsNCiAgICAgICAgICAgIHRyeSB7IFJlbW92ZS1JdGVt
IC1QYXRoICRzcHBjcyAtRm9yY2UgLUVycm9yQWN0aW9uIFN0b3A7IFdyaXRlLUhv
c3QgKCRMLnN5bWxpbmtSZW1vdmVkIC1mICRzcHBjcykgLUZvcmVncm91bmRDb2xv
ciBHcmVlbiB9IGNhdGNoIHsgV3JpdGUtSG9zdCAoJEwuc3ltbGlua1JlbW92ZUZh
aWwgLWYgJF8pIC1Gb3JlZ3JvdW5kQ29sb3IgWWVsbG93IH0NCiAgICAgICAgfSBl
bHNlIHsgV3JpdGUtSG9zdCAoJEwuc3ltbGlua05vdEV4aXN0IC1mICRzcHBjcykg
LUZvcmVncm91bmRDb2xvciBHcmF5IH0NCg0KICAgICAgICBpZiAoVGVzdC1QYXRo
IC1QYXRoICRzcHBjKSB7DQogICAgICAgICAgICB0cnkgeyBSZW1vdmUtSXRlbSAt
UGF0aCAkc3BwYyAtRm9yY2UgLUVycm9yQWN0aW9uIFN0b3A7IFdyaXRlLUhvc3Qg
KCRMLmRsbFJlbW92ZWQgLWYgJHNwcGMpIC1Gb3JlZ3JvdW5kQ29sb3IgR3JlZW4g
fSBjYXRjaCB7IFdyaXRlLUhvc3QgKCRMLmRsbFJlbW92ZUZhaWwgLWYgJF8pIC1G
b3JlZ3JvdW5kQ29sb3IgWWVsbG93IH0NCiAgICAgICAgfSBlbHNlIHsgV3JpdGUt
SG9zdCAoJEwuZGxsTm90RXhpc3QgLWYgJHNwcGMpIC1Gb3JlZ3JvdW5kQ29sb3Ig
R3JheSB9DQoNCiAgICAgICAgIyBEb3N5YXnEsSBnZcOnaWNpIGtvbnVtYSB0YcWf
xLFtYWsgaXN0ZXJzZW5peiwgYnVyYXlhIGVrbGV5aW4gKMO2cm46IE1vdmUtSXRl
bSkNCiAgICB9IGNhdGNoIHsNCiAgICAgICAgV3JpdGUtSG9zdCAoJEwuZGxsQ2xl
YW51cEVycm9yIC1mICRfKSAtRm9yZWdyb3VuZENvbG9yIFJlZA0KICAgIH0NCg0K
ICAgICMgNikgS2F5xLF0IGRlZnRlcmkgdGVtaXpsacSfaSDDtnJuZcSfaSAoZWts
ZWRpxJ9pbml6IGFuYWh0YXJsYXJhIGfDtnJlIGF5YXJsYSkNCiAgICB0cnkgew0K
ICAgICAgICAkUmVnUGF0aCA9ICJIS0NVOlxTb2Z0d2FyZVxNaWNyb3NvZnRcT2Zm
aWNlXDE2LjBcQ29tbW9uXExpY2Vuc2luZ1xSZXNpbGllbmN5Ig0KICAgICAgICBp
ZiAoVGVzdC1QYXRoICRSZWdQYXRoKSB7DQogICAgICAgICAgICBSZW1vdmUtSXRl
bVByb3BlcnR5IC1QYXRoICRSZWdQYXRoIC1OYW1lICJUaW1lT2ZMYXN0SGVhcnRi
ZWF0RmFpbHVyZSIgLUVycm9yQWN0aW9uIFNpbGVudGx5Q29udGludWUNCiAgICAg
ICAgICAgIFdyaXRlLUhvc3QgKCRMLnJlZ0NsZWFuZWQgLWYgJFJlZ1BhdGgpIC1G
b3JlZ3JvdW5kQ29sb3IgR3JlZW4NCiAgICAgICAgfSBlbHNlIHsNCiAgICAgICAg
ICAgIFdyaXRlLUhvc3QgKCRMLnJlZ0tleU5vdEZvdW5kIC1mICRSZWdQYXRoKSAt
Rm9yZWdyb3VuZENvbG9yIEdyYXkNCiAgICAgICAgfQ0KICAgIH0gY2F0Y2ggew0K
ICAgICAgICBXcml0ZS1Ib3N0ICgkTC5yZWdDbGVhbkVycm9yIC1mICRfKSAtRm9y
ZWdyb3VuZENvbG9yIFllbGxvdw0KICAgIH0NCg0KICAgIFdyaXRlLUhvc3QgJEwu
cmVtb3ZlQ29tcGxldGUgLUZvcmVncm91bmRDb2xvciBDeWFuDQp9DQoNCiMgRWty
YW7EsSB0ZW1pemxlDQpjbHMNCldyaXRlLUhvc3QNCg0KaWYgKCRyKSB7DQogICAg
V3JpdGUtSG9zdCAkTC50aXRsZVJlbW92ZSAtRm9yZWdyb3VuZENvbG9yIEN5YW4N
CiAgICBXcml0ZS1Ib3N0ICItLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tIg0KICAgIHRyeSB7DQogICAgICAgIFJlbW92ZQ0K
ICAgIH0gY2F0Y2ggew0KICAgICAgICBXcml0ZS1Ib3N0ICgkTC5yZW1vdmVFcnJv
ciAtZiAkXykNCiAgICB9DQp9IGVsc2Ugew0KICAgIFdyaXRlLUhvc3QgJEwudGl0
bGVJbnN0YWxsIC1Gb3JlZ3JvdW5kQ29sb3IgQ3lhbg0KICAgIFdyaXRlLUhvc3Qg
Ii0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0iDQogICAgSW5zdGFsbA0KfQ0KV3JpdGUtSG9zdCAiLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLSINCldyaXRlLUhvc3Qg
JEwuc2NyaXB0Q29tcGxldGUgLUZvcmVncm91bmRDb2xvciBDeWFuDQpTdGFydC1T
bGVlcCAy
-----END CERTIFICATE_OHOOK-----

::===============================================================================================================

:: Deßiütirilmemeli / Don't modify (aktivasyon kontrol/activation check)

-----BEGIN CERTIFICATE_check-----
IyAtLS0gRN1MIEFZQVJMQVJJIFZFIE1FVN1OTEVSIC0tLQ0KIyAtLS0gTEFOR1VB
R0UgU0VUVElOR1MgQU5EIFNUUklOR1MgLS0tDQoNCiMg3f5sZXRpbSBzaXN0ZW1p
IGFyYXn8eiBkaWxpbmkga29udHJvbCBldA0KIyBDaGVjayB0aGUgT1MgVUkgbGFu
Z3VhZ2UNCiR1aUN1bHR1cmUgPSAoR2V0LVVJQ3VsdHVyZSkuTmFtZQ0KJEdsb2Jh
bDpMQU5HID0gJG51bGwNCg0KIyBU/HJr52UgbWV0aW5sZXINCiMgVHVya2lzaCBz
dHJpbmdzDQokVFIgPSBAew0KICAgIE9ob29rU3RhdHVzICAgICAgICAgICAgICAg
ICA9ICJPZmZpY2Ugc/xy/G38bmRlIGthbP1j/SBPZmZpY2UgYWt0aXZhc3lvbnUg
aedpbiBPaG9vayB59m50ZW1pIGn+bGV0aW0gc2lzdGVtaW5lIHn8a2xlbm1p/i5g
bmBuIiArDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIk9mZmlj
ZSBha3RpdmFzeW9uIGJpbGdpc2luZGVraSAnTGlzYW5zIER1cnVtdSA6IEJpbGRp
cmltJyB2ZXlhICdZZXRraXNpeiBLdWxsYW79bSBT/HJlc2knIHV5YXL9c/0gdmFy
c2EgYnUgdXlhcv15/SBn9nJtZXpkZW4gZ2VsaW4uYG5gbiIgKw0KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICJPZmZpY2Ug/HL8bvxu/Hoga2Fs/WP9
IG9sYXJhayBldGtpbmxl/nRpcmlsbWn+LiINCiAgICBTdGF0dXMwICAgICAgICAg
ICAgICAgICAgICAgPSAiTGlzYW5zc/16Ig0KICAgIFN0YXR1czEgICAgICAgICAg
ICAgICAgICAgICA9ICJMaXNhbnNs/SINCiAgICBTdGF0dXMyICAgICAgICAgICAg
ICAgICAgICAgPSAiWWV0a2lzaXogS3VsbGFu/W0gU/xyZXNpIg0KICAgIFN0YXR1
czMgICAgICAgICAgICAgICAgICAgICA9ICJLTVMgTGlzYW5z/W79biBT/HJlc2kg
RG9sZHUgdmV5YSBEb25hbv1tIFRvbGVyYW5zIET9/v0iDQogICAgU3RhdHVzNCAg
ICAgICAgICAgICAgICAgICAgID0gIk9yaWppbmFsIE9sbWF5YW4gWWV0a2lzaXog
S3VsbGFu/W0gU/xyZXNpIg0KICAgIFN0YXR1czUgICAgICAgICAgICAgICAgICAg
ICA9ICJCaWxkaXJpbSINCiAgICBTdGF0dXM2ICAgICAgICAgICAgICAgICAgICAg
PSAiVXphdP1sbf3+IFlldGtpc2l6IEt1bGxhbv1tIFP8cmVzaSINCiAgICBTdGF0
dXNEZWZhdWx0ICAgICAgICAgICAgICAgPSAiQmlsaW5tZXllbiINCiAgICBVbmtu
b3duICAgICAgICAgICAgICAgICAgICAgPSAiQmlsaW5taXlvciINCiAgICBQb3B1
cE5vUHJvZHVjdHMgICAgICAgICAgICAgPSAiV2luZG93cyB2ZSBPZmZpY2Ug/HL8
bmxlcmkgYnVsdW5hbWFk/SB2ZXlhIGxpc2FucyBkdXJ1bXUgYmlsaW5taXlvci5g
bmBuIg0KICAgIFBvcHVwVGl0bGUgICAgICAgICAgICAgICAgICA9ICKgIKAgoCCg
IKAgoCCgIKAgoFdpbmRvd3MgJiBPZmZpY2UgTGlzYW5zIEJpbGdpbGVyaWBuIC0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLWBuYG4iDQogICAgVW5rbm93blByb2R1Y3Qg
ICAgICAgICAgICAgID0gIkJpbGlubWV5ZW4g3HL8biINCiAgICBQb3B1cExpY1N0
YXR1cyAgICAgICAgICAgICAgPSAiTGlzYW5zIER1cnVtdSINCiAgICBQb3B1cENo
YW5uZWwgICAgICAgICAgICAgICAgPSAi3HL8biBBbmFodGFy/SBLYW5hbP0iDQog
ICAgUG9wdXBQYXJ0aWFsS2V5ICAgICAgICAgICAgID0gIkv9c21pINxy/G4gQW5h
aHRhcv0iDQogICAgUG9wdXBLbXNEYXlzICAgICAgICAgICAgICAgID0gIkxpc2Fu
c2z9IEtNUyBH/G4gU2F5/XP9Ig0KICAgIFBvcHVwS21zTmFtZSAgICAgICAgICAg
ICAgICA9ICJLTVMgU3VudWN1IEFk/SINCiAgICBQb3B1cEttc0lwICAgICAgICAg
ICAgICAgICAgPSAiS01TIFN1bnVjdSBJUCBBZHJlc2kiDQogICAgUG9wdXBPaG9v
a1N0YXR1cyAgICAgICAgICAgID0gIk9IT09LIERVUlVNVSA6Ig0KICAgIFBvcHVw
TWVzc2FnZUJveFRpdGxlICAgICAgICA9ICJQTUFTIFtQb3dlcnNoZWxsIE11bHRp
IEFjdGl2YXRpb24gU3lzdGVtXSBieSBtZXBoaXN0b29vMiINCn0NCg0KIyDdbmdp
bGl6Y2UgbWV0aW5sZXINCiMgRW5nbGlzaCBzdHJpbmdzDQokRU4gPSBAew0KICAg
IE9ob29rU3RhdHVzICAgICAgICAgICAgICAgICA9ICJUaGUgT2hvb2sgbWV0aG9k
IGZvciBwZXJtYW5lbnQgT2ZmaWNlIGFjdGl2YXRpb24gaXMgaW5zdGFsbGVkIG9u
IHRoZSBvcGVyYXRpbmcgc3lzdGVtIGZvciB0aGlzIE9mZmljZSB2ZXJzaW9uLmBu
YG4iICsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiSWYgdGhl
cmUgaXMgYSAnTGljZW5zZSBTdGF0dXM6IE5vdGlmaWNhdGlvbicgb3IgJ0dyYWNl
IFBlcmlvZCcgd2FybmluZyBpbiB0aGUgT2ZmaWNlIGFjdGl2YXRpb24gaW5mbywg
cGxlYXNlIGlnbm9yZSB0aGlzIHdhcm5pbmcuYG5gbiIgKw0KICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICJZb3VyIE9mZmljZSBwcm9kdWN0IGlzIHBl
cm1hbmVudGx5IGFjdGl2YXRlZC4iDQogICAgU3RhdHVzMCAgICAgICAgICAgICAg
ICAgICAgID0gIlVubGljZW5zZWQiDQogICAgU3RhdHVzMSAgICAgICAgICAgICAg
ICAgICAgID0gIkxpY2Vuc2VkIg0KICAgIFN0YXR1czIgICAgICAgICAgICAgICAg
ICAgICA9ICJHcmFjZSBQZXJpb2QiDQogICAgU3RhdHVzMyAgICAgICAgICAgICAg
ICAgICAgID0gIktNUyBMaWNlbnNlIEV4cGlyZWQgb3IgSGFyZHdhcmUgT3V0IG9m
IFRvbGVyYW5jZSINCiAgICBTdGF0dXM0ICAgICAgICAgICAgICAgICAgICAgPSAi
Tm9uLUdlbnVpbmUgR3JhY2UgUGVyaW9kIg0KICAgIFN0YXR1czUgICAgICAgICAg
ICAgICAgICAgICA9ICJOb3RpZmljYXRpb24iDQogICAgU3RhdHVzNiAgICAgICAg
ICAgICAgICAgICAgID0gIkV4dGVuZGVkIEdyYWNlIFBlcmlvZCINCiAgICBTdGF0
dXNEZWZhdWx0ICAgICAgICAgICAgICAgPSAiVW5rbm93biINCiAgICBVbmtub3du
ICAgICAgICAgICAgICAgICAgICAgPSAiVW5rbm93biINCiAgICBQb3B1cE5vUHJv
ZHVjdHMgICAgICAgICAgICAgPSAiTm8gV2luZG93cyBvciBPZmZpY2UgcHJvZHVj
dHMgZm91bmQsIG9yIGxpY2Vuc2Ugc3RhdHVzIGlzIHVua25vd24uYG5gbiINCiAg
ICBQb3B1cFRpdGxlICAgICAgICAgICAgICAgICAgPSAioCCgIKAgoCCgIKAgoCCg
IKBXaW5kb3dzICYgT2ZmaWNlIExpY2Vuc2UgSW5mb3JtYXRpb25gbiAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS1gbmBuIg0KICAgIFVua25vd25Qcm9kdWN0ICAgICAg
ICAgICAgICA9ICJVbmtub3duIFByb2R1Y3QiDQogICAgUG9wdXBMaWNTdGF0dXMg
ICAgICAgICAgICAgID0gIkxpY2Vuc2UgU3RhdHVzIg0KICAgIFBvcHVwQ2hhbm5l
bCAgICAgICAgICAgICAgICA9ICJQcm9kdWN0IEtleSBDaGFubmVsIg0KICAgIFBv
cHVwUGFydGlhbEtleSAgICAgICAgICAgICA9ICJQYXJ0aWFsIFByb2R1Y3QgS2V5
Ig0KICAgIFBvcHVwS21zRGF5cyAgICAgICAgICAgICAgICA9ICJMaWNlbnNlZCBL
TVMgRGF5cyBMZWZ0Ig0KICAgIFBvcHVwS21zTmFtZSAgICAgICAgICAgICAgICA9
ICJLTVMgU2VydmVyIE5hbWUiDQogICAgUG9wdXBLbXNJcCAgICAgICAgICAgICAg
ICAgID0gIktNUyBTZXJ2ZXIgSVAgQWRkcmVzcyINCiAgICBQb3B1cE9ob29rU3Rh
dHVzICAgICAgICAgICAgPSAiT0hPT0sgU1RBVFVTIDoiDQogICAgUG9wdXBNZXNz
YWdlQm94VGl0bGUgICAgICAgID0gIlBNQVMgW1Bvd2Vyc2hlbGwgTXVsdGkgQWN0
aXZhdGlvbiBTeXN0ZW1dIGJ5IG1lcGhpc3Rvb28yIg0KfQ0KDQojIERpbCBzZedp
bWkNCiMgTGFuZ3VhZ2Ugc2VsZWN0aW9uDQppZiAoJHVpQ3VsdHVyZSAtZXEgJ3Ry
LVRSJykgew0KICAgICRHbG9iYWw6TEFORyA9ICRUUg0KfSBlbHNlIHsNCiAgICAk
R2xvYmFsOkxBTkcgPSAkRU4NCn0NCiMgLS0tIETdTCBBWUFSTEFSSSBWRSBNRVTd
TkxFUiBTT05VIC0tLQ0KIyAtLS0gRU5EIE9GIExBTkdVQUdFIFNFVFRJTkdTIEFO
RCBTVFJJTkdTIC0tLQ0KDQoNCmZ1bmN0aW9uIEdldC1PaG9va1N0YXR1cyB7DQqg
IKAgJG9mZmljZUJhc2VQYXRoID0gIkM6XFByb2dyYW0gRmlsZXNcTWljcm9zb2Z0
IE9mZmljZVxyb290XHZmc1wiDQqgIKAgJGZzID0gTmV3LU9iamVjdCAtQ29tT2Jq
ZWN0IFNjcmlwdGluZy5GaWxlU3lzdGVtT2JqZWN0DQoNCqAgoCBpZiAoJGZzLkZv
bGRlckV4aXN0cygkb2ZmaWNlQmFzZVBhdGggKyAiU3lzdGVtIikpIHsNCqAgoCCg
IKAgJG9mZmljZVBhdGggPSAkb2ZmaWNlQmFzZVBhdGggKyAiU3lzdGVtXCINCqAg
oCB9DQqgIKAgZWxzZWlmICgkZnMuRm9sZGVyRXhpc3RzKCRvZmZpY2VCYXNlUGF0
aCArICJTeXN0ZW1YODYiKSkgew0KoCCgIKAgoCAkb2ZmaWNlUGF0aCA9ICRvZmZp
Y2VCYXNlUGF0aCArICJTeXN0ZW1YODZcIg0KoCCgIH0NCqAgoCBlbHNlIHsNCqAg
oCCgIKAgcmV0dXJuICIiDQqgIKAgfQ0KDQqgIKAgJHNwcGNGaWxlID0gJG9mZmlj
ZVBhdGggKyAic3BwYy5kbGwiDQqgIKAgJHNwcGNzRmlsZSA9ICRvZmZpY2VQYXRo
ICsgInNwcGNzLmRsbCINCg0KoCCgIGlmICgoJGZzLkZpbGVFeGlzdHMoJHNwcGNG
aWxlKSkgLWFuZCAoJGZzLkZpbGVFeGlzdHMoJHNwcGNzRmlsZSkpKSB7DQqgIKAg
oCCgICMgREXQ3d5U3VLdTETdIC8gTU9ESUZJRUQNCiAgICAgICAgcmV0dXJuICRM
QU5HLk9ob29rU3RhdHVzDQqgIKAgfQ0KoCCgIGVsc2Ugew0KoCCgIKAgoCByZXR1
cm4gIiINCqAgoCB9DQp9DQoNCmZ1bmN0aW9uIEdldC1MaWNlbnNlU3RhdHVzVGV4
dCB7DQqgIKAgcGFyYW0gKCRjb2RlKQ0KoCCgICMgREXQ3d5U3VLdTETdIC8gTU9E
SUZJRUQNCiAgICBzd2l0Y2ggKCRjb2RlKSB7DQqgIKAgoCCgIDAgeyByZXR1cm4g
JExBTkcuU3RhdHVzMCB9DQqgIKAgoCCgIDEgeyByZXR1cm4gJExBTkcuU3RhdHVz
MSB9DQqgIKAgoCCgIDIgeyByZXR1cm4gJExBTkcuU3RhdHVzMiB9DQqgIKAgoCCg
IDMgeyByZXR1cm4gJExBTkcuU3RhdHVzMyB9DQqgIKAgoCCgIDQgeyByZXR1cm4g
JExBTkcuU3RhdHVzNCB9DQqgIKAgoCCgIDUgeyByZXR1cm4gJExBTkcuU3RhdHVz
NSB9DQqgIKAgoCCgIDYgeyByZXR1cm4gJExBTkcuU3RhdHVzNiB9DQqgIKAgoCCg
IGRlZmF1bHQgeyByZXR1cm4gJExBTkcuU3RhdHVzRGVmYXVsdCB9DQqgIKAgfQ0K
fQ0KDQpmdW5jdGlvbiBHZXQtU2xtZ3JEbHZJbmZvIHsNCqAgoCBwYXJhbSgkcHJv
ZHVjdElEKQ0KDQqgIKAgJG91dHB1dCA9ICYgY3NjcmlwdC5leGUgL25vbG9nbyAi
JGVudjpTeXN0ZW1Sb290XFN5c3RlbTMyXHNsbWdyLnZicyIgL2RsdiAkcHJvZHVj
dElEIDI+JjENCqAgoCAkbGluZXMgPSAkb3V0cHV0IC1zcGxpdCAiYHI/YG4iDQoN
CqAgoCAjICLccvxuIEFuYWh0YXL9IEthbmFs/SIgdmV5YSAiUHJvZHVjdCBLZXkg
Q2hhbm5lbCIgc2F0/XJsYXL9bv0gYXL9eW9ydXogKEJ1IHNhdP1yIHphdGVuIGlr
aSBkaWxpIGRlIGRlc3Rla2xpeW9yZHUpDQqgIKAgZm9yZWFjaCAoJGxpbmUgaW4g
JGxpbmVzKSB7DQqgIKAgoCCgIGlmICgkbGluZSAtbWF0Y2ggJ9xy/G4gQW5haHRh
cv0gS2FuYWz9JyAtb3IgJGxpbmUgLW1hdGNoICdQcm9kdWN0IEtleSBDaGFubmVs
Jykgew0KoCCgIKAgoCCgIKAgIyBTYXT9cmRhbiA6IHNvbnJhc/0gZGXwZXJpIGFs
DQqgIKAgoCCgIKAgoCAkcGFydHMgPSAkbGluZSAtc3BsaXQgJzonLCAyDQqgIKAg
oCCgIKAgoCBpZiAoJHBhcnRzLkNvdW50IC1nZSAyKSB7DQqgIKAgoCCgIKAgoCCg
IKAgJGNoYW5uZWxUZXh0ID0gJHBhcnRzWzFdLlRyaW0oKQ0KDQqgIKAgoCCgIKAg
oCCgIKAgIyBPRU0gZG0gdmV5YSBPRU06Tk9OU0xQIGdpYmkgaWZhZGVsZXJpIGT8
emf8biB5YXoNCqAgoCCgIKAgoCCgIKAgoCBpZiAoJGNoYW5uZWxUZXh0IC1tYXRj
aCAnXmRtJCcpIHsNCqAgoCCgIKAgoCCgIKAgoCCgIKAgcmV0dXJuICJPRU0tRE0i
DQqgIKAgoCCgIKAgoCCgIKAgfQ0KoCCgIKAgoCCgIKAgoCCgIGVsc2VpZiAoJGNo
YW5uZWxUZXh0IC1tYXRjaCAnXihPRU0pWzpcLV0/KC4qKSQnKSB7DQqgIKAgoCCg
IKAgoCCgIKAgoCCgIHJldHVybiAiT0VNOiQoJG1hdGNoZXNbMl0uVHJpbSgpKSIN
CqAgoCCgIKAgoCCgIKAgoCB9DQqgIKAgoCCgIKAgoCCgIKAgZWxzZWlmICgkY2hh
bm5lbFRleHQgLW5lICcnKSB7DQqgIKAgoCCgIKAgoCCgIKAgoCCgIHJldHVybiAk
Y2hhbm5lbFRleHQNCqAgoCCgIKAgoCCgIKAgoCB9DQqgIKAgoCCgIKAgoCCgIKAg
ZWxzZSB7DQqgIKAgoCCgIKAgoCCgIKAgoCCgICMgREXQ3d5U3VLdTETdIC8gTU9E
SUZJRUQNCiAgICAgICAgICAgICAgICAgICAgcmV0dXJuICRMQU5HLlVua25vd24N
CqAgoCCgIKAgoCCgIKAgoCB9DQqgIKAgoCCgIKAgoCB9DQqgIKAgoCCgIH0NCqAg
oCB9DQqgIKAgIyBERdDd3lTdUt1MRN0gLyBNT0RJRklFRA0KICAgIHJldHVybiAk
TEFORy5Vbmtub3duDQp9DQoNCmZ1bmN0aW9uIEdldC1LTVNJbmZvRnJvbVNsbWdy
IHsNCqAgoCBwYXJhbSgkcHJvZHVjdElEKQ0KDQqgIKAgJG91dHB1dCA9ICYgY3Nj
cmlwdC5leGUgL25vbG9nbyAiJGVudjpTeXN0ZW1Sb290XFN5c3RlbTMyXHNsbWdy
LnZicyIgL2RsdiAkcHJvZHVjdElEIDI+JjENCg0KICAgICMgREXQ3d5U3VLdTETd
OiDdbmdpbGl6Y2UgJ1Byb2R1Y3QgS2V5IENoYW5uZWwnIGVrbGVuZGkNCiAgICAj
IE1PRElGSUVEOiBBZGRlZCBFbmdsaXNoICdQcm9kdWN0IEtleSBDaGFubmVsJw0K
oCCgICRjaGFubmVsTGluZSA9ICRvdXRwdXQgfCBXaGVyZS1PYmplY3QgeyAkXyAt
bWF0Y2ggJ9xy/G4gQW5haHRhcv0gS2FuYWz9JyAtb3IgJF8gLW1hdGNoICdQcm9k
dWN0IEtleSBDaGFubmVsJyB9DQqgIKAgJGNoYW5uZWxUZXh0ID0gaWYgKCRjaGFu
bmVsTGluZSkgeyAkY2hhbm5lbExpbmUgLXJlcGxhY2UgJy4qOlxzKicsJycgfSBl
bHNlIHsgJycgfQ0KDQqgIKAgaWYgKCRjaGFubmVsVGV4dCAtbWF0Y2ggJyhLTVN8
R1ZMS3xWb2x1bWUpJykgew0KoCCgIKAgoCAjIERF0N3eVN1S3UxE3Tog3W5naWxp
emNlICdLTVMgbWFjaGluZSBuYW1lOicgdmUgJ0tNUyBtYWNoaW5lIElQIGFkZHJl
c3M6JyBla2xlbmRpDQogICAgICAgICMgTU9ESUZJRUQ6IEFkZGVkIEVuZ2xpc2gg
J0tNUyBtYWNoaW5lIG5hbWU6JyBhbmQgJ0tNUyBtYWNoaW5lIElQIGFkZHJlc3M6
Jw0KICAgICAgICAka21zTmFtZUxpbmUgPSAkb3V0cHV0IHwgV2hlcmUtT2JqZWN0
IHsgJF8gLW1hdGNoICdLTVMgbWFraW5lc2kgYWT9OicgLW9yICRfIC1tYXRjaCAn
S01TIG1hY2hpbmUgbmFtZTonIH0NCqAgoCCgIKAgJGttc0lwTGluZSA9ICRvdXRw
dXQgfCBXaGVyZS1PYmplY3QgeyAkXyAtbWF0Y2ggJ0tNUyBtYWtpbmVzaSBJUCBh
ZHJlc2k6JyAtb3IgJF8gLW1hdGNoICdLTVMgbWFjaGluZSBJUCBhZGRyZXNzOicg
fQ0KDQqgIKAgoCCgICRrbXNOYW1lID0gaWYgKCRrbXNOYW1lTGluZSkgeyAka21z
TmFtZUxpbmUgLXJlcGxhY2UgJy4qOlxzKicsJycgfSBlbHNlIHsgJycgfQ0KoCCg
IKAgoCAka21zSXAgPSBpZiAoJGttc0lwTGluZSkgeyAka21zSXBMaW5lIC1yZXBs
YWNlICcuKjpccyonLCcnIH0gZWxzZSB7ICcnIH0NCg0KoCCgIKAgoCBpZiAoW3N0
cmluZ106OklzTnVsbE9yV2hpdGVTcGFjZSgka21zTmFtZSkgLW9yICRrbXNOYW1l
LlRyaW0oKSAtZXEgJzE2ODgnKSB7DQqgIKAgoCCgIKAgoCB0cnkgew0KoCCgIKAg
oCCgIKAgoCCgICRyZWdQYXRoID0gIkhLTE06XFNPRlRXQVJFXE1pY3Jvc29mdFxX
aW5kb3dzIE5UXEN1cnJlbnRWZXJzaW9uXFNvZnR3YXJlUHJvdGVjdGlvblBsYXRm
b3JtIg0KoCCgIKAgoCCgIKAgoCCgICRyZWdLbXNOYW1lID0gKEdldC1JdGVtUHJv
cGVydHkgLVBhdGggJHJlZ1BhdGggLU5hbWUgS2V5TWFuYWdlbWVudFNlcnZpY2VO
YW1lIC1FcnJvckFjdGlvbiBTaWxlbnRseUNvbnRpbnVlKS5LZXlNYW5hZ2VtZW50
U2VydmljZU5hbWUNCqAgoCCgIKAgoCCgIKAgoCBpZiAoJHJlZ0ttc05hbWUgLWFu
ZCAkcmVnS21zTmFtZSAtbmUgJzE2ODgnKSB7DQqgIKAgoCCgIKAgoCCgIKAgoCCg
ICRrbXNOYW1lID0gJHJlZ0ttc05hbWUNCqAgoCCgIKAgoCCgIKAgoCB9DQqgIKAg
oCCgIKAgoCB9IGNhdGNoIHsNCqAgoCCgIKAgoCCgIH0NCqAgoCCgIKAgfQ0KDQqg
IKAgoCCgIHJldHVybiBAew0KoCCgIKAgoCCgIKAgQ2hhbm5lbCA9ICRjaGFubmVs
VGV4dC5UcmltKCkNCqAgoCCgIKAgoCCgIEtNU05hbWUgPSAka21zTmFtZS5Ucmlt
KCkNCqAgoCCgIKAgoCCgIEtNU0lwID0gJGttc0lwLlRyaW0oKQ0KoCCgIKAgoCB9
DQqgIKAgfQ0KoCCgIGVsc2Ugew0KoCCgIKAgoCByZXR1cm4gQHsNCqAgoCCgIKAg
oCCgIENoYW5uZWwgPSAkY2hhbm5lbFRleHQuVHJpbSgpDQqgIKAgoCCgIKAgoCBL
TVNOYW1lID0gJycNCqAgoCCgIKAgoCCgIEtNU0lwID0gJycNCqAgoCCgIKAgfQ0K
oCCgIH0NCn0NCg0KZnVuY3Rpb24gR2V0LVByb2R1Y3RzIHsNCqAgoCB0cnkgew0K
oCCgIKAgoCAkcXVlcnkgPSAiU0VMRUNUICogRlJPTSBTb2Z0d2FyZUxpY2Vuc2lu
Z1Byb2R1Y3QgV0hFUkUgUGFydGlhbFByb2R1Y3RLZXkgSVMgTk9UIE5VTEwiDQqg
IKAgoCCgICRhbGxQcm9kdWN0cyA9IEdldC1DaW1JbnN0YW5jZSAtUXVlcnkgJHF1
ZXJ5IHwgV2hlcmUtT2JqZWN0IHsgJF8uTGljZW5zZVN0YXR1cyAtbmUgMCB9DQqg
IKAgoCCgIHJldHVybiAkYWxsUHJvZHVjdHMNCqAgoCB9IGNhdGNoIHsNCqAgoCCg
IKAgcmV0dXJuIEAoKQ0KoCCgIH0NCn0NCg0KZnVuY3Rpb24gU2hvdy1MaWNlbnNl
U3RhdHVzUG9wdXAgew0KoCCgIEFkZC1UeXBlIC1Bc3NlbWJseU5hbWUgUHJlc2Vu
dGF0aW9uRnJhbWV3b3JrDQoNCqAgoCAkcHJvZHVjdHMgPSBHZXQtUHJvZHVjdHMN
CqAgoCAkb2hvb2tNZXNzYWdlID0gR2V0LU9ob29rU3RhdHVzDQoNCqAgoCAkb3V0
cHV0ID0gIiINCg0KoCCgIGlmICgkcHJvZHVjdHMuQ291bnQgLWVxIDApIHsNCqAg
oCCgIKAgIyBERdDd3lTdUt1MRN0gLyBNT0RJRklFRA0KICAgICAgICAkb3V0cHV0
ICs9ICRMQU5HLlBvcHVwTm9Qcm9kdWN0cw0KoCCgIH0gZWxzZSB7DQqgIKAgoCCg
ICMgREXQ3d5U3VLdTETdIC8gTU9ESUZJRUQNCiAgICAgICAgJG91dHB1dCArPSAk
TEFORy5Qb3B1cFRpdGxlDQoNCqAgoCCgIKAgJG9zID0gR2V0LUNpbUluc3RhbmNl
IC1DbGFzc05hbWUgV2luMzJfT3BlcmF0aW5nU3lzdGVtDQqgIKAgoCCgICRvc0Nh
cHRpb24gPSAkb3MuQ2FwdGlvbg0KoCCgIKAgoCAkb3NOYW1lV3JpdHRlbiA9ICRm
YWxzZQ0KDQqgIKAgoCCgIGZvcmVhY2ggKCRwIGluICRwcm9kdWN0cykgew0KoCCg
IKAgoCCgIKAgIyBERdDd3lTdUt1MRN0gLyBNT0RJRklFRA0KICAgICAgICAgICAg
JHR5cGUgPSBpZiAoJHAuTmFtZSAtbWF0Y2ggJ09mZmljZScpIHsgJycgfSBlbHNl
aWYgKCRwLk5hbWUgLW1hdGNoICdeV2luZG93cycpIHsgJycgfSBlbHNlIHsgJExB
TkcuVW5rbm93blByb2R1Y3QgfQ0KoCCgIKAgoCCgIKAgJHN0YXR1c1RleHQgPSBH
ZXQtTGljZW5zZVN0YXR1c1RleHQgJHAuTGljZW5zZVN0YXR1cw0KDQqgIKAgoCCg
IKAgoCBpZiAoJHAuTmFtZSAtbWF0Y2ggJ15XaW5kb3dzJyAtYW5kIC1ub3QgJG9z
TmFtZVdyaXR0ZW4pIHsNCqAgoCCgIKAgoCCgIKAgoCAkb3V0cHV0ICs9ICIkb3ND
YXB0aW9uYG4iDQqgIKAgoCCgIKAgoCCgIKAgJG9zTmFtZVdyaXR0ZW4gPSAkdHJ1
ZQ0KoCCgIKAgoCCgIKAgfQ0KDQqgIKAgoCCgIKAgoCAjIEthbmFsIGJpbGdpc2lu
aSBHZXQtU2xtZ3JEbHZJbmZvIGZvbmtzaXlvbnVuZGFuIGFsIChPRU06Tk9OU0xQ
IGnnaW4gZG/wcnUg5/1rdP0pDQqgIKAgoCCgIKAgoCAkY2hhbm5lbCA9IEdldC1T
bG1nckRsdkluZm8gLXByb2R1Y3RJRCAkcC5JRA0KDQqgIKAgoCCgIKAgoCBpZiAo
JHAuTmFtZSAtbWF0Y2ggJ09mZmljZScpIHsNCqAgoCCgIKAgoCCgIKAgoCAkb3V0
cHV0ICs9ICIkKCRwLk5hbWUpYG4iDQqgIKAgoCCgIKAgoCB9DQoNCqAgoCCgIKAg
oCCgICRvdXRwdXQgKz0gImBuIg0KoCCgIKAgoCCgIKAgIyBERdDd3lTdUt1MRN0g
LyBNT0RJRklFRA0KICAgICAgICAgICAgJG91dHB1dCArPSAiJCgkTEFORy5Qb3B1
cExpY1N0YXR1cykJCTogJHN0YXR1c1RleHRgbiINCqAgoCCgIKAgoCCgICRvdXRw
dXQgKz0gImBuIg0KoCCgIKAgoCCgIKAgIyBERdDd3lTdUt1MRN0gLyBNT0RJRklF
RA0KICAgICAgICAgICAgJG91dHB1dCArPSAiJCgkTEFORy5Qb3B1cENoYW5uZWwp
oCCgIKAgoAk6ICRjaGFubmVsYG4iDQqgIKAgoCCgIKAgoCAjIERF0N3eVN1S3UxE
3SAvIE1PRElGSUVEDQogICAgICAgICAgICAkb3V0cHV0ICs9ICIkKCRMQU5HLlBv
cHVwUGFydGlhbEtleSmgIKAgoCCgCTogJCgkcC5QYXJ0aWFsUHJvZHVjdEtleSlg
biINCg0KoCCgIKAgoCCgIKAgIyBLTVMgYmlsZ2lsZXJpbmkgc2FkZWNlIEtNUyBs
aXNhbnP9IHZhcnNhIGf2c3Rlcg0KoCCgIKAgoCCgIKAgJGttc0luZm8gPSBHZXQt
S01TSW5mb0Zyb21TbG1nciAtcHJvZHVjdElEICRwLklEDQqgIKAgoCCgIKAgoCBp
ZiAoJHAuR3JhY2VQZXJpb2RSZW1haW5pbmcgLWd0IDApIHsNCqAgoCCgIKAgoCCg
IKAgoCAkZGF5c0xlZnQgPSBbbWF0aF06OkZsb29yKCRwLkdyYWNlUGVyaW9kUmVt
YWluaW5nIC8gKDI0KjYwKSkNCqAgoCCgIKAgoCCgIKAgoCAjIERF0N3eVN1S3UxE
3SAvIE1PRElGSUVEDQogICAgICAgICAgICAgICAgJG91dHB1dCArPSAiJCgkTEFO
Ry5Qb3B1cEttc0RheXMpCTogJGRheXNMZWZ0YG4iDQoNCqAgoCCgIKAgoCCgIKAg
oCAka21zTmFtZVRyaW1tZWQgPSAka21zSW5mby5LTVNOYW1lLlRyaW0oKQ0KoCCg
IKAgoCCgIKAgoCCgIGlmICgtbm90IFtzdHJpbmddOjpJc051bGxPcldoaXRlU3Bh
Y2UoJGttc05hbWVUcmltbWVkKSAtYW5kICRrbXNOYW1lVHJpbW1lZCAtbmUgJzE2
ODgnKSB7DQqgIKAgoCCgIKAgoCCgIKAgoCCgIGlmICgka21zTmFtZVRyaW1tZWQg
LW1hdGNoICdeKC4qKTpcZCskJykgew0KoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAg
JGttc0hvc3QgPSAkbWF0Y2hlc1sxXS5UcmltKCkNCqAgoCCgIKAgoCCgIKAgoCCg
IKAgoCCgIGlmICgka21zSG9zdCAtZXEgJycpIHsNCqAgoCCgIKAgoCCgIKAgoCCg
IKAgoCCgIKAgoCAjIERF0N3eVN1S3UxE3SAvIE1PRElGSUVEDQogICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICRvdXRwdXQgKz0gIiQoJExBTkcuUG9wdXBL
bXNOYW1lKQkJOiAkKCRMQU5HLlVua25vd24pYG4iDQqgIKAgoCCgIKAgoCCgIKAg
oCCgIKAgoCB9IGVsc2Ugew0KoCCgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCCgICMg
REXQ3d5U3VLdTETdIC8gTU9ESUZJRUQNCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgJG91dHB1dCArPSAiJCgkTEFORy5Qb3B1cEttc05hbWUpCQk6ICRr
bXNIb3N0YG4iDQqgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCB9DQqgIKAgoCCgIKAg
oCCgIKAgoCCgIH0gZWxzZSB7DQqgIKAgoCCgIKAgoCCgIKAgoCCgIKAgoCAjIERF
0N3eVN1S3UxE3SAvIE1PRElGSUVEDQogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgJG91dHB1dCArPSAiJCgkTEFORy5Qb3B1cEttc05hbWUpCQk6ICRrbXNOYW1l
VHJpbW1lZGBuIg0KoCCgIKAgoCCgIKAgoCCgIKAgoCB9DQqgIKAgoCCgIKAgoCCg
IKAgfQ0KDQqgIKAgoCCgIKAgoCCgIKAgaWYgKCRrbXNJbmZvLktNU0lwIC1uZSAn
Jykgew0KoCCgIKAgoCCgIKAgoCCgIKAgoCAjIERF0N3eVN1S3UxE3SAvIE1PRElG
SUVEDQogICAgICAgICAgICAgICAgICAgICRvdXRwdXQgKz0gIiQoJExBTkcuUG9w
dXBLbXNJcCkJOiAkKCRrbXNJbmZvLktNU0lwKWBuIg0KoCCgIKAgoCCgIKAgoCCg
IH0NCqAgoCCgIKAgoCCgIH0NCg0KoCCgIKAgoCCgIKAgJG91dHB1dCArPSAiLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tYG4iDQqgIKAgoCCgIKAgoCAkb3V0cHV0ICs9
ICJgbiINCqAgoCCgIKAgfQ0KoCCgIH0NCg0KaWYgKCRvaG9va01lc3NhZ2UgLW5l
ICIiKSB7DQqgIKAgJG9mZmljZUxpY2Vuc2VFeGlzdHMgPSAkZmFsc2UNCqAgoCBm
b3JlYWNoICgkcCBpbiAkcHJvZHVjdHMpIHsNCqAgoCCgIKAgaWYgKCRwLk5hbWUg
LW1hdGNoICdPZmZpY2UnKSB7DQqgIKAgoCCgIKAgoCAkb2ZmaWNlTGljZW5zZUV4
aXN0cyA9ICR0cnVlDQqgIKAgoCCgIKAgoCBicmVhaw0KoCCgIKAgoCB9DQqgIKAg
fQ0KoCCgIGlmICgkb2ZmaWNlTGljZW5zZUV4aXN0cykgew0KoCCgIKAgoCAjIERF
0N3eVN1S3UxE3SAvIE1PRElGSUVEDQogICAgICAgICRvdXRwdXQgKz0gIiQoJExB
TkcuUG9wdXBPaG9va1N0YXR1cylgbiINCqAgoCCgIKAgJG91dHB1dCArPSAkb2hv
b2tNZXNzYWdlDQqgIKAgfQ0KfQ0KDQqgIKAgQWRkLVR5cGUgLUFzc2VtYmx5TmFt
ZSBTeXN0ZW0uV2luZG93cy5Gb3Jtcw0KoCCgICMgREXQ3d5U3VLdTETdIC8gTU9E
SUZJRUQNCiAgICBbU3lzdGVtLldpbmRvd3MuRm9ybXMuTWVzc2FnZUJveF06OlNo
b3coJG91dHB1dCwgJExBTkcuUG9wdXBNZXNzYWdlQm94VGl0bGUsIFtTeXN0ZW0u
V2luZG93cy5Gb3Jtcy5NZXNzYWdlQm94QnV0dG9uc106Ok9LLCBbU3lzdGVtLldp
bmRvd3MuRm9ybXMuTWVzc2FnZUJveEljb25dOjpJbmZvcm1hdGlvbiwgW1N5c3Rl
bS5XaW5kb3dzLkZvcm1zLk1lc3NhZ2VCb3hEZWZhdWx0QnV0dG9uXTo6QnV0dG9u
MSwgW1N5c3RlbS5XaW5kb3dzLkZvcm1zLk1lc3NhZ2VCb3hPcHRpb25zXTo6U2Vy
dmljZU5vdGlmaWNhdGlvbikNCn0NCg0KU2hvdy1MaWNlbnNlU3RhdHVzUG9wdXA=
-----END CERTIFICATE_check-----

::===============================================================================================================

:: Deßiütirilmemeli / Don't modify (disableX)

-----BEGIN CERTIFICATE_disableX-----
JGNvZGUgPSBAJw0KdXNpbmcgU3lzdGVtOw0KdXNpbmcgU3lzdGVtLlJ1bnRpbWUu
SW50ZXJvcFNlcnZpY2VzOw0KDQpuYW1lc3BhY2UgQ2xvc2VCdXR0b25Ub2dnbGUg
ew0KDQogaW50ZXJuYWwgc3RhdGljIGNsYXNzIFdpbkFQSSB7DQogICBbRGxsSW1w
b3J0KCJrZXJuZWwzMi5kbGwiKV0NCiAgIGludGVybmFsIHN0YXRpYyBleHRlcm4g
SW50UHRyIEdldENvbnNvbGVXaW5kb3coKTsNCg0KICAgW0RsbEltcG9ydCgidXNl
cjMyLmRsbCIpXQ0KICAgW3JldHVybjogTWFyc2hhbEFzKFVubWFuYWdlZFR5cGUu
Qm9vbCldDQogICBpbnRlcm5hbCBzdGF0aWMgZXh0ZXJuIGJvb2wgRGVsZXRlTWVu
dShJbnRQdHIgaE1lbnUsDQogICAgICAgICAgICAgICAgICAgICAgICAgIHVpbnQg
dVBvc2l0aW9uLCB1aW50IHVGbGFncyk7DQoNCiAgIFtEbGxJbXBvcnQoInVzZXIz
Mi5kbGwiKV0NCiAgIFtyZXR1cm46IE1hcnNoYWxBcyhVbm1hbmFnZWRUeXBlLkJv
b2wpXQ0KICAgaW50ZXJuYWwgc3RhdGljIGV4dGVybiBib29sIERyYXdNZW51QmFy
KEludFB0ciBoV25kKTsNCg0KICAgW0RsbEltcG9ydCgidXNlcjMyLmRsbCIpXQ0K
ICAgaW50ZXJuYWwgc3RhdGljIGV4dGVybiBJbnRQdHIgR2V0U3lzdGVtTWVudShJ
bnRQdHIgaFduZCwNCiAgICAgICAgICAgICAgW01hcnNoYWxBcyhVbm1hbmFnZWRU
eXBlLkJvb2wpXWJvb2wgYlJldmVydCk7DQoNCiAgIGNvbnN0IHVpbnQgU0NfQ0xP
U0UgICAgID0gMHhmMDYwOw0KICAgY29uc3QgdWludCBNRl9CWUNPTU1BTkQgPSAw
Ow0KDQogICBpbnRlcm5hbCBzdGF0aWMgdm9pZCBDaGFuZ2VDdXJyZW50U3RhdGUo
Ym9vbCBzdGF0ZSkgew0KICAgICBJbnRQdHIgaE1lbnUgPSBHZXRTeXN0ZW1NZW51
KEdldENvbnNvbGVXaW5kb3coKSwgc3RhdGUpOw0KICAgICBEZWxldGVNZW51KGhN
ZW51LCBTQ19DTE9TRSwgTUZfQllDT01NQU5EKTsNCiAgICAgRHJhd01lbnVCYXIo
R2V0Q29uc29sZVdpbmRvdygpKTsNCiAgIH0NCiB9DQoNCiBwdWJsaWMgc3RhdGlj
IGNsYXNzIFN0YXR1cyB7DQogICBwdWJsaWMgc3RhdGljIHZvaWQgRGlzYWJsZSgp
IHsNCiAgICAgV2luQVBJLkNoYW5nZUN1cnJlbnRTdGF0ZShmYWxzZSk7IC8vaXRz
ICd0cnVlJyBpZiBuZWVkIHRvIGVuYWJsZQ0KICAgfQ0KIH0NCn0NCidADQoNCkFk
ZC1UeXBlICRjb2RlDQpbQ2xvc2VCdXR0b25Ub2dnbGUuU3RhdHVzXTo6RGlzYWJs
ZSgp
-----END CERTIFICATE_disableX-----

::===============================================================================================================

:: Deßiütirilmemeli /Don't modify (center)

-----BEGIN CERTIFICATE_center-----
cGFyYW0oDQogICAgW3N0cmluZ10kVGl0bGVDb250YWlucyA9ICJQTUFTIg0KKQ0K
DQpBZGQtVHlwZSBAIg0KdXNpbmcgU3lzdGVtOw0KdXNpbmcgU3lzdGVtLlJ1bnRp
bWUuSW50ZXJvcFNlcnZpY2VzOw0KdXNpbmcgU3lzdGVtLlRleHQ7DQpwdWJsaWMg
Y2xhc3MgVXNlcjMyIHsNCiAgICBbRGxsSW1wb3J0KCJ1c2VyMzIuZGxsIiwgU2V0
TGFzdEVycm9yID0gdHJ1ZSldDQogICAgcHVibGljIHN0YXRpYyBleHRlcm4gSW50
UHRyIEZpbmRXaW5kb3coc3RyaW5nIGxwQ2xhc3NOYW1lLCBzdHJpbmcgbHBXaW5k
b3dOYW1lKTsNCg0KICAgIFtEbGxJbXBvcnQoInVzZXIzMi5kbGwiKV0NCiAgICBw
dWJsaWMgc3RhdGljIGV4dGVybiBib29sIEdldFdpbmRvd1JlY3QoSW50UHRyIGh3
bmQsIG91dCBSRUNUIGxwUmVjdCk7DQoNCiAgICBbRGxsSW1wb3J0KCJ1c2VyMzIu
ZGxsIildDQogICAgcHVibGljIHN0YXRpYyBleHRlcm4gYm9vbCBNb3ZlV2luZG93
KEludFB0ciBoV25kLCBpbnQgWCwgaW50IFksIGludCBuV2lkdGgsIGludCBuSGVp
Z2h0LCBib29sIGJSZXBhaW50KTsNCg0KICAgIFtEbGxJbXBvcnQoInVzZXIzMi5k
bGwiKV0NCiAgICBwdWJsaWMgc3RhdGljIGV4dGVybiBpbnQgR2V0V2luZG93VGV4
dChJbnRQdHIgaFduZCwgU3RyaW5nQnVpbGRlciBscFN0cmluZywgaW50IG5NYXhD
b3VudCk7DQoNCiAgICBbRGxsSW1wb3J0KCJ1c2VyMzIuZGxsIildDQogICAgcHVi
bGljIHN0YXRpYyBleHRlcm4gaW50IEdldFdpbmRvd1RleHRMZW5ndGgoSW50UHRy
IGhXbmQpOw0KfQ0KDQpbU3RydWN0TGF5b3V0KExheW91dEtpbmQuU2VxdWVudGlh
bCldDQpwdWJsaWMgc3RydWN0IFJFQ1Qgew0KICAgIHB1YmxpYyBpbnQgTGVmdDsN
CiAgICBwdWJsaWMgaW50IFRvcDsNCiAgICBwdWJsaWMgaW50IFJpZ2h0Ow0KICAg
IHB1YmxpYyBpbnQgQm90dG9tOw0KfQ0KDQoiQA0KDQpBZGQtVHlwZSAtQXNzZW1i
bHlOYW1lIFN5c3RlbS5XaW5kb3dzLkZvcm1zDQokc2NyZWVuID0gW1N5c3RlbS5X
aW5kb3dzLkZvcm1zLlNjcmVlbl06OlByaW1hcnlTY3JlZW4uQm91bmRzDQoNCiRj
bWRQcm9jcyA9IEdldC1Qcm9jZXNzIGNtZCAtRXJyb3JBY3Rpb24gU2lsZW50bHlD
b250aW51ZQ0KDQokZm91bmRBbnkgPSAkZmFsc2UNCg0KZm9yZWFjaCAoJHByb2Mg
aW4gJGNtZFByb2NzKSB7DQogICAgJGhXbmQgPSAkcHJvYy5NYWluV2luZG93SGFu
ZGxlDQogICAgaWYgKCRoV25kIC1lcSAwKSB7IGNvbnRpbnVlIH0NCg0KICAgICRs
ZW4gPSBbVXNlcjMyXTo6R2V0V2luZG93VGV4dExlbmd0aCgkaFduZCkNCiAgICBp
ZiAoJGxlbiAtbGUgMCkgeyBjb250aW51ZSB9DQoNCiAgICAkc2IgPSBOZXctT2Jq
ZWN0IFN5c3RlbS5UZXh0LlN0cmluZ0J1aWxkZXIgLUFyZ3VtZW50TGlzdCAoJGxl
biArIDEpDQogICAgW1VzZXIzMl06OkdldFdpbmRvd1RleHQoJGhXbmQsICRzYiwg
JHNiLkNhcGFjaXR5KSB8IE91dC1OdWxsDQogICAgJHdpbmRvd1RpdGxlID0gJHNi
LlRvU3RyaW5nKCkNCg0KICAgIGlmICgkd2luZG93VGl0bGUgLWFuZCAkd2luZG93
VGl0bGUgLWxpa2UgIiokVGl0bGVDb250YWlucyoiKSB7DQogICAgICAgICRyZWN0
ID0gTmV3LU9iamVjdCBSRUNUDQogICAgICAgIFtVc2VyMzJdOjpHZXRXaW5kb3dS
ZWN0KCRoV25kLCBbcmVmXSRyZWN0KSB8IE91dC1OdWxsDQoNCiAgICAgICAgJHdp
ZHRoID0gJHJlY3QuUmlnaHQgLSAkcmVjdC5MZWZ0DQogICAgICAgICRoZWlnaHQg
PSAkcmVjdC5Cb3R0b20gLSAkcmVjdC5Ub3ANCg0KICAgICAgICAkeCA9IFttYXRo
XTo6Rmxvb3IoKCRzY3JlZW4uV2lkdGggLSAkd2lkdGgpIC8gMikNCiAgICAgICAg
JHkgPSBbbWF0aF06OkZsb29yKCgkc2NyZWVuLkhlaWdodCAtICRoZWlnaHQpIC8g
MikNCg0KICAgICAgICBbVXNlcjMyXTo6TW92ZVdpbmRvdygkaFduZCwgJHgsICR5
LCAkd2lkdGgsICRoZWlnaHQsICR0cnVlKSB8IE91dC1OdWxsDQoNCgkJV3JpdGUt
SG9zdCAiICINCiAgICAgICAgJGZvdW5kQW55ID0gJHRydWUNCiAgICB9DQp9
-----END CERTIFICATE_center-----

::===============================================================================================================