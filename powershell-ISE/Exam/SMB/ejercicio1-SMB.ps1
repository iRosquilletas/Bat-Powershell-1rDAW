# Crear usuarios locales
New-LocalUser -Name "Consulta" -Password (ConvertTo-SecureString -AsPlainText "ContraseñaConsulta" -Force) -Description "Usuario de consulta"
New-LocalUser -Name "Modifica" -Password (ConvertTo-SecureString -AsPlainText "ContraseñaModifica" -Force) -Description "Usuario de modificación"

# Crear directorio a compartir
$sharePath = "C:\COMPARTIR"
New-Item -Path $sharePath -ItemType Directory -Force

# Compartir recurso DATOS
New-SmbShare -Name "DATOS" -Path $sharePath -FullAccess "Modifica" -ReadAccess "Consulta"

# Configurar firewall para permitir el tráfico SMB
New-NetFirewallRule -DisplayName "File and Printer Sharing (SMB-In)" -Direction Inbound -Protocol TCP -LocalPort 445 -Action Allow

# Permitir acceso desde cualquier IP (Parte voluntaria)
Set-SmbServerConfiguration -EnableSMB1Protocol $true -EnableSMB2Protocol $true

# Cliente - Montar el recurso compartido desde otro ordenador (puede ejecutarse en otro equipo)
$credConsulta = New-Object -TypeName PSCredential -ArgumentList "Consulta", (ConvertTo-SecureString -AsPlainText "ContraseñaConsulta" -Force)
$driveLetter = "W:"
$uncPath = "\\Servidor\DATOS"

# Asignar unidad W: con el usuario consulta
New-PSDrive -Name $driveLetter -PSProvider FileSystem -Root $uncPath -Credential $credConsulta -Persist

# Hacer que el recurso sea permanente
New-SmbMapping -LocalPath $driveLetter -RemotePath $uncPath -Persistent $true
