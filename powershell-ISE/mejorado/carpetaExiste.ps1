# Solicitar al usuario que ingrese la ruta de la carpeta
$rutaCarpeta = Read-Host "Ingresa la ruta completa de la carpeta"

# Verificar si la carpeta existe
if (Test-Path $rutaCarpeta -PathType Container) {
    Write-Host "¡La carpeta existe!"
} else {
    Write-Host "La carpeta no existe en la ruta especificada."
}
