Write-Host "Primero: "
for ($i = 1; $i -le 4; $i++) {
    for ($j = 1; $j -le $i; $j++) {
        $linea += "* "
    }
    Write-Host $linea
    $linea = ""
}
Write-Host "Segundo: "
for ($i = 4; $i -ge 0; $i--) {
    for ($j = 0; $j -lt $i; $j++) {
        $linea += "* "
    }
    Write-Host $linea
    $linea = ""
}

