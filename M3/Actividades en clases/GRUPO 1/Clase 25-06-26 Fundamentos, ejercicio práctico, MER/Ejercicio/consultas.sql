use biblioteca;
select * from libros;
SELECT
l.libro_id,
l.titulo,
a.nombre AS autor,
c.nombre AS categoria,
l.precio,
l.stock
FROM libros l
INNER JOIN Autores a ON l.autor_id = a.autor_id
INNER JOIN Categorias c ON l.categoria_id = c.categoria_id;

SELECT *
FROM Libros
WHERE stock < 10;

SELECT
v.venta_id,
l.titulo,
v.cantidad,
v.fecha_venta
FROM Ventas v
INNER JOIN Libros l ON v.libro_id = l.libro_id
WHERE v.fecha_venta = CURRENT_DATE;

SELECT
c.nombre AS categoria,
COUNT(l.libro_id) AS cantidad_libros
FROM Categorias c
LEFT JOIN Libros l ON c.categoria_id = l.categoria_id
GROUP BY c.categoria_id, c.nombre;

SELECT max(precio) as "Libro más caro"
from libros; 

SELECT libro_id, titulo, precio
FROM Libros
ORDER BY precio DESC
LIMIT 1;
