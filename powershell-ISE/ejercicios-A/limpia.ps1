$extension = "*" + (Read-Host Dame la extension)

$ruta = Read-Host Dame la ruta 

$archivos = Get-ChildItem -Path $ruta -Filter $extension

Move-Item -Path $ruta/$extension -Destination $env:userprofile\Downloads

foreach ($archivo in $archivos) {
    Write-Host "Se ha movido $($archivo)"
}

$borrar = Read-Host ¿Quieres borrar estos archivos? Y/N

if ($borrar -eq "Y") {
    Remove-Item -Path $env:userprofile\Downloads\$extension
} elseif ($borrar -eq "N") {
    return
}