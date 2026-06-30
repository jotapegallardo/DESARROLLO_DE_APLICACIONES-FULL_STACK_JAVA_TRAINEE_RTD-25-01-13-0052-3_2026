#============== Consultas Anidadas (Subconsultas) =============
/*
Una subconsulta en SQL (también conocida como consulta anidada) 
es una consulta que se encuentra incrustada dentro de otra 
instrucción SQL principal (como SELECT, INSERT, UPDATE o DELETE). 
Se utiliza para realizar operaciones complejas, cálculos y filtrados 
en pasos intermedios

*** Estructura general ***

SELECT columnas
FROM tabla
WHERE columna = (
	SELECT columna
    FROM otra_tabla
);
*/

#Sin subconsulta
SELECT * FROM estudiantes
WHERE curso_id = 5;

#Con subconsulta
#Ejemplo 1
SELECT * FROM estudiantes
WHERE curso_id = (
	SELECT id
    FROM cursos
    WHERE nombre = 'Full Stack Java'
);

#Ejemplo 2: Mostrar los profesores que imparten "Full Stack Java"
SELECT * FROM profesores
WHERE curso_id = (
	SELECT id
    FROM cursos
    WHERE nombre = 'Full Stack Java'
);

#Ejemplo 3: Mostrar estudiantes que pertenecen al mismo curso "Pedro"
SELECT * 
FROM estudiantes
WHERE curso_id = (
	SELECT curso_id
    FROM estudiantes
    WHERE nombre = 'Pedro'
);

#Ejemplo 4: Mostrar estudiantes que tienen una edad superior al promedio del curso
SELECT * 
FROM estudiantes
WHERE edad > (
	SELECT AVG(edad)
    FROM estudiantes
);


#===================== Vistas (Views) =================
/*
Una vista (o view) en SQL es esencialmente una tabla virtual 
o una consulta guardada. No almacena datos físicos por sí misma, 
sino que actúa como una ventana que muestra dinámicamente 
los resultados de una instrucción SELECT ejecutada sobre 
una o más tablas reales.


Una vista es una consulta guardada.
En lugar de escribir el mismo SELECT una y otra vez, 
podemos guardarlo con un nombre y reutilizarlo.

*/
/*
¿Para qué sirve?

Simplificación: Permite ocultar consultas complejas 
(con múltiples JOIN, filtros o agrupaciones) detrás 
de un nombre sencillo. En lugar de escribir una 
consulta larga cada vez, simplemente haces  SELECT* FROM mi_vista


Seguridad: Oculta datos sensibles. Puedes darle a un usuario acceso 
únicamente a una vista que muestre ciertos datos, impidiendo que vea 
o modifique el resto de la tabla original.

Consistencia: Si la estructura de las tablas base cambia, solo necesitas 
actualizar la vista. Las aplicaciones o reportes que dependan de la 
vista seguirán funcionando sin alteraciones.
*/

#=== Crear una vista ==
CREATE VIEW vw_estudiantes_cursos AS
SELECT 	es.id, 
		es.nombre, 
		es.edad, 
        cu.nombre AS curso
FROM estudiantes es
JOIN cursos cu
ON es.curso_id = cu.id;

#Utilizar la vista 
SELECT* FROM vw_estudiantes_cursos;

#== Incluso podemos filtrar
SELECT* FROM vw_estudiantes_cursos
WHERE edad > 35;

#======================= Procedimientos Almacenados =================
/*
Un procedimiento almacenado (stored procedure) es un bloque de código SQL 
precompilado que se guarda directamente en la base de datos. 
Actúa como una función o subrutina, permitiéndote agrupar múltiples 
instrucciones para realizar operaciones complejas, reutilizar 
el código y mejorar la seguridad.
*/

