@ECHO OFF
SETLOCAL

set VERSION=1.8.0_51


:: Kopier config
xcopy "%~dp0deployment.properties" "C:\Windows\Sun\Java\Deployment\" /C /R /H /K /Y /I /S
xcopy "%~dp0exception.sites" "C:\Windows\Sun\Java\Deployment\" /C /R /H /K /Y /I /S


:: Sjekk om vi allerede har installert den samme versjonen
if exist "%programfiles%\Java\jre%VERSION%" GOTO AlreadyInstalled
if exist "%programfiles(x86)%\Java\jre%VERSION%" GOTO AlreadyInstalled


:: Avinstaller eksisterende versjoner
echo Uninstall existing versions...
call "%~dp0java_runtime_nuker.bat"


:: Installer
echo Installing...
msiexec /i "%~dp0jre%VERSION%.msi" /quiet /norestart

:: Sjekk at installasjonen gikk greit
echo Checking how it went...
if exist "%programfiles%\Java\jre%VERSION%\bin\java.exe" GOTO InstallOK
if exist "%programfiles(x86)%\Java\jre%VERSION%\bin\java.exe" GOTO InstallOK


:InstallFailed
echo Install failed
exit /B 5

:AlreadyInstalled
if exist "%programfiles%\Java\jre%VERSION%\bin\java.exe" GOTO AlreadyInstalledOK
if exist "%programfiles(x86)%\Java\jre%VERSION%\bin\java.exe" GOTO AlreadyInstalledOK

:AlreadyInstalledBroken
echo Same version already installed, but it is broken
exit /B 6

:AlreadyInstalledOK
echo Same version already installed, looks healthy
exit /B 3010



:InstallOK
:EOF
echo Install success
exit /B %EXIT_CODE%
