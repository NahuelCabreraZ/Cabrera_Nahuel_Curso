# Consulta 1 #
SELECT vp.id, vp.fecha FROM ventas.pedidos as vp ORDER BY vp.fecha DESC

# Consulta 2 #
SELECT * FROM ventas.pedidos ORDER BY pedidos.cantidad DESC LIMIT 2

# Consulta 3 #
SELECT DISTINCT id_cliente FROM ventas.pedidos

# Consulta 4 #
SELECT * FROM ventas.pedidos as vp WHERE vp.fecha LIKE "%2022%" and vp.cantidad >= 500

# Consulta 5 #
SELECT concat_ws(" ,", nombre, apellido) "Vendedor" FROM ventas.vendedores as vv 
WHERE vv.comisión BETWEEN 0.05 and 0.11

# Consulta 6 #
SELECT MAX(comisión) "Mejor Comisión" FROM ventas.vendedores

# Consulta 7 #
SELECT id, concat_ws(" ,", apellido, nombre) "cliente" FROM ventas.clientes as vc 
WHERE cuitcuil NOT LIKE "NULL" ORDER BY vc.apellido ASC

# Consulta 8 #
SELECT nombre FROM ventas.clientes as vc WHERE vc.nombre LIKE "A%" and vc.nombre LIKE "%n%" or vc.nombre LIKE "P%"
ORDER BY vc.nombre ASC

# Consulta 9 #
SELECT nombre FROM ventas.clientes as vc WHERE vc.nombre NOT LIKE "A%" ORDER BY vc.nombre ASC

# Consulta 10 #
SELECT nombre FROM ventas.vendedores as vv WHERE vv.nombre LIKE "%el" or vv.nombre LIKE "%o"

# Consulta 11 #
SELECT DISTINCT vc.apellido, vc.nombre, vc.id FROM ventas.clientes as vc
INNER JOIN ventas.pedidos as vp
WHERE vp.id_cliente NOT LIKE "Null" ORDER BY vc.apellido ASC

# Consulta 12 #
SELECT * FROM ventas.pedidos as vp 
INNER JOIN ventas.clientes as vc
WHERE vp.id_cliente NOT LIKE "Null" ORDER BY vc.apellido ASC

# Consulta 13 #
SELECT * FROM ventas.pedidos as vp 
INNER JOIN ventas.vendedores as vv
WHERE vp.id_vendedor NOT LIKE "Null" ORDER BY vv.apellido ASC

# Consulta 14 #
SELECT concat(vc.apellido,", ", vc.nombre)"clientes", concat(vv.nombre,", ", vv.apellido)"vendedores", vp.cantidad, vp.fecha FROM ventas.clientes as vc
INNER JOIN ventas.pedidos as vp
INNER JOIN ventas.vendedores as vv
WHERE vv.id = vp.id_cliente

# Consulta 15 #
SELECT vc.apellido, vc.nombre, vp.fecha, vp.cantidad FROM ventas.clientes as vc
INNER JOIN ventas.pedidos as vp
WHERE vp.fecha LIKE "2022%" and vp.cantidad BETWEEN "300" and "1000"

# Consulta 16 #
SELECT DISTINCT vv.nombre, vv.apellido, vv.id FROM ventas.vendedores as vv
INNER JOIN ventas.pedidos as vp
INNER JOIN ventas.clientes as vc
WHERE vv.id = vc.nombre LIKE "María%"

# Consulta 17 #
SELECT DISTINCT vc.nombre, vc.apellido FROM ventas.clientes as vc
INNER JOIN ventas.pedidos as vp on vp.id_cliente = vc.id
INNER JOIN ventas.vendedores as vv on vv.id = vp.id_vendedor 
WHERE vv.nombre = "Daniel" and vv.apellido = "Sáez"

# Consulta 18 #
SELECT DISTINCT concat(vc.nombre, ", ", vc.apellido) as "Clientes", vp.fecha, vp.cantidad FROM ventas.clientes as vc
LEFT JOIN ventas.pedidos as vp on vc.id = vp.id_cliente ORDER BY vc.apellido asc

# Consulta 19 #
SELECT DISTINCT concat(vv.nombre, ", ", vv.apellido) as "Vendedores", vp.fecha, vp.cantidad FROM ventas.vendedores as vv
LEFT JOIN ventas.pedidos as vp on vv.id = vp.id_vendedor ORDER BY vv.apellido asc

# Consulta 20 #
SELECT vc.nombre, vc.apellido
FROM ventas.clientes as vc
WHERE NOT EXISTS (SELECT id_cliente FROM ventas.pedidos WHERE vc.id = ventas.pedidos.id_cliente)

# Consulta 21 #
SELECT vv.nombre, vv.apellido
FROM ventas.vendedores as vv
WHERE NOT EXISTS (SELECT id_vendedor FROM ventas.pedidos WHERE vv.id = ventas.pedidos.id_vendedor)

# Consulta 22 #
SELECT concat(vc.apellido, " ,", vc.nombre) as Clientes, concat(vv.apellido, " ,", vv.nombre) as Vendedores FROM ventas.clientes as vc
INNER JOIN ventas.vendedores as vv
WHERE NOT EXISTS (SELECT id_cliente FROM ventas.pedidos WHERE vc.id = ventas.pedidos.id_cliente) 
and NOT EXISTS (SELECT id_vendedor FROM ventas.pedidos WHERE vv.id = ventas.pedidos.id_vendedor)
ORDER BY vc.apellido and vv.apellido ASC

