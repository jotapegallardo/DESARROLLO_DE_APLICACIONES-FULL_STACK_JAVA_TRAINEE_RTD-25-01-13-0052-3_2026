#================= Continuación de SELECT ==========
#Mayor o igual
SELECT * FROM estudiantes
WHERE edad >= 28;

#Menor o igual
SELECT * FROM estudiantes
WHERE edad <= 28;

#Distinto
SELECT * FROM estudiantes
WHERE nombre != 'Ana';

#Otra alternativa para distinto
SELECT * FROM estudiantes
WHERE nombre <> 'Ana';

#BETWEEN --> Muy usado para rangos
SELECT * FROM estudiantes
WHERE edad BETWEEN 24 AND 34;

#Uso del IN 
SELECT * FROM estudiantes
WHERE id IN (1, 5, 7, 8);

#Uso de IS NULL y IS NOT NULL

#Profesores sin curso
SELECT * FROM profesores
WHERE curso_id IS NULL;

#Profesores que tienen cursos
SELECT * FROM profesores
WHERE curso_id IS NOT NULL;

#=========================== Funciones de agregación ==============
#COUNT --> Cuenta de la cantidad de registros
SELECT COUNT(*) AS 'Cantidad de Estudiantes'
FROM estudiantes;

#MAX --> Obtiene el valor más grande
SELECT MAX(edad) AS 'Mayor edad de Estudiantes'
FROM estudiantes;

#MIN --> Obtiene el valor más pequeño 
SELECT MIN(edad) AS 'Menor edad de Estudiantes'
FROM estudiantes;

#AVG --> Calcula el promedio
SELECT AVG(edad) AS 'Promedio edad de Estudiantes'
FROM estudiantes;

#SUM --> Suma todos los valores
SELECT SUM(edad) AS 'Promedio edad de Estudiantes'
FROM estudiantes;

#¿Qué pasa si quiero saber cuántos estudiantes hay por cada curso?
#Podemos agrupar los estudiantes por curso usando GROUP BY

SELECT curso_id, COUNT(*) AS cantidad_estudiantes
FROM estudiantes
GROUP BY curso_id;

#Recuperar con los nombres de los cursos
SELECT es.curso_id, cu.nombre AS nombre_curso, COUNT(*) AS cantidad_estudiantes
FROM estudiantes es
INNER JOIN cursos cu
ON es.curso_id = cu.id
GROUP BY es.curso_id;

#AHORA CON ORDEN DESCENDEDNTE
SELECT es.curso_id, cu.nombre AS nombre_curso, COUNT(*) AS cantidad_estudiantes
FROM estudiantes es
INNER JOIN cursos cu
ON es.curso_id = cu.id
GROUP BY es.curso_id
ORDER BY COUNT(*) ASC;

#¿Y si solamente quiero mostrsr los cursos que tengan 3 o más estudiantes?
# HAVING 

SELECT curso_id, COUNT(*) AS cantidad
FROM estudiantes
GROUP BY curso_id
HAVING COUNT(*) >=3; #CONDICIÓN 


SELECT es.curso_id, cu.nombre AS nombre_curso, COUNT(*) AS cantidad_estudiantes
FROM estudiantes es
INNER JOIN cursos cu
ON es.curso_id = cu.id
GROUP BY es.curso_id
HAVING COUNT(*) >=3;

/*
La cláusula HAVING en SQL se utiliza para filtrar grupos de registros 
que cumplen con una condición específica. A diferencia de WHERE 
(que filtra filas individuales antes de agrupar), 
HAVING se usa exclusivamente junto con GROUP BY para 
filtrar grupos basándose en los resultados de funciones 
de agregación (como SUM, COUNT, AVG).

Diferencia entre HAVING y WHERE
- WHERE: Filtra los datos originales antes de agruparlos. No puede usar funciones de agregación.
- HAVING: Filtra los grupos después de que se haya realizado la agrupación y la agregación. Aquí sí se aplican las funciones de agregación.
*/

#======================= FUNCIONES DE FEXTO ===================
#UPPER --> CONVIERTE EL TEXTO A MAYÚSCULAS
SELECT UPPER(nombre) AS nombre_alumno
FROM estudiantes;


#LOWER --> CONVIERTO EL TEXTO A MINÚSCULAS
SELECT LOWER(nombre) AS nombre_alumno
FROM estudiantes;

#LENGTH --> CUANTA LA CANTIDAD DE CARACTERES
SELECT LENGTH(nombre) AS CANTIDAD_CARACTERES_NOMBRES
FROM estudiantes;

