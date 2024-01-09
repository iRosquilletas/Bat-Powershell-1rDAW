[int]$numero = Read-host "Ingresa un número"
Write-Host "Números impares hasta $numero"
foreach ($i in 1..$numero) {
    if ($i % 2 -ne 0) {
        Write-Host $i
    }
}
