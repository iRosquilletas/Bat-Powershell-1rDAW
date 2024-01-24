param (
    [string]$csvFile
)

# Comprobar si se proporcionó el nombre del fichero CSV
if (-not $csvFile) {
    Write-Host "Por favor, proporciona el nombre del fichero CSV como parámetro."
    Exit
}

# Construir la ruta completa al fichero CSV
$csvPath = Join-Path -Path $PSScriptRoot -ChildPath $csvFile

# Comprobar si el fichero existe
if (-not (Test-Path $csvPath)) {
    Write-Host "El fichero $csvFile no existe en la ruta proporcionada."
    Exit
}

# Leer el contenido del fichero CSV
$usuarios = Import-Csv $csvPath

# Recorrer cada usuario y realizar las acciones necesarias
foreach ($usuario in $usuarios) {
    # Construir el login del usuario
    $login = ($usuario.NOMBRE.ToLower() -replace '\s', '') + $usuario.APELLIDO1.Substring(0, 2).ToLower() + $usuario.APELLIDO2.Substring(0, 2).ToLower()

    # Construir el nombre del grupo
    $grupo = $usuario.GRUPO

    # Construir la contraseña
    $password = $usuario.NIA

    # Crear el usuario
    New-LocalUser -Name $login -Password (ConvertTo-SecureString -AsPlainText $password -Force) -Description "$($usuario.NOMBRE) $($usuario.APELLIDO1) $($usuario.APELLIDO2)"

    # Añadir el usuario al grupo correspondiente
    Add-LocalGroupMember -Group $grupo -Member $login

    # Forzar el cambio de contraseña la primera vez que se conecta
    Set-LocalUser -Name $login -PasswordNeverExpires $true -UserMayNotChangePassword $false
}

Write-Host "Proceso completado."
