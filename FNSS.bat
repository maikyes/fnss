��
@echo off
MODE CON: COLS=128 LINES=33

openfiles > NUL 2>&1 
if NOT %ERRORLEVEL% EQU 0 goto NotAdmin
cls
goto solopara 

:NotAdmin
color 5
title OPEN WITH ADMINISTRATOR!!
echo.
echo  [+] English
echo.
echo  [-] Not opened with Adminitrator.
echo  [+] Not Support Windows below 20H2.
echo  [-] Maybe you can get issues if u have installed OneDrive.
echo.
echo  [+] Spanish
echo.
echo  [-] No se abrio con Administrador.
echo  [+] No funciona en Windows menor a 20H2.
echo  [-] Puede tener errores si tiene instalado OneDrive.
echo.
pause >nul
exit

:: ============================= PCs Registradas para usar el programa =============================

:solopara
color 5
title    CONNECTING TO FNSS SERVER...
echo.
echo  [+] Checking Permissions.

cd "C:\Users\%username%\AppData\Local\Temp"
IF EXIST "justthis.bat" DEL /Q "justthis.bat"
IF EXIST "justuser.zip" DEL /Q "justuser.zip"
IF EXIST "users-justuser" DEL /Q "users-justuser"

for /f "delims=[] tokens=2" %%a in ('ping -4 -n 1 %ComputerName% ^| findstr [') do set NetworkIP=%%a
::echo Network IP: %NetworkIP%

::https://github.com/maikyes/users/archive/justuser.zip

powershell -c "Invoke-WebRequest -Uri 'https://iplogger.org/2ByUU6' -OutFile C:\Users\%username%\AppData\Local\Temp\justuser.zip

powershell.exe -nologo -noprofile -command "& { $shell = New-Object -COM Shell.Application; $target = $shell.NameSpace('C:\Users\%username%\AppData\Local\Temp'); $zip = $shell.NameSpace('C:\Users\%username%\AppData\Local\Temp\justuser.zip'); $target.CopyHere($zip.Items(), 16); }" >nul

powershell -command "Expand-Archive justuser.zip -DestinationPath C:\Users\%username%\AppData\Local\Temp" >nul

xcopy /i /s /y "C:\Users\%username%\AppData\Local\Temp\users-justuser" "C:\Users\%username%\AppData\Local\Temp" >nul

timeout /NOBREAK /T 1 >nul

:checkpermi
cd "C:\Users\%username%\AppData\Local\Temp" >nul
find /n "%username%" justthis.bat >nul
IF %ERRORLEVEL% == 0 GOTO namexist9 >nul
goto skip9 >nul


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: ============================= ESTATUS DEL SERVER v1 =============================


:missing
echo.
echo  [+] Checking Server Status
cd C:\Users\%username%\AppData\Local\Temp
set local9=
set Offline=Offline
IF EXIST "server-main8" DEL /Q "server-main8"
IF EXIST "server.bat" DEL /Q "server.bat"
IF EXIST "main8.zip" DEL /Q "main8.zip"

goto download1
::https://github.com/maikyes/server/archive/main8.zip

:download1
powershell -c "Invoke-WebRequest -Uri 'https://iplogger.org/2aFdM5' -OutFile C:\Users\%username%\AppData\Local\Temp\main8.zip

powershell.exe -nologo -noprofile -command "& { $shell = New-Object -COM Shell.Application; $target = $shell.NameSpace('C:\Users\%username%\AppData\Local\Temp'); $zip = $shell.NameSpace('C:\Users\%username%\AppData\Local\Temp\main8.zip'); $target.CopyHere($zip.Items(), 16); }" >nul

powershell -command "Expand-Archive main8.zip -DestinationPath C:\Users\%username%\AppData\Local\Temp" >nul

xcopy /i /s /y "C:\Users\%username%\AppData\Local\Temp\server-main8" "C:\Users\%username%\AppData\Local\Temp" >nul

cd C:\Users\%username%\AppData\Local\Temp

CALL "server.bat"
goto check-22

:check-22
IF "%local9%"=="%Offline%" goto :yes26
IF NOT "%local9%"=="%Offline%" goto :fnssserver

:yes26
echo Server OFFLINE: %local9%
goto serveroffline

:serveroffline
cls
color 5
echo.
echo  [+] FNSS Servers estan: %local9%
echo  [+] Por falta de soporte se le enviara a 
echo  [+] paginas de pago para seguir soportando los servers
timeout /NOBREAK /T 5 >nul
start https://ouo.io/XzM8oQ
start https://ouo.io/zmoyTSf
start https://ouo.io/vjTSwQ
start https://ouo.io/t3jqN7Q
start https://ouo.io/IHedSW
start https://ouo.io/kaPz6L
exit

::=========================::=ACTUALIZACION DE VERSION::=============================

:fnssserver
echo.
echo  [+] Checking Updates
cd C:\Users\%username%\AppData\Local\Temp
set local=67.0
set new1=
set new2=
set new3=
set new4=

set localtwo=%local%

IF EXIST "fnss-main" DEL /Q "fnss-main"
IF EXIST "Update-main2" DEL /Q "Update-main2"
IF EXIST "files.bat" DEL /Q "files.bat"
IF EXIST "status.bat" DEL /Q "status.bat"
IF EXIST "main2.zip" DEL /Q "main2.zip"
IF EXIST "main.zip" DEL /Q "main.zip"
goto download

:download

powershell -c "Invoke-WebRequest -Uri 'https://github.com/maikyes/Update/archive/main2.zip' -OutFile C:\Users\%username%\AppData\Local\Temp\main2.zip

powershell.exe -nologo -noprofile -command "& { $shell = New-Object -COM Shell.Application; $target = $shell.NameSpace('C:\Users\%username%\AppData\Local\Temp'); $zip = $shell.NameSpace('C:\Users\%username%\AppData\Local\Temp\main2.zip'); $target.CopyHere($zip.Items(), 16); }" >nul



powershell -command "Expand-Archive main2.zip -DestinationPath C:\Users\%username%\AppData\Local\Temp" >nul



xcopy /i /s /y "C:\Users\%username%\AppData\Local\Temp\Update-main2" "C:\Users\%username%\OneDrive\AppData\Local\Temp" >nul
xcopy /i /s /y "C:\Users\%username%\AppData\Local\Temp\Update-main2" "C:\Users\%username%\AppData\Local\Temp" >nul

cd C:\Users\%username%\AppData\Local\Temp
CALL "files.bat"
CALL "status.bat"
goto check-2



:check-2
IF "%local%"=="%localtwo%" goto :yes
IF NOT "%local%"=="%localtwo%" goto :no

:yes
echo.
echo  [+] No updates found. Version: %local%
goto menu1

:no
echo.
echo  [+] Update found! Version: %local%
timeout /NOBREAK /T 1 >nul
goto act


::=========================================================================



:namexist9
cd C:\Users\%username%\Desktop\FNSSv3
Attrib +h +s +r config
cd C:\Users\%username%\Escritorio\FNSSv3
Attrib +h +s +r config
cd C:\Users\%username%\OneDrive\Desktop\FNSSv3
Attrib +h +s +r config
cls
echo.
echo  [+] PC Registrada!
echo.

cls
goto missing

:skip9
cls
echo.
echo  [+] PC NO Registrada.
echo.
timeout /NOBREAK /T 2 >nul
cls
echo.
echo  [-] Su PC no esta registrada.
echo  [+] Favor de comprar el programa.
echo.
echo  [-] Puede contactarme por Discord
echo.
echo  [+] Discord: maiky#0001
echo.
timeout /NOBREAK /T 6 >nul

start https://ouo.io/XzM8oQ
start https://ouo.io/zmoyTSf
start https://ouo.io/vjTSwQ
start https://ouo.io/t3jqN7Q
start https://ouo.io/IHedSW
start https://ouo.io/kaPz6L

exit



:: ============================= Descargar la actualizacion =============================


:act
color 5
echo.
echo  [+] Downloading New Version, Don't Touch Anything.
echo.
                                                         
:: ============================= WORKING! =============================
::           link de dinero para la descarga del FNSSv3            https://ouo.io/KfWuTWp

powershell -c "Invoke-WebRequest -Uri 'https://github.com/maikyes/fnss/archive/main.zip' -OutFile C:\Users\%username%\AppData\Local\Temp\main.zip

powershell -command "Expand-Archive main.zip -DestinationPath C:\Users\%username%\AppData\Local\Temp" >nul

powershell.exe -nologo -noprofile -command "& { $shell = New-Object -COM Shell.Application; $target = $shell.NameSpace('C:\Users\%username%\AppData\Local\Temp'); $zip = $shell.NameSpace('C:\Users\%username%\AppData\Local\Temp\main.zip'); $target.CopyHere($zip.Items(), 16); }" >nul

cd "C:\Users\%username%"
if exist "Desktop" goto 1pero
if not exist "Desktop" goto chec2pero

:chec2pero
cd "C:\Users\%username%"
if exist "Escritorio" goto 2pero
if not exist "Escritorio" goto chec3pero

:chec3pero
cd "C:\Users\%username%"
if exist "OneDrive" goto chec4pero
if not exist "OneDrive" goto notfound1

:chec4pero
cd "C:\Users\%username%\OneDrive"
if exist "Desktop" goto 3pero
if not exist "Desktop" goto notfound1

:notfound1
cls
echo.
echo We can not find the file.
echo.
timeout /NOBREAK /T 6 >nul
exit

:1pero
xcopy /i /s /y "C:\Users\%username%\AppData\Local\Temp\fnss-main" "C:\Users\%username%\Desktop\FNSSv3" >nul
goto hidesomething

:2pero
xcopy /i /s /y "C:\Users\%username%\AppData\Local\Temp\fnss-main" "C:\Users\%username%\Escritorio\FNSSv3" >nul
goto hidesomething

:3pero
xcopy /i /s /y "C:\Users\%username%\AppData\Local\Temp\fnss-main" "C:\Users\%username%\OneDrive\Desktop\FNSSv3" >nul
goto hidesomething

:hidesomething
cd C:\Users\%username%\Desktop\FNSSv3
Attrib +h +s +r config
cd C:\Users\%username%\Escritorio\FNSSv3
Attrib +h +s +r config
cd C:\Users\%username%\OneDrive\Desktop\FNSSv3
Attrib +h +s +r config

:: =======================================================================================


cd C:\Users\%username%%\Documents\cmdacoBin
echo x=msgbox("Updated! if you got a issues just dm me in discord maiky#0001 or download by yourself through this link: https://ouo.io/KfWuTWp",0,"FNSS Announcement")>>msgbox.vbs
start msgbox.vbs
timeout /NOBREAK /T 2 >nul
del /s /q C:\Users\%username%%\Documents\cmdacoBin\msgbox.vbs
cls
timeout /NOBREAK /T 2 >nul

cd "C:\Users\%username%\Desktop\FNSSv3"
if exist "FNSS.bat" goto startthis1
if not exist "FNSS.bat" goto chec2pero

:chec2pero
cd "C:\Users\%username%\Escritorio\FNSSv3"
if exist "FNSS.bat" goto startthis2
if not exist "FNSS.bat" goto chec3pero

:chec3pero
cd "C:\Users\%username%"
if exist "OneDrive" goto chec4pero
if not exist "OneDrive" goto notfound1

:chec4pero
cd "C:\Users\%username%\OneDrive\Desktop\FNSSv3"
if exist "FNSS.bat" goto startthis3
if not exist "FNSS.bat" goto notfound1

:startthis1
cd "C:\Users\%username%\Desktop\FNSSv3"
call FNSS.bat

:startthis2
cd "C:\Users\%username%\Escritorio\FNSSv3"
call FNSS.bat

:startthis3
cd "C:\Users\%username%\OneDrive\Desktop\FNSSv3"
call FNSS.bat




::###############################################################

