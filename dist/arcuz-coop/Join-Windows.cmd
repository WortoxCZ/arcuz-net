@echo off
setlocal
cd /d "%~dp0"

echo ============================================
echo   Arcuz Co-op  --  JOIN
echo ============================================
echo.

set "PHOST="
set /p "PHOST=Host IP address: "
if "%PHOST%"=="" (
  echo No address entered.
  pause
  exit /b 1
)

set "PNAME=Player2"
set /p "PNAME=Your player name [Player2]: "

rem --- config: connect to the host machine ---
> netcfg.txt echo netHost=%PHOST%^&netPort=8843^&netName=%PNAME%^&netCellOn=on^&netBcastOn=on^&netAvOn=on^&netEnemyOn=on^&netStashOn=on^&netVfxOn=on^&netDbgOn=off

call :trust

echo.
echo Launching the game, connecting to %PHOST% ...
start "" flashplayer_32_sa.exe "%~dp0arcuz-net.swf"
exit /b 0

:trust
rem Flash blocks network sockets for local files unless the folder is trusted.
set "TRUSTDIR=%APPDATA%\Macromedia\Flash Player\#Security\FlashPlayerTrust"
if not exist "%TRUSTDIR%" mkdir "%TRUSTDIR%"
> "%TRUSTDIR%\arcuz-coop.cfg" echo %~dp0
exit /b 0
