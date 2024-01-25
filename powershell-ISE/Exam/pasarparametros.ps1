PowerShell
Param(
    [string] $Primero,
    [string] $Segundo = "valor por defecto",
    [switch] $Tercero = $false,
    [bool] $Cuarto,
    [int] $Quinto
)
Write-Host $Primero
Write-Host $Segundo
Write-Host $Tercero
Write-Host $Cuarto
Write-Host $Quinto