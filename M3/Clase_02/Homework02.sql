use M3;

# Normalizar los nombres de los campos y colocar el tipo de dato adecuado para cada uno en cada una de las tablas. 
# Descartar columnas que consideres que no tienen relevancia.

alter table Canal_Venta  change Codigo IDCanal int;
alter table Canal_Venta  change Descricpion Canal varchar(50);

alter table Tipo_Gasto change `Descripcion` `Tipo_Gasto` varchar(100);

alter table Gasto change SucursalID IDSucursal int;
alter table Gasto change TipoGastoID IDTipoGasto int;


alter table Producto change `Concepto` `Producto` varchar(100);
alter table cliente change Nombre_Y_Apellido Nombre_Y_Apellido varchar(125);
select * from cliente;

alter table `Cliente` add `Latitud` decimal(13,10) not null default('0') after `Y`, 
					  add `Longitud` decimal(13,10) not null default('0') after `Latitud`;
alter table cliente add Provincia2 varchar(50) not null default('Sin Dato') after provincia;
update Cliente set Y = '0' where Y = '';
update Cliente set Y = '0' where Y = ' ';
update Cliente set X = '0' where X = '';
update Cliente set X = '0' where X = ' ';
update cliente set provincia2 = Nombre_Y_Apellido;
update cliente set Nombre_Y_Apellido = provincia;
update cliente set provincia = provincia2;
alter table cliente drop provincia2;
update Cliente set Latitud = replace(Y,',','.'), 
				   Longitud = replace(X,',','.');

select * from cliente;

 alter table `cliente` drop X,
					   drop Y;
                      
select * from empleado;

alter table empleado change Salario Salario decimal(15,3) not null default 0;

select * from producto;

alter table producto change Precio Precio decimal(15,3) not null default 0;

select * from Sucursal;

alter table sucursal add Latitud2 decimal(13,10) not null default 0 after Latitud,
					 add Longitud2 decimal(13,10) not null default 0 after Latitud2;
                     
update sucursal set Latitud2 = replace(Latitud,',','.'),
					Longitud2 = replace(Longitud,',','.');
                    
alter table sucursal drop Latitud, drop Longitud;
alter table sucursal change Latitud2 Latitud decimal(13,10) not null default 0,
					 change Longitud2 Longitud decimal(13,10) not null default 0;
                     
select * from sucursal;

select * from Venta;

update venta set Precio = '0.00' where Precio = '';
update venta set Precio = '0.00' where Precio = ' ';

alter table venta change Precio Precio decimal(15,3) not null default 0;

-- Columnas sin usar --

alter table cliente drop col10;
select * from cliente;

-- Competar valores faltantes --

update cliente set domicilio = 'Sin Dato' where trim(domicilio) = '' or isnull(domicilio);
update cliente set Localidad = 'Sin Dato' where trim(Localidad) = '' or isnull(Localidad);
update cliente set Nombre_Y_Apellido = 'Sin Dato' where trim(Nombre_Y_Apellido) = '' or isnull(Nombre_Y_Apellido);
update cliente set Provincia = 'Sin Dato' where trim(Provincia) = '' or isnull(Provincia);

update empleado set apellido = 'Sin dato' where trim(apellido) = '' or isnull(apellido);
update empleado set Nombre = 'Sin dato' where trim(Nombre) = '' or isnull(Nombre);
update empleado set Sucursal = 'Sin dato' where trim(Sucursal) = '' or isnull(Sucursal);
update empleado set Sector = 'Sin dato' where trim(Sector) = '' or isnull(Sector);
update empleado set Cargo = 'Sin dato' where trim(Cargo) = '' or isnull(Cargo);

update producto set Producto = 'Sin dato' where trim(Producto)='' or isnull(Producto);
update producto set Tipo = 'Sin dato' where trim(Tipo)='' or isnull(Tipo);

