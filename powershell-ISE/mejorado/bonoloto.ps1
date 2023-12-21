Write-Host " --- Bonoloto ---- "
$combinaciones = @()

function GenerarCombinacion {
    $combinacion = @()

    while ($combinacion.Count -lt 6) {
        $randomNumber = Get-Random -Minimum 1 -Maximum 50

        if ($randomNumber -notin $combinacion) {
            $combinacion += $randomNumber
        }
    }

    return $combinacion | Sort-Object
}

# Generar 5 combinaciones únicas
for ($i = 0; $i -lt 5; $i++) {
    $nuevaCombinacion = GenerarCombinacion

    # Asegurar que no haya combinaciones duplicadas
    while ($combinaciones -contains $nuevaCombinacion) {
        $nuevaCombinacion = GenerarCombinacion
    }

    $combinaciones += $nuevaCombinacion
}

# Mostrar todas las combinaciones generadas
$combinaciones | ForEach-Object { Write-Host $_ }
