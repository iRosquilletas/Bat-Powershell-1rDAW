clear-host
Write-Host ---- Calculadora ----
While ($true) {
    [int]$a = Read-Host "Introduce el primer número" 
    [int]$b = Read-Host "Introduce el segundo número"
    $c = Read-Host "Qué operación quieres? + - * / potencia"

    switch ($c) {
    "+" {
        $d = $a + $b
        write-host "Resultado: "$d

    }
    "-" {
        $d = $a - $b
        
        write-host "Resultado: "$d
    
    }
    "*" {
        $d = $a * $b
      
        write-host "Resultado: "$d
    }
    "/" {
        $d = $a / $b
        
        write-host "Resultado: "$d

    }
    "potencia" {
    $d = [math]::Pow($a,$b)

    Write-Host "Resultado: "$d
    
    }

    default {
        Write-Host "No valido"
        Write-Host " "
    }
    }




}