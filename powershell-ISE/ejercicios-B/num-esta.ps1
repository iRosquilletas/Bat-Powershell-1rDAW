﻿clear-host
Write-Host "---- Bievenido ----"
$a = Read-Host "Dime el primer rango: "
$b = Read-Host "Dime el segundo rango: "
$c = Read-Host "Dime cuantos números aleatorios quieres que salgan: "

$z = @()
for ($i = 0; $i -lt $c; $i++){
    $uno = Get-Random -Minimum $a -Maximum $b
    $z += $uno

}

Write-Host $z


do{
    $pregunta = Read-Host "Dime el número que creas que esté: "
    if ($z -contains $pregunta) {
        Write-Host "El número está"
    } else {
        Write-Host "No está"
    
    }
    
    $d = Read-Host "Quieres seguir?(Y/N): "
    if ($d -ne "y"){
        break
    }

} while ($true)

write-host "Los números era: "$z





