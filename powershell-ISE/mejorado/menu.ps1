<#
A. Listar detalladamente los archivos en un directorio específico.
B. Contar la cantidad de archivos en un directorio seleccionado.
C. Calcular la cantidad total de archivos en un directorio y subdirectorios.
D. Mostrar los archivos en un directorio que ocupen más de 1GB.
E. Presentar la fecha y hora actual de forma personalizada.
F. Borrar archivos en un directorio específico.
G. Eliminar una palabra específica de un archivo de texto.
H. Salir del sistema.

Asegúrate de proporcionar mensajes claros al usuario y manejar posibles errores de manera adecuada.

#>

do {
    Write-Host "---- Sistema Avanzado de Gestión de Archivos ----"
    Write-Host "A. Listar detalladamente los archivos en un directorio"
    Write-Host "B. Contar la cantidad de archivos en un directorio"
    Write-Host "C. Calcular la cantidad total de archivos en un directorio y subdirectorios"
    Write-Host "D. Mostrar archivos en un directorio que ocupen más de 1GB"
    Write-Host "E. Presentar la fecha y hora actual de forma personalizada"
    Write-Host "F. Borrar archivos en un directorio"
    Write-Host "G. Eliminar una palabra específica de un archivo de texto"
    Write-Host "H. Buscar archivos por patrón de nombre"
    Write-Host "H. Salir"

    $opcion = Read-Host "Selecciona una opción"

    Switch ($opcion) {
        "A" {
            $directorio = Read-Host "Ingresa la ruta del directorio:"
            Get-ChildItem $directorio -File | Format-Table -Property Name, Length, LastWriteTime
        }
        "B" {
            $directorio = Read-Host "Ingresa la ruta del directorio:"
            (Get-ChildItem $directorio -File).Count
        }
        "C" {
            $directorio = Read-Host "Ingresa la ruta del directorio:"
            (Get-ChildItem $directorio -File -Recurse).Count
        }
        "D" {
            $directorio = Read-Host "Ingresa la ruta del directorio:"
            Get-ChildItem $directorio -File | Where-Object { $_.Length -gt 1GB }
        }
        "E" {
            $formatoFecha = Read-Host "Ingresa el formato de fecha y hora (ej. 'dd/MM/yyyy HH:mm:ss'):"
            Get-Date -Format $formatoFecha
        }
        "F" {
            $directorio = Read-Host "Ingresa la ruta del directorio:"
            Get-ChildItem $directorio | Remove-Item -Force -Recurse
            Write-Host "Archivos en '$directorio' eliminados."
        }
        "G" {
            $archivo = Read-Host "Ingresa la ruta del archivo de texto:"
            $palabra = Read-Host "Ingresa la palabra a eliminar:"
            (Get-Content $archivo) -replace $palabra | Set-Content $archivo
            Write-Host "Palabra '$palabra' eliminada de '$archivo'."
        }
        "H" {
            $directorio = Read-Host "Ingresa la ruta del directorio:"
            $patron = Read-Host "Ingresa el patrón de nombre a buscar:"
            Get-ChildItem $directorio -File -Recurse | Where-Object { $_.Name -match $patron }
        }
        "i" {
            exit
           }
        Default {
            Write-Host "Opción no válida. Por favor, selecciona una opción válida."
        }
    }
} while ($true)