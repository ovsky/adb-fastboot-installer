@echo off
TITLE Automatic ADB Installer v2.8.0
COLOR 06

call :isAdmin

if %errorlevel% == 0 (
    goto :run
) else (
    echo Requesting administrative privileges...
    PING localhost -n 2 >NUL

    goto :UACPrompt
)

exit /b

:isAdmin
    fsutil dirty query %systemdrive% >nul
exit /b

:run
COLOR 03

TITLE Automatic ADB Installer v2.8.0

    @echo off
    echo Automatic ADB Installer v2.8.0
    ECHO(
    echo Installing latest ADB and Fastboot...
    ECHO(

    echo -------------------
    echo Yaay! We've got admin rights!
    PING localhost -n 2 >NUL
    echo -------------------
    PING localhost -n 2 >NUL

    echo Copying ADB files...
    PING localhost -n 2 >NUL

    echo -------------------
    PING localhost -n 2 >NUL
    
    echo RESULT:
    copy %~dp0\adb.cmd %WINDIR%\System32\adb.cmd
    copy %~dp0\fastboot.cmd %WINDIR%\System32\fastboot.cmd
    XCOPY %~dp0\adb %WINDIR%\adb /y /q 1>nul 2>>%USERPROFILE%\adb-installer.log
    @REM XCOPY %~dp0\adb %WINDIR%\adb /y /q 1>nul 2>>%USERPROFILE%\adb-installer.log 
    echo         ADB files initialized.
    PING localhost -n 2 >NUL
    echo -------------------
    echo LOG:    %USERPROFILE%\adb-installer.log
    echo -------------------
    PING localhost -n 2 >NUL

    :QUESTION
    color 02
    @REM DEL PATH.TMP
    ECHO(
    SET /P ANSWER=Do you want to install device drivers? (Y/N)
    IF /i {%ANSWER%}=={y} (GOTO DRIVER)
    IF /i {%ANSWER%}=={yes} (GOTO DRIVER)
    IF /i {%ANSWER%}=={n} (GOTO FINISH)
    IF /i {%ANSWER%}=={no} (GOTO FINISH)
    ECHO Bad answer! Use only Y/N or Yes/No
    GOTO QUESTION

    :DRIVER
    ECHO Installation of latest ADB driver...
    ECHO Please continue driver installation...
    IF DEFINED programfiles(x86) GOTO x64
    :x86
    ECHO(
    ECHO Detected 32-bit OS. Installing 32-bit driver ...
    PING localhost -n 2 >NUL
    START /wait %~dp0\driver\DPInst_x86 /f 2>>%USERPROFILE%\adb-installer.log
    GOTO FINISH
    :x64
    ECHO(
    ECHO Detected 64-bit OS. Installing 64-bit driver ...
    ECHO Please continue driver installation ...
    PING localhost -n 2 >NUL
    START /wait %~dp0\driver\DPInst_x64 /f 2>>%USERPROFILE%\adb-installer.log

    :FINISH
    color 03
    ECHO(
    PING localhost -n 2 >NUL
    echo -------------------
    @REM color 08
    PING localhost -n 1 >NUL
    echo Success! Now you can close this window and use the latest Android SDK ADB.
    PING localhost -n 1 >NUL
    echo -------------------
    ECHO(


    pause

exit /b

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %~1", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
exit /B