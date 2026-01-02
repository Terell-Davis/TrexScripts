@echo off
setlocal EnableDelayedExpansion

rem Define a dictionary equivalent using array
set "index=0"

:input_loop
set /p "barcode=Scan barcode: "
if "%barcode%"=="stop" goto end_input

rem Check if barcode already exists in the array
set "found=false"
for /l %%i in (0,1,%index%) do (
    if "!barcodes[%%i]!"=="%barcode%" (
        set /a "counts[%%i]+=1"
        set "found=true"
    )
)

rem If not found, add to the array
if "!found!"=="false" (
    set "barcodes[%index%]=%barcode%"
    set "counts[%index%]=1"
    set /a "index+=1"
)

goto input_loop