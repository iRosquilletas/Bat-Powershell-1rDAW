do {

Write-Host "1. Suma" "2. Resta" "3. Multiplicación" "4. División" "5. Potencia" "6.Salir"

$operacion = Read-Host "Dime la operación"

$num1 =Read-Host "Dime el primer número"
$num2 =Read-Host "Dime el segundo número"

switch ($operacion){

    1 {$resultado = [double]$num1 + [double]$num2}
    2 {$resultado = [double]$num1 - [double]$num2}
    3 {$resultado = [double]$num1 * [double]$num2}
    4 {$resultado = [double]$num1 / [double]$num2}
    5 {$resultado = ([math]::Pow([double]$num1,[double]$num2))}
    6 {exit}
        default {Write-Host "Operación incorrecta"}


}
} while ($true) 

Write-Host "La operación que realizas es la " $operacion
Write-Host "Primer número: " $num1
Write-Host "Segundo número: " $num2
Write-Host "El resultado: " $resultado