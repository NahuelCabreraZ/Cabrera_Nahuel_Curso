INSERT INTO elsistema.productos (nombre, descripcion, id_marca, stock, precio, estado, tms)
VALUES ("arroz", "alimentos", 1, 300, 350, "A", "2022-11-10");

INSERT INTO elsistema.productos (nombre, descripcion, id_marca, stock, precio, estado, tms)
VALUES ("fideos", "alimentos", 1, 300, 330, "A", "2022-11-11");

INSERT INTO elsistema.productos (nombre, descripcion, id_marca, stock, precio, estado, tms)
VALUES ("lentejas", "alimentos", 1, 300, 150, "A", "2022-11-05");

INSERT INTO elsistema.productos (nombre, descripcion, id_marca, stock, precio, estado, tms)
VALUES ("lavandina", "limpieza", 2, 200, 100, "A", "2022-11-10");

INSERT INTO elsistema.productos (nombre, descripcion, id_marca, stock, precio, estado, tms)
VALUES ("detergente", "limpieza", 3, 300, 180, "A", "2022-11-11");


INSERT INTO elsistema.marcas (nombre, descripcion, id_proveedor, estado, tms)
VALUES ("Marolio", "alimentos", 1, "A", "2022-10-05");

INSERT INTO elsistema.marcas (nombre, descripcion, id_proveedor, estado, tms)
VALUES ("Ayudin", "limpieza", 3, "A", "2022-10-05");

INSERT INTO elsistema.marcas (nombre, descripcion, id_proveedor, estado, tms)
VALUES ("Magistral", "limpieza", 3, "A", "2022-10-05");

INSERT INTO elsistema.marcas (nombre, descripcion, id_proveedor, estado, tms)
VALUES ("Cofra", "alimentos", 2, "A", "2022-10-05");

INSERT INTO elsistema.marcas (nombre, descripcion, id_proveedor, estado, tms)
VALUES ("Axe", "higiene personal", 3, "A", "2022-10-05");


INSERT INTO elsistema.proveedores (id,razon_social, nombre, apellido, naturaleza, cuit, id_localidad, estado, tms)
VALUES (1,"Yaguarete SRL", "Jorge", "Figueredo", "J", "22-37559813-8", 1, "A", "2022-10-05");

INSERT INTO elsistema.proveedores (razon_social, nombre, apellido, naturaleza, cuit, id_localidad, estado, tms)
VALUES ("Hermetica SA", "Julian", "Alvarez", "J", "21-37459813-4", 2, "A", "2022-10-05");

INSERT INTO elsistema.proveedores (razon_social, nombre, apellido, naturaleza, cuit, id_localidad, estado, tms)
VALUES ("Cofre SRL", "Gerardo", "Monzon", "J", "21-37449812-1", 3, "A", "2022-10-05");

INSERT INTO elsistema.proveedores (razon_social, nombre, apellido, naturaleza, cuit, id_localidad, estado, tms)
VALUES ("Rulo SRL", "Matias", "Mereles", "J", "15-47559822-5", 5, "A", "2022-10-05");

INSERT INTO elsistema.proveedores (razon_social, nombre, apellido, naturaleza, cuit, id_localidad, estado, tms)
VALUES ("Nahuel Cabrerusky", "Nahuel", "Cabrerusky", "F", "22-37590532-5", 1, "A", "2022-10-05");



INSERT INTO elsistema.cajas (id,hora_inicio, hora_cierre, estado, tms)
VALUES (1, "2022-11-11 16:30:00", "2022-11-11 23:30:00", "A", "2022-11-11 16:30:00");

INSERT INTO elsistema.cajas (hora_inicio, hora_cierre, estado, tms)
VALUES ("2022-11-11 10:30:00", "2022-11-11 16:30:00", "A", "2022-11-11 10:30:00");

INSERT INTO elsistema.cajas (hora_inicio, hora_cierre, estado, tms)
VALUES ("2022-11-11 15:30:00", "2022-11-11 20:30:00", "A", "2022-11-11 15:30:00");

INSERT INTO elsistema.cajas (hora_inicio, hora_cierre, estado, tms)
VALUES ("2022-11-11 19:30:00", "2022-11-11 23:30:00", "A", "2022-11-11 19:30:00");

INSERT INTO elsistema.cajas (hora_inicio, hora_cierre, estado, tms)
VALUES ("2022-11-11 15:30:00", "2022-11-11 20:30:00", "A", "2022-11-11 15:30:00");

USE elsistema;
CREATE TABLE marcas (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
descripcion VARCHAR(30) NOT NULL,
imagen MEDIUMBLOB,
id_proveedor INT UNSIGNED,
estado VARCHAR(1),
tms timestamp,
FOREIGN KEY (id_proveedor) REFERENCES proveedores(id)
);

CREATE TABLE productos (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
descripcion VARCHAR(30) NOT NULL,
id_marca INT UNSIGNED,
stock int,
precio int,
estado VARCHAR(1),
tms timestamp,
FOREIGN KEY (id_marca) REFERENCES marcas(id)
);

