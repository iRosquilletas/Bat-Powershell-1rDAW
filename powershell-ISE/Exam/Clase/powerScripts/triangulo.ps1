[int]$tamaño= Read-host "Dime el tamaño"

$salida= ""
for($i=0; $i -lt $tamaño; $i++){
    $salida+= "*"
    Write-Host $salida
}

"_____________"

[int]$tamaño= Read-host "Dime el tamaño"

for($i= $tamaño; $i -ge 1; $i--){
    $espacio= " " * ($tamaño -$i)
    $salida= "*" * $i + $espacio
    Write-Host $salida
}
