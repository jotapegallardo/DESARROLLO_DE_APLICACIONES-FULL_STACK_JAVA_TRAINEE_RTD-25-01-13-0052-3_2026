/*
¿Qué es SQL?

SQL significa:

Structured Query Language
(Lenguaje de Consulta Estructurado)

Es el lenguaje que utilizamos para comunicarnos con las bases de datos.

Con SQL podemos:

Crear bases de datos.
Crear tablas.
Insertar datos.
Buscar información.
Modificar información.
Eliminar información.
*/

/* Esto es un comentario multilínea*/
#Esto es un comentario de un a línea

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

#Consulta de prueba
SELECT 'Hola mundo';

#Otra consulta
SELECT 10+5;

#Crear una base de datos "instituto_iseg"
CREATE DATABASE instituto_iseg;
/*
CREATE --> crear
DATABASE --> base de datos
instituto_iseg --> El nombre de nuestra base de datos
*/


#Utilizar la base de datos "instituto_iseg"
USE instituto_iseg;

#Creación de una tabla "estudiantes"
CREATE TABLE estudiantes (
	id INT, 
    nombre VARCHAR(50), 
    edad INT
);

/*
id INT --> Campo llamado "id" que almacenará números enteros
nombre VARCHAR(50) --> Campo de texto de hasta 50 caracteres
edad INT --> Campo llamado "edad" que almacenará números enteros
*/


#Ahora vamos insertar registros en nuestra tabla estudiantes
INSERT INTO estudiantes 
VALUES (1, "Ana", 34);

INSERT INTO estudiantes 
VALUES (2, "Pedro", 22);

INSERT INTO estudiantes 
VALUES (3, "María", 34);


SELECT * FROM estudiantes;

/*==================== Modificación de la tabla ================*/
#Paso 1: Modificar las columnas para que sean NOT NULL
ALTER TABLE estudiantes
MODIFY id INT NOT NULL;

ALTER TABLE estudiantes
MODIFY edad INT NOT NULL;

ALTER TABLE estudiantes
MODIFY nombre VARCHAR(50) NOT NULL;

#Paso 2: Convertir id en PRIMARY KEY 
ALTER TABLE estudiantes
ADD PRIMARY KEY (id);

#Paso 3: Hacer id AUTO_INCREMENT
ALTER TABLE estudiantes
MODIFY id INT NOT NULL AUTO_INCREMENT;

#Hacer id campo unico
ALTER TABLE estudiantes 
ADD UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE;

#Paso 4: Verificar los cambios
DESCRIBE estudiantes;

# otra alternativa

SHOW CREATE TABLE estudiantes;

/*=============== Insertar nuevos registros luego de la modicación de la tabala ==========*/
INSERT INTO estudiantes (nombre, edad)
VALUES ('Carlos', 27);

INSERT INTO estudiantes (nombre, edad)
VALUES ('Sofía', 31);

SELECT * FROM estudiantes;

#=========== Mejor práctica de insert ==============
INSERT INTO estudiantes (nombre, edad)
VALUES 
('Sofía', 31), 
('Javier', 28),
('Camila', 39),
('Diego', 24),
('Valentina', 19),
("Tomás", 22);

#===================== SELECT ==========================
/*
Query = consulta a nuestra bd
Instrucción que se manda al servidor para hacer algo específico:
- Selecionar
- Guardar
- Actualizar
- Borrar

CRUD:
Create, Read, Update, Delete
Crear, Leer, Actualizar, Borrar o eliminar
*/

#SELECT --> Selecionar o recuperar información de una tabla --> READ

#Selecionar todas las columnas de la tabla estudiantes
SELECT * FROM estudiantes;

#Mostar columnas específicas
SELECT nombre FROM estudiantes;

#Filtrar registros usando WHERE
SELECT id, nombre, edad 
FROM estudiantes
WHERE id = 3;

#Mostrar estudiantes mayores a 25 años
SELECT *
FROM estudiantes
WHERE edad > 25;

#Buscar un nombre específico
SELECT *
FROM estudiantes
WHERE nombre LIKE 'Ana';

#Buscar nombres que comienzan con "Ca"
SELECT *
FROM estudiantes
WHERE nombre LIKE 'Ca%';

#Bucar nombres que terminen con a
SELECT *
FROM estudiantes
WHERE nombre LIKE '%a';

#Buscar nombre que contengan la letra e
SELECT *
FROM estudiantes
WHERE nombre LIKE '%e%';

#Estudiantes cuyo nombre termine con "a" y tienen más de 27 años
SELECT *
FROM estudiantes
WHERE nombre LIKE '%a' AND edad > 27;

#Estudiantes cuyo nombre termine con "a" o tienen más de 20 años
SELECT *
FROM estudiantes
WHERE nombre LIKE '%a' OR edad > 20;

