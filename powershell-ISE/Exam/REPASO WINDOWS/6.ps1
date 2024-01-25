# Ruta al archivo CSV
$csvPath = "C:\Ruta\A\Tu\alta_usu.csv"

# Leer el archivo CSV
$userData = Import-Csv -Path $csvPath

# Iterar sobre los datos del CSV
foreach ($user in $userData) {
    $username = $user.Nombre
    $department = $user.Departamento

    # Verificar si el usuario ya existe
    $existingUser = Get-LocalUser -Name $username -ErrorAction SilentlyContinue

    if ($existingUser -eq $null) {
        # Crear nuevo usuario si no existe
        New-LocalUser -Name $username -Group $department -Password (ConvertTo-SecureString "TuPassword" -AsPlainText -Force)
        Write-Host "Usuario $username creado en el departamento $department."
    } else {
        Write-Host "El usuario $username ya existe."
    }
}