update Proveedor set Nombre ='Sin Dato' where trim(Nombre)='' or isnull(Nombre);
update Proveedor set Dirreccion ='Sin Dato' where trim(Dirreccion)='' or isnull(Dirreccion);
update Proveedor set Ciudad ='Sin Dato' where trim(Ciudad)='' or isnull(Ciudad);
update Proveedor set Región ='Sin Dato' where trim(Región)='' or isnull(Región);
update Proveedor set País ='Sin Dato' where trim(País)='' or isnull(País);
update Proveedor set Departamento ='Sin Dato' where trim(Departamento)='' or isnull(Departamento);

update sucursal set Sucursal = 'Sin Dato' where trim(Sucursal)='' or isnull(Sucursal);
update sucursal set Direccion = 'Sin Dato' where trim(Direccion)='' or isnull(Direccion);
update sucursal set Localidad = 'Sin Dato' where trim(Localidad)='' or isnull(Localidad);
update sucursal set Provincia = 'Sin Dato' where trim(Provincia)='' or isnull(Provincia);



select * from venta where precio = '' or cantidad = '';


update venta v join producto p on (v.IDProducto = p.IDProducto)
set v.precio = p.precio
where v.precio = 0;

DROP TABLE IF EXISTS `aux_venta`;
CREATE TABLE IF NOT EXISTS `aux_venta` (
  `IdVenta`				INTEGER,
  `Fecha` 				DATE NOT NULL,
  `Fecha_Entrega` 		DATE NOT NULL,
  `IdCliente`			INTEGER, 
  `IdSucursal`			INTEGER,
  `IdEmpleado`			INTEGER,
  `IdProducto`			INTEGER,
  `Precio`				FLOAT,
  `Cantidad`			INTEGER,
  `Motivo`				INTEGER
);
-- Motivo:
--    1 -> cantidad en 0


update venta set cantidad = replace(Cantidad, '\r','');

select * from aux_venta;

INSERT INTO aux_venta (IdVenta, Fecha, Fecha_Entrega, IdCliente, IdSucursal, IdEmpleado, IdProducto, Precio, Cantidad, Motivo)
SELECT IdVenta, Fecha, Fecha_Entrega, IdCliente, IdSucursal, IdEmpleado, IdProducto, Precio, 0, 1
FROM venta WHERE Cantidad = '' or Cantidad is null;

select * from aux_venta;
select * from venta;

-- una vez concensuado...

update venta set cantidad = '1' where cantidad = '' or cantidad is null;
alter table venta change cantidad Cantidad int not null default 0; 

/*Normalizacion a Letra Capital*/
UPDATE cliente SET 	Provincia = UC_Words(TRIM(Provincia)),
					Localidad = UC_Words(TRIM(Localidad)),
                    Domicilio = UC_Words(TRIM(Domicilio)),
                    Nombre_y_Apellido = UC_Words(TRIM(Nombre_y_Apellido));
					
UPDATE sucursal SET Provincia = UC_Words(TRIM(Provincia)),
					Localidad = UC_Words(TRIM(Localidad)), -- 
                    Direccion = UC_Words(TRIM(Direccion)),
                    Sucursal = UC_Words(TRIM(Sucursal));

select * from sucursal;
                    
UPDATE proveedor SET Región = UC_Words(TRIM(Región)),
					Ciudad = UC_Words(TRIM(Ciudad)),
                    Departamento = UC_Words(TRIM(Departamento)),
                    País = UC_Words(TRIM(País)),
                    Nombre = UC_Words(TRIM(Nombre)),
                    Dirreccion = UC_Words(TRIM(Dirreccion));
                    
select * from proveedor;

UPDATE producto SET Producto = UC_Words(TRIM(Producto)),
					Tipo = UC_Words(TRIM(Tipo));
					
