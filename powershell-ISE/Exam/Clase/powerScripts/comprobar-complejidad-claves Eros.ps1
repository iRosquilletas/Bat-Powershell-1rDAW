Clear-Host
$password = Read-Host "Dime la contraseña"
#pasar la variable de string a una array de caractéres
$arrayPassword = $password.ToCharArray()

[int]$contador= ""

if($arrayPassword.Length -ge 10){
    Write-Host "tamaño"
    $contador++

}

for(($a = 0); $a -lt $arrayPassword.Length; $a++){
    
    #IsUpper determina si hay una mayúscula
    if([char]::IsUpper($arrayPassword[$a])){
    Write-Host "mayúsculas"
        $contador++
        break
    
    }

}
for(($a = 0); $a -lt $arrayPassword.Length; a++){

    if([char]::IsLower($arrayPassword[$a])){
        Write-Host "minúscula"
        $contador++
        break
    
    }

}


$caracteresEspeciales = "'-!"#$%&()*,./:;?@[]^_`{|}~+<=>"
$caracteresEspecialesChar= $caracteresEspeciales.ToCharArray()


for(($b = 0);$b -lt $arrayPassword.Length; $b++){

    for(($c=0); $c -lt $caracteresEspecialesChar.Length; $c++){
    
        if($caracteresEspecialesChar[$c] -eq $arrayPassword[$b]){
            Write-Host "Caracter especial"
            $contador++
            break

        }    
    }

}

if($contador -eq 4){

    Write-Host "Su contraseña es apta"

}else{

    Write-Host "Su contraseña no es apta"

}