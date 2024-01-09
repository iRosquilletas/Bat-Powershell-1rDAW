<#Genera una lista de números pares del 1 al 10 utilizando un bucle foreach y luego imprime la lista#>

$numerosPares = @()

foreach ($numero in 2..10) {
    if ($numero % 2 -eq 0) {
        $numerosPares += $numero
    }
}

Write-Host "Números pares del 1 al 10: $($numerosPares -join ', ')"
