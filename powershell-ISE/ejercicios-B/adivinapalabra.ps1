clear-host
Write-Host "---- Adivina la Palabra ----"
$array = @()
for ($i = 0; $i -lt 4; $i++){
    $jajaja = Read-Host "Dime letra por letra que palabra quieres: "
    $array += $jajaja

}

write-host $array

$z = @()

do {

    if ($z -contains $array){
        Write-Host "Lo conseguiste"
        break
    }

    $a = Read-Host "Dime una letra: "

    if ($a -contains $array[0][0]){
        $z += $a
    }
    if ($a -contains $array[1][0]){
        $z += $a
    }
    if ($a -contains $array[2][0]){
        $z += $a
    }
    if ($a -contains $array[3][0]){
        $z += $a
    }
    write-host $z

} while ($true)


Write-Host "JAJAJAJAJAJAJA"