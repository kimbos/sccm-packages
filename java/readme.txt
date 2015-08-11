1. Download the 32-bit offline installer:
	http://java.com/en/download/manual.jsp

2. Run the following command from a command prompt:
	jre-8u31-windows-i586.exe STATIC=1 AUTO_UPDATE=0 EULA=0 NOSTARTMENU=1 REBOOT=0

	:: STATIC will create a seperate folder for the update (v8u31) instead of overwriting the currently installed version.
	:: without STATIC the java install will become corrupted if you run the installation while java is in use.

3. At the first page of the wizard, do not continue

4: Go to: %userprofile%\Appdata\LocalLow\Sun\Java

5. Copy the MSI-installer over to your SCCM server

6. Create a package in SCCM and point the program to "install.bat"


IMPORTANT!
Do not rename the MSI-file, it can cause problems if you want to uninstall it later.
