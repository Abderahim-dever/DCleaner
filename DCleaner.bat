@echo off
title Dever Cleaner
chcp 65001
mode 102,30
color 05
:start
cls
call :banner
echo.

echo  ┌────────────────────────────────┐
echo  │  [1] - System Cleaner          │
echo  │  [2] - Exit                    │
echo  └────────────────────────────────┘


echo.
set /p userInput="   -› "

ping -n 2 127.0.0.1 > nul
if "%userInput%"=="1" (
    echo Deleting temporary files...
    for /l %%i in (1,-1,1) do (
        echo ...
        ping -n 2 127.0.0.1 > nul
        
    )
    pause
    del /q /f "%TEMP%\*.*"
    for /d %%p in ("%TEMP%\*") do rmdir "%%p" /s /q

    del /q /f "C:\Windows\Temp\*.*"
    for /d %%p in ("C:\Windows\Temp\*") do rmdir "%%p" /s /q
    rd /s /q C:\Windows\Prefetch
pause
    rd /s /q C:\Windows\SoftwareDistribution\Download
pause
    rd /s /q %USERPROFILE%\AppData\Local\Microsoft\Windows\Explorer
pause
    rd /s /q %USERPROFILE%\AppData\Local\Microsoft\Windows\INetCache
pause
    
    reg add "HKEY_CURRENT_USER\Software\Microsoft\GameBar" /v "AppCaptureEnabled" /t REG_DWORD /d 0 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\GameBar" /v "GameBarEnabled" /t REG_DWORD /d 0 /f
    reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "Enabled" /t REG_DWORD /d 0 /f


    ping -n 2 127.0.0.1 > nul

    start cleanmgr
    echo.
    echo press ok to disk cleaner
    echo.
    pause
    start sysdm.cpl ,3
    echo.
    echo - Select 'adjust for best preformance'
    echo.
    pause
    goto :start
)

if "%userInput%"=="2" (
    for /l %%i in (1,-1,1) do (
        echo.
        echo.
        echo Bye, Die !!
        ping -n 2 127.0.0.1 > nul
    )
    Exit
)
:banner
echo.
echo.
echo                      ██████╗  ██████╗██╗     ███████╗ █████╗ ███╗   ██╗███████╗██████╗ 
echo                      ██╔══██╗██╔════╝██║     ██╔════╝██╔══██╗████╗  ██║██╔════╝██╔══██╗
echo                      ██║  ██║██║     ██║     █████╗  ███████║██╔██╗ ██║█████╗  ██████╔╝
echo                      ██║  ██║██║     ██║     ██╔══╝  ██╔══██║██║╚██╗██║██╔══╝  ██╔══██╗
echo                      ██████╔╝╚██████╗███████╗███████╗██║  ██║██║ ╚████║███████╗██║  ██║
echo                      ╚═════╝  ╚═════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝
echo.
echo.

