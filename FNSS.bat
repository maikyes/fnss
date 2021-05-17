@echo off

:: ============================= ESTATUS DEL PROGRAMA v2 =============================

cd C:\Users\%username%\AppData\Local\Temp
set local=36.0
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

bitsadmin /transfer "FNSS Check" /download /priority foreground https://github.com/maikyes/Update/archive/main2.zip "C:\Users\%username%\AppData\Local\Temp\main2.zip"

powershell.exe -nologo -noprofile -command "& { $shell = New-Object -COM Shell.Application; $target = $shell.NameSpace('C:\Users\%username%\AppData\Local\Temp'); $zip = $shell.NameSpace('C:\Users\%username%\AppData\Local\Temp\main2.zip'); $target.CopyHere($zip.Items(), 16); }"

cls

powershell -command "Expand-Archive main2.zip -DestinationPath C:\Users\%username%\AppData\Local\Temp"

cls

xcopy /i /s /y "C:\Users\%username%\AppData\Local\Temp\Update-main2" "C:\Users\%username%\AppData\Local\Temp"

cd C:\Users\%username%\AppData\Local\Temp
CALL "files.bat"
CALL "status.bat"
goto check-2



:check-2
IF "%local%"=="%localtwo%" goto :yes
IF NOT "%local%"=="%localtwo%" goto :no

:yes
cls
echo No updates found. Version: %local%
timeout /NOBREAK /T 1 >nul
goto home4

:no
cls
echo Update found! Version: %local%
timeout /NOBREAK /T 1 >nul
goto act








:: ============================= PCs Registradas para usar el programa =============================

:home4
echo.
for /f "delims=[] tokens=2" %%a in ('ping -4 -n 1 %ComputerName% ^| findstr [') do set NetworkIP=%%a
echo Network IP: %NetworkIP%


cd "%userprofile%\documents"
if exist "cmdacoBin" goto ski
if not exist "cmdacoBin" goto noskip3

:noskip3
md "cmdacoBin"
goto ski

:ski
cd "%userprofile%\documents\cmdacoBin"
if exist "DEBUG.bat" goto call2
if not exist "DEBUG.bat" goto skip4


:skip4
echo set netip=192.168.1.124> "DEBUG.dll"
echo set netip=192.168.0.16>> "DEBUG.dll"
echo set netip=192.168.0.5>> "DEBUG.dll"
echo set netip=192.168.1.3>> "DEBUG.dll"
echo set netip=maiko>> "DEBUG.dll"
echo set netip=Skrt Killero>> "DEBUG.dll"
echo set netip=alanc>> "DEBUG.dll"
echo set netip=santy>> "DEBUG.dll"
echo set netip=Yesid>> "DEBUG.dll"
echo set netip=unrx>> "DEBUG.dll"
echo set netip=mayko>> "DEBUG.dll"
echo set netip=carlos cabassa>> "DEBUG.dll"
echo set netip=Raul>> "DEBUG.dll"
echo set netip=GAMER>> "DEBUG.dll"
echo set netip=ESMERLIN MARTE>> "DEBUG.dll"


goto call2



:call2
call "DEBUG.bat"


if "%NetworkIP%"=="192.168.1.124" goto namexist9
if "%NetworkIP%"=="192.168.0.16" goto namexist9
if "%NetworkIP%"=="192.168.0.5" goto namexist9
if "%NetworkIP%"=="192.168.1.3" goto namexist9
if "%username%"=="maiko" goto namexist9
if "%username%"=="Skrt Killero" goto namexist9
if "%username%"=="alanc" goto namexist9
if "%username%"=="santy" goto namexist9
if "%username%"=="Yesid" goto namexist9
if "%username%"=="unrx" goto namexist9
if "%username%"=="mayko" goto namexist9
if "%username%"=="carlos cabassa" goto namexist9
if "%username%"=="Raul" goto namexist9
if "%username%"=="GAMER" goto namexist9
if "%username%"=="ESMERLIN MARTE" goto namexist9




goto skip9


::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

:namexist9
cls
echo.
echo ======================
echo    PC Registrada!
echo ======================

timeout /NOBREAK /T 1 >nul
cls
goto menu1

:skip9
cls
echo ==================================================
echo  Su PC no esta registrada en la base de datos
echo  Favor de comprar el programa.
echo.
echo  Puede contactarme por:
echo. 
echo  WhatsApp: +1 305-812-1398
echo  Discord: maik#2896
echo.
echo  Gracias!
echo ==================================================
echo.
pause
timeout /NOBREAK /T 2 >nul

