$a = Read-Host "Dime que mensaje quieres mostrar: "
[int]$b = Read-Host "Dime cuantas veces: "

for ($i = $b; $i -gt 0; $i--){
    Write-Host $i $a 

}