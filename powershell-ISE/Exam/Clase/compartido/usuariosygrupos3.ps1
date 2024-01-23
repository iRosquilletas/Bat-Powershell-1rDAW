$opcion = 0

do {
    Write-Host "Seleccione una opción:"
    Write-Host "1. Agregar users a grupos"
    Write-Host "2. Crear grupo profesor y directorios"
    Write-Host "3. Establecer permisos"
    Write-Host "0. Salir"

    $opcion = Read-Host "Ingrese el número de la opción"

    switch ($opcion) {
        1 {
            do {
                Write-Host "Seleccione una opción:"
                Write-Host "1. Agregar usuario 'Marta' al grupo 'DAM'"
                Write-Host "2. Agregar usuario 'Luis' al grupo 'IES'"
                Write-Host "3. Agregar usuario 'Luis' al grupo 'DAW'"
                Write-Host "4. Agregar usuario 'Carlos' al grupo 'IES'"
                Write-Host "5. Agregar usuario 'Carlos' al grupo 'DAW'"
                Write-Host "6. Agregar usuario 'Juan' al grupo 'IES'"
                Write-Host "7. Agregar usuario 'Juan' al grupo 'DAW'"
                Write-Host "8. Agregar usuario 'Juan' al grupo 'profesor'"
                Write-Host "0. Volver al menú principal"

                $opcionUsuario = Read-Host "Ingrese el número de la opción"

                switch ($opcionUsuario) {
                    1 {
                        $username = "Marta"
                        $group = "DAM"
                        New-LocalUser -Name $username
                        Add-LocalGroupMember -Group $group -Member $username
                        Enable-LocalUser $username
                    }
                    2 {
                        $username = "Luis"
                        $group = "IES"
                        New-LocalUser -Name $username
                        Add-LocalGroupMember -Group $group -Member $username
                        Enable-LocalUser $username
                    }
                    3 {
                        $username = "Luis"
                        $group = "DAW"
                        New-LocalUser -Name $username
                        Add-LocalGroupMember -Group $group -Member $username
                        Enable-LocalUser $username
                    }
                    4 {
                        $username = "Carlos"
                        $group = "IES"
                        New-LocalUser -Name $username
                        Add-LocalGroupMember -Group $group -Member $username
                        Enable-LocalUser $username
                    }
                    5 {
                        $username = "Carlos"
                        $group = "DAW"
                        New-LocalUser -Name $username
                        Add-LocalGroupMember -Group $group -Member $username
                        Enable-LocalUser $username
                    }
                    6 {
                        $username = "Juan"
                        $group = "IES"
                        New-LocalUser -Name $username
                        Add-LocalGroupMember -Group $group -Member $username
                        Enable-LocalUser $username
                    }
                    7 {
                        $username = "Juan"
                        $group = "DAW"
                        New-LocalUser -Name $username
                        Add-LocalGroupMember -Group $group -Member $username
                        Enable-LocalUser $username
                    }
                    8 {
                        $username = "Juan"
                        $group = "profesor"
                        New-LocalUser -Name $username
                        Add-LocalGroupMember -Group $group -Member $username
                        Enable-LocalUser $username
                    }
                }
            } while ($opcionUsuario -ne 0)
        }
        2 {
            New-LocalGroup -Name "profesor"
            New-LocalGroup -Name "IES"
            New-LocalGroup -Name "DAW"
            New-LocalGroup -Name "DAM"
            New-Item -ItemType Directory -Path "c:\users\vicent\desktop\senia"
            New-Item -ItemType Directory -Path "c:\users\vicent\desktop\senia\APUNTES"
            New-Item -ItemType Directory -Path "c:\users\vicent\desktop\senia\APUNTES\DAW"
            New-Item -ItemType Directory -Path "c:\users\vicent\desktop\senia\APUNTES\DAM"
        }
        3 {
            # Create two local users
            $consultaUser = New-LocalUser -Name "Consulta" 
            $modificaUser = New-LocalUser -Name "Modifica" 

            # Create a shared folder
            New-Item -Path "C:\COMPARTIR" -ItemType Directory

            # Share the folder with appropriate permissions
            New-SmbShare -Name "DATOS" -Path "C:\COMPARTIR" -FullAccess "Modifica" -ReadAccess "Consulta"
            # IES SOLO LECTURA
            $acl = Get-Acl "c:\users\vicent\desktop\senia"
            $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("IES", "Read", "Allow")
            $acl.SetAccessRule($AccessRule)
            $acl | Set-Acl "c:\users\vicent\desktop\senia"

            # Permisos del profesor
            $acl = Get-Acl "c:\users\vicent\desktop\senia\APUNTES"
            $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("profesor", "FullControl", "Allow")
            $acl.SetAccessRule($AccessRule)
            $acl | Set-Acl "c:\users\vicent\desktop\senia\APUNTES"
            
            # DAW 
            $acl = Get-Acl "c:\users\vicent\desktop\senia\APUNTES\DAW"
            $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("DAW", "Read,Write,ReadAndExecute","Allow")
            $acl.SetAccessRule($AccessRule)
            $acl | Set-Acl "c:\users\vicent\desktop\senia\APUNTES\DAW"

            #DAM
            $acl = Get-Acl "c:\users\vicent\desktop\senia\APUNTES\DAM"
            $AccessRule = New-Object System.Security.AccessControl.FileSystemAccessRule("DAM", "Read,Write,ReadAndExecute","Allow")
            $acl.SetAccessRule($AccessRule)
            $acl | Set-Acl "c:\users\vicent\desktop\senia\APUNTES\DAM"

        }
    }
} while ($opcion -ne 0)