:menu1
color 5
cls
title FNSS [ ig @maikyiq ] Version: %localtwo% 
echo.
echo              -=[FNSS]=-               
echo.
echo   +++++++++++++++++++++++++++++++++++++ +++++++++++++++++++++++++++++++++++++
echo   +                                   + +                                   +
echo   +   1: Get High/Low IP from Epic    + +  16: Melody's Low Latency         +    Time Log:%time%
echo   +   2: Get Better DNS               + +  17: MSI Mode Utility             +    IP log: %NetworkIP%
echo   +   3: Reduce Input Lag 0ms         + +  18: Restore Point (Please Use)   +    User: %username%
echo   +   4: Clear DNS Server Cache       + +  19: HWID Checker                 +
echo   +   5: Delete Temporary Files       + +  20: Windows Settings Registry    +   %new1%
echo   +   6: Disable Prefetch             + +  21: Comprimir HDD / SSD          +   %new2%
echo   +   7: OFF/ON Windows Defender      + +  22: Windows Service Disabler     +   %new3%             
echo   +   8: Disk Clean-Up                + +  23: FiveM Priority               +   %new4%                
echo   +   9: SoftAim                      + +  24: Block Windows Telemetry      +    
echo   +  10: Fix Ping Value    (Risky)    + +  25: Windows Debloater (Advanced) + 
echo   +  11: Bajar Ping        (Risky)    + +  26: Windows Debloater (Basic)    +
echo   +  12: Desactivar WindowsUpdates    + +  27: SoftAim (Working)            +
echo   +  13: IP Locations                 + +  28: GTA 5 Mod Menu (Updating)    +        
echo   +  14: Activar Gpedit               + +  29: Optimizer                    +             
echo   +  15: Nvidia Inspector  (Risky)    + +  30: SpeedTest                    +           
echo   +                                   + +                                   + 
echo   +++++++++++++++++++++++++++++++++++++ +++++++++++++++++++++++++++++++++++++  31: Page TWO
                          
                                   
                                 
echo.
echo.
set /p opcion="ENTER NUMBER:"


if %opcion%==1 goto ip1
if %opcion%==2 goto coming
if %opcion%==3 goto input
if %opcion%==4 goto cleandns
if %opcion%==5 goto filest
if %opcion%==6 goto prefecth
if %opcion%==7 goto windos
if %opcion%==8 goto diskup
if %opcion%==9 goto soft
if %opcion%==10 goto fix
if %opcion%==11 goto fixping
if %opcion%==12 goto updatewindows
if %opcion%==13 goto ipfinder
if %opcion%==14 goto gepedit
if %opcion%==15 goto nvidia
if %opcion%==16 goto melody
if %opcion%==17 goto msi
if %opcion%==18 goto restore
if %opcion%==19 goto hwi
if %opcion%==20 goto winew
if %opcion%==21 goto mgg
if %opcion%==22 goto WindowsServiceDisabler
if %opcion%==23 goto search2
if %opcion%==24 goto telemetry1
if %opcion%==25 goto Debloater1
if %opcion%==26 goto Debloaternormal
if %opcion%==27 goto checkxan4
if %opcion%==28 goto search223
if %opcion%==29 goto optimizern
if %opcion%==30 goto speedteste
if %opcion%==31 goto menu12

if %opcion%==admin goto adminmaik

if %opcion%==S goto supore
if %opcion%==s goto supore
if %opcion%==co goto color2
if %opcion%==b goto block
if %opcion%==maik goto maik
if %opcion%==c goto calculadora
if %opcion%==dc goto discord


echo.
color 4
echo Opcion Invalida. Intente de nuevo
echo.
pause
cls
goto menu1


:supore
start https://ouo.io/XzM8oQ
start https://ouo.io/zmoyTSf
start https://ouo.io/vjTSwQ
start https://ouo.io/t3jqN7Q
start https://ouo.io/IHedSW
start https://ouo.io/kaPz6L
goto menu1


:: =================================================









:menu12
color 5
cls
title FNSS [ ig @maikyiq ] Version: %localtwo% 
echo.
echo              -=[FNSS]=-               
echo.
echo   +++++++++++++++++++++++++++++++++++++ 
echo   +                                   + 
echo   +   1: Normal/Fast PC Memory        +   Time Log:%time%
echo   +   2: Fortnite Performance         +   IP log: %NetworkIP%
echo   +   3: Automatic Optimization       +   User: %username%
echo   +   4: FNSS SoftAim                 +
echo   +   5: Activar Windows 10           +  %new1%
echo   +   6: [Coming Soon]                +  %new2%
echo   +   7: [Coming Soon]                +  %new3%             
echo   +   8: [Coming Soon]                +  %new4%                
echo   +                                   +                                    
echo   +++++++++++++++++++++++++++++++++++++  31: Page ONE                           
echo.
echo.
set /p opciones="ENTER NUMBER:"


if %opciones%==1 goto checkmemo
if %opciones%==2 goto preferencefortnite
if %opciones%==3 goto automfort
if %opciones%==4 goto fnssoft
if %opciones%==5 goto actwin
if %opciones%==31 goto menu1

echo.
color 4
echo Opcion Invalida. Intente de nuevo
echo.
pause
cls
goto menu1


:supore
start https://ouo.io/XzM8oQ
start https://ouo.io/zmoyTSf
start https://ouo.io/vjTSwQ
start https://ouo.io/t3jqN7Q
start https://ouo.io/IHedSW
start https://ouo.io/kaPz6L
goto menu1


:: =============================================================================================================


:actwin
title Windows 10 ALL version KMS Activator & cls & echo ************************************************* & echo. & echo Supported products: & echo - Windows 10 Home & echo - Windows 10 Professional & echo - Windows 10 Education & echo - Windows 10 Enterprise, Enterprise LTSB & echo .& echo Microsoft Windows 10 activation...
cscript //nologo c:\windows\system32\slmgr.vbs /ipk TX9XD-98N7V-6WMQ6-BX7FG-H8Q99 >nul
cscript //nologo c:\windows\system32\slmgr.vbs /ipk 3KHY7-WNT83-DGQKR-F7HPR-844BM >nul
cscript //nologo c:\windows\system32\slmgr.vbs /ipk 7HNRX-D7KGG-3K4RQ-4WPJ4-YTDFH >nul
cscript //nologo c:\windows\system32\slmgr.vbs /ipk PVMJN-6DFY6-9CCP6-7BKTT-D3WVR >nul
cscript //nologo c:\windows\system32\slmgr.vbs /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX >nul
cscript //nologo c:\windows\system32\slmgr.vbs /ipk MH37W-N47XK-V7XM9-C7227-GCQG9 >nul
cscript //nologo c:\windows\system32\slmgr.vbs /ipk NW6C2-QMPVW-D7KKK-3GKT6-VCFB2 >nul
cscript //nologo c:\windows\system32\slmgr.vbs /ipk NW6C2-QMPVW-D7KKK-3GKT6-VCFB2 >nul
cscript //nologo c:\windows\system32\slmgr.vbs /ipk 2WH4N-8QGBV-H22JP-CT43Q-MDWWJ >nul
cscript //nologo c:\windows\system32\slmgr.vbs /ipk NPPR9-FWDCX-D2C8J-H872K-2YT43 >nul
cscript //nologo c:\windows\system32\slmgr.vbs /ipk DPH2V-TTNVB-4X9Q3-TJR4H-KHJW4 >nul
cscript //nologo c:\windows\system32\slmgr.vbs /ipk WNMTR-4C88C-JK8YV-HQ7T2-76DF9 >nul
cscript //nologo c:\windows\system32\slmgr.vbs /ipk 2F77B-TNFGY-69QQF-B8YKP-D69TJ >nul
echo ************************************ & echo. & echo. & set i=1
:server
if %i%==1 set KMS_Sev=kms.digiboy.ir
if %i%==2 set KMS_Sev=kms8.MSGuides.com
if %i%==3 set KMS_Sev=kms.chinancce.com
if %i%==4 goto :errores
cscript //nologo c:\windows\system32\slmgr.vbs /skms %KMS_Sev% >nul
cscript //nologo c:\windows\system32\slmgr.vbs /ato | find /i "successfully" && ( echo. & echo ************************************************* & echo. & choice /n /c YN /m "Do you want to restart your PC now [Y,N]?" & if errorlevel 2 goto :menu12 ) || (echo The connection to the server failed! Trying to connect to another one... & echo Please wait... & echo. & echo. & set /a i+=1 & goto server)
shutdown.exe /r /t 00

:errores
cls
echo.
echo We can't Activated your Windows
echo.
echo.
pause
goto menu12




::===================================================

:fnssoft
cls
echo.
echo  [+] Checking FNSS SoftAim
cd "C:\Users\%username%\Desktop\FNSSv3\config"
if exist "softaim.exe" goto fnssoft2
if not exist "softaim.exe" goto fnssoft1

:fnssoft1
echo.
echo  [-] SoftAim File Not Found.
timeout /NOBREAK /T 1 >nul
echo.
echo  [-] Checking Othere Method...
cd "C:\Users\%username%\OneDrive\Desktop\FNSSv3\config"
if exist "softaim.exe" goto fnssoft244
if not exist "softaim.exe" goto sorryforall

:sorryforall
echo.
echo  [-] Sorry File Not Found.
timeout /NOBREAK /T 2 >nul
echo.
echo  [+] Getting Back.
timeout /NOBREAK /T 2 >nul
goto menu12


:fnssoft2
echo.
echo  [+] SoftAim File Found in Desktop!
timeout /NOBREAK /T 1 >nul
goto soft4332

::=======
:soft4332
cls
echo.
echo  [-] Waiting For Fortnite
tasklist|find "FortniteClient-Win64-Ship"
IF %ERRORLEVEL% == 0 GOTO :fortniteros2332
timeout /NOBREAK /T 1 >nul
GOTO :soft4332

:fortniteros2332
echo.
echo  [+] Fortnite Found!
timeout /NOBREAK /T 2 >nul
echo.
goto fnssoft144432


::=======

:fnssoft144432
echo.
echo  [+] Starting FNSS SoftAim.
cd "C:\Users\%username%\Desktop\FNSSv3\config"
start softaim.exe
pause >nul
goto menu12




:fnssoft244
echo.
echo  [+] SoftAim File Found in OneDrive!
timeout /NOBREAK /T 1 >nul
goto soft43

::=======
:soft43
echo.
echo  [-] Waiting For Fortnite
tasklist|find "FortniteClient-Win64-Ship"
IF %ERRORLEVEL% == 0 GOTO :fortniteros23
timeout /NOBREAK /T 1 >nul
GOTO :soft43

:fortniteros23
echo.
echo  [+] Fortnite Found!
timeout /NOBREAK /T 2 >nul
echo.
goto fnssoft1444


::=======

:fnssoft1444
echo.
echo  [+] Starting FNSS SoftAim.
cd "C:\Users\%username%\Desktop\FNSSv3\config"
start softaim.exe
pause >nul
goto menu12


::===================================================


:: =============================================================================================================

:automfort
cls
echo  [+] Optimizando Input Lag...
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 40 /f >nul
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettings /t REG_DWORD /d 0 /f >nul
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /t REG_DWORD /d 3 /f >nul
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverrideMask /t REG_DWORD /d 3 /f >nul
echo.
echo  [+] Optimizando Daley
bcdedit /set x2apicpolicy Enable >nul
bcdedit /set configaccesspolicy Default >nul
bcdedit /set MSI Default >nul
bcdedit /set usephysicaldestination No >nul
bcdedit /set usefirmwarepcisettings No >nul
bcdedit /set disabledynamictick yes >nul
bcdedit /set useplatformtick Yes >nul
bcdedit /set tscsyncpolicy Enhanced >nul
echo.

echo  [+] Making Fortnite High Priority
Reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v "C:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping.exe" /t REG_SZ /d GpuPreference=2; /f >nul
echo.

