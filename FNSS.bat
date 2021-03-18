@echo off

:first
title Better FN [By Maik]   [ @maikyiq ]  [ Latest Version v5 ]
color 5
echo.
echo ===========================
echo  Antes de usar el programa 
echo  Debe actualizarlo.
echo ===========================
echo.

set /p att="y/n: "

if %att%==y goto act
if %att%==Y goto act
if %att%==n exit
if %att%==N exit 
if %att%==m goto home

color 0c
echo.
echo Opcion Invalida. Intente de nuevo
echo.
pause
cls
goto first


:home
title Better FN [By Maik]   [ @maikyiq ]  [ Latest Version v5 ]
color 4
cls
echo.
echo ===================
echo  FNSS Accounts v6.
echo ===================
echo.
echo  [1] Log In
echo  [2] Sign Up
echo  [3] Update FNSS
echo  [4] Exit
echo.
set /p op=

if %op%==1 goto 1
if %op%==2 goto 2
if %op%==3 goto act
if %op%==4 goto 4

color 0c
echo.
echo Opcion Invalida. Intente de nuevo
echo.
pause
cls
goto home



###__Importar__Cuentas__###################################################


:act
cls
color 5
echo.
echo ============================
echo  Downloading new Version...
echo   Don't Touch Anything...
echo ============================
echo.

start https://github.com/maikyes/fnss/archive/main.zip
timeout /NOBREAK /T 5 >nul

move C:\Users\%username%\Downloads\fnss-main.zip C:\Users\%username%\Desktop\FNSSv3

timeout /NOBREAK /T 4 >nul

powershell Expand-Archive fnss-main.zip -DestinationPath C:\Users\%username%\Desktop\FNSSv3

timeout /NOBREAK /T 4 >nul

xcopy /i /s /y "C:\Users\%username%\Desktop\FNSSv3\fnss-main" "C:\Users\%username%\Desktop\FNSSv3"

timeout /NOBREAK /T 3 >nul

rmdir /s /q fnss-main
del /s /q fnss-main.zip

timeout /NOBREAK /T 3 >nul

color A
cls
echo.
echo =================
echo     Updated!
echo =================
timeout /NOBREAK /T 3 >nul
goto home


#########__Antes__Del__Sign__Up___#################################################

:2
cls
color 4
echo ======================
echo  FNSS Serial Number
echo ======================
echo.
set /p seri="Enter Serial Number: "

if %seri%==2364-2687-2346 goto 9
if %seri%==show goto seri2

color 0c
echo.
echo Wrong Serial Number...
echo Please type your serial number.
echo.
pause >nul
goto home

:seri2
color A
echo.
echo Serial Number: 2364-2687-2346
echo.
pause >nul
goto 2



########################################################################

:9
cls
color 0c
echo.
echo ===============================
echo   Submitting Serial Number...
echo ===============================
timeout /NOBREAK /T 3 >nul
cls
color A
echo.
echo ===============================
echo   Serial Number Submit!
echo ===============================
timeout /NOBREAK /T 2 >nul
goto 5



#########################################################################




:5
cls
color 4
echo =======================================
echo  FNSS Sign Up
echo =======================================
echo.
set /p newname="Enter new username:"
if "%newname%"=="%newname%" goto inputname

:inputname
cd "%userprofile%\documents"
if exist "cmdacoBin" goto skip
if not exist "cmdacoBin" goto noskip

:noskip
md "cmdacoBin"
goto skip

:skip
cd "%userprofile%\documents\cmdacoBin"
if exist "%newname%.bat" goto namexist
if not exist "%newname%.bat" goto skip2

:skip2
echo set realusername=%newname%> "%newname%.bat"
goto next

:next
echo.
set /p pswd=Enter new Password:
if "%pswd%"=="%pswd%" goto inputpass

:inputpass
cd "%userprofile%\documents\cmdacoBin"
echo set password=%pswd%>> "%newname%.bat"
goto next1

:namexist
echo.
echo The entered username already exists.
echo Press any key to return. . .
pause >nul
goto 2

:next1
cls
color A
echo ================
echo  FNSS Accounts
echo ================
echo.
echo Your account has been successfully created!
echo.
pause
goto home

