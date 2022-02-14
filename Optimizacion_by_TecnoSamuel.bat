@echo off
color 43
title Optimizacion by TecnoSamuel v2.5
echo ------------------------------------------------------------
echo -                                                          -
echo Bienvenido a este programa de optimizacion v2.5, empecemos!-
echo -                                                          -
echo ------------------------------------------------------------
pause
cls
:2paso
cls
echo --------------------
echo ----Herramientas----
echo --------------------
echo Que quieres hacer? (1,2 o 3):
echo 1. Borrar cache
echo 2. Desinstalar Onedrive (Windows 10)
echo 3. Salir del programa.
set /p tools=Indique su opcion: 
if %tools%==1 goto delete_cache
if %tools%==2 goto delete_ondedrive
if %tools%==3 goto salir
:delete_cache
pause
cls
set /p delete_cache_confirmation= Esto borrara la cache de tu pc, estas seguro? (s/n): 
echo Has elegido la letra %letra% y el nombre de usuario %nameuser% eliminando cache...
if %delete_cache_confirmation%==s rmdir /s /q %TEMP%
if %delete_cache_confirmation%==s rmdir /s /q %HOMEDRIVE%\Windows\Temp\
if %delete_cache_confirmation%==n goto 2paso 
echo Se ha limpiado la carpeta Temp, donde se ubica los archivos cache, si no se ha podido borrar algunos archivos es normal no todos se pueden borrar.
mkdir %TEMP%
mkdir %HOMEDRIVE%\Windows\Temp
goto 2paso
:delete_ondedrive
cls
pause
cls
set /p del_onedrive_confirmation= Estas seguro que quieres desinstalar por completo el Onedrive? (s/n): 
if %del_onedrive_confirmation%==s goto delete_ondedrive_confirmation
if %del_onedrive_confirmation%==n goto 2paso
cls
:delete_ondedrive_confirmation
echo Comenzando desinstalacion
pause
set x86="%SYSTEMROOT%\System32\OneDriveSetup.exe"
set x64="%SYSTEMROOT%\SysWOW64\OneDriveSetup.exe"

echo Cerrando proceso de Onedrive.
echo.
taskkill /f /im OneDrive.exe > NUL 2>&1
ping 127.0.0.1 -n 5 > NUL 2>&1

echo Desinstalando OneDrive...
echo.
if exist %x64% (
%x64% /uninstall
) else (
%x86% /uninstall
)
ping 127.0.0.1 -n 5 > NUL 2>&1

echo Borrando restos de OneDrive...
echo.
rd "%USERPROFILE%\OneDrive" /Q /S > NUL 2>&1
rd "C:\OneDriveTemp" /Q /S > NUL 2>&1
rd "%LOCALAPPDATA%\Microsoft\OneDrive" /Q /S > NUL 2>&1
rd "%PROGRAMDATA%\Microsoft OneDrive" /Q /S > NUL 2>&1

echo Borrando OneDrive del panel lateral del explorador...
echo.
REG DELETE "HKEY_CLASSES_ROOT\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f > NUL 2>&1
REG DELETE "HKEY_CLASSES_ROOT\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" /f > NUL 2>&1
echo Desinstalacion completada
pause
set /p reinicio= Reinicio recomendado Te gustaria reniciar tu pc? (s/n)
if %reinicio%==s (
shutdown /r
) else (
goto 2paso
)
:salir
cls
echo --------------------------
echo - Gracias por utilizar   -
echo -      el programa!      -
echo --------------------------
pause
exit
