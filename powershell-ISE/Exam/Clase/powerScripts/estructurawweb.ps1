$nombre=Read-Host "¿Nombre de la empresa?"

New-Item -ItemType Directory -path C:\Users\$env:USERNAME\Desktop\$nombre
New-Item C:\Users\$env:USERNAME\Desktop\$nombre\index.html

"
<!DOCTYPE html>
<html>
<head>
</head>
<body>
</body>
</html>
" | Out-File "C:\Users\$env:USERNAME\Desktop\$nombre\index.html"

