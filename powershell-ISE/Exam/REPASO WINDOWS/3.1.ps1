# Solicitar al usuario el nombre del servicio a detener
$serviceName = Read-Host "Ingrese el nombre del servicio que desea detener"

# Intentar detener el servicio
try {
    Stop-Service -Name $serviceName -ErrorAction Stop
    Write-Host "Servicio $serviceName detenido correctamente."
} catch {
    Write-Host "Error al detener el servicio $serviceName. Asegúrate de que el servicio existe y que tienes los permisos necesarios."
}