# punto 8 #
#Listar el nombre, presupuesto, gastos y diferencia(presupuesto-gasto) de todos los departamentos con estado activo o 1. #

SELECT nombre, presupuesto, gasto, (presupuesto-gasto) as "Diferencia" FROM elsistema.departamentos
WHERE estado = 1

#Punto 9#

SELECT l.nombre, c.nombre FROM elsistema.localidades as l
INNER JOIN elsistema.provincias as p ON l.id_provincia = p.id
INNER JOIN elsistema.paises as c ON p.idpais = c.id

#Punto 10#
UPDATE `elsistema`.`empleados` SET `fecha_ingreso` = '2022-01-03', `id_localidad` = '3' 
WHERE (`idemplaedo` = '5');

#Punto 11#
INSERT INTO elsistema.vendedores (nombre, apellido, cuitcuil, comisión)
VALUES ("Jorge", "Manute", "22-38559813-8", 300);

INSERT INTO elsistema.vendedores (nombre, apellido, cuitcuil, comisión)
VALUES ("Manuel", "Google", "29-38559813-8", 200);

INSERT INTO elsistema.vendedores (nombre, apellido, cuitcuil, comisión)
VALUES ("Thor", "Tejedor", "15-38559813-8", 400);

INSERT INTO elsistema.vendedores (nombre, apellido, cuitcuil, comisión)
VALUES ("Manuela", "Arroyo", "17-38559813-8", 700);

INSERT INTO elsistema.vendedores (nombre, apellido, cuitcuil, comisión)
VALUES ("Fiorella", "Mantulak", "21-38559813-8", 800);

#Punto 12#
ALTER TABLE `elsistema`.`movimientos` 
DROP FOREIGN KEY `movimientos_ibfk_3`;
ALTER TABLE `elsistema`.`movimientos` 
;
ALTER TABLE `elsistema`.`movimientos` ALTER INDEX `movimientos_ibfk_3_idx` VISIBLE;
ALTER TABLE `elsistema`.`movimientos` 
ADD CONSTRAINT `movimientos_ibfk_3`
  FOREIGN KEY (`id_producto`)
  REFERENCES `elsistema`.`productos` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

#Punto 13#
INSERT INTO elsistema.movimientos (cantidad, fecha, id_cliente, id_vendedor, id_producto, estado, tms, tipo_movimiento)
VALUES (20, "2022-08-15", 2, 1, 3, "A", "2022-10-05 19:30:00", "Ingreso");

INSERT INTO elsistema.movimientos (cantidad, fecha, id_cliente, id_vendedor, id_producto, estado, tms, tipo_movimiento)
VALUES (15, "2021-08-15", 3, 2, 4, "A", "2022-10-05 19:30:00", "Ingreso");

INSERT INTO elsistema.movimientos (cantidad, fecha, id_cliente, id_vendedor, id_producto, estado, tms, tipo_movimiento)
VALUES (110, "2021-05-15", 4, 3, 1, "A", "2022-10-06 19:30:00", "Ingreso");

INSERT INTO elsistema.movimientos (cantidad, fecha, id_cliente, id_vendedor, id_producto, estado, tms, tipo_movimiento)
VALUES (50, "2022-07-25", 5, 4, 5, "A", "2022-10-05 19:30:00", "Ingreso");

INSERT INTO elsistema.movimientos (cantidad, fecha, id_cliente, id_vendedor, id_producto, estado, tms, tipo_movimiento)
VALUES (25, "2021-08-15", 1, 5, 4, "A", "2022-10-05 19:30:00", "Egreso");

#Punto 14#
DELETE FROM `elsistema`.`movimientos` WHERE (`id` = '6');
DELETE FROM `elsistema`.`movimientos` WHERE (`id` = '5');

DELETE FROM `elsistema`.`paises` WHERE (`id` = '1');

#Punto 15#
UPDATE `elsistema`.`productos` SET `stock` = '410' WHERE (`id` = '1');
UPDATE `elsistema`.`productos` SET `stock` = '320' WHERE (`id` = '3');
UPDATE `elsistema`.`productos` SET `stock` = '190' WHERE (`id` = '4');
UPDATE `elsistema`.`productos` SET `stock` = '350' WHERE (`id` = '5');

#Punto 16#
CREATE TABLE elsistema.parametros (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
id_usuario INT,
cosas json,
tms timestamp
);

#Punto 17 #
INSERT INTO elsistema.parametros (id,cosas) 
VALUES (4,
'{
"idDeLaCosa": 101, 
"permisos": "PUT,GET",
"vistasPermitidas":["menuPrincipal","menuSecundario","ventas","estadisticaVentas","listaCliente"],
"grupo": "ventas",
"ZonaHoraria": "America/Argentina/BuenosAires",
"FechaInicioActividades": "01/01/2019",
"MesAperturaCaja": "Enero",
"MesCierreCaja": "Diciembre",
"BalanceAniosAnteriores": [{"2019": {"ingreso": "7374901.93", "egreso": "3732538,75"}, "2020": {"ingreso": "27442665,12", "egreso": "8522331,82"}}]
}
')
