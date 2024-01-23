$empresa = Read-Host Dime el nombre de la empresa

New-Item -Path $empresa -ItemType Directory
New-Item -Path $empresa\css -ItemType Directory
New-Item -Path $empresa\imgs -ItemType Directory
New-Item -Path $empresa\index.html -ItemType File
New-Item -Path $empresa\css\style.css -ItemType File

$index = "
<!DOCTYPE html>
<html>
<head>
</head>
<body>
</body>
</html>
"

Set-Content -Path $empresa\index.html -Value $index

$style = "
body { }
"

Set-Content -Path $empresa\css\style.css -Value $style
