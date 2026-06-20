/*
¿Qué es SQL?

SQL significa:

Structured Query Language
(Lenguaje de Consulta Estructurado)

Es el lenguaje que utilizamos para comunicarnos con las bases de datos.

Con SQL podemos:

Crear bases de datos.
Eliminar una base de datos.
Crear tablas.
Insertar datos.
Buscar información.
Modificar información.
Eliminar información.
*/
/*Esto 
es 
un 
comentario 
multi línea*/

#Esto es un comentario de una línea 

/*

Algunos de los comandos SQL más importantes

SELECT- extrae datos de una base de datos
UPDATE- Actualiza datos en una base de datos
DELETE- elimina datos de una base de datos
INSERT INTO- Inserta nuevos datos en una base de datos.
CREATE DATABASE- crea una nueva base de datos
ALTER DATABASE- modifica una base de datos
CREATE TABLE- crea una nueva tabla
ALTER TABLE- modifica una tabla
DROP TABLE- elimina una tabla
CREATE INDEX- crea un índice (clave de búsqueda)
DROP INDEX- elimina un índice

*/

#Primera consulta en SQL
select 'Hola mundo'; #SELECT significa selecionar

SELECT 10 + 5; 

#Paso 1: Crear una base de datos
CREATE DATABASE instituto;

#Paso 2: Utilizar laa base de datos
USE instituto;

#Paso 3: Crear una tabla
CREATE TABLE estudiantes (
	id INT, #Campo llamado id que almacenará números enteros
    nombre VARCHAR(50),#Campo llamado nombre que alamacenará texto con un máximo de 50 caracteres
    edad INT#Campo llamado edad que almacenará números enteros
);

SELECT * FROM estudiantes;

#Paso 4: insertar registros en nuestra tabla
INSERT INTO estudiantes VALUES (1, 'Ana', 24);
INSERT INTO estudiantes VALUES (2, 'Pedro', 27);
INSERT INTO estudiantes VALUES (3, 'María', 31);

#Paso 5: Consultar la información
SELECT * FROM estudiantes;#Con el * recuperamos todos los campos de la tabla

SELECT id, nombre FROM estudiantes;# Recuperar campo en específico

/*
SELECT --> Selecionar 
* --> Todas las columnas o campos
FROM --> desde que tabla queremos recuperar los datos
estudiantes --> La tabla
*/

#============== Modificar la Tabla estudiantes ==================

#MODIFICACIÓN PARA QUE LAS COLUMNAS SEAN NOT NULL
#modificamos el campo id
ALTER TABLE estudiantes
MODIFY id INT NOT NULL;

#modificamos el campo nombre
ALTER TABLE estudiantes
MODIFY nombre VARCHAR(50) NOT NULL;

#modificamos el campo edad
ALTER TABLE estudiantes
MODIFY edad INT NOT NULL;

#CONVERTIR EL CAMPO ID EN CLAVE PRIMARIA
ALTER TABLE estudiantes
ADD PRIMARY KEY (id);

#DELETE FROM estudiantes
#WHERE id = 2;


#Hacer que id sea auto incremental
ALTER TABLE estudiantes
MODIFY id INT NOT NULL AUTO_INCREMENT;

#hACER QUE ID SE UNICO
ALTER TABLE estudiantes 
ADD UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE;


#Verificación de la tabla
DESCRIBE estudiantes; 

SHOW CREATE TABLE estudiantes;

#insertar nuevos registros
INSERT INTO estudiantes (nombre, edad)
VALUES ('Carlos', 37);

INSERT INTO estudiantes (nombre, edad)
VALUES ('Roberto', 22);

#======= Forma más profesional ============
INSERT INTO estudiantes (nombre, edad)
VALUES 
	('Sofía', 20) ,
	('Javier', 29),
    ('Valentina', 34),
    ('Diego', 28),
    ('Daniel Megano',34),
	('Sebastias Morter',38),
    ('Tomás', 42);
    
SELECT * FROM estudiantes;

# Query --> consulta, instrucción que se envía al servidor para hacer algo en específico
# Crear, Selecionar, Guardar, Actualizar o Borrar (eliminar)

#CRUD
#Create, Read, Update, Delete
#Crear, Leer, Actualizar, Borrar 

/*
CREAR-> INSERT INTO,
LEER -> SELECT
ACTUALIZAR-> UPDATE
BORRAR-> DELETE
*/

#============ Diferentes formas de selecionar información (recupear) =======
#Con el * recuperamos todos los campos de la tabla
SELECT * FROM estudiantes;

# Recuperar campo en específico
SELECT id, nombre FROM estudiantes;

# Filtrar usando WHERE
SELECT id, nombre, edad FROM estudiantes
WHERE id = 4; 

#Mostrar estudiantes con edad mayor a 25 años
SELECT *
FROM estudiantes
WHERE edad > 25;


#Buscar estudiante por nombre
SELECT *
FROM estudiantes
WHERE nombre LIKE 'PEDRO';#LIKE no distingue entre mayúsculas y minúsculas

#Buscar nombres que comienzan con "Ca"
SELECT *
FROM estudiantes
WHERE nombre LIKE 'Ca%';

#Buscar nombres que terminen con "a"
SELECT *
FROM estudiantes
WHERE nombre LIKE '%a';

#Buscar nombres que contengan la letra "e"
SELECT *
FROM estudiantes
WHERE nombre LIKE '%e%';

#Buscar estudiante cuyo nombre termina con "o" y que tienen más de 20 años
SELECT *
FROM estudiantes
WHERE nombre LIKE '%o' AND edad > 20;

