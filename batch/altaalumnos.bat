@echo off
echo -------------------------------------------
echo         ALTA DE ALUMNOS - alumnos.csv
echo -------------------------------------------
echo.
echo Formato de entrada: nombre,apellido,NIA
set /p entrada="Introduce los datos (nombre,apellido,NIA): "
echo %entrada% >> alumnos.csv
echo.
echo Datos ingresados en alumnos.csv:
type alumnos.csv
