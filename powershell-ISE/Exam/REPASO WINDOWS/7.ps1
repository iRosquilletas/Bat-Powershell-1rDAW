# Definir rutas y nombres de usuarios
$recursoCompartido = "APUNTES"
$usuarioMiguel = "Miguel"
$usuarioSara = "Sara"

# Ruta completa del recurso compartido
$rutaRecurso = "C:\Ruta\A\Tu\$recursoCompartido"

# Crear el recurso compartido si no existe
if (-not (Test-Path $rutaRecurso)) {
    New-Item -Path $rutaRecurso -ItemType Directory
}

# Configurar permisos para Miguel (permisos de escritura)
$aclMiguel = Get-Acl $rutaRecurso
$permisosMiguel = New-Object System.Security.AccessControl.FileSystemAccessRule(
    $usuarioMiguel,
    "FullControl",
    "Allow"
)
$aclMiguel.AddAccessRule($permisosMiguel)
Set-Acl -Path $rutaRecurso -AclObject $aclMiguel

# Configurar permisos para Sara (permisos de solo lectura)
$aclSara = Get-Acl $rutaRecurso
$permisosSara = New-Object System.Security.AccessControl.FileSystemAccessRule(
    $usuarioSara,
    "Read",
    "Allow"
)
$aclSara.AddAccessRule($permisosSara)
Set-Acl -Path $rutaRecurso -AclObject $aclSara

Write-Host "Configuración de permisos completada para el recurso compartido $recursoCompartido."
