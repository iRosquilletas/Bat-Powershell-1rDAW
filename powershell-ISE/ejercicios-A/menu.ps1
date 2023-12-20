do {
     "A. Listar los ficheros"
     "B. Contar los ficheros que contiene un directorio"
     "C. Contar los ficheros que contiene un directorio y sus subdirectorios"
     "D. Contar los ficheros del directorio que ocupen más de 1GB"
     "E. Mostrar DIA y HORA"
     "F. Salir"

    $eleccion = Read-Host

    switch ( $eleccion ) {
        a { (Get-ChildItem C:\Users\$env:USERNAME)}
        b { (Get-ChildItem C:\Users\$env:USERNAME).Count}
        c { (Get-ChildItem C:\Users\$env:USERNAME -Recurse).count}
        d { ((Get-ChildItem C:\Users\$env:USERNAME -File | Where-Object {$_.Length -gt 1GB })).Count }
        e { (Get-Date)}
        f { exit}
        default {Write-Host No es válido.}
    }
    Read-Host
    Clear-Host

}while ($true)
        

        