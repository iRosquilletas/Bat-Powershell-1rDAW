# Solicitar al usuario que introduzca una cadena
$cadena = Read-Host "Introduce una cadena"

# Inicializar contador de vocales
$contadorVocales = 0

# Iterar sobre cada caracter en la cadena
foreach ($caracter in $cadena.ToCharArray()) {
    # Verificar si el caracter es una vocal (mayúscula o minúscula)
    if ($caracter -match "[aeiouAEIOU]") {
        $contadorVocales++
    }
}

# Mostrar el resultado
Write-Host "Número de vocales en la cadena: $contadorVocales"

