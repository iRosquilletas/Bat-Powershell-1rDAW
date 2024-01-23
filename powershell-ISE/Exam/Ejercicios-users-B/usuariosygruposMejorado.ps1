do{
function Test-passwd {
    param (
        [string]$password
    )

 
    if ($password.Length -lt 8) {
        Write-Host "La contraseña debe tener al menos 8 caracteres."
        return $false
    }

    if ($password -cnotmatch "[a-z]") {
        Write-Host "La contraseña debe contener al menos una letra mayúscula."
        return $false
    }

    
    if ($password -cnotmatch "[A-Z]") {
        Write-Host "La contraseña debe contener al menos una letra minúscula."
        return $false
    }
    
  
    if ($password -notmatch "\d") {
        Write-Host "La contraseña debe contener al menos un número."
        return $false
    }

   
    if ($password -notmatch "[^a-zA-Z0-9]") {
        Write-Host "La contraseña debe contener al menos un carácter especial."
        return $false
    }


    Write-Host "La contraseña cumple con los requisitos de complejidad."
    return $true
}
clear-host
Write-Host "---- Menu ----"
Write-Host "1. Listar los usuario del sistema"
Write-Host "2. Crear usuario"
Write-Host "3. Cambiar contraseña de un usuario"
Write-Host "4. Desactivar usuario"
Write-Host "5. Borrar usuario"
Write-Host "6. Listar los grupos de usuarios del sistema"
Write-Host "7. Listar miembros de un grupo"
Write-Host "8. Crear grupo"
Write-Host "9. Borrar grupo"
Write-Host "10. Añadir usuario a grupo"
Write-Host "11. Borrar usuario de un grupo"
Write-Host "12. Salir"


$a = Read-Host "Qué opción eliges?"

switch($a) {
    "1" {
        
        Get-LocalUser
        pause
        
    }
    "2"{
        $name =  Read-Host "Introduce el nombre"
        $password = Read-Host "Introduce la contraseña "-AsSecureString
        if (Test-passwd -password $password -ne False){
            Write-Host "Contraseña segura"
        } else {
            pause
            Exit
           
        }
        $completeName = Read-Host "Introduce el nombre completo"
 
        $description = Read-Host "Introuce la descripción de tu cuenta"
        New-LocalUser $name -Password $password -FullName $completename -Description $description
        Add-LocalGroupMember -Group "Usuarios" -Member $name
        Get-LocalUser
        pause
    }
    "3"{
        $password = Read-Host "Introduce la contraseña" -AsSecureString
        Set-LocalUser -Name "UsuarioExistente" -Password $password -AsPlainText -Force
    
    
    }
    "4"{
        $name = Read-Host "Introduce el nombre del usuario"
        Disable-LocalUser -Name $name
    }
    "5"{
        $delete = Read-Host "Introduce el nombre del usuario que desea eliminar"
        Remove-LocalUser -Name $delete
    }
    "6"{
        Get-LocalGroup

    }

    "7"{
        $a = Read-Host "Introduce el nombre del grupo que desea listar"
        Get-LocalGroupMember -Group $a
        pause
    
    }
    "8"{
        $group = Read-Host "Introduce el nombre del grupo"
        New-LocalGroup -Name $group
        pause

    }
    "9"{
        $delete = Read-Host "Introduce el grupo que quieras eliminar"
        $o = Read-Host "Estás seguro que quieres eliminar el grupo $delete?"
        switch ($o){
           "s" {
                Remove-LocalGroup -Name $delete
                pause
           }
           "n"{
                exit

           } default {
                "Opción no valida"
           }
        }
    }

    "10"{
        $group = Read-Host "Introduce el nombre del grupo"
        $user = Read-Host "Introduce el nombre del usuario que quieras añadir"
        Add-LocalGroupMember -Group $group -Member $user
    }

    "11"{
        $group = Read-Host "Introduce el nombre del grupo"
        $user = Read-Host "Introduce el nombre del usuario que quieras añadir"       
        Remove-LocalGroupMember -Group $group -Member $user

    }
    "12"{
        exit
    } default {
        "Opción invalida"
    
    }
}
}while($true)