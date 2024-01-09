<#Solicita al usuario que ingrese una palabra y utiliza un bucle foreach para imprimir la palabra al revés.#>

$palabra = Read-Host "Ingresa una palabra"
$reversa = ""

foreach ($letra in $palabra.ToCharArray()) {
    $reversa = $letra + $reversa
}

Write-Host "La palabra al revés es: $reversa"
