@echo off
setlocal
cd /d "%~dp0"

echo ============================================
echo   Arcuz Co-op  --  HOST
echo ============================================
echo.

where node >nul 2>nul
if errorlevel 1 (
  echo ERROR: Node.js is not installed.
  echo The host machine needs it to run the session relay.
  echo Get it from https://nodejs.org/ then run this again.
  echo.
  pause
  exit /b 1
)

set "PNAME=Player1"
set /p "PNAME=Your player name [Player1]: "

rem --- config: the host connects to the relay on its own machine ---
> netcfg.txt echo netHost=127.0.0.1^&netPort=8843^&netName=%PNAME%^&netCellOn=on^&netBcastOn=on^&netAvOn=on^&netEnemyOn=on^&netStashOn=on^&netVfxOn=on^&netDbgOn=off

call :trust

echo.
echo Starting the relay. KEEP its window open for the whole session
echo (it is the server -- closing it ends the game for everyone).
start "Arcuz relay" cmd /k node relay\relay.js

rem let the relay bind its port before the game tries to connect
ping -n 3 127.0.0.1 >nul

echo Launching the game...
start "" flashplayer_32_sa.exe "%~dp0arcuz-net.swf"

echo.
echo --------------------------------------------
echo  Other players join with your IP address.
echo  Find it by running:  ipconfig
echo  (use the IPv4 address; for play over the
echo   internet you must port-forward TCP 8843)
echo --------------------------------------------
echo.
pause
exit /b 0

:trust
rem Flash blocks network sockets for local files unless the folder is trusted.
set "TRUSTDIR=%APPDATA%\Macromedia\Flash Player\#Security\FlashPlayerTrust"
if not exist "%TRUSTDIR%" mkdir "%TRUSTDIR%"
> "%TRUSTDIR%\arcuz-coop.cfg" echo %~dp0
exit /b 0
