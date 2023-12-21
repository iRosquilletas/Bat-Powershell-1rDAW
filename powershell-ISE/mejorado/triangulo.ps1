<#Desarrolla un script en PowerShell llamado Triangulo.ps1 que permita al usuario dibujar un triángulo rectángulo, ya sea en posición normal o invertida, según su preferencia. El script debe solicitar al usuario el tamaño del triángulo y permitirle elegir la dirección del mismo (normal o invertido).

La salida debe consistir en líneas de asteriscos, formando un triángulo rectángulo según el tamaño especificado por el usuario. #>



# Solicitar al usuario el tamaño del triángulo
do {
    $tamanio = Read-Host "Ingrese el tamaño del triángulo (un número entero positivo):"
} until ($tamanio -match '^\d+$' -and $tamanio -gt 0)

# Solicitar al usuario la dirección del triángulo
do {
    $direccion = Read-Host "Ingrese la dirección del triángulo (N para normal, I para invertido):"
} until ($direccion -match '^[NI]$')

function Dibujar-Triangulo {
    param (
        [int]$size,
        [string]$dir
    )

    $triangulo = @()

    if ($dir -eq 'N') {
        # Triángulo normal
        for ($i = 1; $i -le $size; $i++) {
            $linea = '*' * $i
            $triangulo += $linea
            Write-Host $linea
        }
    } elseif ($dir -eq 'I') {
        # Triángulo invertido
        for ($i = $size; $i -ge 1; $i--) {
            $linea = '*' * $i
            $triangulo += $linea
            Write-Host $linea
        }
    }
}

Write-Host "Dibujando triángulo rectángulo de tamaño $tamanio en dirección $([char]::ToUpper($direccion))"
Dibujar-Triangulo -size $tamanio -dir $direccion
