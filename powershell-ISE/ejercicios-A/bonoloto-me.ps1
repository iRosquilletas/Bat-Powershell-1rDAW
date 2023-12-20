Write-Host " --- Bonoloto ---- "
$a = @()

for ($i = 0; $i -lt 6;){
    $random = Get-Random -Minimum 1 -Maximum 49
    if ($a -notcontains $random){
    $a += $random
    $i++ 
    }
}

[array]::Sort($a)
Write-Host $a

$a = $a | Sort-Object -Descending
Write-Host $a
