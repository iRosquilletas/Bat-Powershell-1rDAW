# Importar el módulo necesario
Import-Module Microsoft.PowerShell.LocalAccounts

# Preguntar el nombre del fichero csv
$csvFile = Read-Host -Prompt 'Introduce el nombre del fichero csv'

# Leer el archivo CSV
$usuarios = Import-Csv -Path .\$csvFile

# Recorrer cada fila del CSV
foreach ($usuario in $usuarios) {
    # Crear el nombre de usuario con las tres primeras letras del nombre y del apellido
    $nombreUsuario = ($usuario.NOMBRE.Substring(0,3) + $usuario.APELLIDO1.Substring(0,3)).ToLower()

    # Crear el usuario local
    $nuevoUsuario = New-LocalUser -Name $nombreUsuario -Password (ConvertTo-SecureString -AsPlainText $usuario.NIA -Force) -FullName "$($usuario.NOMBRE) $($usuario.APELLIDO1) $($usuario.APELLIDO2)" -Description "Usuario creado de forma masiva" -UserMayNotChangePassword $false -PasswordNeverExpires $false

    # Añadir el usuario al grupo correspondiente
    Add-LocalGroupMember -Group $usuario.GRUPO -Member $nuevoUsuario
}



