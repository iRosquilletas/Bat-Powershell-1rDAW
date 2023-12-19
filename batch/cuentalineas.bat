@echo off
if "%1"=="" (
    echo Uso: cuentalineas.bat archivo.txt [archivo2.txt archivo3.txt ...]
    exit /b
)

:procesar_archivos
set "total=0"
for %%i in (%*) do (
    set /a lineas=0
    for /f %%j in ('find /c /v "" ^< "%%i"') do set /a lineas=%%j
    echo El archivo "%%i" tiene %lineas% líneas.
    set /a total+=lineas
)

echo.
echo El total de líneas es: %total%
