[int]$tamaño = Read-host "Dime el tamaño"

for ($i = 1; $i -le $tamaño; $i++) {
    $fila = ($i..($i + $tamaño - 1)) -join ' '
    Write-Host $fila
}
<#   #: Los comentarios en PowerShell comienzan con el símbolo de numeral (#).
    Read-host: Solicita al usuario que ingrese un valor desde la consola.
    $i: Variable de bucle que representa el número de fila actual.
    $i..($i + $tamaño - 1): Genera una secuencia de números consecutivos desde $i hasta $i + $tamaño - 1.
    -join ' ': Une los elementos de la secuencia con un espacio en blanco.
    Write-Host: Imprime el contenido en la consola. #>