# Consulta 23 #
SELECT SUM(vp.cantidad) as TOTAL  FROM ventas.pedidos as vp

# Consulta 24 #
SELECT SUM(vp.cantidad) / COUNT(vp.cantidad) as Promedio  FROM ventas.pedidos as vp

# Consulta 25 #
SELECT COUNT(DISTINCT id_vendedor) "Total Vendedores" FROM ventas.pedidos

# Consulta 26 #
SELECT COUNT(id) as "Total Clientes" FROM ventas.clientes

# Consulta 27 #
SELECT MAX(cantidad) FROM ventas.pedidos

# Consulta 28 #
SELECT MIN(cantidad) FROM ventas.pedidos

# Consulta 29 #
SELECT MAX(categoría), ciudad FROM ventas.clientes GROUP BY ciudad

# Consulta 30 #
SELECT id_cliente,fecha, max(cantidad) as "Max pedido" , vc.nombre, vc.apellido, vc.id
FROM ventas.pedidos
INNER JOIN ventas.clientes as vc
WHERE id_cliente = vc.id
GROUP BY fecha ORDER BY fecha ASC

# Consulta 31 #
SELECT id_cliente,fecha, max(cantidad) as "Max pedido" , vc.nombre, vc.apellido, vc.id
FROM ventas.pedidos
INNER JOIN ventas.clientes as vc
WHERE id_cliente = vc.id and ventas.pedidos.cantidad > 2000
GROUP BY fecha ORDER BY fecha ASC

# Consulta 32 #
SELECT vv.id,vv.nombre,vv.apellido,vp.fecha,vp.cantidad FROM ventas.vendedores as vv
JOIN ventas.pedidos as vp ON vv.id = vp.id_vendedor
WHERE fecha LIKE "2021-08-17"

# Consulta 33 #
SELECT DISTINCT vc.id,vc.nombre,vc.apellido,vp.fecha,vp.cantidad FROM ventas.clientes vc
LEFT JOIN ventas.pedidos vp ON vc.id = vp.id_cliente
GROUP BY vc.id

# Consulta 34 #
SELECT vc.id,vc.nombre,vc.apellido,vp.fecha,vp.cantidad FROM ventas.clientes as vc
JOIN ventas.pedidos as vp ON vc.id = vp.id_cliente
WHERE vp.fecha LIKE "2020%"

# Consulta 35 #
SELECT MAX(cantidad), YEAR(fecha) as AÑO FROM ventas.pedidos as vp
GROUP BY YEAR(fecha)
ORDER BY YEAR(fecha) asc

# Consulta 36 #
SELECT count(id) as pedidos, Year(vp.fecha) as AÑO FROM ventas.pedidos as vp
GROUP BY year(vp.fecha)
ORDER BY year(vp.fecha)

# Consulta 37 #
SELECT vp.id, vp.fecha FROM ventas.pedidos as vp
CROSS JOIN ventas.clientes as vc ON vp.id_cliente = vc.id
WHERE vc.nombre LIKE "Adela"
ORDER BY vp.id ASC

# Consulta 38 #
SELECT count(vp.id)"nomero de pedidos de Daniel Saez" FROM ventas.pedidos as vp
CROSS JOIN ventas.vendedores as vv ON vp.id_vendedor = vv.id
WHERE vv.apellido LIKE "Sáez"

# Consulta 39 #
SELECT vc.id, vc.nombre, vc.apellido, max(vp.cantidad) FROM ventas.clientes as vc
CROSS JOIN ventas.pedidos as vp ON vp.id_cliente = vc.id
WHERE vp.fecha LIKE "2020%"

# Consulta 40 #
SELECT vp.fecha, min(vp.cantidad) as "Minimo de Pepe" FROM ventas.pedidos as vp
INNER JOIN ventas.clientes as vc ON vp.id_cliente = vc.id
WHERE vc.nombre LIKE "Pepe"

# Consulta 41 #
SELECT vc.nombre,vc.apellido FROM ventas.clientes as vc
WHERE vc.id NOT IN (SELECT vp.id_cliente FROM ventas.pedidos as vp)

# Consulta 42 #
SELECT vv.nombre,vv.apellido FROM ventas.vendedores as vv
WHERE vv.id NOT IN (SELECT vp.id_vendedor FROM ventas.pedidos as vp)

# Consulta 43 #
SELECT concat(vc.apellido, " ,", vc.nombre) as Clientes FROM ventas.clientes as vc
LEFT JOIN ventas.pedidos as vp ON vc.id = vp.id_cliente
WHERE NOT EXISTS (SELECT vp.id_cliente FROM ventas.pedidos WHERE vc.id = ventas.pedidos.id_cliente)

# Consulta 44 #
SELECT vv.nombre, vv.apellido
FROM ventas.vendedores as vv
WHERE NOT EXISTS (SELECT id_vendedor FROM ventas.pedidos WHERE vv.id = ventas.pedidos.id_vendedor)