clear-host
Write-Host "Contador de vocales"

$a = Read-Host "Introduce la palabra/oración " | Out-String
$vocales = "aeiou"
$contador = 0
foreach ($letra in $a){
    if ($vocales -contains $letra){
        $contador++
        write-host "hola"
        }
        write-host "jajaj"
}
write-host $letra
Write-Host $contador