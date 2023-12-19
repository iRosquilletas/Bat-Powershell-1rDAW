chcp 65001
@echo off
cls
echo.
echo === Generador de números Random ===
echo.
SET /p pri=Escriba el primer número: 
SET /p seg=Escriba el segundo número: 
echo.
if %pri% GTR %seg% (
	exit
	) else (
echo Elegiste el rango [%pri% - %seg%]
echo.
SET /a range=%seg%-%pri%+1
SET /a random=%random% %% range + %pri%
ECHO Generando número aleatorio entre %pri% y %seg%...
echo Número aleatorio: %random%
)

