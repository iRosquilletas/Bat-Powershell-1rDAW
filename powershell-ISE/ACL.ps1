New-item -ItemType Directory -Path C:\SENIA
New-item -ItemType Directory -Path C:\SENIA\APUNTES
New-item -ItemType Directory -Path C:\SENIA\APUNTES\DAW
New-item -ItemType Directory -Path C:\SENIA\APUNTES\DAM


$acl = Get-Acl C:\SENIA
$AccessRule = New-Object System.Security.accessControl.FileSystemAccessRule("IES", "Read", "Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl C:\SENIA


$acl = Get-Acl C:\SENIA\APUNTES
$AccessRule = New-Object System.Security.accessControl.FileSystemAccessRule("Juan", "FullControl", "Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl C:\SENIA\APUNTES

$permisos = "Read", "Write", "ExecuteFile"
$acl = Get-Acl C:\SENIA\APUNTES\DAW
$AccessRule = New-Object System.Security.accessControl.FileSystemAccessRule("DAW", $permisos, "Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl C:\SENIA\APUNTES\DAW

$acl = Get-Acl C:\SENIA\APUNTES\DAW
$AccessRule = New-Object System.Security.accessControl.FileSystemAccessRule("DAM", "FullControl", "Deny")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl C:\SENIA\APUNTES\DAW

$permisos = "Read", "Write", "ExecuteFile"
$acl = Get-Acl C:\SENIA\APUNTES\DAM
$AccessRule = New-Object System.Security.accessControl.FileSystemAccessRule("DAM", $permisos, "Allow")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl C:\SENIA\APUNTES\DAM

$acl = Get-Acl C:\SENIA\APUNTES\DAM
$AccessRule = New-Object System.Security.accessControl.FileSystemAccessRule("DAW", "FullControl", "Deny")
$acl.SetAccessRule($AccessRule)
$acl | Set-Acl C:\SENIA\APUNTES\DAM