@echo off
setlocal
chcp 65001 2>nul >nul

set target=%WINDIR%\adb\adb.exe

"%target%" %*