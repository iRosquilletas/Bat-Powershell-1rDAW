
param (
    [string]$mensaje
)

Write-Host "             ------ $mensaje ------"


Write-Host "1. Crear recurso compartido (nombre del recurso, path )"
Write-Host "2. Muestra información de los recursos compartidos"
Write-Host "3. Muestra información detallada de un recurso. Solicitar el nombre del recurso compartido"
Write-Host "4. Modificar información detallada de un recurso. Solicitar el nombre del recurso compartido"
Write-Host "5. Eliminar recurso compartido (Pide recurso)"
Write-Host "6. Añadir permiso de un usuario a un recurso (pide recurso, usuario y permiso)"
Write-Host "7. Eliminar permiso a un usuario a un recurso (pide recurso, usuario y permiso)"
Write-Host "8. Denegar acceso de un usuario a recurso (pide recurso y usuario)"
Write-Host "9. Desbloquear acceso a recurso (pide recurso y usuario)"
Write-Host "10. Salir"

$a = Read-Host "Elige cual opción"
switch ($a) {
    "1" { 
    New-SmbShare -Name NomDuPartage -Path "C:\raro" -ReadAccess "Modifica"


    } default {
    break
    }
}