cd C:\Users\%username%\Desktop
rmdir /s /q "C:\Users\%username%\Desktop\FNSSv3.zip"
del /f /q "C:\Users\%username%\Desktop\FNSSv3"
del /f /q "C:\Users\%username%\Desktop\FNSSv3.zip"
del /f /q "C:\Users\%username%\Desktop\FNSSv3.rar"
rmdir /s /q "C:\Users\%username%\Desktop\FNSSv3\fnss-main"
del /f /q "C:\Users\%username%\Desktop\fnss-main.zip"
del /f /q "C:\Users\%username%\Desktop\fnss-main (1).zip"

cd C:\Users\%username%\Downloads
del /s /q "C:\Users\%username%\Downloads\FNSSv3.zip"
del /s /q "C:\Users\%username%\Downloads\FNSSv3.rar"


timeout /NOBREAK /T 1 >nul

rd /s /q "%systemdrive%\$Recycle.bin"

timeout /NOBREAK /T 1 >nul

exit



:: ============================= Descargar la actualizacion =============================


:act
cls
color 5
echo.
echo ============================
echo  Downloading new Version...
echo   Don't Touch Anything...
echo ============================
echo.

:: ============================= WORKING! =============================

bitsadmin /transfer "FNSS" /download /priority foreground https://github.com/maikyes/fnss/archive/main.zip "C:\Users\%username%\AppData\Local\Temp\main.zip"

powershell.exe -nologo -noprofile -command "& { $shell = New-Object -COM Shell.Application; $target = $shell.NameSpace('C:\Users\%username%\AppData\Local\Temp'); $zip = $shell.NameSpace('C:\Users\%username%\AppData\Local\Temp\main.zip'); $target.CopyHere($zip.Items(), 16); }"
timeout /NOBREAK /T 1 >nul
powershell -command "Expand-Archive main.zip -DestinationPath C:\Users\%username%\AppData\Local\Temp"

xcopy /i /s /y "C:\Users\%username%\AppData\Local\Temp\fnss-main" "C:\Users\%username%\Desktop\FNSSv3"

:: =======================================================================================


cd C:\Users\%username%%\Documents\cmdacoBin
echo x=msgbox("Updated! if you got a issues just dm me in discord maik#2896",0,"FNSS Announcement")>>msgbox.vbs
start msgbox.vbs
timeout /NOBREAK /T 1 >nul
del /s /q C:\Users\%username%%\Documents\cmdacoBin\msgbox.vbs
cls
exit



::###############################################################

:menu1
cls
title Better FN [By Maik]  [ @maikyiq ] Version: %localtwo%
echo.
echo              -=[FNSS]=-               
echo.
echo   +++++++++++++++++++++++++++++++++++++ +++++++++++++++++++++++++++++++++++++
echo   +                                   + +                                   +
echo   +   1: Get High/Low IP from Epic    + +  16: Melody's Low Latency         +   Time Log:%time%
echo   +   2: Get Better DNS               + +  17: MSI Mode Utility             +   IP log: %NetworkIP%
echo   +   3: Reduce Input Lag 0ms         + +  18: Restore Point (Please Use)   +   User: %username%
echo   +   4: Clear DNS Server Cache       + +  19: HWID Checker                 +
echo   +   5: Delete Temporary Files       + +  20: Windows Settings Registry    +  
echo   +   6: Disable Prefetch             + +  21: Comprimir HDD / SSD          +      
echo   +   7: OFF/ON Windows Defender      + +  22: Windows Service Disabler     +              
echo   +   8: Disk Clean-Up                + +                                   +                     
echo   +   9: SoftAim                      + +++++++++++++++++++++++++++++++++++++      
echo   +  10: Fix Ping Value    (Risky)    +                                               
echo   +  11: Bajar Ping        (Risky)    + %new1%                                           
echo   +  12: Desactivar WindowsUpdates    + %new2%                           
echo   +  13: IP Locations                 + %new3%                                            
echo   +  14: Activar Gpedit               + %new4%                   
echo   +  15: Nvidia Inspector  (Risky)    +                    
echo   +                                   +                                
echo   +++++++++++++++++++++++++++++++++++++
                          
                                 
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


:: =============================================
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
echo Esto puede ser revertido y puedes elegir que servicios deas desabilitar. && echo.
echo Te gustaria continuar? yes/no/reset [ Solo descativa lo que crees que no usas ]
echo.
set /p con=
if /i "%con%" == "no" cls && goto menu1
if /i "%con%" == "reset" cls && goto restorer
if /i "%con%" == "yes" (
       goto servicess
) else (
     cls && echo. && echo No escribiste una opcion: yes, no, reset
     timeout 2 >nul
     cls
     goto :mainnnnnn
)



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