#CONCAT --> UNE TEXTO Y VALORES
SELECT CONCAT(nombre, ' ', edad)
FROM estudiantes;

SELECT CONCAT('El estudiante ', nombre, ' tiene ', edad, ' años')
FROM estudiantes;

#=========================== UPDATE =====================
#Actualizar la edad de un estudiante
UPDATE estudiantes
SET edad = 23
WHERE id = 2;

UPDATE estudiantes
SET edad = edad + 1
WHERE id = 2;

#Actualizar varias columnas
UPDATE estudiantes
SET edad = edad + 1,
	nombre = 'Ana María'
WHERE id = 1;

#Actualizar varios registros, aumentar la edad para los estudiantes de un curso
UPDATE estudiantes
SET edad = edad + 1
WHERE curso_id = 1;

#Aumentar la edad a todos los estudiantes
UPDATE estudiantes
SET edad = edad + 1;

#===================== DELETE ================
#DELETE permite eliminar resgitros de una tabla
#Pertenece al CRUD: eliminar

#************* RECOMENDACIÓN ***********
#ANTES DE CADA DELETE EJECUTAR PRIMERO EL MISMO FILTRO CON SELECT

#PRIMERO SIEMPRE REVISAMOS QUE VAMOS A ELIMINAR
SELECT * FROM estudiantes
WHERE id = 12;

#LUEGO ELIMINAMOS
DELETE FROM estudiantes
WHERE id = 12;

#Eliminar estudiantes menores a 20 años
DELETE FROM estudiantes
WHERE edad < 20;

#Eliminar estudiantes de un curso en específico
DELETE FROM estudiantes
WHERE curso_id = 1;

#Eliminar estudiantes por nombre
DELETE FROM estudiantes
WHERE nombre = 'Pedro';

#Eliminar estudiantes cuyo nombre comience con "A"
DELETE FROM estudiantes
WHERE nombre LIKE 'A%';

#Eliminar estudiantes usando IN 
DELETE FROM estudiantes
WHERE id IN (2, 5, 8);

#========== MUCHO CUIDADO ==========
DELETE FROM estudiantes;
/*
Eso elimina todos los registros de la tabla estudiantes.
La tabla queda vacía, pero sigue existiendo
*/


#========================== 1.- Integridad Referencial ================
/*La integridad referencial es una regla que garantiza 
que las relaciones entre las tablas sean válidas y consistentes.

CURSOS
+----+--------------------+
| id | nombre             |
+----+--------------------+
| 1  | Full Stack Java    |
| 2  | Full Stack Python  |
| 3  | Ciencia de Datos   |
+----+--------------------+

ESTUDIANTES
+----+---------+------+-----------+
| id | nombre  | edad | curso_id  |
+----+---------+------+-----------+
| 1  | Ana     | 24   | 1         |
| 2  | Pedro   | 27   | 2         |
+----+---------+------+-----------+

La regla es:

estudiantes.curso_id
debe existir en
cursos.id
*/

#EJEMPLO VÁLIDO
INSERT INTO estudiantes (nombre, edad, curso_id)
VALUES ('Sandra', 34, 5);

/*
Funciona porque:

curso_id = 5
existe en la tabla cursos
*/

#EJEMPLO inválido
INSERT INTO estudiantes (nombre, edad, curso_id)
VALUES ('Luis', 31, 99);

/*
Error porque:

curso_id = 99
NO EXISTE EN LA TABLA CURSOS
*/

#=================== 2. Inserción con Integridad Referencial ================
#Primero:
INSERT INTO cursos (nombre)
VALUES ('Desarrollo Web 2');

#Luego:
INSERT INTO estudiantes (nombre, edad, curso_id)
VALUES ('Camila', 21, 23);


#================== 3. Actualización con Integridad Referencial =================
#Supongamos: Ana -> curso_id = 1
#Queremos cambiarla:

UPDATE estudiantes
SET curso_id = 23
WHERE id = 1;

/*Funciona.
Porque:
curso_id = 2
sí existe.*/

#================== 4. Eliminación con Integridad Referencial =================
/*
Supongamos:
Curso 1
↓
Ana
Carlos
Pedro
*/

#Intentemos:
DELETE FROM cursos
WHERE id = 1;

/*
MySQL responderá:
Cannot delete or update a parent row:
a foreign key constraint fails

== ¿Por qué? ==
Porque estaríamos dejando:

Ana → curso_id = 1
Carlos → curso_id = 1
Pedro → curso_id = 1

pero el curso ya no existiría.
La base de datos protege la consistencia.
*/

