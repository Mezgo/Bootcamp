use Repaso;


#################---------------------------------------#################
#################------------CREACION TABLAS------------#################
#################---------------------------------------#################

CREATE TABLE canal_venta (
	Codigo			int not null auto_increment primary key,
    Canal 			varchar(50) not null
);

DROP TABLE IF EXISTS cliente;
CREATE TABLE IF NOT EXISTS cliente (
	ID					INTEGER,
	Provincia			VARCHAR(50),
	Nombre_y_Apellido	VARCHAR(80),
	Domicilio			VARCHAR(150),
	Telefono			VARCHAR(30),
	Edad				VARCHAR(5),
	Localidad			VARCHAR(80),
	X					VARCHAR(30),
	Y					VARCHAR(30),
	col10				VARCHAR(1)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

DROP TABLE IF EXISTS compra;
CREATE TABLE IF NOT EXISTS compra (
  IdCompra				INTEGER,
  Fecha 				DATE,
  IdProducto			INTEGER,
  Cantidad				INTEGER,
  Precio				DECIMAL(10,2),
  IdProveedor			INTEGER
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

DROP TABLE IF EXISTS empleado;
CREATE TABLE IF NOT EXISTS empleado (
	IDEmpleado					INTEGER,
	Apellido					VARCHAR(100),
	Nombre						VARCHAR(100),
	Sucursal					VARCHAR(50),
	Sector						VARCHAR(50),
	Cargo						VARCHAR(50),
	Salario2					VARCHAR(30)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

DROP TABLE IF EXISTS gasto;
CREATE TABLE IF NOT EXISTS gasto (
  	IdGasto 			INTEGER,
  	IdSucursal 			INTEGER,
  	IdTipoGasto 		INTEGER,
    Fecha				DATE,
  	Monto 				DECIMAL(10,2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

DROP TABLE IF EXISTS producto;
CREATE TABLE IF NOT EXISTS producto (
	IDProducto					INTEGER,
	Concepto					VARCHAR(100),
	Tipo						VARCHAR(50),
	Precio2						VARCHAR(30)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

DROP TABLE IF EXISTS proveedor;
CREATE TABLE IF NOT EXISTS proveedor (
	IDProveedor		INTEGER,
	Nombre			VARCHAR(80),
	Domicilio		VARCHAR(150),
	Ciudad			VARCHAR(80),
	Provincia		VARCHAR(50),
	Pais			VARCHAR(20),
	Departamento	VARCHAR(80)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

DROP TABLE IF EXISTS sucursal;
CREATE TABLE IF NOT EXISTS sucursal (
	ID			INTEGER,
	Sucursal	VARCHAR(40),
	Domicilio	VARCHAR(150),
	Localidad	VARCHAR(80),
	Provincia	VARCHAR(50),
	Latitud2	VARCHAR(30),
	Longitud2	VARCHAR(30)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

DROP TABLE IF EXISTS tipo_gasto;
CREATE TABLE IF NOT EXISTS tipo_gasto (
  IdTipoGasto 			int(11) NOT NULL AUTO_INCREMENT,
  Descripcion 			varchar(100) NOT NULL,
  Monto_Aproximado 		DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (IdTipoGasto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;

DROP TABLE IF EXISTS venta;
CREATE TABLE IF NOT EXISTS venta (
  IdVenta				INTEGER,
  Fecha					DATE NOT NULL,
  Fecha_Entrega 		DATE NOT NULL,
  IdCanal				INTEGER, 
  IdCliente				INTEGER, 
  IdSucursal			INTEGER,
  IdEmpleado			INTEGER,
  IdProducto			INTEGER,
  Precio				VARCHAR(30),
  Cantidad				VARCHAR(30)
  -- Precio			DECIMAL(10,2),
  -- Cantidad`		INTEGER
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;