UPDATE empleado SET Sucursal = UC_Words(TRIM(Sucursal)),
                    Sector = UC_Words(TRIM(Sector)),
                    Cargo = UC_Words(TRIM(Cargo)),
                    Nombre = UC_Words(TRIM(Nombre)),
                    Apellido = UC_Words(TRIM(Apellido));

-- Chequeo de claves duplicadas --

SELECT IdCliente, COUNT(*) FROM cliente GROUP BY IdCliente HAVING COUNT(*) > 1;
SELECT IdSucursal, COUNT(*) FROM sucursal GROUP BY IdSucursal HAVING COUNT(*) > 1;
SELECT IdEmpleado, COUNT(*) FROM empleado GROUP BY IdEmpleado HAVING COUNT(*) > 1;
SELECT IdProveedor, COUNT(*) FROM proveedor GROUP BY IdProveedor HAVING COUNT(*) > 1;
SELECT IdProducto, COUNT(*) FROM producto GROUP BY IdProducto HAVING COUNT(*) > 1;

select count(*) from empleado;

SELECT e.*, s.IdSucursal, s.Sucursal
FROM empleado e
JOIN sucursal s	ON (e.Sucursal = s.Sucursal);
    
select distinct Sucursal from empleado
where Sucursal NOT IN (select Sucursal from sucursal);

/*Generacion de clave única tabla empleado mediante creacion de clave subrogada*/
UPDATE empleado SET Sucursal = 'Mendoza1' WHERE Sucursal = 'Mendoza 1';
UPDATE empleado SET Sucursal = 'Mendoza2' WHERE Sucursal = 'Mendoza 2';
-- UPDATE empleado SET Sucursal = 'Córdoba Quiroz' WHERE Sucursal = 'Cordoba Quiroz';

ALTER TABLE `empleado` ADD `IdSucursal` INT NULL DEFAULT '0' AFTER `Sucursal`;

UPDATE empleado e
JOIN sucursal s	ON (e.Sucursal = s.Sucursal)
SET e.IdSucursal = s.IdSucursal;

SELECT * FROM `empleado`;

ALTER TABLE `empleado` DROP `Sucursal`;

ALTER TABLE `empleado` ADD `CodigoEmpleado` INT NULL DEFAULT '0' AFTER `IdEmpleado`;

UPDATE empleado SET CodigoEmpleado = IdEmpleado;
UPDATE empleado SET IdEmpleado = (IdSucursal * 1000000) + CodigoEmpleado;

/*Chequeo de claves duplicadas*/
SELECT * FROM `empleado`;
SELECT IdEmpleado, COUNT(*) FROM empleado GROUP BY IdEmpleado HAVING COUNT(*) > 1;

/*Modificacion de la clave foranea de empleado en venta*/
UPDATE venta SET IdEmpleado = (IdSucursal * 1000000) + IdEmpleado;