#Solución 1
#Primero mover estudiantes:
UPDATE estudiantes
SET curso_id = 2
WHERE curso_id = 1;

#ahora..
DELETE FROM cursos
WHERE id = 1;

#Solución 2 --> eliminación en cascada

#========== TABLA PARA EJEMPLO DE ON DELETE CASCADE ==========

# Creamos una tabla hija relacionada con profesores
CREATE TABLE contactos_profesores (
    id INT NOT NULL AUTO_INCREMENT,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    profesor_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (profesor_id)
	REFERENCES profesores(id)
	ON DELETE CASCADE
);


#==== Paso 1 Insertar datos de contacto
INSERT INTO contactos_profesores (telefono, email, profesor_id)
VALUES
('912345678', 'ricardo@instituto.cl', 1),
('923456789', 'paula@instituto.cl', 2),
('934567890', 'andrea@instituto.cl', 3);

#==== Paso 2 Ver datos antes de eliminar
SELECT *
FROM profesores;

SELECT *
FROM contactos_profesores;

#== Ver profesores con sus contactos
SELECT pr.nombre AS profesor,
       cp.telefono,
       cp.email
FROM profesores pr
INNER JOIN contactos_profesores cp
ON pr.id = cp.profesor_id;

#==== Paso 3 Eliminar un profesor =====
DELETE FROM profesores
WHERE id = 1;

/*
El profesor con id = 1 se elimina de profesores, 
y automáticamente también se elimina su contacto en contactos_profesores.
*/



#==================== Transaccionalidad y Principios ACID =============
/*
Situación Problema

Imaginemos que vamos a desarrollar una billetera virtual llamada:

Alke Wallet

La aplicación permitirá:

Crear usuarios.
Manejar diferentes monedas.
Realizar transferencias entre usuarios.
Mantener un historial de transacciones.

¿Qué podría pasar si una transferencia bancaria se ejecuta de forma incorrecta?

- El dinero podría desaparecer.
- El dinero podría duplicarse.
- La base de datos podría quedar inconsistente.

Precisamente por eso existen las transacciones y los principios ACID.
*/

#Paso 1: Crear la base de datos
CREATE DATABASE AlkeWallet;

USE AlkeWallet;

#Paso 2: Crear la tabla moneda
CREATE TABLE moneda (
    currency_id INT NOT NULL AUTO_INCREMENT,
    currency_name VARCHAR(50) NOT NULL,
    currency_symbol VARCHAR(10) NOT NULL,
    PRIMARY KEY (currency_id)
);

#Paso 3: Crear la tabla usuario
CREATE TABLE usuario (
    user_id INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(100) NOT NULL UNIQUE,
    contrasena VARCHAR(100) NOT NULL,
    saldo DECIMAL(10,2) NOT NULL,
    currency_id INT NOT NULL,
    PRIMARY KEY (user_id),
    FOREIGN KEY (currency_id)
        REFERENCES moneda(currency_id)
);


#Paso 4: Crear la tabla transaccion
CREATE TABLE transaccion (
    transaction_id INT NOT NULL AUTO_INCREMENT,
    sender_user_id INT NOT NULL,
    receiver_user_id INT NOT NULL,
    importe DECIMAL(10,2) NOT NULL,
    transaction_date DATETIME NOT NULL,
    PRIMARY KEY (transaction_id),
    FOREIGN KEY (sender_user_id)
        REFERENCES usuario(user_id),
    FOREIGN KEY (receiver_user_id)
        REFERENCES usuario(user_id)
);


#Paso 5: Insertar datos
#Monedas
INSERT INTO moneda (currency_name, currency_symbol)
VALUES
('Peso Chileno', 'CLP'),
('Dólar Estadounidense', 'USD'),
('Euro', 'EUR');

#Usuarios
INSERT INTO usuario (
    nombre,
    correo_electronico,
    contrasena,
    saldo,
    currency_id
)
VALUES
('Ana Torres', 'ana@correo.cl', '123456', 100000, 1),
('Pedro González', 'pedro@correo.cl', '123456', 50000, 1),
('María López', 'maria@correo.cl', '123456', 75000, 1);

#***Integridad Referencial
#¿Podemos crear un usuario utilizando una moneda que no existe?
#----------------------------------------------------------------

/***Situación del negocio

Ana quiere transferir:

$20.000

a Pedro.

**¿Qué operaciones debemos realizar?

- Descontar dinero de Ana.
- Agregar dinero a Pedro.
- Registrar la transferencia.

**¿Qué es una transacción? --> Ver presentación

Una transacción es un conjunto de operaciones SQL que deben ejecutarse juntas.

La idea principal es:

O se ejecutan todas las operaciones o no se ejecuta ninguna.
*/

