[int]$tamaño = Read-host "Dime el tamaño"

# Dibujar la mitad superior del rombo
for ($i = 1; $i -le $tamaño; $i++) {
    $espacio = " " * ($tamaño - $i)
    $salida = "*" * (2 * $i - 1) + $espacio
    Write-Host $salida
}

# Dibujar la mitad inferior del rombo
for ($i = $tamaño - 1; $i -ge 1; $i--) {
    $espacio = " " * ($tamaño - $i)
    $salida = "*" * (2 * $i - 1) + $espacio
    Write-Host $salida
}