/*Normalizacion tabla empleado*/
DROP TABLE IF EXISTS `cargo`;
CREATE TABLE IF NOT EXISTS `cargo` (
  `IdCargo` int(11) NOT NULL AUTO_INCREMENT,
  `Cargo` varchar(50) NOT NULL,
  PRIMARY KEY (`IdCargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

DROP TABLE IF EXISTS `sector`;
CREATE TABLE IF NOT EXISTS `sector` (
  `IdSector` int(11) NOT NULL AUTO_INCREMENT,
  `Sector` varchar(50) NOT NULL,
  PRIMARY KEY (`IdSector`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

INSERT INTO cargo (Cargo) SELECT DISTINCT Cargo FROM empleado ORDER BY 1;
INSERT INTO sector (Sector) SELECT DISTINCT Sector FROM empleado ORDER BY 1;

select * from cargo;
select * from sector;

ALTER TABLE `empleado` 	ADD `IdSector` INT NOT NULL DEFAULT '0' AFTER `IdSucursal`, 
						ADD `IdCargo` INT NOT NULL DEFAULT '0' AFTER `IdSector`;

UPDATE empleado e JOIN cargo c ON (c.Cargo = e.Cargo) SET e.IdCargo = c.IdCargo;
UPDATE empleado e JOIN sector s ON (s.Sector = e.Sector) SET e.IdSector = s.IdSector;

ALTER TABLE `empleado` DROP `Cargo`;
ALTER TABLE `empleado` DROP `Sector`;

SELECT * FROM `empleado`;

/*Normalización tabla producto*/
ALTER TABLE `producto` ADD `IdTipoProducto` INT NOT NULL DEFAULT '0' AFTER `Precio`;

DROP TABLE IF EXISTS `tipo_producto`;
CREATE TABLE IF NOT EXISTS `tipo_producto` (
  `IdTipoProducto` int(11) NOT NULL AUTO_INCREMENT,
  `TipoProducto` varchar(50) NOT NULL,
  PRIMARY KEY (`IdTipoProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

INSERT INTO tipo_producto (TipoProducto) SELECT DISTINCT Tipo FROM producto ORDER BY 1;

UPDATE producto p JOIN tipo_producto t ON (p.Tipo = t.TipoProducto) SET p.IdTipoProducto = t.IdTipoProducto;

SELECT * FROM `producto`;

ALTER TABLE `producto` DROP `Tipo`;

/*Normalización Localidad Provincia*/
DROP TABLE IF EXISTS aux_Localidad;
CREATE TABLE IF NOT EXISTS aux_Localidad (
	Localidad_Original	VARCHAR(80),
	Provincia_Original	VARCHAR(50),
	Localidad_Normalizada	VARCHAR(80),
	Provincia_Normalizada	VARCHAR(50),
	IdLocalidad			INTEGER
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

select * from proveedor;

INSERT INTO aux_localidad (Localidad_Original, Provincia_Original, Localidad_Normalizada, Provincia_Normalizada, IdLocalidad)
SELECT DISTINCT Localidad, Provincia, Localidad, Provincia, 0 FROM cliente
UNION
SELECT DISTINCT Localidad, Provincia, Localidad, Provincia, 0 FROM sucursal
UNION
SELECT DISTINCT Ciudad, Región, Ciudad, Región, 0 FROM proveedor
ORDER BY 2, 1;

SELECT * FROM aux_localidad ORDER BY Provincia_Original;

UPDATE `aux_localidad` SET Provincia_Normalizada = 'Buenos Aires'
WHERE Provincia_Original IN ('B. Aires',
                            'B.Aires',
                            'Bs As',
                            'Bs.As.',
                            'Buenos Aires',
                            'C Debuenos Aires',
                            'Caba',
                            'Ciudad De Buenos Aires',
                            'Pcia Bs As',
                            'Prov De Bs As.',
                            'Provincia De Buenos Aires');
							
UPDATE `aux_localidad` SET Localidad_Normalizada = 'Capital Federal'
WHERE Localidad_Original IN ('Boca De Atencion Monte Castro',
                            'Caba',
                            'Cap.   Federal',
                            'Cap. Fed.',
                            'Capfed',
                            'Capital',
                            'Capital Federal',
                            'Cdad De Buenos Aires',
                            'Ciudad De Buenos Aires')
AND Provincia_Normalizada = 'Buenos Aires';
							
UPDATE `aux_localidad` SET Localidad_Normalizada = 'Córdoba'
WHERE Localidad_Original IN ('Coroba',
                            'Cordoba',
							'Cã³rdoba')
AND Provincia_Normalizada = 'Córdoba';

DROP TABLE IF EXISTS `localidad`;
CREATE TABLE IF NOT EXISTS `localidad` (
  `IdLocalidad` int(11) NOT NULL AUTO_INCREMENT,
  `Localidad` varchar(80) NOT NULL,
  `Provincia` varchar(80) NOT NULL,
  `IdProvincia` int(11) NOT NULL,
  PRIMARY KEY (`IdLocalidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

DROP TABLE IF EXISTS `provincia`;
CREATE TABLE IF NOT EXISTS `provincia` (
  `IdProvincia` int(11) NOT NULL AUTO_INCREMENT,
  `Provincia` varchar(50) NOT NULL,
  PRIMARY KEY (`IdProvincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

INSERT INTO Localidad (Localidad, Provincia, IdProvincia)
SELECT	DISTINCT Localidad_Normalizada, Provincia_Normalizada, 0
FROM aux_localidad
ORDER BY Provincia_Normalizada, Localidad_Normalizada;

INSERT INTO provincia (Provincia)
SELECT DISTINCT Provincia_Normalizada
FROM aux_localidad
ORDER BY Provincia_Normalizada;

select * from provincia;
select * from localidad;

UPDATE localidad l
JOIN provincia p ON (l.Provincia = p.Provincia)
SET l.IdProvincia = p.IdProvincia;

UPDATE aux_localidad a
JOIN localidad l ON (l.Localidad = a.Localidad_Normalizada
                AND a.Provincia_Normalizada = l.Provincia)
SET a.IdLocalidad = l.IdLocalidad;

select * from aux_localidad;

ALTER TABLE `cliente` ADD `IdLocalidad` INT NOT NULL DEFAULT '0' AFTER `Localidad`;
ALTER TABLE `proveedor` ADD `IdLocalidad` INT NOT NULL DEFAULT '0' AFTER `Departamento`;
ALTER TABLE `sucursal` ADD `IdLocalidad` INT NOT NULL DEFAULT '0' AFTER `Provincia`;

UPDATE cliente c JOIN aux_localidad a
	ON (c.Provincia = a.Provincia_Original AND c.Localidad = a.Localidad_Original)
SET c.IdLocalidad = a.IdLocalidad;

UPDATE sucursal s JOIN aux_localidad a
	ON (s.Provincia = a.Provincia_Original AND s.Localidad = a.Localidad_Original)
SET s.IdLocalidad = a.IdLocalidad;

UPDATE proveedor p JOIN aux_localidad a
	ON (p.Región = a.Provincia_Original AND p.Ciudad = a.Localidad_Original)
SET p.IdLocalidad = a.IdLocalidad;

select * from cliente;
select * from proveedor;
select * from sucursal;

ALTER TABLE `cliente`
  DROP `Provincia`,
  DROP `Localidad`;
  
ALTER TABLE `proveedor`
  DROP `Ciudad`,
  DROP `Región`,
  DROP `País`,
  DROP `Departamento`;
  
ALTER TABLE `sucursal`
  DROP `Localidad`,
  DROP `Provincia`;
  
ALTER TABLE `localidad`
  DROP `Provincia`;
  
SELECT * FROM `cliente`;
SELECT * FROM `proveedor`;
SELECT * FROM `sucursal`;
SELECT * FROM `localidad`;
SELECT * FROM `provincia`;

select * from cliente;
/*Discretización*/
ALTER TABLE `cliente` ADD `Rango_Etario` VARCHAR(20) NOT NULL DEFAULT '-' AFTER `Edades`;

UPDATE cliente SET Rango_Etario = '1_Hasta 30 años' WHERE Edades <= 30;
UPDATE cliente SET Rango_Etario = '2_De 31 a 40 años' WHERE Edades <= 40 AND Rango_Etario = '-';
UPDATE cliente SET Rango_Etario = '3_De 41 a 50 años' WHERE Edades <= 50 AND Rango_Etario = '-';
UPDATE cliente SET Rango_Etario = '4_De 51 a 60 años' WHERE Edades <= 60 AND Rango_Etario = '-';
UPDATE cliente SET Rango_Etario = '5_Desde 60 años' WHERE Edades > 60 AND Rango_Etario = '-';

select Rango_Etario, count(*)
from cliente
group by Rango_Etario;

SELECT * from venta
UNION ALL
SELECT * from aux_venta;