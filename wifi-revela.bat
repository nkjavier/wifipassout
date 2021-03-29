@echo off
setlocal enabledelayedexpansion
for /f "tokens=2 delims=:" %%a in ('netsh wlan show profile') do (
      set "ssid=%%~a"
      call :getpwd "%%sid:~1%%"
)
pause
:getpwd
set "ssid=%*"
for /f "tokens=2 delims:" %%i ('netsh wlan show profile name^="%%sid:"=%" key^=clear ^|findstr /C:"Key Content"') do (
     echo wi-fi Name: %ssid% Password : %%i
     )
