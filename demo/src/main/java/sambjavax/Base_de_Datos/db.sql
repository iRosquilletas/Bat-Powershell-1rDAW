CREATE DATABASE cesdb2022;
USE cesdb2022;
CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nombre_usuario VARCHAR(50) NOT NULL,
    contrasena VARCHAR(100) NOT NULL,
    salt VARCHAR(100) NOT NULL,
rol ENUM('Empleado', 'Admin') NOT NULL DEFAULT 'Empleado' CHECK (rol IN ('Empleado', 'Admin')),


);







CREATE TABLE Motocicletas (
    id_moto INT AUTO_INCREMENT PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(50) NOT NULL,
    matricula VARCHAR(20) NOT NULL,
    numero_bastidor VARCHAR(50) NOT NULL,
);




CREATE TABLE Ventas (
    id_venta INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    cliente VARCHAR(100) NOT NULL,
    correo VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    direccion VARCHAR(255) NOT NULL,
    dni VARCHAR(20) NOT NULL,
    id_moto INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario),
    FOREIGN KEY (id_moto) REFERENCES Motocicletas(id_moto)
);
CREATE TABLE tabla_prueba (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    ip_address VARCHAR(45) NOT NULL
);