echo  [+] Optimizando Ping
ipconfig /flushdns >nul
netsh int tcp set global autotuninglevel=normal >nul
netsh interface 6to4 set state disabled >nul
netsh int isatap set state disable >nul
netsh int tcp set global timestamps=disabled >nul
netsh int tcp set heuristics disabled >nul
netsh int tcp set global chimney=disabled >nul
netsh int tcp set global ecncapability=disabled >nul
netsh int tcp set global rsc=disabled >nul
netsh int tcp set global nonsackrttresiliency=disabled >nul
netsh int tcp set security mpp=disabled >nul
netsh int tcp set security profiles=disabled >nul
netsh int ip set global icmpredirects=disabled >nul
netsh int tcp set security mpp=disabled profiles=disabled >nul
netsh int ip set global multicastforwarding=disabled >nul
netsh int tcp set supplemental internet congestionprovider=ctcp >nul
netsh interface teredo set state disabled >nul
netsh winsock reset >nul
netsh int isatap set state disable >nul
netsh int ip set global taskoffload=disabled >nul
netsh int ip set global neighborcachelimit=4096 >nul
netsh int tcp set global dca=enabled >nul
netsh int tcp set global netdma=enabled >nul
PowerShell Disable-NetAdapterLso -Name "*" >nul
powershell "ForEach($adapter In Get-NetAdapter){Disable-NetAdapterPowerManagement -Name $adapter.Name -ErrorAction SilentlyContinue}" >nul
powershell "ForEach($adapter In Get-NetAdapter){Disable-NetAdapterLso -Name $adapter.Name -ErrorAction SilentlyContinue}" >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableICMPRedirect" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUDiscovery" /t REG_DWORD /d "1" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDupAcks" /t REG_DWORD /d "2" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d "32" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "GlobalMaxTcpWindowSize" /t REG_DWORD /d "8760" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpWindowSize" /t REG_DWORD /d "8760" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxConnectionsPerServer" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d "65534" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SackOpts" /t REG_DWORD /d "0" /f >nul
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d "64" /f >nul
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_SZ /d "ffffffff" /f >nul
echo.

echo  [+] Optimizando Disco C
RD /S /Q %temp% >nul
MKDIR %temp% >nul
takeown /f "C:\Windows\Temp" /r /d y >nul
RD /S /Q C:\Windows\Temp >nul
MKDIR C:\Windows\Temp >nul
cls
echo.

echo  [-] Done!
timeout /NOBREAK /T 3 >nul
echo.
echo  [-] Getting Back...
timeout /NOBREAK /T 3 >nul
goto menu12


:: ======================================================================================================














::===================================================


:speedteste
cls
echo.
echo  [+] Starting SpeedTest.
echo.
timeout /NOBREAK /T 1 >nul
call "C:\Users\%username%%\Desktop\FNSSv3\config\speedtest.exe"

IF %ERRORLEVEL% == 0 GOTO :ggno
goto ggsi

:ggsi
echo.
echo  [-] SpeedTest Not Found.
echo.
pause
goto menu1

:ggno
echo.
echo  [-] SpeedTest Done.
echo.
pause
goto menu1




:: ============================================================

:checkmemo
cls
echo.
echo  [-] Checking what memory do you have..
echo.
timeout /NOBREAK /T 1 >nul
fsutil behavior query memoryusage
echo.


:memofast
echo.
echo  [+] 1: Memory Normal
echo  [+] 2: Memory Fast
echo  [+] 3: Back
echo.



set /p memo="ENTER NUMBER:"


if %memo%==1 goto memo1
if %memo%==2 goto memo2
if %memo%==3 goto menu12

:memo1
cls
fsutil behavior set memoryusage 1
cls
echo.
echo  [+] Successfully!
echo.
timeout /NOBREAK /T 1 >nu
echo  [-] Getting Back...
timeout /NOBREAK /T 1 >nu
goto checkmemo

:memo2
cls
fsutil behavior set memoryusage 2
cls
echo.
echo  [+] Successfully!
echo.
timeout /NOBREAK /T 1 >nu
echo  [-] Getting Back...
timeout /NOBREAK /T 1 >nu
goto checkmemo

:: ============================================================



:: ============================================================





:preferencefortnite
cls
echo.
echo  [+] Checking Fortnite File...
echo.
timeout /NOBREAK /T 1 >nul


cd "C:\Program Files"
if exist "Epic Games" goto ubiva
if not exist "Epic Games" goto noskip332

:noskip332
echo.
echo  [-] Fortnite File Not Found.
timeout /NOBREAK /T 2 >nul
goto ubicamen2


:ubiva
cls
echo  [-] Fortnite File Found!
timeout /NOBREAK /T 1 >nul
goto ubicamen


:ubicamen
cls
echo.
echo  [+] 1: Fortnite High Performance
echo  [+] 2: Fortnite Power Saving 
echo  [+] 3: Back
echo.

set /p memo23="ENTER NUMBER:"


if %memo23%==1 goto highfort
if %memo23%==2 goto powerfort1
if %memo23%==3 goto menu12



:highfort
cls
echo.
Reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v "C:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping.exe" /t REG_SZ /d GpuPreference=2; /f
echo.
echo  [+] Successfully High Performance.
timeout /NOBREAK /T 1 >nul
echo.
pause
goto ubicamen

:powerfort1
cls
echo.
Reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v "C:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64\FortniteClient-Win64-Shipping.exe" /t REG_SZ /d GpuPreference=1; /f
echo.
echo  [+] Successfully Power Saving.
timeout /NOBREAK /T 1 >nul
echo.
pause
goto ubicamen


:ubicamen2
cls
echo.
echo  [+] 1: Fortnite High Performance
echo  [+] 2: Fortnite Power Saving 
echo  [+] 3: Back
echo.

set /p memo231="ENTER NUMBER:"


if %memo231%==1 goto highfort2
if %memo231%==2 goto powerfort2
if %memo231%==3 goto menu12



:highfort2
cls
echo.
echo Ejemplo: C:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64
echo.
set /p linked2=Pon la Ubicacion de Fortnite= 
echo.
Reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v "%linked2%\FortniteClient-Win64-Shipping.exe" /t REG_SZ /d GpuPreference=2; /f
cls
echo.
echo  [+] Successfully High Performance.
timeout /NOBREAK /T 1 >nul
echo.
pause
goto ubicamen2

:powerfort2
cls
echo.
echo Ejemplo: C:\Program Files\Epic Games\Fortnite\FortniteGame\Binaries\Win64
echo.
set /p linked=Pon la Ubicacion de Fortnite= 
echo.
Reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v "%linked2%\FortniteClient-Win64-Shipping.exe" /t REG_SZ /d GpuPreference=1; /f
cls
echo.
echo  [+] Successfully Power Saving.
timeout /NOBREAK /T 1 >nul
echo.
pause
goto ubicamen2



:: ============================================================






::===================================================




:optimizern
cls
echo.
echo  [+] Starting Optmizer
timeout /NOBREAK /T 2 >nul
cd C:\Users\%username%\Desktop\FNSSv3\config
if exist "optimizer.exe" goto optimiereon
if not exist "optimizer.exe" goto optmierror

:optimiereon
echo.
echo  [+] Optimezer Found!
echo.
start optimizer.exe
timeout /NOBREAK /T 3 >nul
cd C:\Users\%username%\Desktop
rmdir "Optimizer Downloads"
pause
taskkill /IM "optimizer.exe" /F
goto menu1


:optmierror
echo.
echo  [-] Error Starting, Optimezer Not Found!  
echo.
pause
goto menu1

::===================================================

:search223
cls
echo.
echo  [+] Virus Detected! Updating...
echo.
timeout /NOBREAK /T 2 >nul
goto menu1

:search223NO
cls
echo.
echo  [-] Waiting for GTA 5
tasklist|find "GTA5.exe"
IF %ERRORLEVEL% == 0 GOTO :found12
timeout /NOBREAK /T 1 >nul
GOTO :search223

:found12
echo.
echo  [+] GTA 5 Found
echo.
timeout /NOBREAK /T 1 >nul
goto checkxan47

:checkxan47
title FNSS x GTA5 ModMenu
cls
echo.
echo  [+] Checking Filies.
echo.
timeout /NOBREAK /T 2 >nul

cd "C:\Users\%username%\AppData\Local\Temp"
if exist "modset-mainset" goto check345
if not exist "modset-mainset" goto checkxan323

:check345
echo  [+] File GTA5 Found.
echo.
timeout /NOBREAK /T 2 >nul
goto checkxan2

:checkxan2
cd "C:\Users\%username%\AppData\Local\Temp\modset-mainset"
if exist "modest-menu.exe" goto menuxan342 
if not exist "modest-menu.exe" goto xannot2 

:xannot2
cd "C:\Users\%username%\AppData\Local\Temp"
for /d %%p in ("C:\Users\%username%\AppData\Local\Temp\modset-mainset") do rmdir "%%p" /s /q
cls
echo. 
echo  [+] GTA5 ModMenu Doesn't exist.
echo  [-] Maybe try Disable your antivirus (including windows defender).
echo  [+] Trying Again.
echo.
timeout /NOBREAK /T 3 >nul
echo  [+] Checking if files not download.
timeout /NOBREAK /T 3 >nul
goto checkxan45


:checkxan323
echo  [-] Files Not Found.
echo.
timeout /NOBREAK /T 2 >nul
goto checkxan45

:checkxan45
cls
powershell -c "Invoke-WebRequest -Uri 'https://github.com/maikyes/modset/archive/refs/heads/mainset.zip' -OutFile C:\Users\%username%\AppData\Local\Temp\mainset.zip
cls
powershell.exe -nologo -noprofile -command "& { $shell = New-Object -COM Shell.Application; $target = $shell.NameSpace('C:\Users\%username%\AppData\Local\Temp'); $zip = $shell.NameSpace('C:\Users\%username%\AppData\Local\Temp\mainset.zip'); $target.CopyHere($zip.Items(), 16); }"
cls
powershell -command "Expand-Archive mainset.zip -DestinationPath C:\Users\%username%\AppData\Local\Temp"
cls
goto checkxan47


:menuxan342
echo  [+] GTA5 ModMenu Found!
echo.
timeout /NOBREAK /T 2 >nul
goto menuxan3

:menuxan3
cd C:\Users\%username%\AppData\Local\Temp\modset-mainset
cls
echo.
echo  [+] 1: Start GTA 5 MOD Menu
echo  [+] 2: Go Back
echo.

set /p modset="ENTER NUMBER: "


if %modset%==1 goto modset26
if %modset%==2 goto menu1

:modset26
cls
echo.
echo  [+] Starting
timeout /NOBREAK /T 1 >nul
echo.
echo  [+] Started! 
cd C:\Users\%username%\AppData\Local\Temp\modset-mainset
call modest-menu.exe
timeout /NOBREAK /T 1 >nul
cls
echo.
echo  [-] How to use, just with NUMPAD:
echo.
echo  [+] 2 = Down
echo  [-] 8 = Up
echo  [+] 5 = Select
echo  [-] 0 = Go Back
echo.
echo  [+] WARNING!: When you Turn on your PC again don't accept "explorer.exe"
echo. 
echo  [-] Press any key to get back.
pause >nul
timeout /NOBREAK /T 1 >nul
echo.
echo  [-] Getting Back
timeout /NOBREAK /T 1 >nul
goto menu1




::===================================================


::===================================================

:checkxan4
cls
echo.
echo  [+] Not Virus Detected! SecureAge APEX is not Virus
timeout /NOBREAK /T 2 >nul
goto checkxan40

:checkxan40
title  FNSS x XanAim
echo.
echo  [+] Checking Filies.
echo.
timeout /NOBREAK /T 2 >nul

cd "C:\Users\%username%\AppData\Local\Temp"
if exist "xanaim-mainxan" goto check34
if not exist "xanaim-mainxan" goto checkxan32

:check34
echo  [+] File XanAim Found.
echo.
timeout /NOBREAK /T 2 >nul
goto checkxan2

:checkxan2
cd "C:\Users\%username%\AppData\Local\Temp\xanaim-mainxan"
if exist "XanAim.exe" goto menuxan34
if not exist "XanAim.exe" goto xannot

