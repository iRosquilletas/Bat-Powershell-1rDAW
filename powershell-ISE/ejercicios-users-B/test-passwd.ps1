function Test-passwd {
    param (
        [string]$password
    )

 
    while ($password.Length -lt 8) {
        Write-Host "La contraseña debe tener al menos 8 caracteres."
        return $false
    }

    while ($password -notmatch "[a-z]") {
        Write-Host "La contraseña debe contener al menos una letra mayúscula."
        return $false
    }

    
    while ($password -notmatch "[A-Z]") {
        Write-Host "La contraseña debe contener al menos una letra minúscula."
        return $false
    }
    
  
    while ($password -notmatch "\d") {
        Write-Host "La contraseña debe contener al menos un número."
        return $false
    }

   
    whi ($password -notmatch "[^a-zA-Z0-9]") {
        Write-Host "La contraseña debe contener al menos un carácter especial."
        return $false
    }
    
    if ($passdword -eq "['-!#$%&()*,./:;?@[]^_`{|}~+<=>]"){
        Write-Host "La contraseña no puede contener ese caracter."
        return $false
    }


    Write-Host "La contraseña cumple con los requisitos de complejidad."
    return $true
}


clear-host
$password = Read-Host "Ingrese la contraseña"
Test-passwd -password $password

