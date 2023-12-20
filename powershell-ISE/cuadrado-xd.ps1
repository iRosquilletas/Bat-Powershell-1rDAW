Write-Host "Cuadrado"

$contador = 0
$a = Read-Host "Introduce cuantas: "

for ($i = 0; $i -lt $a; $i++){
    if ($contador -lt 100000){
        
        $contador += 11111
        if ($contador -eq 111110){
            $contador += 1
            Write-Host $contador
            while($contador -gt 100000){
                $contador += 111111
                if ($contador -gt 999999){
                    break
                    }
            }
        }
        Write-Host $contador
    }
}

Write-Host "Mare meua"
















