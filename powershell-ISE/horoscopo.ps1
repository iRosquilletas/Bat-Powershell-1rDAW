# Solicitar al usuario que introduzca su año de nacimiento
$anioNacimiento = Read-Host "Introduce tu año de nacimiento"

# Verificar que la entrada del usuario sea un número
if ($anioNacimiento -match '^\d+$') {
    $anioNacimiento = [int]$anioNacimiento

    # Calcular el signo del horóscopo chino
    $signoChino = ($anioNacimiento) % 12
    $signos = @("Mono", "Gallo", "Perro", "Cerdo", "Rata", "Buey", "Tigre", "Conejo", "Dragón", "Serpiente", "Caballo", "Cabra")

    # Mostrar el resultado
    Write-Host "Tu signo del horóscopo chino es: $($signos[$signoChino])"
} else {
    Write-Host "Por favor, introduce un año de nacimiento válido."
}