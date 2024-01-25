# Definir rutas y nombres de grupos
$rutaDirectorio = "C:\DAW-SI"
$grupoProfesores = "profesores"
$grupoAlumnos = "alumnos"

# Crear el directorio si no existe
if (-not (Test-Path $rutaDirectorio)) {
    New-Item -Path $rutaDirectorio -ItemType Directory
    Write-Host "Directorio $rutaDirectorio creado."
}

# Configurar permisos NTFS
$acl = Get-Acl $rutaDirectorio

# Permisos de escritura para profesores
$permisosProfesores = New-Object System.Security.AccessControl.FileSystemAccessRule(
    $grupoProfesores,
    "Write",
    "Allow"
)
$acl.AddAccessRule($permisosProfesores)

# Permisos de lectura para alumnos
$permisosAlumnos = New-Object System.Security.AccessControl.FileSystemAccessRule(
    $grupoAlumnos,
    "Read",
    "Allow"
)
$acl.AddAccessRule($permisosAlumnos)

# Aplicar los cambios en los permisos
Set-Acl -Path $rutaDirectorio -AclObject $acl

Write-Host "Permisos NTFS configurados para el directorio $rutaDirectorio."
