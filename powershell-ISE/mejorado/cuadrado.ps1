# Solicitar al usuario el tamaño del cuadrado
do {
    $tamanio = Read-Host "Ingrese el tamaño del cuadrado (un número entero positivo):"
} until ($tamanio -match '^\d+$' -and $tamanio -gt 0)

function Dibujar-Cuadrado {
    param (
        [int]$size
    )

    $cuadrado = @()

    for ($i = 1; $i -le $size; $i++) {
        $linea = '*' * $size
        $cuadrado += $linea
        Write-Host $linea
    }
}

Write-Host "Dibujando cuadrado de tamaño $tamanio"
Dibujar-Cuadrado -size $tamanio
