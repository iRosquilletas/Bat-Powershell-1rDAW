# Solicitar al usuario la ruta del archivo de texto
$rutaArchivo = Read-Host "Introduce la ruta del archivo de texto"

# Verificar si el archivo existe
if (Test-Path $rutaArchivo -PathType Leaf) {
    # Solicitar al usuario la cadena de búsqueda
    $cadenaBuscar = Read-Host "Introduce la cadena que deseas buscar"

    # Solicitar al usuario la cadena de reemplazo
    $cadenaReemplazar = Read-Host "Introduce la cadena con la que deseas reemplazar"

    # Leer el contenido actual del archivo
    $contenido = Get-Content $rutaArchivo -Raw

    # Realizar la sustitución en el contenido
    $contenidoModificado = $contenido -replace $cadenaBuscar, $cadenaReemplazar

    # Escribir el contenido modificado de vuelta al archivo
    $contenidoModificado | Set-Content $rutaArchivo

    Write-Host "La sustitución se ha realizado con éxito."
} else {
    Write-Host "El archivo especificado no existe. Por favor, verifica la ruta del archivo."
}
