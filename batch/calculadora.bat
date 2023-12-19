@echo off
:menu
echo ---------------------------------
echo           CALCULADORA
echo ---------------------------------
echo 1. Suma
echo 2. Resta
echo 3. Multiplicación
echo 4. División
echo 5. Salir
echo ---------------------------------
set /p opcion="Seleccione una opción (1-5): "

if "%opcion%"=="1" goto suma
if "%opcion%"=="2" goto resta
if "%opcion%"=="3" goto multiplicacion
if "%opcion%"=="4" goto division
if "%opcion%"=="5" goto fin

:suma
set /p num1="Ingrese el primer número: "
set /p num2="Ingrese el segundo número: "
set /a resultado=num1+num2
echo La suma es: %resultado%
goto menu

:resta
set /p num1="Ingrese el primer número: "
set /p num2="Ingrese el segundo número: "
set /a resultado=num1-num2
echo La resta es: %resultado%
goto menu

:multiplicacion
set /p num1="Ingrese el primer número: "
set /p num2="Ingrese el segundo número: "
set /a resultado=num1*num2
echo La multiplicación es: %resultado%
goto menu

:division
set /p num1="Ingrese el numerador: "
set /p num2="Ingrese el denominador: "
set /a resultado=num1/num2
echo La división es: %resultado%
goto menu

:fin
