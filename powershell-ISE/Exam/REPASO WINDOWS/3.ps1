# Definir función para detener un servicio
function Stop-ServiceByName {
    param(
        [string]$ServiceName
    )
    
    $service = Get-Service -Name $ServiceName -ErrorAction SilentlyContinue
    
    if ($service -ne $null) {
        Stop-Service -Name $ServiceName
        Write-Host "Servicio $ServiceName detenido correctamente."
    } else {
        Write-Host "No se encontró el servicio $ServiceName."
    }
}

# Solicitar al usuario el nombre del servicio a detener
$serviceName = Read-Host "Ingrese el nombre del servicio que desea detener"

# Llamar a la función para detener el servicio
Stop-ServiceByName -ServiceName $serviceName
