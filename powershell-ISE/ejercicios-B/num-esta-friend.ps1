# 19/12/23
# Preguntar si está el número
# By Santiago
$arraynum = @()
$n = Read-Host "Cuantos numeros quieres generar"

# Pedimos los valores para generar el random
$maximo = Read-Host "Dime el máximo que puede tener los números"
$minimo = Read-Host "Dime el mínimo que puede tener los números"

# Con el uso de un do-while rompemos el programa y salimos
do {
    # Con el for vamos generando los random a la array
    for ($i=0; $i -lt $n; $i++) {
        # Generamos el random con los valores pedidos anteriormente
        $random = Get-Random -Maximum $maximo -Minimum $minimo

        # Agregamos el nuevo número al array
        $arraynum += $random
    }

    $probarnumero = Read-Host "Dime un numero para ver si está dentro de los numeros generados"

    # Decimos si esta el numero en la lista
    if ($arraynum -contains $probarnumero) {
        Write-Host "Sí, el número está en la lista"
    } else {
        Write-Host "No, el número no está en la lista"
    }

    # Prueba para salir del programa y mostrar los numeros generados
    $posiblesalida = Read-Host "Quieres probar otra vez Y/N?"
    if ($posiblesalida -ne "Y") {
        Write-Host Los numeros eran $arraynum

        break
    }

} while ($true)
