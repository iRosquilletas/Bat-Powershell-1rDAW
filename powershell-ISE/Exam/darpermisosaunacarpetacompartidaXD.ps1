# Ruta de la carpeta compartida
$rutaCarpeta = "C:\Users\Rosquilletas\Desktop\PRUEBAS"

# Nombre de usuario al que le asignarás permisos (en este caso, "Marta")
$nombreUsuario = "Marta"

# Asignar permisos de solo lectura
icacls $rutaCarpeta /grant "$($nombreUsuario):(R)"

#quitare
icacls $rutaCarpeta /remove "$nombreUsuario:(R)"

icacls $rutaCarpeta /remove "$nombreUsuario:(W)"



icacls $rutaCarpeta /remove "$nombreUsuario:(F)"
