# Solicitar al usuario un número
$n = Read-Host "Introduce un número"

# Verificar que la entrada sea un número entero positivo
if ($n -match '^\d+$') {
    $n = [int]$n

    # Generar el dibujo
    for ($i = 1; $i -le $n; $i++) {
        for ($j = 1; $j -le 5; $j++) {
            Write-Host -NoNewline "$i"
        }
        Write-Host ""
    }
} else {
    Write-Host "Por favor, introduce un número entero positivo."
}