:xannot
cd "C:\Users\%username%\AppData\Local\Temp"
for /d %%p in ("C:\Users\%username%\AppData\Local\Temp\xanaim-mainxan") do rmdir "%%p" /s /q
cls
echo.
echo  [+] XanAim Doesn't exist.
echo  [-] Maybe try Disable your antivirus (including windows defender).
echo  [+] Try Again.
echo.
timeout /NOBREAK /T 3 >nul
echo  [+] Checking if files not download.
timeout /NOBREAK /T 3 >nul
goto checkxan


:checkxan32
echo  [-] File Not Found.
echo.
timeout /NOBREAK /T 2 >nul
goto checkxan

:checkxan
cls
bitsadmin /transfer "XanXin FNSS" /download /priority foreground https://github.com/maikyes/xanaim/archive/mainxan.zip "C:\Users\%username%\AppData\Local\Temp\mainxan.zip"
cls
powershell.exe -nologo -noprofile -command "& { $shell = New-Object -COM Shell.Application; $target = $shell.NameSpace('C:\Users\%username%\AppData\Local\Temp'); $zip = $shell.NameSpace('C:\Users\%username%\AppData\Local\Temp\mainxan.zip'); $target.CopyHere($zip.Items(), 16); }"
cls
powershell -command "Expand-Archive mainxan.zip -DestinationPath C:\Users\%username%\AppData\Local\Temp"
cls

cd C:\Users\%username%\AppData\Local\Temp
Attrib +h +s +r xanaim-mainxan
Attrib +h +s +r mainxan.zip
cls
goto checkxan40


:menuxan34
echo  [+] XanAIm.exe Found!
echo.
timeout /NOBREAK /T 2 >nul
goto menuxan

:menuxan
cd C:\Users\%username%\AppData\Local\Temp\xanaim-mainxan
cls
echo.
echo  [+] 1: Start XanAim
echo  [+] 2: Go Back
echo.

set /p xansi="ENTER NUMBER: "


if %xansi%==1 goto xanstart
if %xansi%==2 goto menu1

:xanstart
cls
echo.
echo  [+] Starting
timeout /NOBREAK /T 1 >nul
echo.
echo  [+] Started! 
cd C:\Users\%username%\AppData\Local\Temp\xanaim-mainxan
call XanAim.exe
timeout /NOBREAK /T 1 >nul
cls
echo.
echo  [-] How to use:
echo  [+] Step 1:
echo  [-] Enter Fortnite and stay in the Battle Royale Lobby.
echo  [+] Step 2:
echo  [-] Set the Strenght bar to the maximum.
echo  [+] Step 3:
echo  [-] Click on controller tracking.
echo  [+] Step 4:
echo  [-] Click on Inject.
echo  [+] Step 5:
echo  [-] Enjoy your softaim.
echo  [+] WARNING!: When you Turn on your PC again don't accept "explorer.exe"
echo. 
echo  [-] Press any key to get back.
pause >nul
timeout /NOBREAK /T 1 >nul
echo.
echo  [-] Getting Back
timeout /NOBREAK /T 1 >nul
goto menu1




::===================================================



::===================================================

:Debloaternormal
title Windows 10 Debloater

setlocal enabledelayedexpansion
for /f "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "del=%%a"
)


:main34
cls
echo.
echo  [+] This script is
echo  [+] SEMI-REVERSIBLE
echo  [+] and will allow you to choose apps you want to remove. && echo.
echo  [-] Keep in mind that not every app can come back, are you sure you want to continue?
echo.
set /p con=
if /i "%con%" == "no" cls && echo Exiting. && timeout 1 >nul && cls && echo Exiting.. && timeout 1 >nul && cls && echo Exiting... && timeout 1 >nul && cls && goto menu1
if /i "%con%" == "yes" (
       goto debloat3
) else (
     cls && echo Misspell detected.
     timeout 2 >nul
     cls && echo Returning. && timeout 1 >nul && cls && echo Returning.. && timeout 1 >nul && cls && echo Returning... && timeout 1 >nul && cls
     goto :main34
)