/*
Principales Ventajas

Rendimiento: Al estar precompilados y ejecutarse directamente en 
el servidor de la base de datos, reducen el tráfico de red y procesan 
los datos mucho más rápido que enviando consultas sueltas.

Reutilización: Una vez creado y guardado, puedes llamarlo todas 
las veces que sea necesario sin tener que reescribir todo el código SQL.

Centralización: La lógica de negocio se mantiene en la base de datos. 
Si necesitas hacer un cambio, lo modificas una sola vez en el procedimiento 
y todas las aplicaciones que lo usen se actualizarán automáticamente.

Seguridad: Puedes otorgar permisos a los usuarios para ejecutar un procedimiento 
almacenado específico sin darles acceso directo para modificar las tablas subyacentes.
*/

#==Procedimiento simple

DELIMITER $$

CREATE PROCEDURE listar_estudiantes()
BEGIN
	SELECT *
    FROM estudiantes;
END $$

#== Para ejecutar
CALL listar_estudiantes();


#Procedimiento con párametros

DELIMITER $$

CREATE PROCEDURE buscar_estudiante(IN p_id INT)
BEGIN
	SELECT *
    FROM estudiantes
    WHERE id = p_id;
END$$

#Para ejecutar
CALL buscar_estudiante(3);

#== Procedimiento para insertar
DELIMITER $$

CREATE PROCEDURE agregar_estudiante(
	IN p_nombre VARCHAR(50),
    IN p_edad INT,
    IN p_curso INT
    )
BEGIN
	INSERT INTO estudiantes (nombre, edad, curso_id)
    VALUES (p_nombre, p_edad, p_curso);

END $$


#==lo ejecutamos
CALL agregar_estudiante('Camila', 37, 5);


#============================= trigger ==========================
/*
Un trigger (o disparador) en SQL es un bloque de código o procedimiento 
almacenado en la base de datos que se ejecuta automáticamente de forma 
implícita cada vez que ocurre un evento específico, como insertar, 
actualizar o eliminar datos en una tabla.

Los triggers se utilizan principalmente para automatizar tareas, 
mantener la integridad de los datos y realizar auditorías sin intervención manual.

¿Cuándo se activan?

Se clasifican dependiendo del momento en que se ejecutan respecto a la acción que los provoca:

BEFORE (Antes): El código se ejecuta antes de que se complete la operación 
(ej. antes de insertar un registro). Se usa comúnmente para validar 
o modificar datos antes de que se guarden.

AFTER (Después): El código se ejecuta justo después de que la acción ocurra exitosamente. 
Se usa para auditorías, actualizar tablas relacionadas o registrar historiales.


Eventos que los disparan

Cualquier acción DML (Data Manipulation Language) sobre una tabla puede activar un trigger:
- INSERT: Al agregar un nuevo registro.
- UPDATE: Al modificar datos existentes.
- DELETE: Al eliminar un registro.

¿Para qué se usan principalmente?

- Auditoría: Guardar en una tabla de "historial" qué usuario realizó un cambio, cuándo y qué datos se modificaron.
- Integridad de datos: Asegurar que si eliminas un cliente, automáticamente se eliminen todos sus pedidos asociados.
- Cálculos automáticos: Recalcular el stock total de un producto cada vez que se registra una nueva venta.
*/


/*Ejemplo 1: Registrar cuando se elimina un profesor

¿Qué pasaría si eliminamos un profesor por error? 
¿Cómo sabríamos quién fue eliminado?

Podemos crear un historial.
*/
#Paso 1: Crear tabla de auditoría
CREATE TABLE profesores_eliminados (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha_eliminacion DATETIME NOT NULL
);


#Paso 2: Crear el trigger
DELIMITER $$

CREATE TRIGGER tr_profesor_eliminado
BEFORE DELETE
ON profesores
FOR EACH ROW
BEGIN
	INSERT INTO profesores_eliminados (nombre, fecha_eliminacion)
    VALUES(OLD.NOMBRE, NOW());
    
END $$
    
DELETE FROM profesores
WHERE id = 3;
















