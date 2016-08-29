@echo on
setlocal EnableExtensions DisableDelayedExpansion

set "SEARCH=00000000-0000-0000-0000-000000000000"
for %%P in ("*.xml") do (
    for /F "delims=" %%I in ('
        findstr /N /R "^" "%%~P" ^& ^> "%%~fP" break
    ') do (
        set "LINE=%%I"
        setlocal EnableDelayedExpansion
        set "LINE=!LINE:*:=!"
        if defined LINE set "LINE=!LINE:%SEARCH%=%%~nP!"
        >> "%%~fP" echo(!LINE!
        endlocal
    )
)
endlocal
exit /B