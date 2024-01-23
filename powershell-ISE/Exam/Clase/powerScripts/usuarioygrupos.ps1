do {
    Clear-Host
    Write-Host "Menu"
    Write-Host "1.Listar los usuarios del sistema:"
    Write-Host "2. Crear usuario"
    Write-Host "3. Cambiar contraseña de un usuario"
    Write-Host "4. Desactivar un usuario"
    Write-Host "5. Borrar usuario"
    Write-Host "6. Listar los grupos de un usuario del sistema"
    Write-Host "7. Listar miembros de un grupo"
    Write-Host "8. Crear grupo"
    Write-Host "9. Borrar grupo"
    Write-Host "10. Añadir un usuario a un grupo"
    Write-Host "11. Borrar usuarios de un grupo"
    Write-Host "12. Salir"


    $opcion = Read-Host "Ingrese el numero de la opcion deseada "
    
    switch ($opcion){
        
        1 { 
          Get-LocalUser
          }
        2 {
          $name= Read-Host "Ingrese el nombre del usuario a crear"
          $pass= Read-Host -AsSecureString "Ingrese password" 
          New-LocalUser $name -Password $pass
          Enable-LocalUser $name
          Add-LocalGroupMember -Group usuarios -Member $name
          }
        3 { $name= Rea
        d-Host "Ingrese el nombre del usuario a modificar"
            $newpassword = Read-Host "Ingrese la nueva contraseña" -AsSecureString
            Set-LocalUser -Name $name -Password $newpassword
          }

        4 {
            Get-LocalUser
            $name= Read-Host "Ingrese el nombre del usuario a desabilitar"
            Disable-LocalUser -Name $name
          }
        5 {
            Get-LocalUser
            $name= Read-Host "Ingrese el nombre del usuario a borrar"
            Remove-LocalUser -Name $name
          }
        6 {Get-LocalGroup}

        7{$nomGroup = Read-Host Nombre del grupo
            Get-LocalGroupMember -Group $nomGroup}

        8{$nomGroup = Read-Host Nombre del grupo
            New-LocalGroup -Name $nomGroup}

        9{Get-LocalGroup
            $nomGrupo = Read-host NOmbre del grupo que quieres borrar 
            Remove-LocalGroup -Name $nomGrupo}

        10{ $nomGrupo = Read-host NOmbre del grupo
            $nom = Read-host Que usuario quieres añadir
               Add-localGroupMember -Group $nomGrupo -Member $nom}
        11{ $nomGrupo = Read-host NOmbre del grupo
            $nom = Read-host Que usuario quieres borrar
            Remove-localGroupMember -Group $nomGrupo -Member $nom
           }


        12 {exit}
        default {write-host "La opción elegida no es correcta"}
    }
    pause

} while ($true)