#Ordenar por nombre de forma ascendente
#ASC --> A-Z
SELECT *
FROM estudiantes
WHERE edad > 20
ORDER BY nombre ASC;

#Ordenar por nombre de forma descendente
#DESC --> Z-A
SELECT *
FROM estudiantes
WHERE edad > 20
ORDER BY nombre DESC;

#Ordenar por edad
SELECT *
FROM estudiantes
WHERE edad > 20
ORDER BY edad DESC;

#LIMIT inicio, cantidad
#Desde el registro 4, mostrar 3 registros
#Ojo: en LIMIT, el conteo parte desde 0
SELECT *
FROM estudiantes
LIMIT 4, 3;

#Estructura general
/*
SELECT columna1, columna2
FROM nombre_tabla
WHERE condición
ORDER BY columna1 ASC/DESC
LIMIT inicio, cantidad_registro
*/

#================== CLAVE FORANEA ===================
/*
Mala práctica

id      nombre         edad       curso
1        Ana            34      Full Stack Java
2        Pedro          25      Full Stack Python
3        María          28      FSJ
4        Javier         32      Full Stack Java T.

Problemas:
- Se repite información
- Si el nombre del curso cambia, debemos modificar muchos registros
- Pueden producirse errores de escritura en el nombre del curso.
*/

#Paso 1: Crear tabla cursos
CREATE TABLE cursos (
	id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR (100) NOT NULL,
    PRIMARY KEY (id),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE
);

#Paso 2: Insertar al algunos cursos
INSERT INTO cursos (nombre) 
VALUES
('Programación Web'),
('Bases de Datos'),
('JavaScript'),
('Full Stack Python'),
('Full Stack Java'),
('Redes'),
('Ciberseguridad'),
('Desarrollo Móvil'),
('Inteligencia Artificial'),
('Diseño UX/UI'),
('Cloud Computing');

SELECT * FROM cursos;

#Paso 3: agregar la columna curso_id a estudiantes
ALTER TABLE estudiantes
ADD curso_id INT;

SELECT * FROM estudiantes
LIMIT 0, 20;

DESCRIBE estudiantes;

#Paso 4: Crear la clave foranéa
ALTER TABLE estudiantes
ADD CONSTRAINT fk_estudiante_curso
FOREIGN KEY (curso_id)
REFERENCES cursos(id);

#Paso 5: Asignar cursos a los estudiantes
UPDATE estudiantes
SET curso_id = 1
WHERE id IN (1, 3, 5); 

UPDATE estudiantes
SET curso_id = 4
WHERE id IN (2, 4, 6); 

UPDATE estudiantes
SET curso_id = 5
WHERE id IN (7, 8, 9); 

#================= cómo quedaría nuestro INSERT INTO ahora ==================
INSERT INTO estudiantes (nombre, edad, curso_id)
VALUES ('Roberto', 37, 2);

/*
ERROR no existe el id 99 en cursos
INSERT INTO estudiantes (nombre, edad, curso_id)
VALUES ('Luis', 39, 99);*/

#======================= uso ded JOIN ======================

#INNER JOIN
SELECT estudiantes.nombre, estudiantes.edad, cursos.nombre
FROM estudiantes 
INNER JOIN cursos
ON estudiantes.curso_id = cursos.id;

/*
SINTAXIS
SELECT columnas
FROM tabla1 
INNER JOIN tabla2
ON condición;
*/

#Ahora con alias
SELECT es.nombre, es.edad, cu.nombre AS curso
FROM estudiantes es
INNER JOIN cursos cu
ON es.curso_id = cu.id;

#============ Agregamos tabla profesores
CREATE TABLE profesores(
	id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR (100) NOT NULL,
    curso_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY (curso_id)
    REFERENCES cursos(id),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE

);

INSERT INTO profesores (nombre, curso_id)
VALUES
('Ricardo', 1),
('Paulina', 2);


#====== LEFT JOIN
#Todos los cursos con sus profesores, incluso los que no tienen profesor
SELECT cu.nombre AS CURSO, pr.nombre AS profesor
FROM cursos cu
LEFT JOIN profesores pr
ON cu.id = pr.curso_id;

#========= RIGHT JOIN
INSERT INTo profesores(nombre)
VALUES ('Andrea');

SELECT cu.nombre AS CURSO, pr.nombre AS profesor
FROM cursos cu
RIGHT JOIN profesores pr
ON cu.id = pr.curso_id;

#======== CROSS JOIN
#Combina todos los registros de una tabla con todos los registros de la otra tabla
SELECT es.nombre, cu.nombre AS curso
FROM estudiantes es
CROSS JOIN cursos cu;




