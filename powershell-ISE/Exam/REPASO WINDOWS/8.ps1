# Definir detalles del recurso compartido
$recursoCompartido = "APUNTES"
$unidadMapeo = "W:"
$usuario = "Usuario"  # Nombre de usuario con acceso al recurso compartido
$password = "TuPassword"  # Contraseña del usuario

# Crear una credencial para el acceso al recurso compartido
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force
$credencial = New-Object -TypeName PSCredential -ArgumentList $usuario, $securePassword

# Montar el recurso compartido como una unidad de red
New-PSDrive -Name $unidadMapeo -PSProvider FileSystem -Root "\\Servidor\$recursoCompartido" -Credential $credencial -Persist

Write-Host "Recurso compartido $recursoCompartido montado como unidad $unidadMapeo."
