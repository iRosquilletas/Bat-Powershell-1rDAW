CREATE DATABASE ERMUZA;
USE ERMUZA;
create table platos(

	id_plato int(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    descripcion text

);
CREATE TABLE Mesas(

	id_Mesa int(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    capacidad int(3)  not null
    
);
CREATE TABLE Trabajadores(

	idTrabajador int(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Nombre varchar(25) NOT NULL,
    Primer_Apellido varchar(25) NOT NULL,
    Segundo_Apellido varchar(25) NOT NULL,
    Rango enum("JefeSala", "Camarero" , "Cocinero") not null,
    DNI varchar(9)
   
);
CREATE TABLE MesaTrabajadores(
	id_Mesa int(3) NOT NULL,
    id_Trabajador int(3) NOT NULL,
	FOREIGN KEY (id_Mesa) REFERENCES Mesas(id_Mesa),
    FOREIGN KEY (id_Trabajador) REFERENCES Trabajadores(idTrabajador)
);

	CREATE TABLE comandas(

		id_Comanda int(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
		id_Mesa int(3) not null,
		Estado ENUM("abierta", "cerrada" , "cobrada") not null,
		FOREIGN KEY (id_Mesa) REFERENCES Mesas(id_Mesa)
		
	);

CREATE TABLE detalleComanda(
    id_DetalleComanda int(3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_Comanda int(3) NOT NULL,
    id_Plato int(3) NOT NULL,
    Cantidad int(3) NOT NULL,
    Estado VARCHAR(15) NOT NULL,  
    FOREIGN KEY (id_Comanda) REFERENCES comandas(id_Comanda),
    FOREIGN KEY (id_Plato) REFERENCES platos(id_plato)
);





    
INSERT INTO Trabajadores (Nombre, Primer_Apellido, Segundo_Apellido, Rango, DNI) 
VALUES
('Eros', 'Muñoz', 'Zanón', 'JefeSala', '12345678M'),
('Alvaro', 'Pardo', 'Escartí', 'Camarero', '98765432P'),
('Pedro', 'Rodriguez', 'Fernandez', 'Camarero', '45678912U'),
('Maximo', 'Escartí', 'Izquierdo', 'Cocinero', '78912345X');

INSERT INTO Mesas (capacidad) VALUES
(4),
(2),
(6),
(8),
(3),
(5),
(10),
(4),
(7),
(2);

INSERT INTO platos (descripcion) VALUES
('Pizza Margarita'),
('Espaguetis a la boloñesa'),
('Hamburguesa con queso'),
('Ensalada César'),
('Sushi de salmón'),
('Paella mixta'),
('Lasagna'),
('Tacos al pastor'),
('Pollo a la parrilla'),
('Ceviche de camarón'),
('Risotto de champiñones'),
('Filete de salmón a la plancha'),
('Pad Thai'),
('Sándwich de pollo'),
('Calamares fritos');

INSERT INTO MesaTrabajadores (id_Mesa, id_Trabajador) 
VALUES
(1, 2),  -- Camarero 1 puede ver mesas del 1 al 5
(2, 2),  
(3, 2),
(4, 2),
(5, 2),
(6, 3),  -- Camarero 2 puede ver mesas del 6 al 10
(7, 3),
(8, 3),
(9, 3),
(10, 3),
(1, 1),  -- Jefe de Sala puede ver todas las mesas
(2, 1),  
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1);
INSERT INTO comandas (id_Mesa, Estado) VALUES (1, 'abierta');
INSERT INTO comandas (id_Mesa, Estado) VALUES (2, 'abierta');
INSERT INTO comandas (id_Mesa, Estado) VALUES (3, 'abierta');
INSERT INTO comandas (id_Mesa, Estado) VALUES (4, 'abierta');
INSERT INTO comandas (id_Mesa, Estado) VALUES (6, 'abierta');
INSERT INTO comandas (id_Mesa, Estado) VALUES (6, 'abierta');
INSERT INTO comandas (id_Mesa, Estado) VALUES (7, 'abierta');
INSERT INTO comandas (id_Mesa, Estado) VALUES (8, 'abierta');
INSERT INTO comandas (id_Mesa, Estado) VALUES (9, 'abierta');
INSERT INTO comandas (id_Mesa, Estado) VALUES (10, 'abierta');
INSERT INTO detalleComanda (id_Comanda, id_Plato, Cantidad, Estado)
VALUES
    (1, 1, 2, "En peticion"),
    (1, 3, 1, "Preparado"),
    (2, 2, 3, "En preparacion"),
    (3, 4, 1, "Entregado"),
    (3, 5, 2, "En peticion"),
    (6, 5, 2, "En peticion"),
    (6, 7, 1, "En peticion");