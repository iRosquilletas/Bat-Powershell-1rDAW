param (
    [string]$menuTitle
)

function MostrarMenu {
    Write-Host "-------------------------------- $menuTitle ---------------------------------"
    Write-Host "1. Crear recurso compartido"
    Write-Host "2. Mostrar información de los recursos compartidos"
    Write-Host "3. Mostrar información detallada de un recurso"
    Write-Host "4. Modificar recurso"
    Write-Host "5. Eliminar recurso compartido"
    Write-Host "6. Añadir permiso de usuario a un recurso"
    Write-Host "7. Eliminar permiso de usuario"
    Write-Host "8. Denegar acceso de un usuario a recurso"
    Write-Host "9. Desbloquear acceso a recurso"
    Write-Host "10. Salir"
}

function CrearRecursoCompartido {
    $nombreRecurso = Read-Host "Introduce el nombre del recurso compartido:"
    $pathRecurso = Read-Host "Introduce la ruta del recurso compartido:"
    
    if (-not (Test-Path $pathRecurso -PathType Container)) {
        Write-Host "La ruta especificada no es válida o no existe."
        return
    }

    if (Get-SmbShare -Name $nombreRecurso -ErrorAction SilentlyContinue) {
        Write-Host "El recurso compartido '$nombreRecurso' ya existe."
    } else {
        New-SmbShare -Name $nombreRecurso -Path $pathRecurso
        Write-Host "Recurso compartido '$nombreRecurso' creado exitosamente en la ruta '$pathRecurso'."
    }
}

function MostrarInformacionRecursos {
    Get-SmbShare | Format-Table -AutoSize
}

function MostrarInformacionDetalladaRecurso {
    $nombreRecurso = Read-Host "Introduce el nombre del recurso compartido:"
    Get-SmbShare -Name $nombreRecurso | Format-List
}

function ModificarRecurso {
    $nombreRecurso = Read-Host "Introduce el nombre del recurso compartido a modificar:"
    $nuevaDescripcion = Read-Host "Introduce la nueva descripción del recurso:"
    
    Set-SmbShare -Name $nombreRecurso -Description $nuevaDescripcion
    Write-Host "Descripción del recurso '$nombreRecurso' modificada exitosamente."
}

function EliminarRecursoCompartido {
    $nombreRecurso = Read-Host "Introduce el nombre del recurso compartido a eliminar:"
    
    if (Get-SmbShare -Name $nombreRecurso -ErrorAction SilentlyContinue) {
        Remove-SmbShare -Name $nombreRecurso -Force
        Write-Host "Recurso compartido '$nombreRecurso' eliminado exitosamente."
    } else {
        Write-Host "El recurso compartido '$nombreRecurso' no existe."
    }
}

function AgregarPermisoUsuarioRecurso {
    $nombreRecurso = Read-Host "Introduce el nombre del recurso compartido:"
    $usuario = Read-Host "Introduce el nombre del usuario:"
    $permiso = Read-Host "Introduce el permiso (Read/Change/FullControl):"
    
    Grant-SmbShareAccess -Name $nombreRecurso -AccountName $usuario -AccessRight $permiso
    Write-Host "Permiso '$permiso' añadido al usuario '$usuario' en el recurso '$nombreRecurso'."
}

function EliminarPermisoUsuarioRecurso {
    $nombreRecurso = Read-Host "Introduce el nombre del recurso compartido:"
    $usuario = Read-Host "Introduce el nombre del usuario:"
    $permiso = Read-Host "Introduce el permiso (Read/Change/FullControl):"
    
    Revoke-SmbShareAccess -Name $nombreRecurso -AccountName $usuario -AccessRight $permiso
    Write-Host "Permiso '$permiso' eliminado al usuario '$usuario' en el recurso '$nombreRecurso'."
}

function DenegarAccesoUsuarioRecurso {
    $nombreRecurso = Read-Host "Introduce el nombre del recurso compartido:"
    $usuario = Read-Host "Introduce el nombre del usuario:"
    
    Block-SmbShareAccess -Name $nombreRecurso -AccountName $usuario
    Write-Host "Acceso denegado al usuario '$usuario' en el recurso '$nombreRecurso'."
}

function DesbloquearAccesoUsuarioRecurso {
    $nombreRecurso = Read-Host "Introduce el nombre del recurso compartido:"
    $usuario = Read-Host "Introduce el nombre del usuario:"
    
    Unblock-SmbShareAccess -Name $nombreRecurso -AccountName $usuario
    Write-Host "Acceso desbloqueado al usuario '$usuario' en el recurso '$nombreRecurso'."
}

do {
    MostrarMenu
    $opcion = Read-Host "Selecciona una opción (1-10):"

    switch ($opcion) {
        1 { CrearRecursoCompartido }
        2 { MostrarInformacionRecursos }
        3 { MostrarInformacionDetalladaRecurso }
        4 { ModificarRecurso }
        5 { EliminarRecursoCompartido }
        6 { AgregarPermisoUsuarioRecurso }
        7 { EliminarPermisoUsuarioRecurso }
        8 { DenegarAccesoUsuarioRecurso }
        9 { DesbloquearAccesoUsuarioRecurso }
        10 { Write-Host "Saliendo del programa." }
        default { Write-Host "Opción no válida. Introduce un número del 1 al 10." }
    }

} while ($opcion -ne 10)
