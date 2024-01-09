# Solicitar al usuario que ingrese un número
[int]$numero = Read-host "Ingresa un número"

$contadorPares = 0

Write-Host "Números pares hasta $numero"
foreach ($i in 1..$numero) {
    if ($i % 2 -eq 0) {
        Write-Host $i -NoNewline
        Write-Host -NoNewline ", "
        $contadorPares++
    }
}

Write-Host "`nTotal de números pares hasta $numero $contadorPares"
