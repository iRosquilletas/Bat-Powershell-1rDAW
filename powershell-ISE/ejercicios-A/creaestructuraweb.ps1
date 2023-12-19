Write-Host "Automatizador de estructura básica de una página web"
$pregunta = Read-Host "Introduce cómo quieres que se llame la carpeta principal"
New-Item "$env:USERPROFILE\Desktop\$pregunta" -ItemType Directory
New-Item "$env:USERPROFILE\Desktop\$pregunta\index.html" -ItemType File
New-Item "$env:USERPROFILE\Desktop\$pregunta\css" -ItemType Directory
New-Item "$env:USERPROFILE\Desktop\$pregunta\css\style.css" -ItemType File
New-Item "$env:USERPROFILE\Desktop\$pregunta\imgs" -ItemType Directory
Add-Content -Path "$env:USERPROFILE\Desktop\$pregunta\index.html" -Value "<!DOCTYPE html>
    <html>
        <head>
        </head>
        <body>
        </body>
    </html>"
Add-Content -Path "$env:USERPROFILE\Desktop\$pregunta\css\style.css" -Value "body{}"