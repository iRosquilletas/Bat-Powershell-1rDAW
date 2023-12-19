@echo off
if "%1"=="" (
    echo Uso: creadirweb.bat NOMBRE_WEBSITE NOMBRE_DIRECTORIO
    exit /b
)

set "nombre_website=%1"
set "nombre_directorio=%2"

mkdir %nombre_directorio%
cd %nombre_directorio%
mkdir css js img
echo <html lang="es"><head><meta charset="UTF-8"><title>%nombre_website%</title><link rel="stylesheet" href="css/style.css"></head><body></body></html> > index.html
echo body { margin: 0; padding: 0; font-family: Arial, sans-serif; } > css/style.css
echo console.log("Hello, %nombre_website%!"); > js/script.js

echo Estructura creada para %nombre
