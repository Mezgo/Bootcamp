use henry_m3;

drop table if exists fact_venta;
DROP TABLE IF EXISTS factVentaAudit;
drop table total_registros_fact_venta;
DROP TABLE Registros_diarios;
DROP TABLE fact_venta_cambios;

#####################-----TABLAS-----########################
CREATE TABLE IF NOT EXISTS `fact_venta` (
  `IdVenta`				INTEGER,
  `Fecha` 				DATE NOT NULL,
  `Fecha_Entrega` 		DATE NOT NULL,
  `IdCanal`				INTEGER, 
  `IdCliente`			INTEGER, 
  `IdEmpleado`			INTEGER,
  `IdProducto`			INTEGER,
  `Precio`				DECIMAL(15,2),
  `Cantidad`			INTEGER
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

ALTER TABLE `fact_venta` ADD PRIMARY KEY(`IdVenta`);
ALTER TABLE `fact_venta` ADD INDEX(`IdProducto`);
ALTER TABLE `fact_venta` ADD INDEX(`IdEmpleado`);
ALTER TABLE `fact_venta` ADD INDEX(`Fecha`);
ALTER TABLE `fact_venta` ADD INDEX(`Fecha_Entrega`);
ALTER TABLE `fact_venta` ADD INDEX(`IdCliente`);
ALTER TABLE `fact_venta` ADD INDEX(`IdCanal`);



CREATE TABLE IF NOT EXISTS `factVentaAudit` (
	IdFactVentaAuditoria INT NOT NULL AUTO_INCREMENT,
    `Fecha`				DATE,
	`Fecha_Entrega`		DATE,
  	`IdCanal` 			INTEGER,
  	`IdCliente` 		INTEGER,
  	`IdEmpleado` 		INTEGER,
  	`IdProducto` 		INTEGER,
    `usuario` 			VARCHAR(30),
    `fechaModificacion` 	DATETIME,
    PRIMARY KEY(IdFactVentaAuditoria)
);

CREATE TABLE total_registros_fact_venta(
	idRegistro int not null auto_increment primary key,
    cantidad int not null,
    usuario varchar(20),
    fechaHora datetime
);

CREATE TABLE Registros_diarios(
	idRegistroDiario 	int auto_increment not null primary key,
    lugarCambio 		varchar(15) not null,
    fechaHora			datetime not null,
    cantidadRegistros	int not null,
    usuario				varchar(20)
);

CREATE TABLE fact_venta_cambios(
	idFactVentaCambio 		int not null auto_increment primary key,
    fecha					date,
    idCliente				int not null,
    idProducto				int not null,
    precio					decimal(15,3),
    cantidad				int not null,
    usuario					varchar(25),
    fechaModificacion		datetime not null
);


#####################-----TRIGGERS-----########################
-- drop trigger factVentaAudit;
create TRIGGER factVentaAudit after insert on fact_venta
for each row
insert into factVentaAudit (
		Fecha, 
        Fecha_Entrega, 
        IdCanal, 
        IdCliente, 
        IdEmpleado, 
        IdProducto, 
        usuario, 
        fechaModificacion)
values (
		NEW.Fecha, 
        NEW.Fecha_Entrega, 
        NEW.IdCanal, 
        NEW.IdCliente, 
        NEW.IdEmpleado,
		NEW.IdProducto, 
        current_user(), 
        NOW()
        );


-- drop trigger registros;
create trigger registros after insert on fact_venta
for each row
insert into total_registros_fact_venta (cantidad, usuario, fechaHora)
values (
	(select count(*)
		from fact_venta
	),
	current_user(),
    now());

-- drop trigger control_actualizacion;
CREATE TRIGGER control_actualizacion after update on fact_venta
for each row
insert into fact_venta_cambios (
	fecha,
    idCliente,
    idProducto,
    precio,
    cantidad,
    usuario,
    fechaModificacion
)
values(
	old.fecha,
    old.idcliente,
    old.idProducto,
    old.precio,
    old.cantidad,
    current_user(),
    now()
);

#####################-----INSERCIONES-----########################
truncate table fact_venta;
insert into fact_venta 
select IdVenta, Fecha, Fecha_Entrega, IdCanal, IdCliente, IdEmpleado, IdProducto, Precio, Cantidad
from venta
limit 30;

INSERT INTO Registros_diarios (lugarCambio, fechaHora, cantidadRegistros)
SELECT 'venta', NOW(), COUNT(*) 
FROM venta;

UPDATE fact_venta
SET Cantidad = 2
WHERE IdVenta = 2;