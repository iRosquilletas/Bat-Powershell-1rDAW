[int]$tamaño = read-host "Dime el tamaño"

for($i = $tamaño; $i -ge 1; $i--){
    $espacio = " " * ($tamaño - $i)
    $salida = "*" * $i + $espacio
    Write-Host $salida
}