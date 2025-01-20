@echo off
TITLE Automatic ADB Installer v2.9.5
COLOR 06

call :isAdmin

if %errorlevel% == 0 (
    goto :run
) else (
    echo Requesting administrative privileges...
    PING localhost -n 1 >NUL

    goto :UACPrompt
)

exit /b

:isAdmin
    fsutil dirty query %systemdrive% >nul
exit /b

:run
COLOR 03

TITLE Automatic ADB Installer v2.9.5

    @echo off
    echo Automatic ADB Installer v2.9.5
    ECHO(
    echo Installing latest ADB and Fastboot...
    ECHO(

    echo -------------------
    echo Yay! We have been granted administrative rights!
    PING localhost -n 1 >NUL
    echo -------------------
    PING localhofst -n 1 >NUL

    echo Copying ADB files...
    PING localhost -n 1 >NUL

    echo -------------------
    PING localhost -n 2 >NUL
    
    echo RESULT:
    copy %~dp0\adb.cmd %WINDIR%\System32\adb.cmd
    copy %~dp0\adbo.cmd %WINDIR%\System32\adbo.cmd
    copy %~dp0\fastboot.cmd %WINDIR%\System32\fastboot.cmd
    XCOPY %~dp0\adb %WINDIR%\adb /y /q 1>nul 2>>%USERPROFILE%\adb-installer.log
    XCOPY %~dp0\adbo %WINDIR%\adbo /y /q 1>nul 2>>%USERPROFILE%\adb-installer.log
    echo         ADB folder with file(s) [15] copied.
    echo         ADBO folder with file(s) [6] copied.
    echo         ADB files initialized!
    echo -------------------
    PING localhost -n 1 >NUL
    echo LOG:    %USERPROFILE%\adb-installer.log
    echo -------------------
    PING localhost -n 1 >NUL

    IF [%1]==[] (
        echo No parameters detected. Asking user for input...
        GOTO QUESTION
    )
    
    if %1 == --silent (
        ECHO Detected --silent parameter. Silent installation with automatic driver detection...
        PING localhost -n 1 >NUL
        GOTO DRIVER
    )else if %1 == --silent-no-driver (
        ECHO Detected --silent-no-driver parameter. Skipping driver installation...
        PING localhost -n 1 >NUL
        GOTO SILENT-FINISH
    )


    :QUESTION
    color 02

    PING localhost -n 2 >NUL
    echo -------------------

    set userInput=
    set /p userInput=Do you want to install ADB drivers? (Y/N) [TIMEOUT: 5s]: <nul
    for /L %%i in (1,1,10) do (
         choice /c YN /n /t 5 /d N >nul
        if errorlevel 2 set userInput=N
        if errorlevel 1 set userInput=Y
        if defined userInput goto :userInputReceived
    )
    set userInput=X

:userInputReceived
    if /i "%userInput%"=="Y" (
        echo You chose to install ADB drivers.
        PING localhost -n 1 >NUL
        GOTO DRIVER
    ) else (
        ECHO "%userInput%"
        ECHO Skipping driver installation...
        PING localhost -n 1 >NUL
        GOTO FINISH
    )

    :DRIVER
    ECHO -------------------
    ECHO Installation of latest ADB driver...
    ECHO Please continue driver installation...
    IF DEFINED programfiles(x86) GOTO x64
    :x86
    ECHO(
    ECHO Detected 32-bit OS. Installing 32-bit driver...
    ECHO Please continue driver installation if needed...
    PING localhost -n 1 >NUL
    IF [%1]==[] (
        START /wait %~dp0\driver\DPInst_x86 /f 2>>%USERPROFILE%\adb-installer.log
    )
    IF [%1] == --silent (
        START /wait %~dp0\driver\DPInst_x86 /q /f 2>>%USERPROFILE%\adb-installer.log
    )
    PING localhost -n 1 >NUL

    GOTO FINISH
    )

    :x64
    ECHO(
    ECHO Detected 64-bit OS. Installing 64-bit driver...
    ECHO Please continue driver installation if needed...
    PING localhost -n 1 >NUL
    
    IF [%1]==[] (
        START /wait %~dp0\driver\DPInst_x64 /f 2>>%USERPROFILE%\adb-installer.log
    )
    IF [%1] == --silent (
        START /wait %~dp0\driver\DPInst_x64 /q /f 2>>%USERPROFILE%\adb-installer.log
    )
    PING localhost -n 1 >NUL


    GOTO FINISH
    )

    :FINISH
    color 03
    ECHO(
    PING localhost -n 1 >NUL
    echo -------------------
    @REM color 08
    PING localhost -n 1 >NUL
    echo Success! Now you can close this window and use the latest Android SDK ADB.
    PING localhost -n 1 >NUL
    echo -------------------

    if [%1] equ [] (
        if /i ["%userInput%"] neq [] (
            pause
        )
    )

    if [%1] neq [] (
        PING localhost -n 4 >NUL
    )
    
    exit /b
    )

    :SILENT-FINISH
    @REM color 08
    PING localhost -n 1 >NUL
    echo -------------------
    echo Success! Now you can close this window and use the latest Android SDK ADB.
    echo -------------------
    PING localhost -n 1 >NUL
    exit /b


:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %~1", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
exit /B