create database biblioteca;
use biblioteca;
create table autores(
	autor_id INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(100) NOT NULL,
	nacionalidad VARCHAR(50)
);

create table categorias(
	categoria_id INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(50) not NULL
);

CREATE TABLE Libros (
libro_id INT AUTO_INCREMENT PRIMARY KEY,
titulo VARCHAR(150) NOT NULL,
autor_id INT,
categoria_id INT,
precio DECIMAL(8,2) NOT NULL,
stock INT NOT NULL DEFAULT 10,
FOREIGN KEY (autor_id) REFERENCES Autores(autor_id),
FOREIGN KEY (categoria_id) REFERENCES Categorias(categoria_id)
);

CREATE TABLE Ventas (
venta_id INT AUTO_INCREMENT PRIMARY KEY,
libro_id INT,
cantidad INT NOT NULL,
fecha_venta DATE NOT NULL DEFAULT (CURRENT_DATE),
FOREIGN KEY (libro_id) REFERENCES Libros(libro_id),
CONSTRAINT chk_cantidad CHECK (cantidad > 0)
);

INSERT INTO Autores (nombre, nacionalidad) VALUES
('Gabriel García Márquez', 'Colombiana'),
('Isabel Allende', 'Chilena'),
('Stephen King', 'Estadounidense'),
('J.K. Rowling', 'Británica'),
('Haruki Murakami', 'Japonesa');

INSERT INTO Categorias (nombre) VALUES
('Novela'),
('Ciencia Ficción'),
('Fantasía'),
('Historia'),
('Infantil');

INSERT INTO Libros (titulo, autor_id, categoria_id, precio, stock) VALUES
('Cien años de soledad', 1, 1, 25.50, 15),
('El amor en los tiempos del cólera', 1, 1, 22.00, 8),
('La casa de los espíritus', 2, 2, 18.90, 12),
('Largo pétalo de mar', 2, 5, 20.00, 5),
('It (Eso)', 3, 3, 30.00, 20),
('El resplandor', 3, 3, 15.75, 4),
('Harry Potter y la piedra filosofal', 4, 4, 19.99, 25),
('Harry Potter y el prisionero de Azkaban', 4, 4, 21.50, 10),
('Tokio blues', 5, 2, 17.50, 9),
('Kafka en la orilla', 5, 2, 24.00, 11);

INSERT INTO Ventas (libro_id, cantidad, fecha_venta) VALUES
(1, 2, CURRENT_DATE),
(3, 1, CURRENT_DATE),
(5, 1, '2026-06-20'), -- Una fecha pasada (asumiendo año actual 2026)
(7, 3, CURRENT_DATE),
(9, 2, '2026-06-24'); -- Otra fecha pasada