####################################################################


###__Iniciar__Seccion__#############################################


:1
color 4
cls
echo =================================
echo  FNSS Accounts Log In
echo =================================
echo.
Set /p logname=Username:
if "%logname%"=="%logname%" goto 2.1

:2.1
echo.
set /p logpass="Password:"
if "%logpass%"=="%logpass%" goto login

:login
cd "%userprofile%\documents\cmdacoBin"
if exist "%logname%.bat" goto call
if not exist "%logname%.bat" goto errorlog

:call
call "%logname%.bat"
if "%password%"=="%logpass%" goto logdone
goto errorlog

:errorlog
color 0c
echo.
echo Username or Password incorrect.
echo Access denied.
pause >nul
goto home

:logdone
cls
color A
echo ==============
echo     FNSS
echo ==============
echo.
echo Successfully logged in!
echo.
timeout /NOBREAK /T 2 >nul
goto account

:account
cls
cd "%userprofile%\documents\cmdacoBin"
call "%realusername%color.bat"
call "%realusername%.bat"
color %colorcode%
cls
color A
echo.
echo ==============================
echo   Account: %realusername%
echo ==============================
timeout /NOBREAK /T 3 >nul
goto menu1

###############################################################

:menu1
cls
title Better FN [By Maik]  [ @maikyiq ]
echo.
echo              -=[FNSS]=-      
echo.
echo   +++++++++++++++++++++++++++++++++++++
echo   +                                   +
echo   +   1: Get High/Low IP from Epic    +  Time Log:%time%
echo   +   2: Get Better DNS For You       +  Version: 6.0 [ PRIVATE ]
echo   +   3: Reduce Input Lag 0ms         +  Usuario: %realusername% [ADMIN]
echo   +   4: Clear DNS Server Cache       +
echo   +   5: Delete Temporary Files       +  +++++++++++++++++++++   -=[Tools]=-
echo   +   6: Disable Prefetch             +  +    Next updated   +   
echo   +   7: OFF/ON Windows Defender      +  +                   +   b: DEBUG.txt
echo   +   8: Disk Clean-Up                +  +  * SkinChecker    +   co: color
echo   +   9: SoftAim                      +  +  * Macro          +   c: Calculadora
echo   +  10: Fix Ping Value               +  +                   +   dc: Discord
echo   +  11: Bajar Ping                   +  +                   +
echo   +  12: Desactivar WindowsUpdates    +  +                   + 
echo   +  13: IP Locations                 +  +                   + 
echo   +  14: Activar Gpedit               +  +                   +   Follow me on ig
echo   +                                   +  +                   +    [ @maikyiq ]
echo   +++++++++++++++++++++++++++++++++++++  +++++++++++++++++++++
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


if %opcion%==co goto color2
if %opcion%==b goto block
if %opcion%==maik goto maik
if %opcion%==c goto calculadora
if %opcion%==dc goto discord


color 4
echo Opcion Invalida. Intente de nuevo
echo.
pause
cls
goto menu1

####################################################################

:discord
echo.
echo Redireccionandote a mi Discord...
timeout /NOBREAK /T 3 >nul
start https://discord.gg/qCD5Q4GkDu
goto menu1


####################################################################

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
start cleanmgr.exe
echo.
pause
goto menu1

####################################################################

:coming
cls
start C:\Users\%username%\Desktop\FNSSv3\config\DnsJumper
echo.
echo Step 1: Pess [ Fastest DNS ]
echo Step 2: Press [ Start DNS Test ] with it done
echo Step 3: Press [ Apply DNS Server ]
echo Step 4: Close that window 
echo Step 5: Press [ Flush DNS ]
echo Finish!
echo.
pause
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
cls
echo.
echo Windows Defender [Activado]
echo.
start C:\Users\%username%\Desktop\FNSSv3\config\E64b85b9frh89fj498.reg
pause
goto windos

:defenderd
cls
echo.
echo Windows Defender [Desactivado]
echo.
start C:\Users\%username%\Desktop\FNSSv3\config\D75f4b8wbf28b28fb.reg
pause
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
