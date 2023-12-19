clear-host
Write-Host "---- Tabla de multiplicar ----"
[int]$a = Read-Host "Introduce el número: "

for ([int]$i = 0; $i -le 10; $i++){
    $b = $a * $i
    Write-Host "$a * $i : "$b
}