[int]$tamaño = Read-host "Dime el tamaño"

for ($i = 1; $i -le $tamaño; $i++) {
    $simbolo = if ($i % 2 -eq 0) { "A" } else { "B" }
    $fila = "$simbolo " * $tamaño
    Write-Host $fila
}