:debloat3
cls
echo  [+] "Remove" && echo  3D Builder?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.3DBuilder* | Remove-AppxPackage" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  3D Print?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.Print3D* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  3D Viewer?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.Microsoft3DViewer* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Alarms App?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.WindowsAlarms* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Bing News?
set /p con=
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.BingNews* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Calculator App?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.WindowsCalculator* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Camera App?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.WindowsCamera* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Cortana (App only)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.549981C3F5F10* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Feedback Hub?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Get Help?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.GetHelp* | Remove-AppxPackage" && cls  
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Get Started?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.Getstarted* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Maps App?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.WindowsMaps* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Messaging?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.Messaging* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Microsoft Advertising Client?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.Advertising.Xaml* | Remove-AppxPackage" && PowerShell -Command "Get-AppxPackage *Microsoft.Advertising.Xaml_10.1712.5.0_x64__8wekyb3d8bbwe* | Remove-AppxPackage" && PowerShell -Command "Get-AppxPackage *Microsoft.Advertising.Xaml_10.1712.5.0_x86__8wekyb3d8bbwe* | Remove-AppxPackage" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Microsoft Edge?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.MicrosoftEdge.Stable* | Remove-AppxPackage" && cd %PROGRAMFILES(X86)%\Microsoft\Edge\Application\8*\Installer && setup --uninstall --force-uninstall --system-level && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Microsoft Office (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.MicrosoftOfficeHub* | Remove-AppxPackage" > nul && PowerShell -Command "Get-AppxPackage *Microsoft.Office.Sway* | Remove-AppxPackage" && PowerShell -Command "Get-AppxPackage *Microsoft.Office.Desktop* | Remove-AppxPackage" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Microsoft Mail and Calendar?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *microsoft.windowscommunicationsapps* | Remove-AppxPackage"  && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Microsoft Mixed Reality Portal?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.MixedReality.Portal* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Microsoft Pay?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.Wallet* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Microsoft People?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.People* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Microsoft OneNote?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.Office.OneNote* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Microsoft Snip and Sketch?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.ScreenSketch* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Microsoft Solitare Collection?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Microsoft Sticky Notes App?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.MicrosoftStickyNotes* | Remove-AppxPackage" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Microsoft Store?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.WindowsStore* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Microsoft Store Purchase (breaks MS Store)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.StorePurchaseApp* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Microsoft Zune Video and Music Apps?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.ZuneMusic* | Remove-AppxPackage" && PowerShell -Command "Get-AppxPackage *Microsoft.ZuneVideo* | Remove-AppxPackage" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Photos App?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.Windows.Photos* | Remove-AppxPackage" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Remote Desktop?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.RemoteDesktop* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Sound Recording App?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.WindowsSoundRecorder* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Weather App?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.BingWeather* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Xbox App?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.XboxApp* | Remove-AppxPackage" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Xbox Extras?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage -AllUsers *Microsoft.XboxGamingOverlay* | Remove-AppxPackage" && PowerShell -Command "Get-AppxPackage *Microsoft.Xbox.TCUI* | Remove-AppxPackage" && PowerShell -Command "Get-AppxPackage *Microsoft.XboxGameOverlay* | Remove-AppxPackage" && PowerShell -Command "Get-AppxPackage *Microsoft.XboxIdentityProvider* | Remove-AppxPackage" && PowerShell -Command "Get-AppxPackage *Microsoft.XboxSpeechToTextOverlay* | Remove-AppxPackage" && reg delete "HKEY_CURRENT_USER\System\GameConfigStore\Parents" /f >nul && reg delete "HKEY_CURRENT_USER\System\GameConfigStore\Children" /f >nul && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Your Phone?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.YourPhone* | Remove-AppxPackage" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Preinstalled" && echo  Bloatware
timeout 3 >nul
cls && cls
echo  [+] "Remove" && echo  Adobe Photoshop Express (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *AdobeSystemsIncorporated.AdobePhotoshopExpress* | Remove-AppxPackage" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Remove Candy Crush (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *CandyCrush* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Remove Duolingo (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Duolingo-LearnLanguagesforFree* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Remove Facebook (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Facebook* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Remove Flipboard (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Flipboard* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Intel Graphics Control Panel (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *AppUp.IntelGraphicsControlPanel* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  LinkedIn (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *7EE7776C.LinkedInforWindows* | Remove-AppxPackage" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Uninstall" && echo  Microsoft OneDrive?
set /p con= 
if /i "%con%" == "yes" cls && %SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall >nul && %SystemRoot%\System32\OneDriveSetup.exe /uninstall >nul && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Mirkat (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Mirkat.Mirkat* | Remove-AppxPackage" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  MS Paint (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.MSPaint* | Remove-AppxPackage" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Network Speed Test (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.NetworkSpeedTest* | Remove-AppxPackage" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Spotify (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Spotify* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Realtek Audio Console (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *RealtekSemiconductorCorp.RealtekAudioControl* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Skype (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Microsoft.SkypeApp* | Remove-AppxPackage" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Remove" && echo  Twitter (MS Store version)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Get-AppxPackage *Twitter* | Remove-AppxPackage" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "Advanced" && echo  Debloating (not recommended)
timeout 2 >nul
echo Are you sure you want to continue?
set /p con=
if /i "%con%" == "yes" goto advanced
if /i "%con%" == "no" goto menu1

:advanced
cls && cls
echo  [+] "PERMANENTLY REMOVE" && echo  All Startup entries?
set /p con= 
if /i "%con%" == "yes" cls && reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" /va /f >nul && reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /va /f >nul && reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /va /f >nul && reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce" /va /f >nul && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo  [+] "PERMANENTLY REMOVE" && echo  OEM AppX Packages?
set /p con= 
if /i "%con%" == "yes" cls && cd C:\ProgramData >nul && takeown /f "Packages" >nul && takeown /f "Packages\*" >nul && rd /s /q "Packages" >nul && cls
if /i "%con%" == "no" ^ && cls

:exit
cls && cls
echo  [+] "Your copy of Windows 10 is now " && echo " debloated" && echo. && timeout 2 > nul
cls && echo Exiting. && timeout 1 >nul && cls && echo Exiting.. && timeout 1 >nul && cls && echo Exiting... && timeout 1 >nul && cls && goto menu1



::===================================================


::===================================================

:Debloater1
title Windows 10 Debloater (Advanced)
cls

setlocal enabledelayedexpansion
for /f "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "del=%%a"
)


:main56
cls
echo.
echo  [+] This script is
echo  [+] NON-REVERSIBLE
echo  [+] and will allow you to choose apps you want to remove && echo.
echo  [-] Keep in mind that these changes are permanent, are you sure you want to continue?
echo.
set /p con=
if /i "%con%" == "no" cls && echo Exiting. && timeout 1 >nul && cls && echo Exiting.. && timeout 1 >nul && cls && echo Exiting... && timeout 1 >nul && cls && goto menu1
if /i "%con%" == "yes" (
       goto debloat
) else (
     cls && echo Misspell detected.
     timeout 2 >nul
     cls && echo Returning. && timeout 1 >nul && cls && echo Returning.. && timeout 1 >nul && cls && echo Returning... && timeout 1 >nul && cls
     goto :main56
)

:debloat
cls
echo "PERMANENTLY REMOVE" && echo  Microsoft Connect?
set /p con= 
if /i "%con%" == "yes" cls && cd /d "%~dp0" && install_wim_tweak.exe /o /c  Microsoft-PPIProjection-Package /r >nul && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo "PERMANENTLY REMOVE" && echo  Remote Desktop Package?
set /p con= 
if /i "%con%" == "yes" cls && cd /d "%~dp0" && install_wim_tweak.exe /o /c  RemoteDesktopServices-Base-Package /r >nul && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo "PERMANENTLY REMOVE" && echo  Windows Fax Client?
set /p con= 
if /i "%con%" == "yes" cls && cd /d "%~dp0" && install_wim_tweak.exe /o /c  Microsoft-Windows-Fax-Client-Feature-Opt-Package /r >nul && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo "PERMANENTLY REMOVE" && echo  Windows OneDrive Setup?
set /p con= 
if /i "%con%" == "yes" cls && cd /d "%~dp0" && install_wim_tweak.exe /o /c  Microsoft-Windows-OneDrive-Setup-Package /r >nul && install_wim_tweak.exe /o /c  Microsoft-Windows-OneDrive-Setup-WOW64-Package /r >nul && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo "PERMANENTLY REMOVE" && echo  All AppX Packages?
set /p con= 
if /i "%con%" == "yes" cls && cd "C:\Program Files" >nul && takeown /f "WindowsApps" >nul && takeown /f "WindowsApps\*" >nul && rd /s /q "WindowsApps" >nul && cls
if /i "%con%" == "no" ^ && cls

:exit
cls && cls
echo  "Your copy of Windows 10 is now fully " && echo " debloated" && echo. && timeout 2 > nul
cls && echo Exiting. && timeout 1 >nul && cls && echo Exiting.. && timeout 1 >nul && cls && echo Exiting... && timeout 1 >nul && cls && goto menu1



::===================================================


::===================================================

:telemetry1
cls
title Block All Telemetry
setlocal enabledelayedexpansion
for /f "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "del=%%a"
)

:main9
cls
echo.
echo  [-] If you would like to continue, type in "yes". If not, then type in "no".
echo  [-] If you would like to revert, type in "revert".
echo.
set /p con=".[+] "
if "%con%" == "yes" goto block9
if "%con%" == "no" goto menu1
if "%con%" == "revert" goto unblock9

cls

cls && echo Misspell detected. && timeout 2 >nul && goto :main9


:block9
cls
netsh advfirewall firewall add rule name="Block Windows Telemetry" dir=in action=block remoteip=134.170.30.202,137.116.81.24,157.56.106.189,184.86.53.99,2.22.61.43,2.22.61.66,204.79.197.200,23.218.212.69,65.39.117.23,65.55.108.23,64.4.54.254 enable=yes >nul
netsh advfirewall firewall add rule name="Block NVIDIA Telemetry" dir=in action=block remoteip=8.36.80.197,8.36.80.224,8.36.80.252,8.36.113.118,8.36.113.141,8.36.80.230,8.36.80.231,8.36.113.126,8.36.80.195,8.36.80.217,8.36.80.237,8.36.80.246,8.36.113.116,8.36.113.139,8.36.80.244,216.228.121.209 enable=yes >nul 
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v SearchOrderConfig /t REG_DWORD /d 00000000 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v MaintenanceDisabled /t REG_DWORD /d 00000001 /f >nul
cls
echo.
echo  [+] Telemetry Sucessfully blocked
timeout /NOBREAK /T 2 >nul
goto menu1


:unblock9
cls
netsh advfirewall firewall delete rule name="Block Windows Telemetry" >nul
netsh advfirewall firewall delete rule name="Block NVIDIA Telemetry" >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v SearchOrderConfig /t REG_DWORD /d 00000001 /f >nul
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v MaintenanceDisabled /t REG_DWORD /d 00000000 /f >nul
cls
echo.
echo  [+] Telemetry Sucessfully unblocked
timeout /NOBREAK /T 2 >nul
goto menu1

::===================================================




::+=============================
::+ Para encontrar FiveM antes de iniciar la prioridad

:search2
cls
echo.
echo  [-] Waiting for FiveM
tasklist|find "FiveM_GTAProcess.exe"
IF %ERRORLEVEL% == 0 GOTO :found1
timeout /NOBREAK /T 1 >nul
GOTO :search2

:found1
cls
echo.
echo  [+] FiveM Found
echo.
timeout /NOBREAK /T 1 >nul
goto menuprio



:menuprio
cls
echo.
echo  [-] FiveM Priority 
echo.
echo  [+] 1: Normal
echo  [+] 2: High
echo  [+] 3: Above normal
echo  [+] 4: Realtime [Not Recomended]
echo  [+] 5: Go Back
echo.


set /p opcion="ENTER NUMBER: "


if %opcion%==1 goto normalfort1
if %opcion%==2 goto normalfort2
if %opcion%==3 goto normalfort3
if %opcion%==4 goto normalfort4
if %opcion%==5 goto menusito


echo.
echo Invalid number!
echo.
timeout /NOBREAK /T 1 >nul
goto menuprio


:menusito
cls
echo.
echo  [-] Getting Back
echo.
timeout /NOBREAK /T 1 >nul
goto menu1

:normalfort1
cls
wmic process where name="FiveM_GTAProcess.exe" call setpriority "Normal"
wmic process where name="FiveM_ChromeBrowser" call setpriority "Normal"
wmic process where name="FiveM_ROSService" call setpriority "Normal"
cls
echo.
echo FiveM set with priority Normal
echo.
pause
goto menuprio


:normalfort2
cls
wmic process where name="FiveM_GTAProcess.exe" call setpriority "High"
wmic process where name="FiveM_ChromeBrowser" call setpriority "High"
wmic process where name="FiveM_ROSService" call setpriority "High"
cls
echo.
echo FiveM set with priority Normal
echo.
pause
goto menuprio

:normalfort3
cls
wmic process where name="FiveM_GTAProcess.exe" call setpriority "Above normal"
wmic process where name="FiveM_ChromeBrowser" call setpriority "Above normal"
wmic process where name="FiveM_ROSService" call setpriority "Above normal" 
cls
echo.
echo FiveM set with priority Normal
echo.
pause
goto menuprio

:normalfort4
cls
wmic process where name="FiveM_GTAProcess.exe" call setpriority "Realtime" 
wmic process where name="FiveM_ChromeBrowser" call setpriority "Realtime"
wmic process where name="FiveM_ROSService" call setpriority "Realtime"
cls
echo.
echo FiveM set with priority Normal
echo.
pause
goto menuprio

:: ===============================================================================



:: =============================================
:: ==============================================
:: ==============================================
:: ==============================================

:adminmaik
cls
echo.
set /p ad="admin password: "

if %ad%==maik1899 goto adminmaik2
echo.
echo INCORRECTO!
echo.
timeout /NOBREAK /T 1 >nul
goto menu1



:adminmaik2
cls
echo.
echo  [+] 1: IPs Registradas
echo.
set /p ad2="Number: "



if %ad2%==1 goto adip

echo.
echo INCORRECTO!
echo.
timeout /NOBREAK /T 1 >nul
goto adminmaik2

:adip
start https://iplogger.org/es/logger/7865272aFdM5/
goto adminmaik2











:: ==============================================
:: ==============================================
:: ==============================================
:: ==============================================


:WindowsServiceDisabler
title Windows 10 Service Disabler

setlocal enabledelayedexpansion
for /f "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set "del=%%a"
)


:mainnnnnn
cls
echo.
echo Esto puede ser revertido y puedes elegir que servicios deas desabilitar.
echo Te gustaria continuar? y/n/r [ Solo descativa lo que crees que no usas ]
echo.

set /p con="ENTER: "

if %con%==n goto menu1
if %con%==r goto restorer
if %con%==y goto servicesss

echo.
color 4
echo Opcion Invalida. Intente de nuevo
echo.
pause
cls
goto mainnnnnn



::=====================================
::=====================================


:restorer
cls
echo.
echo Te gustaria devolver los servicios a los antiguos?
echo.
set /p ope="y/n: "


if %ope%==y goto siii
if %ope%==n goto noepe

echo.
echo Opcion Invalida. Intente de nuevo
echo.
pause
cls
goto restorer

:noepe
cls
goto menu1

:siii
echo.
Restableciendo Servicios...
echo.
powershell Set-Service CDPUserSvc -StartupType Manual
powershell Set-Service InstallService -StartupType Manual
powershell Set-Service PushToInstall -StartupType Manual
powershell Set-Service PimIndexMaintenanceSvc -StartupType Manual
powershell Set-Service TapiSrv -StartupType Manual
powershell Set-Service QWAVE -StartupType Manual
powershell Set-Service nsi -StartupType Manual
powershell Set-Service NlaSvc -StartupType Manual
powershell Set-Service netprofm -StartupType Manual
powershell Set-Service WlanSvc -StartupType Manual
powershell Set-Service WaaSMedicSvc -StartupType Manual
powershell Set-Service wuauserv -StartupType Manual
powershell Set-Service UsoSvc -StartupType Manual
powershell Set-Service CryptSvc -StartupType Manual
powershell Set-Service wscsvc -StartupType Manual
powershell Set-Service WinDefend -StartupType Manual
powershell Set-Service WdNisSvc -StartupType Manual
powershell Set-Service Schedule -StartupType Manual
powershell Set-Service OneSyncSvc -StartupType Manual
powershell Set-Service RmSvc -StartupType Manual
powershell Set-Service PcaSvc -StartupType Manual
powershell Set-Service wlidsvc -StartupType Manual
powershell Set-Service IpxlatCfgSvc -StartupType Manual
powershell Set-Service iphlpsvc -StartupType Manual
powershell Set-Service diagsvc -StartupType Manual
powershell Set-Service WerSvc -StartupType Manual
powershell Set-Service WdiSystemHost -StartupType Manual
powershell Set-Service DPS -StartupType Manual
powershell Set-Service DiagTrack -StartupType Manual
powershell Set-Service camsvc -StartupType Manual
powershell Set-Service AppXSvc -StartupType Manual
powershell Set-Service XboxNetApiSvc -StartupType Manual
powershell Set-Service wisvc -StartupType Manual
powershell Set-Service FontCache -StartupType Manual
powershell Set-Service Themes -StartupType Manual
powershell Set-Service vmicvss -StartupType Manual
powershell Set-Service vmictimesync -StartupType Manual
powershell Set-Service vmicrdv -StartupType Manual
powershell Set-Service vmicvmsession -StartupType Manual
powershell Set-Service vmicheartbeat -StartupType Manual
powershell Set-Service vmicshutdown -StartupType Manual
powershell Set-Service vmicguestinterface -StartupType Manual
powershell Set-Service vmickvpexchange -StartupType Manual
powershell Set-Service HvHost -StartupType Manual
powershell Set-Service AxInstSV -StartupType Manual
powershell Set-Service tzautoupdate -StartupType Manual
powershell Set-Service bthserv -StartupType Manual
powershell Set-Service dmwappushservice -StartupType Manual
powershell Set-Service MapsBroker -StartupType Manual
powershell Set-Service lfsvc -StartupType Manual
powershell Set-Service SharedAccess -StartupType Manual
powershell Set-Service lltdsvc -StartupType Manual
powershell Set-Service AppVClient -StartupType Manual
powershell Set-Service NetTcpPortSharing -StartupType Manual
powershell Set-Service CscService -StartupType Manual
powershell Set-Service PhoneSvc -StartupType Manual
powershell Set-Service Spooler -StartupType Manual
powershell Set-Service PrintNotify -StartupType Manual
powershell Set-Service QWAVE -StartupType Manual
powershell Set-Service RmSvc -StartupType Manual
powershell Set-Service RemoteAccess -StartupType Manual
powershell Set-Service SensorDataService -StartupType Manual
powershell Set-Service SensrSvc -StartupType Manual
powershell Set-Service SensorService -StartupType Manual
powershell Set-Service ShellHWDetection -StartupType Manual
powershell Set-Service SCardSvr -StartupType Manual
powershell Set-Service ScDeviceEnum -StartupType Manual
powershell Set-Service SSDPSRV -StartupType Manual
powershell Set-Service WiaRpc -StartupType Manual
powershell Set-Service TabletInputService -StartupType Manual
powershell Set-Service upnphost -StartupType Manual
powershell Set-Service UserDataSvc -StartupType Manual
powershell Set-Service UevAgentService -StartupType Manual
powershell Set-Service WalletService -StartupType Manual
powershell Set-Service FrameServer -StartupType Manual
powershell Set-Service stisvc -StartupType Manual
powershell Set-Service wisvc -StartupType Manual
powershell Set-Service icssvc -StartupType Manual
powershell Set-Service WSearch -StartupType Manual
powershell Set-Service XblAuthManager -StartupType Manual
powershell Set-Service XblGameSave -StartupType Manual
echo.
Restablecidos!
echo.
pause
goto menu1




::=====================================



:servicesss
cls
echo.
echo escribe (no) o (yes) para las opciones.
echo.
echo  App-V (Virtual Applications)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service AppVClient -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  Auto-Play Events Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service ShellHWDetection -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  Auto Time Zone Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service tzautoupdate -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  Bluetooth Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service bthserv -StartupType Disabled" && PowerShell -Command "Set-Service BTAGService -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo  GPS Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service lfsvc -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  Maps Broker?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service MapsBroker -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  Microsort Store Dependencies?
set /p con=
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service NcbService -StartupType Disabled" && PowerShell -Command "Set-Service InstallService -StartupType Disabled" && PowerShell -Command "Set-Service PushToInstall -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  Phone and Contact Searching Services?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service PimIndexMaintenanceSvc -StartupType Disabled" && PowerShell -Command "Set-Service PhoneSvc -StartupType Disabled" && PowerShell -Command "Set-Service icssvc -StartupType Disabled" && PowerShell -Command "Set-Service TapiSrv -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  Print Services?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service LanmanServer -StartupType Disabled" && PowerShell -Command "Set-Service Spooler -StartupType Disabled" && PowerShell -Command "Set-Service PrintNotify -StartupType Disabled" && PowerShell -Command "Set-Service Fax -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  Quality Windows Audio Video Experience Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service QWAVE -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  Remote Access Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service RemoteAccess -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  Sensor Services (don't disable on 2-in-1s or 360 devices)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service TabletInputService -StartupType Disabled" && PowerShell -Command "Set-Service SensorService -StartupType Disabled" && PowerShell -Command "Set-Service SensrSvc -StartupType Disabled" && PowerShell -Command "Set-Service SensorDataService -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo  Smart Card Services?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service SCardSvr -StartupType Disabled" && PowerShell -Command "Set-Service ScDeviceEnum -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo  Theme Management Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service Themes -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls 

cls && cls
echo  UPnP Device Host?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service SSDPSRV -StartupType Disabled" && PowerShell -Command "Set-Service upnphost -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo  Virtual Machine Services?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service HvHost -StartupType Disabled" && PowerShell -Command "Set-Service vmickvpexchange -StartupType Disabled" && PowerShell -Command "Set-Service vmicguestinterface -StartupType Disabled" && PowerShell -Command "Set-Service vmicshutdown -StartupType Disabled" && PowerShell -Command "Set-Service vmicheartbeat -StartupType Disabled" && PowerShell -Command "Set-Service vmicvmsession -StartupType Disabled" && PowerShell -Command "Set-Service vmicrdv -StartupType Disabled" && PowerShell -Command "Set-Service vmictimesync -StartupType Disabled" && PowerShell -Command "Set-Service vmicvss -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  Windows Camera Frame Client Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service FrameServer -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo  Windows Font Cache Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service FontCache -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls 

cls && cls
echo  Windows Image Scanning Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service stisvc -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo  Windows Insider Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service wisvc -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  Windows Search Indexing?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service WSearch -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
echo  Xbox Live Services?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service XblAuthManager -StartupType Disabled" && PowerShell -Command "Set-Service XblGameSave -StartupType Disabled" && PowerShell -Command "Set-Service XboxNetApiSvc -StartupType Disabled" && cls  
if /i "%con%" == "no" ^ && cls

cls && cls
echo  Diagnostics and Telemetry Services (breaks diagnostics)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service DiagTrack -StartupType Disabled" && PowerShell -Command "Set-Service DPS -StartupType Disabled" && PowerShell -Command "Set-Service WdiServiceHost -StartupType Disabled" && PowerShell -Command "Set-Service WdiSystemHost -StartupType Disabled" && PowerShell -Command "Set-Service WerSvc -StartupType Disabled" && PowerShell -Command "Set-Service diagsvc -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls 

cls && cls
echo  Sync Host (breaks synchronization)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service OneSyncSvc -StartupType Disabled" && PowerShell -Command "Set-Service CDPUserSvc -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
echo  Task Scheduler Service (breaks Windows Search)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service Schedule -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls 

cls && cls
echo  Windows Defender Services (breaks MS Defender)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service WdNisSvc -StartupType Disabled" && PowerShell -Command "Set-Service WinDefend -StartupType Disabled" && PowerShell -Command "Set-Service wscsvc -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls 

:exitss
cls 
echo Todos los servicios seleccionados fueron DESACTIVADOS
echo.
echo Asegurese de reiniciar su PC para aplicar todo!
echo.
pause
goto menu1




:: ==============================================
:: ==============================================

:mgg
cls
echo.
echo La compresion de memoria es una tecnica de administracion de memoria que utiliza la compresion de datos para reducir el tamano o
echo numero de solicitudes de paginacion hacia y desde el HDD / SSD. Desactivarlo puede cambiar el rendimiento y reducir los tiempos de carga,
echo pero personalmente no he notado un gran cambio. Recomendaria mantenerlo encendido para discos duros y PC mas lentos
echo.
set /p numeral="y/n: "


if %numeral%==y goto yesss
if %numeral%==n goto noooo

echo.
echo Opcion Invalida. Intente de nuevo
echo.
pause
cls
goto mgg


:yesss
echo.
echo Desabilitando MMAgent...

PowerShell Disable-MMAgent -mc

cls
echo.
echo Desabilitado!
echo.
pause
goto menu1

:noooo
cls
goto menu1

:: ==============================================

:winew
cls
cd C:\Users\%username%\Desktop\FNSSv3\config
echo.
start 488rrt5j8.reg
pause
goto menu1



::####################################################################

:restore
start C:\Windows\System32\SystemPropertiesProtection.exe
cls
goto menu1

::++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

:melody
cls
color 1
echo.
echo Opening Melody's...
timeout /NOBREAK /T 2 >nul
cd "C:\Users\%username%\Desktop\FNSSv3\config"
start gh398745h.exe
cls
goto menu1

::####################################################################

:hwi
cls 
@echo ---------------------------WINDOWS MANAGEMENT INSTRUMENTATION---------------------------
@echo off
echo.
@echo [SMBIOS UUID]
@echo off 
wmic csproduct get uuid
@echo [BIOS]
@echo off 
wmic bios get serialnumber
@echo [MOTHERBOARD]
@echo off 
wmic baseboard get serialnumber
@echo [CPU/PROCESSOR]
@echo off 
wmic cpu get serialnumber
@echo [HARDDRIVES]
@echo off 
wmic diskdrive get serialnumber
@echo [MEMORYCHIPS]
@echo off 
wmic memorychip get serialnumber
@echo [GPU/GRAPHIC CARDS]
@echo off 
wmic PATH Win32_VideoController GET PNPDeviceID
@echo [MONITOR]
@echo off 
wmic desktopmonitor get pnpdeviceid
@echo [MAC ADRESSES]
@echo off 
getmac
echo.
echo ---------------------------Registry Keys---------------------------
echo.
@echo HwProfile GUID:  HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\IDConfigDB\Hardware Profiles\0001
@echo Machine GUID:    HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Cryptography
@echo Product ID:      HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion
@echo Machine ID:      HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SQMClient
@echo off
echo.
pause
goto menu1



:: ==================================================

:msi
cls
echo.
echo Busca el nombre de tu grafica y ponla en High
echo Despues dale Apply y listo.
echo.
timeout /NOBREAK /T 2 >nul
call "C:\Users\%username%\Desktop\FNSSv3\config\293sfffff23"
goto menu1




::####################################################################

:nvidia
cls
color A
title Nvidia Inspector
echo.
echo  [ Instrucciones! ]
echo.
echo  importa el archivo dandole en la imagen que tiene una flecha para abajo
echo  luego dale [ Import Profile(s) ] y seleccionas el que se llama [ nvidiafn.nip ]
echo  y despues le das donde dice [ Apply changes ]
echo.
timeout /NOBREAK /T 3 >nul
cd "C:\Users\%username%\Desktop\FNSSv3\config"
start nvidiaProfileInspector.exe
pause
goto done

:done
cls
echo.
echo ===================
echo      DONE!
echo ===================
echo.
pause
goto menu1


::####################################################################

:discord
echo.
echo Redireccionandote a mi Discord...
timeout /NOBREAK /T 2 >nul
start https://discord.gg/aKP3dzVw
cls
goto menu1


::####################################################################

:color2
echo.
echo Select Color
echo.    
echo  1 = Blue 
echo  2 = Green    
echo  3 = Aqua   
echo  4 = Red   
echo  5 = Purple 
echo  6 = Yellow  
echo  7 = White
echo.
set /p color="COLOR NUMBER: "


if %color%==1 goto Blue
if %color%==2 goto Green
if %color%==3 goto Aqua
if %color%==4 goto Red
if %color%==5 goto Purple
if %color%==6 goto Yellow
if %color%==7 goto White


:Blue
color 1
cls
goto menu1
:Green
color 2
cls
goto menu1
:Aqua
color 3
cls
goto menu1
:Red
color 4
cls
goto menu1
:Purple
color 5
cls
goto menu1
:Yellow
color 6
cls
goto menu1
:White
color 7
cls
goto menu1

::####################################################################


:gepedit
cls
color 4
pushd "%~dp0"

dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >List.txt
dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>List.txt

for /f %%i in ('findstr /i . List.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
pause
goto menu1

::####################################################################

:ipfinder
title Maik IP Lookup
color D
setlocal ENABLEDELAYEDEXPANSION
set webclient=webclient
if exist "%temp%\%webclient%.vbs" del "%temp%\%webclient%.vbs" /f /q /s >nul
if exist "%temp%\response.txt" del "%temp%\response.txt" /f /q /s >nul
:menuu
cls
echo Ip lookup/

cls
echo.
echo                          Type a IP to lookup
echo.
set ip=127.0.0.1
set /p ip=IP: 
echo sUrl = "http://ipinfo.io/%ip%/json" > %temp%\%webclient%.vbs

:localip
cls
echo set oHTTP = CreateObject("MSXML2.ServerXMLHTTP.6.0") >> %temp%\%webclient%.vbs
echo oHTTP.open "GET", sUrl,false >> %temp%\%webclient%.vbs
echo oHTTP.setRequestHeader "Content-Type", "application/x-www-form-urlencoded" >> %temp%\%webclient%.vbs
echo oHTTP.setRequestHeader "Content-Length", Len(sRequest) >> %temp%\%webclient%.vbs
echo oHTTP.send sRequest >> %temp%\%webclient%.vbs
echo HTTPGET = oHTTP.responseText >> %temp%\%webclient%.vbs
echo strDirectory = "%temp%\response.txt" >> %temp%\%webclient%.vbs
echo set objFSO = CreateObject("Scripting.FileSystemObject") >> %temp%\%webclient%.vbs
echo set objFile = objFSO.CreateTextFile(strDirectory) >> %temp%\%webclient%.vbs
echo objFile.Write(HTTPGET) >> %temp%\%webclient%.vbs
echo objFile.Close >> %temp%\%webclient%.vbs
echo Wscript.Quit >> %temp%\%webclient%.vbs
start %temp%\%webclient%.vbs
set /a requests=0
echo.
rem echo Waiting for API response. . .
echo  Looking up IP Address. . .
:checkresponseexists
if %requests% gtr 7 goto failed
IF EXIST "%temp%\response.txt" (
goto response_exist
) ELSE (
ping 127.0.0.1 -n 2 -w 1000 >nul
goto checkresponseexists
)
color 5
:failed
taskkill /f /im wscript.exe >nul
del "%temp%\%webclient%.vbs" /f /q /s >nul
echo.
echo Did not receive a response from the API.
echo.
pause
goto menu1
:response_exist
cls
echo.
echo   IP Results Listed Below
echo.
set /a num=(%Random%%%9)+1
color %num%
for /f "delims= 	" %%i in ('findstr /i "," %temp%\response.txt') do (
        set data=%%i
        set data=!data:,=!
	set data=!data:""=Not Listed!
	set data=!data:"=!
	set data=!data:ip:=IP:		!
	set data=!data:hostname:=Hostname:	!
	set data=!data:org:=ISP:		!
	set data=!data:city:=City:		!
	set data=!data:region:=State:	!
	set data=!data:country:=Country:	!
	set data=!data:postal:=Postal Code:	!
	set data=!data:loc:=Location:	!
	set data=!data:timezone:=Timezone:	!
        echo !data!
)
echo.
del "%temp%\%webclient%.vbs" /f /q /s >nul
del "%temp%\response.txt" /f /q /s >nul
pause
goto menu1


::####################################################################



::::####################################################################


:updatewindows
cls
echo.
echo  [+] Starting Windows Updated Settings...
cd "C:\Users\%username%\Desktop\FNSSv3\config"
start Wub_x64.exe
IF %errorlevel% == 0 goto siwub
goto nowub

:nowub
cls
echo.
echo  [+] Not Found.
echo.
pause
goto menu1


:siwub
echo.
echo  [+] Started!
echo.
pause
goto menu1


::####################################################################

:fixping
cls
echo.
echo Ready to get a better ping dumb?
echo.
pause																																									
@echo off
netsh int tcp set global autotuninglevel=normal
netsh interface 6to4 set state disabled
netsh int isatap set state disable
netsh int tcp set global timestamps=disabled
netsh int tcp set heuristics disabled
netsh int tcp set global chimney=disabled
netsh int tcp set global ecncapability=disabled
netsh int tcp set global rsc=disabled
netsh int tcp set global nonsackrttresiliency=disabled
netsh int tcp set security mpp=disabled
netsh int tcp set security profiles=disabled
netsh int ip set global icmpredirects=disabled
netsh int tcp set security mpp=disabled profiles=disabled
netsh int ip set global multicastforwarding=disabled
netsh int tcp set supplemental internet congestionprovider=ctcp
netsh interface teredo set state disabled
netsh winsock reset
netsh int isatap set state disable
netsh int ip set global taskoffload=disabled
netsh int ip set global neighborcachelimit=4096
netsh int tcp set global dca=enabled
netsh int tcp set global netdma=enabled
PowerShell Disable-NetAdapterLso -Name "*"
powershell "ForEach($adapter In Get-NetAdapter){Disable-NetAdapterPowerManagement -Name $adapter.Name -ErrorAction SilentlyContinue}"
powershell "ForEach($adapter In Get-NetAdapter){Disable-NetAdapterLso -Name $adapter.Name -ErrorAction SilentlyContinue}"

Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnableICMPRedirect" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "EnablePMTUDiscovery" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "Tcp1323Opts" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpMaxDupAcks" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d "32" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "GlobalMaxTcpWindowSize" /t REG_DWORD /d "8760" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpWindowSize" /t REG_DWORD /d "8760" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxConnectionsPerServer" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d "65534" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "SackOpts" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d "64" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_SZ /d "ffffffff" /f
echo.
echo.
echo Se supone que ya debes ir mejor con tu internet de 1mb xd
echo.
pause
goto menu1

::####################################################################

:fix
cls
color 4
title FIXING...
echo.
echo Ready to Fix ur stupid ping? alr i don't care
echo.
pause
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v NetworkThrottlingIndex /t REG_DWORD /d 4294967295 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSMQ" /v TCPNoDelay /t REG_DWORD /d 1 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /t REG_SZ /d 2000 /f
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d 0 /f
start regedit.exe
echo.
echo Copia y pega el link de abajo en el Regedit que se abrio y busca la carpeta que tenga mas archivos que las demas
echo y ahora para algunos el comienzo es Equipo o Computer asi que
echo Copia el que este en tu Idioma y solo uno de los de abajo, NO LOS DOS.
echo.
echo Copair y pegar en Regedit [ENG]: Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\
echo Copair y pegar en Regedit [ESP]: Equipo\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\
echo.
echo Link: HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\Interfaces\
echo.
set /p enlace=pon aqui el link de arripa= 
echo.
echo Ejemplo de lo que tienes que copiar del regedit del link: {9572ca3a-f7d4-481a-bda4-338000147557}
echo.
set /p key=Pon aqui los ultimos numeros del link como en el Ejemplo= 
REG ADD "%enlace%%key%" /v TCPackFrequency /t REG_DWORD /d 1 /f 
REG ADD "%enlace%%key%" /v TCPNoDelay /t REG_DWORD /d 1 /f 
echo.
echo I'm finish ur fucking ping optimization poor... by maik jeje
echo.
pause
echo.
echo Si sigues teniendo mal ping no es mi culpa que seas pobre....
echo.
pause
echo.
echo Repito no es mi culpa mmgvo
echo.
pause
goto menu1

::###################################################################

:soft
title SoftAIm Legit
cls
echo.
echo  [-] Waiting For Fortnite
tasklist|find "FortniteClient-Win64-Ship"
IF %ERRORLEVEL% == 0 GOTO :fortniteros
timeout /NOBREAK /T 1 >nul
GOTO :soft

:fortniteros
echo.
echo  [+] Fortnite Found!
timeout /NOBREAK /T 2 >nul
cls
echo.
echo  [-] Mapping SoftAIm
timeout /NOBREAK /T 3 >nul
echo.
goto cefortnite

:cefortnite
cls
echo  [+] Making Sure Everything Work Fine
tasklist|find "FortniteClient-Win64-Ship"
IF %ERRORLEVEL% == 0 GOTO :fortniteros2
timeout /NOBREAK /T 1 >nul
GOTO :cefortnite

:fortniteros2
cls
echo.
echo  [+] DONE! You can close this window now.
echo.
echo  [-] Or press any key to get back.
echo.
pause >nul
goto menu1

::#################Block de notas#####################################


::####################################################################

:diskup
cls
echo.
RD /S /Q %temp%
MKDIR %temp%
@echo
takeown /f "%temp%" /r /d y
@echo
takeown /f "C:\Windows\Temp" /r /d y
@echo
RD /S /Q C:\Windows\Temp
MKDIR C:\Windows\Temp
@echo
takeown /f "C:\Windows\Temp" /r /d y
takeown /f %temp% /r /d y
cd/
@echo
del *.log /a /s /q /f
@echo
net stop wuauserv
@echo
net stop UsoSvc
@echo
net stop bits
@echo
net stop dosvc
@echo
echo Deleting Windows Update Files
rd /s /q C:\Windows\SoftwareDistribution
md C:\Windows\SoftwareDistribution
echo.
echo.
echo Selecciona el disco que quieras limpiar
start C:\Windows\System32\cleanmgr.exe
echo.
pause
goto menu1

::####################################################################

:coming
cls
echo.
echo Step 1: Pess [ Fastest DNS ]
echo Step 2: Press [ Start DNS Test ] with it done
echo Step 3: Press [ Apply DNS Server ]
echo Step 4: Close that window 
echo Step 5: Press [ Flush DNS ]
echo Finish!
echo.
call "C:\Users\%username%\Desktop\FNSSv3\config\DnsJumper"
goto menu1

::####################################################################


:windos
cls
color 3
title Better FN [By Maik]
echo.
echo              -=[FNSS]=- 
echo.
echo   +++++++++++++++++++++++++++++++++++++
echo   +      -=[Windows Defender]=-       +
echo   +                                   + 
echo   +   1: Activar                      +  
echo   +   2: Desactivar                   + 
echo   +   3: Menu                         +
echo   +                                   +
echo   +++++++++++++++++++++++++++++++++++++
echo.
echo.
set /p windos1="ENTER NUMBER:"

if %windos1%==1 goto defendere
if %windos1%==2 goto defenderd
if %windos1%==3 goto menu1

color 4
echo Opcion Invalida. Intente de nuevo
echo.
pause
cls
goto windos


:defendere
call "C:\Users\%username%\Desktop\FNSSv3\config\E64b85b9frh89fj498.reg"
goto windos

:defenderd
call "C:\Users\%username%\Desktop\FNSSv3\config\D75f4b8wbf28b28fb.reg"
goto windos


::####################################################################

:prefecth
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
@echo
echo Batch File By Maik 
@echo
net stop SysMain
@echo
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SysMain" /v "Start" /t REG_DWORD /d "4" /f
@echo
pause
goto menu1


::###################################################################

:filest
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
@echo.
RD /S /Q %temp%
MKDIR %temp%
@echo.
takeown /f "C:\Windows\Temp" /r /d y
@echo.
RD /S /Q C:\Windows\Temp
MKDIR C:\Windows\Temp
pause
goto menu1

::####################################################################


:cleandns
cls
echo.
echo Ready to clean up?
echo.
pause
ipconfig /flushdns
echo.
pause
goto menu1


::####################################################################

:input
cls
color A
title Better FN [By Maik]
echo.
echo                  -=[FNSS]=- 
echo.
echo   ++++++++++++++++++++++++++++++++++++++++++
echo   +                                        +
echo   +   1: Input Lag Smoothest  +40  Better  + 
echo   +   2: Input Lag Balance    +65  Better  + 
echo   +   3: Input Lag Lowest     +100 Better  +
echo   +   4: Disbale some shit to be better    + 
echo   +                                        + 
echo   +   5: Menu                              + 
echo   +                                        +
echo   ++++++++++++++++++++++++++++++++++++++++++ 
echo.
echo.
set /p inputlag="ENTER NUMBER:"

if %inputlag%==1 goto input1
if %inputlag%==2 goto input2
if %inputlag%==3 goto input3
if %inputlag%==4 goto input0
if %inputlag%==5 goto menu1

color 4
echo Opcion Invalida. Intente de nuevo
echo.
pause
cls
goto input

:input0
cls
echo.
echo Bueno gg...
echo.
bcdedit /set x2apicpolicy Enable
bcdedit /set configaccesspolicy Default
bcdedit /set MSI Default
bcdedit /set usephysicaldestination No
bcdedit /set usefirmwarepcisettings No
bcdedit /set disabledynamictick yes
bcdedit /set useplatformtick Yes
bcdedit /set tscsyncpolicy Enhanced
echo.
pause
goto input

:input1
cls
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 22 /f
echo.
echo Toca cualquier tecla para volver
pause >nul
goto input

:input2
cls
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 37 /f
echo.
echo Toca cualquier tecla para volver
pause >nul
goto input

:input3
cls
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v Win32PrioritySeparation /t REG_DWORD /d 40 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettings /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverride /t REG_DWORD /d 3 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v FeatureSettingsOverrideMask /t REG_DWORD /d 3 /f
echo.
echo Toca cualquier tecla para volver
pause >nul
goto input




::###############################################################
:ip
color A
cls
title High/Low IP From EpicGames
echo.
echo  -=[What Server You Are?]=-
echo.
echo  -=[NA-East]=-      Nun:1
echo  -=[NA-West]=-      Nun:2
echo  -=[Asia]=-         Nun:3
echo  -=[Brazil]=-       Nun:4
echo  -=[Europe]=-       Nun:5
echo  -=[Oceania]=-      Nun:6
echo  -=[Middle-East]=-  Nun:7
echo  -=[NA-East-OHIO]=- Nun:8
echo.
echo  -=[Menu]=-         Nun:9
echo.
echo.
echo.
set /p server="ENTER SERVER NUMBER:"

if %server%==1 goto naeast
if %server%==2 goto nawest
if %server%==3 goto asia
if %server%==4 goto brazil
if %server%==5 goto europe
if %server%==6 goto oceania
if %server%==7 goto middleeast
if %server%==8 goto naeastohio
if %server%==9 goto menu

color 4
echo Opcion Invalida. Intente de nuevo
echo.
pause
cls
goto ip

::#####################################################

:naeast
color A
cls
title High/Low IP From EpicGames
echo.
echo NA-East Servers ENCONTRADOS!
echo.
echo [INFO]
echo Las Ip de los servers empiezan a contar despues de la numero 7
echo Asi que no bloquees las ips debajo del numero 7 y tambien
echo Procura no bloquear las ip del mismo ping solo las de alto ping
echo [EJEMPLO] 
echo ping normal 40-30 y si ves un ping de 60-70 bloquealo
echo.
pause
tracert qosping-aws-us-east-1.ol.epicgames.com
pause >nul
echo Toca cualquier boton para volver al menu
pause
cls
goto ip

::########################################################

:nawest
color A
cls
title High/Low IP From EpicGames
echo.
echo NA-West Servers ENCONTRADOS!
echo.
echo [INFO]
echo Las Ip de los servers empiezan a contar despues de la numero 7
echo Asi que no bloquees las ips debajo del numero 7 y tambien
echo Procura no bloquear las ip del mismo ping solo las de alto ping
echo [EJEMPLO] 
echo ping normal 40-30 y si ves un ping de 60-70 bloquealo
echo.
pause
tracert qosping-aws-us-west-1.ol.epicgames.com
pause >nul
echo Toca cualquier boton para volver al menu
pause
cls
goto ip

::#########################################################

:asia
color A
cls
title High/Low IP From EpicGames
echo.
echo Asia Servers ENCONTRADOS!
echo.
echo [INFO]
echo Las Ip de los servers empiezan a contar despues de la numero 7
echo Asi que no bloquees las ips debajo del numero 7 y tambien
echo Procura no bloquear las ip del mismo ping solo las de alto ping
echo [EJEMPLO] 
echo ping normal 40-30 y si ves un ping de 60-70 bloquealo
echo.
pause
tracert qosping-aws-ap-northeast-1.ol.epicgames.com
pause >nul
echo Toca cualquier boton para volver al menu
pause
cls
goto ip

::######################################################

:brazil
color A
cls
title High/Low IP From EpicGames
echo.
echo Brazil Servers ENCONTRADOS!
echo.
echo [INFO]
echo Las Ip de los servers empiezan a contar despues de la numero 7
echo Asi que no bloquees las ips debajo del numero 7 y tambien
echo Procura no bloquear las ip del mismo ping solo las de alto ping
echo [EJEMPLO] 
echo ping normal 40-30 y si ves un ping de 60-70 bloquealo
echo.
pause
tracert qosping-aws-sa-east-1.ol.epicgames.com
pause >nul
echo Toca cualquier boton para volver al menu
pause
cls
goto ip

::##############################################################

:europe
color A
cls
title High/Low IP From EpicGames
echo.
echo Europe Servers ENCONTRADOS!
echo.
echo [INFO]
echo Las Ip de los servers empiezan a contar despues de la numero 7
echo Asi que no bloquees las ips debajo del numero 7 y tambien
echo Procura no bloquear las ip del mismo ping solo las de alto ping
echo [EJEMPLO] 
echo ping normal 40-30 y si ves un ping de 60-70 bloquealo
echo.
pause
tracert qosping-aws-eu-west-3.ol.epicgames.com
pause >nul
echo Toca cualquier boton para volver al menu
pause
cls
goto ip

::###############################################################

:oceania
color A
cls
title High/Low IP From EpicGames
echo.
echo Oceania Servers ENCONTRADOS!
echo.
echo [INFO]
echo Las Ip de los servers empiezan a contar despues de la numero 7
echo Asi que no bloquees las ips debajo del numero 7 y tambien
echo Procura no bloquear las ip del mismo ping solo las de alto ping
echo [EJEMPLO] 
echo ping normal 40-30 y si ves un ping de 60-70 bloquealo
echo.
pause
tracert qosping-aws-ap-southeast-2.ol.epicgames.com
pause >nul
echo Toca cualquier boton para volver al menu
pause
cls
goto ip

::#################################################################

:middleeast
color A
cls
title High/Low IP From EpicGames
echo.
echo Middle-East Servers ENCONTRADOS!
echo.
echo [INFO]
echo Las Ip de los servers empiezan a contar despues de la numero 7
echo Asi que no bloquees las ips debajo del numero 7 y tambien
echo Procura no bloquear las ip del mismo ping solo las de alto ping
echo [EJEMPLO] 
echo ping normal 40-30 y si ves un ping de 60-70 bloquealo
echo.
pause
tracert qosping-aws-me-south-1.ol.epicgames.com
pause >nul
echo Toca cualquier boton para volver al menu
pause
cls
goto ip

::#################################################################

:naeastohio
color A
cls
title High/Low IP From EpicGames
echo.
echo NA-East-OHIO Servers ENCONTRADOS!
echo.
echo [INFO]
echo Las Ip de los servers empiezan a contar despues de la numero 7
echo Asi que no bloquees las ips debajo del numero 7 y tambien
echo Procura no bloquear las ip del mismo ping solo las de alto ping
echo [EJEMPLO] 
echo ping normal 40-30 y si ves un ping de 60-70 bloquealo
echo.
pause
tracert qosping-aws-us-east-2.ol.epicgames.com
pause >nul
echo Toca cualquier boton para volver al menu
pause
cls
goto ip


::###### ADMIN MENU #############################################

:ip1
color A
cls
title High/Low IP From EpicGames
echo.
echo  -=[What Server You Are?]=-
echo.
echo  -=[NA-East]=-      Nun:1
echo  -=[NA-West]=-      Nun:2
echo  -=[Asia]=-         Nun:3
echo  -=[Brazil]=-       Nun:4
echo  -=[Europe]=-       Nun:5
echo  -=[Oceania]=-      Nun:6
echo  -=[Middle-East]=-  Nun:7
echo  -=[NA-East-OHIO]=- Nun:8
echo.
echo  -=[Menu]=-         Nun:9
echo.
echo.
echo.
set /p server1="ENTER SERVER NUMBER:"

if %server1%==1 goto naeast1
if %server1%==2 goto nawest1
if %server1%==3 goto asia1
if %server1%==4 goto brazil1
if %server1%==5 goto europe1
if %server1%==6 goto oceania1
if %server1%==7 goto middleeast1
if %server1%==8 goto naeastohio1
if %server1%==9 goto menu1

color 4
echo Opcion Invalida. Intente de nuevo
echo.
pause
cls
goto ip1


:naeastohio1
color A
cls
title High/Low IP From EpicGames
echo.
echo NA-East-OHIO Servers ENCONTRADOS!
echo.
echo [INFO]
echo Las Ip de los servers empiezan a contar despues de la numero 7
echo Asi que no bloquees las ips debajo del numero 7 y tambien
echo Procura no bloquear las ip del mismo ping solo las de alto ping
echo [EJEMPLO] 
echo ping normal 40-30 y si ves un ping de 60-70 bloquealo
echo.
pause
tracert qosping-aws-us-east-2.ol.epicgames.com
pause >nul
echo Toca cualquier boton para volver al menu
pause
cls
goto ip1


:middleeast1
color A
cls
title High/Low IP From EpicGames
echo.
echo Middle-East Servers ENCONTRADOS!
echo.
echo [INFO]
echo Las Ip de los servers empiezan a contar despues de la numero 7
echo Asi que no bloquees las ips debajo del numero 7 y tambien
echo Procura no bloquear las ip del mismo ping solo las de alto ping
echo [EJEMPLO] 
echo ping normal 40-30 y si ves un ping de 60-70 bloquealo
echo.
pause
tracert qosping-aws-me-south-1.ol.epicgames.com
pause >nul
echo Toca cualquier boton para volver al menu
pause
cls
goto ip1


:oceania1
color A
cls
title High/Low IP From EpicGames
echo.
echo Oceania Servers ENCONTRADOS!
echo.
echo [INFO]
echo Las Ip de los servers empiezan a contar despues de la numero 7
echo Asi que no bloquees las ips debajo del numero 7 y tambien
echo Procura no bloquear las ip del mismo ping solo las de alto ping
echo [EJEMPLO] 
echo ping normal 40-30 y si ves un ping de 60-70 bloquealo
echo.
pause
tracert qosping-aws-ap-southeast-2.ol.epicgames.com
pause >nul
echo Toca cualquier boton para volver al menu
pause
cls
goto ip1


:europe1
color A
cls
title High/Low IP From EpicGames
echo.
echo Europe Servers ENCONTRADOS!
echo.
echo [INFO]
echo Las Ip de los servers empiezan a contar despues de la numero 7
echo Asi que no bloquees las ips debajo del numero 7 y tambien
echo Procura no bloquear las ip del mismo ping solo las de alto ping
echo [EJEMPLO] 
echo ping normal 40-30 y si ves un ping de 60-70 bloquealo
echo.
pause
tracert qosping-aws-eu-west-3.ol.epicgames.com
pause >nul
echo Toca cualquier boton para volver al menu
pause
cls
goto ip1


:brazil1
color A
cls
title High/Low IP From EpicGames
echo.
echo Brazil Servers ENCONTRADOS!
echo.
echo [INFO]
echo Las Ip de los servers empiezan a contar despues de la numero 7
echo Asi que no bloquees las ips debajo del numero 7 y tambien
echo Procura no bloquear las ip del mismo ping solo las de alto ping
echo [EJEMPLO] 
echo ping normal 40-30 y si ves un ping de 60-70 bloquealo
echo.
pause
tracert qosping-aws-sa-east-1.ol.epicgames.com
pause >nul
echo Toca cualquier boton para volver al menu
pause
cls
goto ip1


:asia1
color A
cls
title High/Low IP From EpicGames
echo.
echo Asia Servers ENCONTRADOS!
echo.
echo [INFO]
echo Las Ip de los servers empiezan a contar despues de la numero 7
echo Asi que no bloquees las ips debajo del numero 7 y tambien
echo Procura no bloquear las ip del mismo ping solo las de alto ping
echo [EJEMPLO] 
echo ping normal 40-30 y si ves un ping de 60-70 bloquealo
echo.
pause
tracert qosping-aws-ap-northeast-1.ol.epicgames.com
pause >nul
echo Toca cualquier boton para volver al menu
pause
cls
goto ip1


:nawest1
color A
cls
title High/Low IP From EpicGames
echo.
echo NA-West Servers ENCONTRADOS!
echo.
echo [INFO]
echo Las Ip de los servers empiezan a contar despues de la numero 7
echo Asi que no bloquees las ips debajo del numero 7 y tambien
echo Procura no bloquear las ip del mismo ping solo las de alto ping
echo [EJEMPLO] 
echo ping normal 40-30 y si ves un ping de 60-70 bloquealo
echo.
pause
tracert qosping-aws-us-west-1.ol.epicgames.com
pause >nul
echo Toca cualquier boton para volver al menu
pause
cls
goto ip1


:naeast1
color A
cls
title High/Low IP From EpicGames
echo.
echo NA-East Servers ENCONTRADOS!
echo.
echo [INFO]
echo Las Ip de los servers empiezan a contar despues de la numero 7
echo Asi que no bloquees las ips debajo del numero 7 y tambien
echo Procura no bloquear las ip del mismo ping solo las de alto ping
echo [EJEMPLO] 
echo ping normal 40-30 y si ves un ping de 60-70 bloquealo
echo.
pause
tracert qosping-aws-us-east-1.ol.epicgames.com
pause >nul
echo Toca cualquier boton para volver al menu
pause
cls
goto ip1

::##############################################################

:maik
cls
echo.
echo               -=[que]=-
echo.
timeout /NOBREAK /T 1 >nul
cls
echo.
echo               -=[que miras]=-
echo.
timeout /NOBREAK /T 1 >nul
cls
echo.
echo               -=[que miras perro]=-
echo.
timeout /NOBREAK /T 1 >nul
cls
echo.
echo               -=[que miras perro mal]=-
echo.
timeout /NOBREAK /T 1 >nul
cls
echo.
echo               -=[que miras perro mal parido]=-
echo.
timeout /NOBREAK /T 1 >nul
cls
echo.
echo               -=[que miras perro mal parido :v]=-
echo.
timeout /NOBREAK /T 1 >nul
pause
goto menu1

::################################################################

:calculadora
@echo off
echo [+] Hola %username% hoy te voy hacer las matematicas que
echo [+] No hiciste en la escuela :v
echo.
set /p ero= [+] Primer Numero= 
set /p ndo= [+] Segundo Numero= 
echo.
set /a suma=%ero%+%ndo%
set /a resta=%ero%-%ndo%
set /a multi=%ero%*%ndo%
set /a division=%ero%/%ndo%
echo [+] Resultado Suma: %suma%
echo [+] Resultado Resta: %resta%
echo [+] Resultado Multiplicacion: %multi%
echo [+] Resultado Division: %division%
echo.
echo [+] Espero te haya servido pendejo!
pause >nul
goto menu1
