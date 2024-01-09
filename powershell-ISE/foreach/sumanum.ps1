<# Suma de Números:
Solicita al usuario que ingrese una lista de números separados por espacios. Luego, utiliza un bucle foreach para calcular la suma de esos números.#>

$numeros = Read-Host "Ingresa una lista de números separados por espacios"
$suma = 0

foreach ($numero in $numeros -split ' ') {
    $suma += [int]$numero
}

Write-Host "La suma de los números es: $suma"