#Buscar estudiante cuyo nombre termina con "o" o que tienen más de 20 años
SELECT *
FROM estudiantes
WHERE nombre LIKE '%o' OR edad > 20;

#Ordenar por nombre de forma ascedente (A-Z)
SELECT *
FROM estudiantes
WHERE edad > 25
ORDER BY nombre ASC; #Por default

#Ordenar por nombre de forma descendente (Z-A)
SELECT *
FROM estudiantes
WHERE edad > 25
ORDER BY nombre DESC;

SELECT *
FROM estudiantes
WHERE edad > 25
ORDER BY edad DESC;

#Restricción de visualización de cantidad de registros
SELECT *
FROM estudiantes
LIMIT 6, 2; # Desde el registro 6, mostrar 2 registros

#Seleccione todos los nombre distintos (únicos) de la tabla "estudiantes":
SELECT DISTINCT nombre FROM estudiantes;

#Seleccione únicamente los estudiantes que NO sean de Pedro:
SELECT * FROM estudiantes
WHERE NOT nombre = 'Pedro';

/*Estructura general:
SELECT columna1, columna2
FROM nombre_tabla
WHEERE condición
ORDER BY columna1 ASC/desc
LIMIT inicio, cantidad_registros
*/


#========== CLAVE FORANEA ==========
/*
¿Por qué no guardar el nombre del curso directamente?

x Mala práctica

id   nombre   edad    curso
1   Ana       24     Full Stack Java
2   María     31     Full Stack Python
3   Carlos    37     FSJ
4   Roberto   22     full stack java trainee

Problemas:
- Se repite información.
- La información esta mal escrita
- Si el nombre dedl curao cambia, debemos modificar muchos registros de manera individual
- Pueden producirse errores de escritura

*/

#Paso 1: Crear la tabla de cursos
CREATE TABLE cursos (
	id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

#Paso 2: Insertar algunos curso
INSERT INTO cursos (nombre)
VALUES 
('Full Stack Java'),
('Full Stack Python'),
('Ciencia de Datos');

#Paso 3 Agregar la columna curso_id (es el id de la tabla cursos) a estudiantes
ALTER TABLE estudiantes
ADD curso_id INT;

#Paso 4: crear la clave foránea
ALTER TABLE estudiantes
ADD CONSTRAINT fk_estudiante_curso
FOREIGN KEY (curso_id)
REFERENCES cursos(id);  

#Paso 5: asignar cursos a los estudiantes
SELECT * FROM estudiantes;

UPDATE estudiantes
SET curso_id = 1
WHERE id IN (1, 3, 5);

UPDATE estudiantes
SET curso_id = 2
WHERE id IN (2, 4, 6);

UPDATE estudiantes
SET curso_id = 3
WHERE id IN (7, 8, 9);

#Ejemplo de insercción de estudiante
#Funciona porque el curso con id= 1 existe
INSERT INTO estudiantes (nombre, edad, curso_id)
VALUES ('Ricardo', 39, 1);

#Error: porque el curso con id = 99 no existe
INSERT INTO estudiantes (nombre, edad, curso_id)
VALUES ('Sandra', 39, 99);


SELECT * FROM cursos;

#============ USO DE JOIN ======================
#¿Cómo mostramos mostramos el nombre del estudiante y el nombre de su curso?
SELECT estudiantes.nombre, estudiantes.edad, cursos.nombre AS curso
FROM ESTUDIANTES
INNER JOIN CURSOS
ON estudiantes.curso_id = cursos.id; 

#Con alias
SELECT es.nombre, es.edad, cu.nombre AS curso
FROM ESTUDIANTES es
INNER JOIN CURSOS cu
ON es.curso_id = cu.id; 

#Registros que tengan coincidencia en ambas tablas

/*
No hay un “orden obligatorio” en el ON de un JOIN. 
Lo importante es que la condición de igualdad vincule 
la foreign key (FK) de una tabla con la primary key (PK) de la otra.
*/

/*sintaxis
SELECT columnas 
FROM tabla1
INNER JOIN tabla2
ON condición (ejemplo: tabla1.fk = tabla2.pk); 
*/

#============= Ahora agregamos otra tabla ======
CREATE TABLE profesores (
	id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(60) NOT NULL,
    curso_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (curso_id)
    REFERENCES cursos(id)
);

INSERT INTO profesores (nombre, curso_id)
VALUES
('José', 1),
('Paula', 2);

SELECT * FROM profesores;

#============== LEFT JOIN ================
/*
 Devuelve todos los registros de la tabla de la izquierda y las coincidencias de la tabla de la derecha
 Si no hay coincidencias nos muestra un NULL
 */

#Todos los cursos con sus profesores, incluso los que no tienen profesor
SELECT cu.nombre AS curso, pr.nombre AS profesor
FROM cursos cu
LEFT JOIN profesores pr
ON cu.id = pr.curso_id;


SELECT cu.nombre AS curso, pr.nombre AS profesor
FROM cursos cu
INNER JOIN profesores pr
ON cu.id = pr.curso_id;

#================ RIGHT JOIN =================
#Devuelve todos los registros de la tabla de la derecha y las coincidencias de la tabla de la izquierda

# Para el ejemplo agregamos un profesor sin curso
INSERT INTO profesores (nombre)
VALUES ('Andrea');

SELECT cu.nombre AS curso, pr.nombre AS profesor
FROM cursos cu
RIGHT JOIN profesores pr
ON cu.id = pr.curso_id;

#================= CROSS JOIN ================
#Combina todo los registro de una tabla con todos los registros de la otra tabla

SELECT e.nombre, c.nombre AS curso
FROM estudiantes e
CROSS JOIN cursos c;








