Clear-Host

$usuariosNEW = "Jaime", "Marta", "Luis", "Belén", "Carlos", "Juan"
foreach($usuario in $usuariosNEW){
    New-LocalUser -Name $usuario -NoPassword
    Add-LocalGroupMember -Group "Usuarios" -Member $usuario
    }

$grupos = "IES", "DAW", "DAM"
foreach($grupo in $grupos){
    New-LocalGroup -Name $grupo
    }

$usuariosIES = "Jaime", "Belén", "Marta", "Luis", "Carlos", "Juan"
    Add-LocalGroupMember -Group "IES" -Member $usuariosIES

$usuariosDAM = "Marta", "Belén"
    Add-LocalGroupMember -Group "DAM" -Member $usuariosDAM

$usuariosDAW = "Luis", "Carlos"
    Add-LocalGroupMember -Group "DAW" -Member $usuariosDAW



#$usuariosDAM = "Marta", "Belén"
#foreach ($usuario in $usuariosDAM){
#    Add-LocalGroupMember -Group "DAM" -Member $usuario
#}




