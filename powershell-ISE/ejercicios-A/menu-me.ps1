Write-Host "---- Menu ----"
Write-Host "A. Listar los ficheros de un directorio"
Write-Host "B. Contar los ficheros que contiene un directorio"
Write-Host "C. Contra los ficheros que contiene un directorio y sus subdirectorios"
Write-Host "D. Contar los ficheros del directorio que ocupen más de 1GB"
Write-Host "E. Mostrar DIA y HORA"
Write-Host "F. Salir"

$a = Read-Host "Elige alguna opción"

Switch ($a) {
    "A" {
        [String]$b = Read-Host "Dime el directorio: "
        Get-ChildItem $b
    }
    "B" {
        [String]$b = Read-Host "Dime el directorio: "
        (Get-ChildItem $b -File).Count
    }
    "C" {
        [String]$b = Read-Host "Dime el directorio: "
        (Get-ChildItem $b -File -Recurse).Count
    }
    "D" {
        [String]$b = Read-Host "Dime el directorio: "
        (Get-ChildItem $b -File).Count | Where-Object { $_.Length -gt 1GB}

    }

}