clear-host
$bonoloto = @()

#for ($i = 1;$i -lt 7;$i++){
#    $a = Get-Random -Maximum 7 -Minimum 1
#    if ($bonoloto -notcontains $a){
#        $bonoloto += $a
#        $i++
#    }
#    $i--
#}
$i = 1
while ($i -le 6) {
    $a = Get-Random -Maximum 49 -Minimum 1
    if ($bonoloto -notcontains $a){
        $bonoloto += $a
        $i++
    }
}
[array]::Sort($bonoloto)#ordena de menor a mayor
Write-Host $bonoloto