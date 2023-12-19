clear-host
Write-Host "---- Adivina la Palabra ----"
$array = 'hola'



$a = Read-Host "Dime una letra: "
$z = @()

do {

    if ($z -eq 'h o l a'){
        Write-Host "Lo conseguiste"
        break
    }

    $a = Read-Host "Dime una letra: "

    if ($a -eq $array[0][0]){
        $z += $a
    }
    if ($a -eq $array[1][0]){
        $z += $a
    }
    if ($a -eq $array[2][0]){
        $z += $a
    }
    if ($a -eq $array[3][0]){
        $z += $a
    }
    write-host $z

} while ($true)


Write-Host "JAJAJAJAJAJAJA"