#=================================
#Paso 1: Iniciar la transacción
START TRANSACTION;

/*Le estamos diciendo a MySQL:
Voy a realizar varias operaciones que forman una sola unidad de trabajo.
Todavía nada ha sido guardado.*/

#Paso 2: Descontar dinero de Ana
UPDATE usuario
SET saldo = saldo - 20000
WHERE user_id = 1;

/*Antes:

Ana = $100.000
Después:
Ana = $80.000
*/

#Paso 3: Agregar dinero a Pedro
UPDATE usuario
SET saldo = saldo + 20000
WHERE user_id = 2;

/*
Antes:
Pedro = $50.000
Después:
Pedro = $70.000
*/

#Paso 4: Registrar la transferencia
INSERT INTO transaccion (
    sender_user_id,
    receiver_user_id,
    importe,
    transaction_date
)
VALUES (
    1,
    2,
    20000,
    NOW()
);


#Paso 5: Confirmar la operación
COMMIT;

#Todo quedó almacenado de manera definitiva.

#Verificar los resultados
SELECT *
FROM usuario;

SELECT *
FROM transaccion;

#============================
#¿Qué ocurre si algo falla?

#Supongamos:

START TRANSACTION;

UPDATE usuario
SET saldo = saldo - 20000
WHERE user_id = 1;

-- ocurre un error

ROLLBACK;

#Resultado:
#Ana vuelve a tener $100.000
#Pedro sigue teniendo $50.000
#No se registra ninguna transacción.

#Todo vuelve al estado inicial.

/***¿Qué es ROLLBACK?
ROLLBACK es una instrucción SQL que:

Deshace todas las operaciones realizadas desde que comenzó 
la transacción y devuelve la base de datos exactamente al estado anterior.

En otras palabras:

ROLLBACK = Deshacer cambios
*/

/*
===== OJO ===== 
MySQL no "adivina" que hubo un error y automáticamente ejecuta ROLLBACK. 
Alguien tiene que tomar la decisión.

En aplicaciones reales (Java, Python, etc.)

El programa captura la excepción.

Pseudocódigo:

START TRANSACTION

intento
    descontar dinero
    agregar dinero
    registrar transacción

    COMMIT
si ocurre un error
    ROLLBACK

=============
START TRANSACTION abre una especie de "modo borrador".

Mientras la transacción está abierta, podemos revisar si todo salió bien.
Si todo está correcto → COMMIT.
Si hubo algún error → ROLLBACK.

**En SQL puro, normalmente el desarrollador 
o la aplicación es quien decide cuándo ejecutar COMMIT o ROLLBACK; 
MySQL no lo hace automáticamente por nosotros.
*/

/*
=============== Principios ACID ==========
**A - Atomicidad

Todo o nada.

Descontar dinero
+
Agregar dinero
+
Registrar la transacción
=
Una sola operación

Si algo falla:

ROLLBACK;
*/

/***C - Consistencia

La base de datos siempre debe quedar en un estado válido.

Antes:

100000 + 50000 + 75000
=
225000

Después:

80000 + 70000 + 75000
=
225000

El dinero no se creó ni desapareció.
*/


/***I - Aislamiento

Las transacciones concurrentes no deben interferirse.

Ejemplo:

Ana realiza una transferencia.
Pedro consulta su saldo.
María realiza otra transferencia.

La base de datos maneja las operaciones de manera segura.
*/

/*
**D - Durabilidad

Después de:

COMMIT;

La información queda almacenada permanentemente.

Aunque el servidor se apague, los cambios seguirán existiendo.
*/

/*
=========================
Flujo completo de una transacción
START TRANSACTION
        ↓
Descontar dinero a Ana
        ↓
Agregar dinero a Pedro
        ↓
Registrar la transferencia
        ↓
¿Todo salió bien?
      ↓           ↓
     Sí          No
      ↓           ↓
   COMMIT     ROLLBACK
Guardar       Deshacer
*/

/*
Conclusión

Las transacciones y los principios ACID existen para proteger 
la información y garantizar que la base de datos nunca quede 
en un estado inconsistente.

En sistemas reales como bancos, billeteras virtuales, 
aplicaciones de pago y plataformas de comercio electrónico, 
estos conceptos son fundamentales para garantizar que el dinero 
y la información de los usuarios sean manejados de forma correcta
*/







