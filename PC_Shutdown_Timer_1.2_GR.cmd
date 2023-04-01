
:: This is a PC shutdown timer. (wroted and developed by adonios77) 

:: This will work properly if the following settings for current command prompt properties are setted: "Quick Edit Mode" DISABLED.
:: Thats because if the QuickEditMode is enabled, when you click in the window as the coundown runs the counter freezes.

::It's better to save this .cmd or .bat , and create a link for it. So if you change its properties that afects only that link.

::How to disable it: 
:: R-Click on CommandPrompt window -> Properties -> Options (tab) -> Edit Options: Quick Edit Mode UNCHECKED
:: 

:SET
@echo off
%SystemRoot%\System32\chcp.com 65001 >nul
mode con: cols=117 lines=12
title PC Shutdown Timer
setlocal
color 5e
cls
echo   Το παρών είναι ένας χρονοδιακόπτης τερματισμού λειτουργίας υπολογιστή.    (σενάριο εντολών - επιμέλεια adonios77)
echo. & echo.
echo Τρέχουσα ημερομηνία - ώρα : %date% - %time%
echo. & echo.
set HH=00
set MM=00
set SS=00
echo Ρυθμίστε το χρόνο αναμονής για τον τερματισμό του υπολογιστή: 
set /p HH=Ορίστε τις ώρες: 
set /p MM=Ορίστε τα λεπτά: 
:: set /p SS=Set the Seconds:
set /a total=(%HH%*3600)+(%MM%*60)+(%SS%*1)
set /a totalM=(%total%/60)
:START
cls
mode con: cols=65 lines=16
color 4e
echo   Η τρέχουσα ημερομηνία και ώρα είναι: %date%  %time%
echo. & echo.
echo    Ο υπολογιστής θα τερματιστεί μετά από %HH% ώρες και %MM% λεπτά. &echo.
echo                (Σύνολο σε λεπτά: %totalM% λεπτά)
:ERROR
if /i %total% EQU 0 color ce & echo. & echo. & echo     ΠΡΟΕΙΔΟΠΟΙΗΣΗ! Οι τιμές πρέπει να είναι μεγαλύτερες από 0 & echo. & echo. & echo  Ανακατεύθυνση ξανά σε τιμές χρονοδιακόπτη ... & echo. & TIMEOUT /t 10 && goto :SET
echo.
:COUNTER
color 5e
echo.
echo.
echo  Αφήστε το παράθυρο να λειτουργεί στο παρασκήνιο και συνεχίστε 
echo  ή κλείστε αυτό το παράθυρο γιά να τερματίσετε το πρόγραμμα.
echo.
@TIMEOUT /t %total% /nobreak
:SHUTDOWN
@echo (♫)
cls
color ce
mode con: cols=59 lines=10
echo. && echo. && echo                 Τερματισμός Υπολογιστή! && echo. && echo    κλείστε αυτό το παράθυρο γιά να ακυρώσετε τερματισμό. && echo.
@TIMEOUT /t 120 /nobreak
start "" shutdown -s -f -t 0
endlocal
:END
