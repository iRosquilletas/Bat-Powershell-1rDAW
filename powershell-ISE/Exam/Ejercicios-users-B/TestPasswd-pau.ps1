function Test-Passwd {
    param (
        [string]$Password
    )

    # Verificar si la contraseña tiene al menos 8 caracteres
    if ($Password.Length -lt 8) {
        Write-Host "La contraseña debe tener al menos 8 caracteres."
        return $false
    }

    # Verificar si la contraseña contiene al menos una letra mayúscula
    if ($Password -cnotmatch "[A-Z]") {
        Write-Host "La contraseña debe contener al menos una letra mayúscula."
        return $false
    }

    # Verificar si la contraseña contiene al menos una letra minúscula
    if ($Password -cnotmatch "[a-z]") {
        Write-Host "La contraseña debe contener al menos una letra minúscula."
        return $false
    }

    # Verificar si la contraseña contiene al menos un número
    if ($Password -notmatch "\d") {
        Write-Host "La contraseña debe contener al menos un número."
        return $false
    }

    # Verificar si la contraseña contiene al menos un carácter especial
    if ($Password -notmatch "[^a-zA-Z0-9]") {
        Write-Host "La contraseña debe contener al menos un carácter especial."
        return $false
    }

    # Si la contraseña pasa todas las verificaciones, devuelve verdadero
    return $true
}

$password = Read-Host "Ingrese la contraseña"
if (Test-Passwd $password) {
    Write-Host "La contraseña cumple con los requisitos de complejidad de Windows 11."
} else {
    Write-Host "La contraseña no cumple con los requisitos de complejidad de Windows 11."
}
