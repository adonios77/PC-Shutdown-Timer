:: This is a PC shutdown timer. (wroted and developed by adonios77) 

:: This will work properly if the following settings for current command prompt properties are setted: "Quick Edit Mode" DISABLED.
:: Thats because if the QuickEditMode is enabled, when you click in the window as the coundown runs the counter freezes.

::It's better to save this .cmd or .bat , and create a link for it. So if you change its properties that afects only that link.

::How to disable it: 
:: R-Click on CommandPrompt window -> Properties -> Options (tab) -> Edit Options: Quick Edit Mode UNCHECKED
:: 

:SET
@echo off
mode con: cols=59 lines=12
title PC Shutdown Timer
setlocal

color 5e
cls
echo   This is a PC shutdown timer.     (wroted by adonios77)
echo. & echo.
echo The current date and time is: & date /t & time /t
echo. & echo.
set HH=00
set MM=00
set SS=00
echo Set the waiting time to shutdown PC: 
set /p HH=Set the Hours: 
set /p MM=Set the Minutes: 
rem set /p SS=Set the Seconds:
set /a total=(%HH%*3600)+(%MM%*60)+(%SS%*1)
set /a totalM=(%total%/60)

: START
cls
mode con: cols=59 lines=20
color 4e
echo The current date and time is: & date /t & time /t
echo. & echo.
echo    This PC will shut down after %HH% hours and %MM% minutes. &echo.
echo            ( Total in minutes: %totalM% minutes )

:ERROR
if /i %total% EQU 0 color ce & echo. & echo. & echo        WARNING! The values must be greater than 0 & echo. & echo. & echo         Redirecting you to timer values again... & echo. & echo. & TIMEOUT /t 10 && goto :SET

echo.
:COUNTER
color 5e
echo.
echo.
echo    Let the window running in the background and continue 
echo        or close this window to end the program. 
echo.
@TIMEOUT /t %total% /nobreak

:SHUTDOWN
@echo ()
cls
color ce
mode con: cols=59 lines=10
echo. && echo. && echo                 PC Shutting down! && echo. && echo    close this window to cancel shut down. && echo.
@TIMEOUT /t 120 /nobreak
start "" shutdown -s -f -t 0

endlocal
:END
