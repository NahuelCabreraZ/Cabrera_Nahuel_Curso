CREATE TABLE `alumnos_cursos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `alumnos_Cod_Matricula` int NOT NULL,
  `cursos_Cod_Cursos` int NOT NULL,
  PRIMARY KEY (`id`,`alumnos_Cod_Matricula`,`cursos_Cod_Cursos`),
  KEY `fk_Alumnos_Cursos_alumnos_idx` (`alumnos_Cod_Matricula`),
  KEY `fk_Alumnos_Cursos_cursos1_idx` (`cursos_Cod_Cursos`),
  CONSTRAINT `fk_Alumnos_Cursos_alumnos` FOREIGN KEY (`alumnos_Cod_Matricula`) REFERENCES `alumnos` (`Cod_Matricula`),
  CONSTRAINT `fk_Alumnos_Cursos_cursos1` FOREIGN KEY (`cursos_Cod_Cursos`) REFERENCES `cursos` (`Cod_Cursos`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `clientes` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `DNI` varchar(10) NOT NULL,
  `Direccion` varchar(45) NOT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `DNI_UNIQUE` (`DNI`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `clientes_reservas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `CLIENTES_ID` int NOT NULL,
  `RESERVAS_ID` int NOT NULL,
  `Cantidad_Coches` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`,`CLIENTES_ID`,`RESERVAS_ID`),
  KEY `fk_Clientes_Reservas_CLIENTES1_idx` (`CLIENTES_ID`),
  KEY `fk_Clientes_Reservas_RESERVAS1_idx` (`RESERVAS_ID`),
  CONSTRAINT `fk_Clientes_Reservas_CLIENTES1` FOREIGN KEY (`CLIENTES_ID`) REFERENCES `clientes` (`ID`),
  CONSTRAINT `fk_Clientes_Reservas_RESERVAS1` FOREIGN KEY (`RESERVAS_ID`) REFERENCES `reservas` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `coches` (
  `Patente` varchar(10) NOT NULL,
  `Modelo` varchar(45) NOT NULL,
  `Color` varchar(45) NOT NULL,
  `Marca` varchar(45) NOT NULL,
  `Precio_Hora` int NOT NULL,
  `Litros_Combustible` int NOT NULL DEFAULT '50',
  PRIMARY KEY (`Patente`),
  UNIQUE KEY `Patente_UNIQUE` (`Patente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `coches_x_reserva` (
  `ID` int NOT NULL,
  `COCHES_Patente` varchar(10) NOT NULL,
  `RESERVAS_ID` int NOT NULL,
  PRIMARY KEY (`ID`,`COCHES_Patente`,`RESERVAS_ID`),
  KEY `fk_Coches_X_Reserva_COCHES1_idx` (`COCHES_Patente`),
  KEY `fk_Coches_X_Reserva_RESERVAS1_idx` (`RESERVAS_ID`),
  CONSTRAINT `fk_Coches_X_Reserva_COCHES1` FOREIGN KEY (`COCHES_Patente`) REFERENCES `coches` (`Patente`),
  CONSTRAINT `fk_Coches_X_Reserva_RESERVAS1` FOREIGN KEY (`RESERVAS_ID`) REFERENCES `reservas` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `cursos` (
  `Cod_Cursos` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`Cod_Cursos`),
  UNIQUE KEY `descripcion_UNIQUE` (`descripcion`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `empleado` (
  `idEMPLEADO` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `DNI` varchar(45) NOT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `Email` varchar(45) NOT NULL,
  `Fecha_Alta` date NOT NULL,
  PRIMARY KEY (`idEMPLEADO`),
  UNIQUE KEY `idEMPLEADO_UNIQUE` (`idEMPLEADO`),
  UNIQUE KEY `DNI_UNIQUE` (`DNI`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `empleados_localidad` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `EMPLEADO_idEMPLEADO` int NOT NULL,
  `LOCALIDAD_idLOCALIDAD` int NOT NULL,
  PRIMARY KEY (`ID`,`EMPLEADO_idEMPLEADO`,`LOCALIDAD_idLOCALIDAD`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `fk_Empleados_Localidad_EMPLEADO1_idx` (`EMPLEADO_idEMPLEADO`),
  KEY `fk_Empleados_Localidad_LOCALIDAD1_idx` (`LOCALIDAD_idLOCALIDAD`),
  CONSTRAINT `fk_Empleados_Localidad_EMPLEADO1` FOREIGN KEY (`EMPLEADO_idEMPLEADO`) REFERENCES `empleado` (`idEMPLEADO`),
  CONSTRAINT `fk_Empleados_Localidad_LOCALIDAD1` FOREIGN KEY (`LOCALIDAD_idLOCALIDAD`) REFERENCES `localidad` (`idLOCALIDAD`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `localidad` (
  `idLOCALIDAD` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`idLOCALIDAD`),
  UNIQUE KEY `idLOCALIDAD_UNIQUE` (`idLOCALIDAD`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `localidad_prov` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `LOCALIDAD_idLOCALIDAD` int NOT NULL,
  `PROVINCIA_idPROVINCIA` int NOT NULL,
  PRIMARY KEY (`ID`,`LOCALIDAD_idLOCALIDAD`,`PROVINCIA_idPROVINCIA`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `fk_LOCALIDAD_PROV_LOCALIDAD1_idx` (`LOCALIDAD_idLOCALIDAD`),
  KEY `fk_LOCALIDAD_PROV_PROVINCIA1_idx` (`PROVINCIA_idPROVINCIA`),
  CONSTRAINT `fk_LOCALIDAD_PROV_LOCALIDAD1` FOREIGN KEY (`LOCALIDAD_idLOCALIDAD`) REFERENCES `localidad` (`idLOCALIDAD`),
  CONSTRAINT `fk_LOCALIDAD_PROV_PROVINCIA1` FOREIGN KEY (`PROVINCIA_idPROVINCIA`) REFERENCES `provincia` (`idPROVINCIA`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `pais` (
  `idPAIS` int NOT NULL AUTO_INCREMENT,
  `Descripcion_Pais` varchar(45) NOT NULL,
  PRIMARY KEY (`idPAIS`),
  UNIQUE KEY `idPAIS_UNIQUE` (`idPAIS`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `profesores` (
  `idProfesores` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Especialidad` varchar(45) NOT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idProfesores`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `profesores_cursos` (
  `id` int NOT NULL,
  `profesores_idProfesores` int NOT NULL,
  `cursos_Cod_Cursos` int NOT NULL,
  PRIMARY KEY (`id`,`profesores_idProfesores`,`cursos_Cod_Cursos`),
  KEY `fk_Profesores_Cursos_profesores1_idx` (`profesores_idProfesores`),
  KEY `fk_Profesores_Cursos_cursos1_idx` (`cursos_Cod_Cursos`),
  CONSTRAINT `fk_Profesores_Cursos_cursos1` FOREIGN KEY (`cursos_Cod_Cursos`) REFERENCES `cursos` (`Cod_Cursos`),
  CONSTRAINT `fk_Profesores_Cursos_profesores1` FOREIGN KEY (`profesores_idProfesores`) REFERENCES `profesores` (`idProfesores`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

CREATE TABLE `prov_pais` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `PROVINCIA_idPROVINCIA` int NOT NULL,
  `PAIS_idPAIS` int NOT NULL,
  PRIMARY KEY (`ID`,`PROVINCIA_idPROVINCIA`,`PAIS_idPAIS`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  KEY `fk_PROV_PAIS_PROVINCIA1_idx` (`PROVINCIA_idPROVINCIA`),
  KEY `fk_PROV_PAIS_PAIS1_idx` (`PAIS_idPAIS`),
  CONSTRAINT `fk_PROV_PAIS_PAIS1` FOREIGN KEY (`PAIS_idPAIS`) REFERENCES `pais` (`idPAIS`),
  CONSTRAINT `fk_PROV_PAIS_PROVINCIA1` FOREIGN KEY (`PROVINCIA_idPROVINCIA`) REFERENCES `provincia` (`idPROVINCIA`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `provincia` (
  `idPROVINCIA` int NOT NULL AUTO_INCREMENT,
  `DescripcionProv` varchar(45) NOT NULL,
  PRIMARY KEY (`idPROVINCIA`),
  UNIQUE KEY `idPROVINCIA_UNIQUE` (`idPROVINCIA`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `reservas` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `Fecha_Inicio` datetime NOT NULL,
  `Fecha_Fin` datetime NOT NULL,
  `Precio_Total` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

CREATE TABLE `alumnos` (
  `Cod_Matricula` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Dni` varchar(15) NOT NULL,
  `Fecha_Nacimiento` date NOT NULL,
  `Email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Cod_Matricula`),
  UNIQUE KEY `Cod_Matricula_UNIQUE` (`Cod_Matricula`),
  UNIQUE KEY `Dni_UNIQUE` (`Dni`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
