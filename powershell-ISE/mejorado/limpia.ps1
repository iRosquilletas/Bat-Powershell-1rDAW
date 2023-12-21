<#
Buscar archivos por extensión y moverlos:

Solicitar al usuario que ingrese una extensión de archivo.
Pedir la ruta del directorio donde se realizará la búsqueda.
Mover los archivos con la extensión especificada al directorio "Descargas".
Informar al usuario sobre los archivos que se han movido.
Eliminar archivos del directorio de Descargas:

Preguntar al usuario si desea borrar definitivamente los archivos movidos.
Si la respuesta es afirmativa, borrar los archivos del directorio "Descargas".
Proporcionar un mensaje indicando la cantidad de archivos eliminados.
Realizar una copia de seguridad de los archivos antes de borrarlos:

Antes de borrar definitivamente los archivos, realizar una copia de seguridad en un directorio llamado "Backup" dentro de "Descargas".
Mostrar al usuario la ruta donde se ha realizado la copia de seguridad.
Guardar un registro de las operaciones realizadas:

Mantener un registro de las acciones realizadas, incluyendo la fecha, la hora y los detalles de cada operación.
Guardar el registro en un archivo de texto en el directorio "Descargas".
Proporcionar una opción para deshacer la última operación:

Permitir al usuario deshacer la última operación realizada, ya sea la eliminación de archivos o el movimiento.
Salir del script:

Proporcionar una opción para salir del script.


#>

# Solicitar la extensión al usuario
$extension = "*" + (Read-Host "Ingrese la extensión de los archivos:")

# Solicitar la ruta al usuario
$ruta = Read-Host "Ingrese la ruta del directorio:"

# Obtener la lista de archivos con la extensión especificada
$archivos = Get-ChildItem -Path $ruta -Filter $extension

# Verificar si hay archivos antes de continuar
if ($archivos.Count -eq 0) {
    Write-Host "No se encontraron archivos con la extensión '$extension' en la ruta especificada."
    return
}

# Mover los archivos al directorio de Descargas
$destinoDescargas = $env:userprofile\Downloads
$archivos | ForEach-Object {
    Move-Item -Path $_.FullName -Destination $destinoDescargas
}

# Informar al usuario acerca de los archivos movidos
Write-Host "Se han movido los siguientes archivos al directorio de Descargas:"
$archivos | ForEach-Object { Write-Host $_.FullName }

# Preguntar al usuario si desea realizar una copia de seguridad antes de borrar definitivamente
$copiaSeguridad = Read-Host "¿Quieres realizar una copia de seguridad antes de borrar definitivamente? (Y/N)"

if ($copiaSeguridad -eq "Y") {
    # Crear un directorio de copia de seguridad en Descargas
    $directorioBackup = Join-Path $destinoDescargas "Backup"
    New-Item -ItemType Directory -Path $directorioBackup -Force

    # Copiar archivos a la copia de seguridad
    $archivos | ForEach-Object {
        Copy-Item -Path $_.FullName -Destination $directorioBackup
    }

    Write-Host "Se ha realizado una copia de seguridad en: $directorioBackup"
}

# Preguntar al usuario si desea borrar definitivamente los archivos
$borrar = Read-Host "¿Quieres borrar definitivamente estos archivos? (Y/N)"

# Validar la respuesta del usuario
if ($borrar -eq "Y") {
    # Eliminar los archivos del directorio de Descargas
    Remove-Item -Path "$destinoDescargas\$extension"
    Write-Host "Se han borrado definitivamente los archivos."
} elseif ($borrar -eq "N") {
    Write-Host "Operación cancelada. Los archivos no se han borrado."
} else {
    Write-Host "Respuesta no válida. Operación cancelada."
}

# Guardar un registro de las operaciones realizadas
$registro = @"
$(Get-Date) - Se realizaron las siguientes operaciones:
  - Se movieron archivos con la extensión '$extension' al directorio de Descargas.
"@
$registro | Out-File -Append "$destinoDescargas\LogOperaciones.txt"

# Proporcionar una opción para deshacer la última operación
$deshacer = Read-Host "¿Quieres deshacer la última operación? (Y/N)"
if ($deshacer -eq "Y") {
    # Implementar la lógica para deshacer la última operación (por ejemplo, restaurar la copia de seguridad)
    # Puedes añadir la lógica según sea necesario.
    Write-Host "Lógica para deshacer la última operación."
}

Write-Host "Operación finalizada."
