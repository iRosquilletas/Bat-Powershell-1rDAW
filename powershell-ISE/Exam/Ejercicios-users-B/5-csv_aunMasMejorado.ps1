# Nombre del fichero CSV
$csvFile = "ususenia.csv"

# Pedir al usuario los datos para el nuevo usuario
$nombre = Read-Host "Introduce el nombre del nuevo usuario:"
$apellido1 = Read-Host "Introduce el primer apellido del nuevo usuario:"
$apellido2 = Read-Host "Introduce el segundo apellido del nuevo usuario:"
$nia = Read-Host "Introduce el NIA del nuevo usuario:"
$grupo = Read-Host "Introduce el grupo al que pertenece el nuevo usuario (ejemplo: 1ESOA):"

# Construir el login del usuario
$login = ($nombre.ToLower() -replace '\s', '') + $apellido1.Substring(0, 2).ToLower() + $apellido2.Substring(0, 2).ToLower()

# Construir la contraseña
$password = $nia

# Crear el objeto usuario
$nuevoUsuario = [PSCustomObject]@{
    NOMBRE = $nombre
    APELLIDO1 = $apellido1
    APELLIDO2 = $apellido2
    NIA = $nia
    GRUPO = $grupo
}

# Añadir el nuevo usuario al fichero CSV
$nuevoUsuario | Export-Csv -Path $csvFile -Append -NoTypeInformation

# Mostrar información del nuevo usuario
Write-Host "`nNuevo usuario añadido:"
Write-Host "Login: $login"
Write-Host "Contraseña: $password"
Write-Host "Grupo: $grupo"
Write-Host "Nombre completo: $nombre $apellido1 $apellido2"
