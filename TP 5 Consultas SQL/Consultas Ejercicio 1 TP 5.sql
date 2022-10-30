# Consulta 1 #
SELECT apellido FROM sistema.empleados
# Consulta 2 #
SELECT apellido, count(*) FROM sistema.empleados as e group by apellido HAVING COUNT(*)=1
# Consulta 3 #
SELECT * FROM sistema.empleados
# Consulta 4 #
SELECT nombre, apellido FROM sistema.empleados
# Consulta 5 #
SELECT cuil_cuit FROM sistema.empleados
# Consulta 6 #
SELECT concat_ws (" ,", nombre, apellido) as "Nombre Completo" FROM sistema.empleados
# Consulta 7 #
SELECT UCASE(concat_ws (" ,", nombre, apellido)) as "Nombre Completo" FROM sistema.empleados
# Consulta 8 #
SELECT LCASE(concat_ws (" ,", nombre, apellido)) as "Nombre Completo" FROM sistema.empleados
# Consulta 9 #
SELECT nombre, presupuesto FROM sistema.departamentos order by presupuesto asc
# Consulta 10 #
SELECT nombre FROM sistema.departamentos order by nombre asc
# Consulta 11 #
SELECT nombre FROM sistema.departamentos order by nombre desc
# Consulta 12 #
SELECT apellido, nombre FROM sistema.empleados order by apellido asc
# Consulta 13 #
SELECT nombre, presupuesto FROM sistema.departamentos order by presupuesto desc limit 3
# Consulta 14 #
SELECT nombre, presupuesto FROM sistema.departamentos order by presupuesto asc limit 3
# Consulta 15 #
SELECT nombre, presupuesto FROM sistema.departamentos WHERE presupuesto >= 150000
# Consulta 16 #
SELECT nombre, presupuesto FROM sistema.departamentos WHERE presupuesto >= 100000 and presupuesto <= 200000
# Consulta 17 #
SELECT nombre, presupuesto FROM sistema.departamentos WHERE presupuesto < 100000 or presupuesto > 200000
# Consulta 18 #
SELECT nombre, presupuesto FROM sistema.departamentos WHERE presupuesto BETWEEN 100000 and 200000
# Consulta 19 #
SELECT nombre, presupuesto FROM sistema.departamentos WHERE (presupuesto BETWEEN 0 and 99999) or (presupuesto between 200001 and 999999)

# Consulta 20 #
SELECT sd.nombre as "Nombre departamento", concat_ws(" ,", se.nombre, se.apellido) "Nombre Empleado"
FROM sistema.departamentos as sd
INNER JOIN sistema.empleados as se ON se.id_departamento = sd.iddepartamento

# Consulta 21 #
SELECT sd.nombre as "Nombre departamento", concat_ws(" ,", se.apellido, se.nombre) "Nombre Empleado"
FROM sistema.departamentos as sd
INNER JOIN sistema.empleados as se ON se.id_departamento = sd.iddepartamento ORDER BY sd.nombre ASC

# Consulta 22 #
SELECT DISTINCT sd.iddepartamento, sd.nombre FROM sistema.departamentos as sd
INNER JOIN sistema.empleados as se
WHERE se.id_departamento <= 1

# Consulta 23 #
SELECT sd.nombre, se.nombre, se.cuil_cuit FROM sistema.departamentos as sd 
INNER JOIN sistema.empleados as se
WHERE se.cuil_cuit = "27-38382980-3"

# Consulta 24 #

SELECT sd.nombre FROM sistema.departamentos AS sd
INNER JOIN sistema.empleados AS se
WHERE se.nombre LIKE "%Pepe" = sd.iddepartamento

# Consulta 25 #

SELECT se.idemplaedo, se.nombre, se.apellido, se.cuil_cuit FROM sistema.empleados AS se
INNER JOIN sistema.departamentos AS sd
WHERE sd.iddepartamento = 5

# Consulta 26 #
SELECT sd.nombre, se.nombre , se.apellido FROM sistema.empleados as se 
INNER JOIN sistema.departamentos as sd
WHERE id_departamento = 5 and 4 and 2

# Consulta 27 #
SELECT nombre, presupuesto FROM sistema.departamentos WHERE presupuesto < 100000 or presupuesto > 200000
