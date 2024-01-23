$nombre = Read-Host "Dime el nombre: "


New-Item -ItemType Directory -Path C:/Users/$env:USERNAME/Desktop/$nombre
"
<!DOCTYPE html>
<html>
<head>
</head>
<body>
</body>
</html> 
" | out-file C: \Users\$env:USERNAME/Desktop/$nombre/css/index.html

New-Item -ItemType Directory -Path C:\Users\$env:USERNAME/Desktop/$nombre/css

"body{}" > $env:USERNAME/Desktop/$nombre/css/style.css
New-Item -ItemType Directory -Path $env:USERSPROFILE/Desktop/$nombre/imgs

