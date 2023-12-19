[int]$tamaño = read-host "Dime el tamaño"

for($i = 0; $i -lt $tamaño; $i++){
    $salida += "*"
    Write-host $salida
    }

