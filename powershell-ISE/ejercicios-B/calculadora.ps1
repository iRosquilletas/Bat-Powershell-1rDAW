clear-host
Write-Host ---- Calculadora ----
While ($true) {
    [int]$a = Read-Host "Introduce el primer número" 
    [int]$b = Read-Host "Introduce el segundo número"
    $c = Read-Host "Qué operación quieres? + - * /"

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
    default {
        Write-Host "No valido"
        Write-Host " "
    }
    }




}