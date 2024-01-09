# Solicitar al usuario que ingrese la ruta del archivo
$rutaArchivo = Read-Host "Ingresa la ruta completa del archivo"

# Verificar si el archivo existe
if (Test-Path $rutaArchivo -PathType Leaf) {
    Write-Host "¡El archivo existe!"
} else {
    Write-Host "El archivo no existe en la ruta especificada."
}