:servicess
cls 
call :colortext FC "Disable" && echo  App-V (Virtual Applications)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service AppVClient -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext F4 "Disable" && echo  Auto-Play Events Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service ShellHWDetection -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Auto Time Zone Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service tzautoupdate -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Bluetooth Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service bthserv -StartupType Disabled" && PowerShell -Command "Set-Service BTAGService -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  GPS Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service lfsvc -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Maps Broker?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service MapsBroker -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Microsort Store Dependencies?
set /p con=
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service NcbService -StartupType Disabled" && PowerShell -Command "Set-Service InstallService -StartupType Disabled" && PowerShell -Command "Set-Service PushToInstall -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Phone and Contact Searching Services?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service PimIndexMaintenanceSvc -StartupType Disabled" && PowerShell -Command "Set-Service PhoneSvc -StartupType Disabled" && PowerShell -Command "Set-Service icssvc -StartupType Disabled" && PowerShell -Command "Set-Service TapiSrv -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Print Services?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service LanmanServer -StartupType Disabled" && PowerShell -Command "Set-Service Spooler -StartupType Disabled" && PowerShell -Command "Set-Service PrintNotify -StartupType Disabled" && PowerShell -Command "Set-Service Fax -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Quality Windows Audio Video Experience Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service QWAVE -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Remote Access Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service RemoteAccess -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Sensor Services (don't disable on 2-in-1s or 360 devices)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service TabletInputService -StartupType Disabled" && PowerShell -Command "Set-Service SensorService -StartupType Disabled" && PowerShell -Command "Set-Service SensrSvc -StartupType Disabled" && PowerShell -Command "Set-Service SensorDataService -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Smart Card Services?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service SCardSvr -StartupType Disabled" && PowerShell -Command "Set-Service ScDeviceEnum -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext F4 "Disable" && echo  Theme Management Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service Themes -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls 

cls && cls
call :colortext FC "Disable" && echo  UPnP Device Host?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service SSDPSRV -StartupType Disabled" && PowerShell -Command "Set-Service upnphost -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Virtual Machine Services?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service HvHost -StartupType Disabled" && PowerShell -Command "Set-Service vmickvpexchange -StartupType Disabled" && PowerShell -Command "Set-Service vmicguestinterface -StartupType Disabled" && PowerShell -Command "Set-Service vmicshutdown -StartupType Disabled" && PowerShell -Command "Set-Service vmicheartbeat -StartupType Disabled" && PowerShell -Command "Set-Service vmicvmsession -StartupType Disabled" && PowerShell -Command "Set-Service vmicrdv -StartupType Disabled" && PowerShell -Command "Set-Service vmictimesync -StartupType Disabled" && PowerShell -Command "Set-Service vmicvss -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Windows Camera Frame Client Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service FrameServer -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext F4 "Disable" && echo  Windows Font Cache Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service FontCache -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls 

cls && cls
call :colortext FC "Disable" && echo  Windows Image Scanning Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service stisvc -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Windows Insider Service?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service wisvc -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Windows Search Indexing?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service WSearch -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext FC "Disable" && echo  Xbox Live Services?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service XblAuthManager -StartupType Disabled" && PowerShell -Command "Set-Service XblGameSave -StartupType Disabled" && PowerShell -Command "Set-Service XboxNetApiSvc -StartupType Disabled" && cls  
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext F4 "Disable" && echo  Diagnostics and Telemetry Services (breaks diagnostics)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service DiagTrack -StartupType Disabled" && PowerShell -Command "Set-Service DPS -StartupType Disabled" && PowerShell -Command "Set-Service WdiServiceHost -StartupType Disabled" && PowerShell -Command "Set-Service WdiSystemHost -StartupType Disabled" && PowerShell -Command "Set-Service WerSvc -StartupType Disabled" && PowerShell -Command "Set-Service diagsvc -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls 

cls && cls
call :colortext F4 "Disable" && echo  Sync Host (breaks synchronization)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service OneSyncSvc -StartupType Disabled" && PowerShell -Command "Set-Service CDPUserSvc -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls

cls && cls
call :colortext F4 "Disable" && echo  Task Scheduler Service (breaks Windows Search)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service Schedule -StartupType Disabled" && cls
if /i "%con%" == "no" ^ && cls 

cls && cls
call :colortext F4 "Disable" && echo  Windows Defender Services (breaks MS Defender)?
set /p con= 
if /i "%con%" == "yes" cls && PowerShell -Command "Set-Service WdNisSvc -StartupType Disabled" && PowerShell -Command "Set-Service WinDefend -StartupType Disabled" && PowerShell -Command "Set-Service wscsvc -StartupType Disabled" && cls 
if /i "%con%" == "no" ^ && cls 

:exitss
cls && cls
call :colortext F0 "Todos los servicios seleccionados fueron" && call :colortext FA " DESACTIVADOS"
echo.
call :colortext F0 "Asegurese de reiniciar su PC para aplicar todo!"
echo.
pause
goto menu1


:colortext
echo off
<nul set /p ".=%del%" > "%~2"
findstr /v /a:%1 /R "^$" "%~2" nul
del "%~2" > nul 2>&1



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

powershell.exe Disable-MMAgent -mc

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

####################################################################


:gepedit
cls
color 4
pushd "%~dp0"

dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientExtensions-Package~3*.mum >List.txt
dir /b %SystemRoot%\servicing\Packages\Microsoft-Windows-GroupPolicy-ClientTools-Package~3*.mum >>List.txt

for /f %%i in ('findstr /i . List.txt 2^>nul') do dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
pause
goto menu1

####################################################################

:ipfinder
rem Ip Lookup
@echo off
title Maik IP Lookup
color 5
setlocal ENABLEDELAYEDEXPANSION
set webclient=webclient
if exist "%temp%\%webclient%.vbs" del "%temp%\%webclient%.vbs" /f /q /s >nul
if exist "%temp%\response.txt" del "%temp%\response.txt" /f /q /s >nul
cls
echo Ip lookup/

cls
echo.
echo                          Type an pussy's IP to lookup
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
if '%ip%'=='' goto menu1
pause
goto menu1

####################################################################



####################################################################


:updatewindows
cls
echo.
echo Esta opcion te desactivara todas las actualizaciones de windows 
echo para mejorar el rendimiento del ping.
echo.
pause
@echo off
echo Batch File By Maik
taskkill /F /FI "IMAGENAME eq SystemSettings.exe"
@echo
net stop wuauserv
net stop UsoSvc
@echo
echo Do Not Connect To Any Windows Update Locations
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "DoNotConnectToWindowsUpdateInternetLocations" /t REG_DWORD /d "1" /f
@echo
echo Remove Access To Use All Windows Update Features
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "SetDisableUXWUAccess" /t REG_DWORD /d "1" /f
@echo
echo Disable Automatic Updates
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d "1" /f
@echo
echo Do Not Include Drivers With Windows Update
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "1" /f
@echo
gpupdate /force
@echo
echo Deleting Windows Update Files
rd /s /q C:\Windows\SoftwareDistribution
md C:\Windows\SoftwareDistribution
@echo
net start wuauserv
net start UsoSvc
echo Windows Updates Are Successfully Disabled!
pause
goto menu1


####################################################################

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

####################################################################

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

####################################################################

:soft
cls
color A
title Better FN [By Maik]
echo.
echo                -=[FNSS]=- 
echo.
echo   +++++++++++++++++++++++++++++++++++++
echo   +          -=[SoftAim]=-            +      -=[INFO]=-
echo   +                                   + 
echo   +   1: Capacidad de Aim +20         +   +20 Seguro
echo   +   2: Capacidad de Aim +50         +   +50 medio seguro
echo   +   3: Capacidad de Aim +80         +   +80 50/50
echo   +   4: Capacidad de Aim +100        +   +100 casi detectable
echo   +   5: Desactivar                   +
echo   +                                   +
echo   +   6: Menu                         +
echo   +                                   +
echo   +++++++++++++++++++++++++++++++++++++
echo.
echo.
set /p soft="ENTER NUMBER:"

if %soft%==1 goto aim1
if %soft%==2 goto aim2
if %soft%==3 goto aim3
if %soft%==4 goto aim4
if %soft%==5 goto aim5
if %soft%==6 goto menu1

color 4
echo Opcion Invalida. Intente de nuevo
echo.
pause
cls
goto soft


:aim1
cls
echo.
echo               -=[Installing.]=-
echo.
echo               -=[Don't touch anything]=-
timeout /NOBREAK /T 1 >nul
cls
echo.
echo               -=[Installing..]=-
echo.
echo               -=[Don't touch anything]=-
timeout /NOBREAK /T 2 >nul
cls
echo.
echo               -=[Installing...]=-
echo.
echo               -=[Don't touch anything]=-
timeout /NOBREAK /T 2 >nul
pause
goto soft

:aim2
cls
echo.
echo               -=[Installing.]=-
echo.
echo               -=[Don't touch anything]=-
timeout /NOBREAK /T 1 >nul
cls
echo.
echo               -=[Installing..]=-
echo.
echo               -=[Don't touch anything]=-
timeout /NOBREAK /T 2 >nul
cls
echo.
echo               -=[Installing...]=-
echo.
echo               -=[Don't touch anything]=-
timeout /NOBREAK /T 2 >nul
pause
goto soft

:aim3
cls
echo.
echo               -=[Installing.]=-
echo.
echo               -=[Don't touch anything]=-
timeout /NOBREAK /T 1 >nul
cls
echo.
echo               -=[Installing..]=-
echo.
echo               -=[Don't touch anything]=-
timeout /NOBREAK /T 2 >nul
cls
echo.
echo               -=[Installing...]=-
echo.
echo               -=[Don't touch anything]=-
timeout /NOBREAK /T 2 >nul
pause
goto soft

:aim4
cls
echo.
echo               -=[Installing.]=-
echo.
echo               -=[Don't touch anything]=-
timeout /NOBREAK /T 1 >nul
cls
echo.
echo               -=[Installing..]=-
echo.
echo               -=[Don't touch anything]=-
timeout /NOBREAK /T 2 >nul
cls
echo.
echo               -=[Installing...]=-
echo.
echo               -=[Don't touch anything]=-
timeout /NOBREAK /T 2 >nul
pause
goto soft

:aim5
cls
echo.
echo               -=[Loading.]=-
echo.
echo               -=[Don't touch anything]=-
timeout /NOBREAK /T 1 >nul
cls
echo.
echo               -=[Loading..]=-
echo.
echo               -=[Don't touch anything]=-
timeout /NOBREAK /T 2 >nul
cls
echo.
echo               -=[Loading...]=-
echo.
echo               -=[Don't touch anything]=-
timeout /NOBREAK /T 2 >nul
pause
goto soft

#################Block de notas#####################################

:block
@echo off>>DEBUG.txt
echo.
echo los datos se guardaran aqui!
echo.
echo ____________________________________________>DEBUG.txt
echo. >DEBUG.txt
echo Cambios recientes:>DEBUG.txt
echo Pagina:%opcion% >DEBUG.txt
echo %ip1% >DEBUG.txt
echo %coming% >DEBUG.txt
echo %input% >DEBUG.txt
echo %cleandns% >DEBUG.txt
echo %filest% >DEBUG.txt
echo %prefecth% >DEBUG.txt
echo %windos% %windos1% >DEBUG.txt
echo %diskup% >>DEBUG.txt
echo. >DEBUG.txt
echo ____________________________________________>DEBUG.txt
pause
goto menu1


####################################################################

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

####################################################################

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

####################################################################


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


####################################################################

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


###################################################################

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

####################################################################


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


#####################################################################

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

######################################################################

:menu
cls
color A
title Better FN [By Maik]
echo.
echo              -=[FNSS]=- 
echo.
echo   +++++++++++++++++++++++++++++++++++++
echo   +                                   +
echo   +   1: Get High/Low IP from Epic    +  Time Log:%time%
echo   +   2: Get Better DNS For You       +  Version: 2.0
echo   +   3: Reduce Input Lag 0ms         +  Usuario: %username% [INVITADO]
echo   +                                   + 
echo   +                                   +  Log Again: L
echo   +++++++++++++++++++++++++++++++++++++ 
echo.
echo.
set /p menu3="ENTER NUMBER:"

if %menu3%==1 goto ip
if %menu3%==L goto log
if %menu3%==l goto log


color 4
echo Opcion invalida o no eres ADMIN
echo.
pause
cls
goto menu

:log
cls
color 4
echo.
echo                    -=[Logging out]=-
echo.
echo               -=[Don't touch anything]=-
timeout /NOBREAK /T 4 >nul
echo.
pause
goto admin

###############################################################
## aqui sera donde se creara el comando para enviar el correo##
:skin


###############################################################
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

######################################################

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

########################################################

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

#########################################################

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

######################################################

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

##############################################################

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

###############################################################

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

#################################################################

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

#################################################################

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


###### ADMIN MENU #############################################

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

##############################################################

:maik
cls
echo.
echo               -=[que]=-
echo.
timeout /NOBREAK /T 2 >nul
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

################################################################

:calculadora
@echo off
set /p ero= Primer Numero= 
set /p ndo= Segundo Numero= 
echo.
set /a suma=%ero%+%ndo%
set /a resta=%ero%-%ndo%
set /a multi=%ero%*%ndo%
set /a division=%ero%/%ndo%
echo  Resultado Suma: %suma%
echo  Resultado Resta: %resta%
echo  Resultado Multiplicacion: %multi%
echo  Resultado Division: %division%
pause >nul
goto menu1
