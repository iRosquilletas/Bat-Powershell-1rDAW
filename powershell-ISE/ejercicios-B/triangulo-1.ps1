[int]$tamaño = read-host "Dime el tamaño"
for ($i = 1; $i -le $tamaño; $i++) {
      $simbolo = if ($i % 2 -eq 0) { "B" } else { "A" } # Si es par escribe la letra B y no es par escribe la letra A
      $linea = $simbolo * $i
      $forma += $linea
      Write-Host $linea
      }
    
