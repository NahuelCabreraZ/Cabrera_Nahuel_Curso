USE elsistema;
CREATE TABLE paises (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL
);

CREATE TABLE provincias (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
idpais int unsigned,
FOREIGN KEY (idpais) REFERENCES paises(id)
);
CREATE TABLE localidades (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30) NOT NULL,
cp int NOT NULL,
id_provincia int unsigned,
FOREIGN KEY (id_provincia) REFERENCES provincias(id)
);

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