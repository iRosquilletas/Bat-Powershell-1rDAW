<#Contador de Palabras:
Pide al usuario que ingrese una frase. Utiliza un bucle foreach para contar el número de palabras en la frase.#>

$frase = Read-Host "Ingresa una frase"
$palabras = $frase -split ' '

$contador = 0
foreach ($palabra in $palabras) {
    $contador++
}

Write-Host "El número de palabras en la frase es: $contador"
