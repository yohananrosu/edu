@echo off
rem Compass - opens the live compass display in its own app window.
rem The window closes with Esc on this keyboard or # on the transmitting phone.
rem If the site is published (e.g. GitHub Pages), put its address here so the QR code works:
set "COMPASS_URL="

if "%COMPASS_URL%"=="" set "COMPASS_URL=file:///%~dp0index.html"

set "BROWSER="
for %%P in ("%ProgramFiles%\Google\Chrome\Application\chrome.exe" "%ProgramFiles(x86)%\Google\Chrome\Application\chrome.exe" "%LocalAppData%\Google\Chrome\Application\chrome.exe" "%ProgramFiles(x86)%\Microsoft\Edge\Application\msedge.exe" "%ProgramFiles%\Microsoft\Edge\Application\msedge.exe") do (
  if not defined BROWSER if exist %%P set "BROWSER=%%~P"
)

if not defined BROWSER (
  start "" "%COMPASS_URL%"
) else (
  start "" "%BROWSER%" --app="%COMPASS_URL%" --start-maximized
)
