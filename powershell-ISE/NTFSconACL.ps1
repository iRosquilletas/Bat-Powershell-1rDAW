Clear-Host

$usuariosNEW = "Jaime", "Belén", "Marta", "Luis", "Carlos", "Juan"
foreach($usuario in $usuariosNEW){
    New-LocalUser -Name $usuario 
    Add-LocalGroupMember -Group "Usuarios" -Member $usuario
    }

$grupos = "IES", "DAW", "DAM"
foreach($grupo in $grupos){
    New-LocalGroup -Name $grupo
    }

$usuariosIES = "Jaime", "Belén", "Marta", "Luis", "Carlos", "Juan"
    Add-LocalGroupMember -Group "IES" -Member $usuariosIES

$usuariosDAW = "Luis", "Carlos"
    Add-LocalGroupMember -Group "DAW" -Member $usuariosDAW

[String]$usuariosDAM = "Belén", "Marta"
    Add-LocalGroupMember -Group "DAM" -Member $usuariosDAM

