# Lista de palabras relacionadas con animales
$palabras = @("perro", "gato", "elefante", "tigre", "jirafa", "mono", "leon", "serpiente", "pinguino", "rinoceronte")

# Seleccionar una palabra aleatoria
$palabraSecreta = Get-Random -InputObject $palabras

# Inicializar el array para almacenar las letras adivinadas
$letrasAdivinadas = @()

# Muestra la longitud de la palabra con guiones bajos
$palabraOculta = "_" * $palabraSecreta.Length
Write-Host "¡Bienvenido al juego de adivinanza de palabras!"
Write-Host "Palabra a adivinar: $palabraOculta"

# Bucle principal del juego
while ($palabraOculta -ne $palabraSecreta) {
    # Solicitar al usuario que ingrese una letra
    $letra = Read-Host "Ingresa una letra"

    # Verificar si la letra ya ha sido adivinada
    if ($letrasAdivinadas -contains $letra) {
        Write-Host "Ya has intentado esa letra. Intenta con otra."
        continue
    }

    # Agregar la letra a las letras adivinadas
    $letrasAdivinadas += $letra

    # Verificar si la letra está en la palabra secreta
    if ($palabraSecreta.Contains($letra)) {
        # Mostrar las letras adivinadas y las posiciones
        $palabraOculta = $palabraSecreta -replace "[^$letrasAdivinadas]", "_"
        Write-Host "¡Bien hecho! Letras adivinadas: $palabraOculta"
    } else {
        Write-Host "Esa letra no está en la palabra. Intenta de nuevo."
    }
}

Write-Host "¡Felicidades! Has adivinado la palabra: $palabraSecreta"
