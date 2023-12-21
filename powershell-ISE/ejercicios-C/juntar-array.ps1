$cadena = Read-Host "Introduce una cadena"


$cadenaUnida = -join $cadena.ToCharArray()

Write-Host $cadenaUnida