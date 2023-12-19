clear-host
Write-Host "---- Adivina el número ----"
[int]$a = Read-Host "Escribe el primer rango"
[int]$b = Read-Host "Escribe el segundo rango"
$random = Get-Random -Minimum $a -Maximum $b

do {
   
    [int]$c = Read-Host "Introduce el número que crees que es: "
    if ($c -eq $random) {
        Write-Host "¡Ganaste!"
        break
    }
    elseif ($c -gt $b) {
        Write-Host "Pusiste un número más alto que el rango"
    }
    elseif ($c -lt $a){
        Write-Host "Pusiste un número más bajo que el rango"
    }
    elseif ($c -lt $random) {
        Write-Host "El número es más alto."
    } 
    else {
        Write-Host "El número es más bajo."
    }
} while ($true)

