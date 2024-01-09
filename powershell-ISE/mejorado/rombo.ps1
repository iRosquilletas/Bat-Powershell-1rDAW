[int]$tamaño = Read-host "Dime el tamaño"

# Dibujar el rombo
for ($i = 1; $i -le $tamaño; $i++) {
    $espacio = " " * ($tamaño - $i)
    $salida = "*" * (2 * $i - 1)
    Write-Host ($espacio + $salida.PadRight($tamaño + ($tamaño - $i)))
}

for ($i = $tamaño - 1; $i -ge 1; $i--) {
    $espacio = " " * ($tamaño - $i)
    $salida = "*" * (2 * $i - 1)
    Write-Host ($espacio + $salida.PadRight($tamaño + ($tamaño - $i)))
}
