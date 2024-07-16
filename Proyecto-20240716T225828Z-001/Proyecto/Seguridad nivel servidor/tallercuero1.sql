use master
go
drop database tallercuero
go
create database tallercuero
go
use tallercuero
go

create table Cat_Paises(
	id_pais int,
	nombre nvarchar(30),
	abreviatura nvarchar(5),
	codigoEntrada nvarchar(5),
	nacionalidad nvarchar(30)

	constraint PK_IDPAIS primary key(id_pais)
);

create table Departamentos(
	id_departamento int,
	departamento nvarchar(45),
	abreviatura nvarchar(5),
	pais int,

	constraint PK_IDDEPARTAMENTO primary key(id_departamento),
	constraint FK_IDPAIS_DEPARTAMENTO foreign key(pais) references Cat_Paises(id_pais)
)

create table Municipios(
	id_municipio int,
	municipio nvarchar(35),
	abreviatura nvarchar(5),
	departamento int,

	constraint PK_IDMUNICIPIO primary key(id_municipio),
	constraint FK_IDDEPARTAMENTO_MUNICIPIOS foreign key(departamento) references Departamentos(id_departamento)
)

create table Ubicaciones(
	id_ubicacion int,
	direccion nvarchar(50),
	municipio int,
	codigoPostal int,
	calle nvarchar(35),

	constraint FK_IDMUNICIPIO foreign key(municipio) references Municipios(id_municipio),
	constraint PK_IDUBICACION primary key(id_ubicacion)
);


create table Identificaciones(
	id_identificacion int,
	numeroIdentificacion nvarchar(30),
	tipoIdentificacion nvarchar(30),
	fechavencimiento date,

	constraint PK_IDIDENTIFICACION primary key(id_identificacion)
)
--Personas
create table Clientes(
	id_cliente int,
    nombre NVARCHAR(45) NOT NULL,
    apellido NVARCHAR(45) NOT NULL,
    telefono NVARCHAR(20),
    direccion int,

constraint FK_CLIENTES_UBI foreign key (direccion) references Ubicaciones(id_ubicacion),
constraint PK_IDCLIENTE primary key (id_cliente),
)



create table Empleados(
	id_empleado int,
	nombres varchar (20),
	apellidos varchar (15),
	inss varchar(10),	
	identificacion int

	constraint FK_IDIDENTIFICACION foreign key (identificacion) references Identificaciones(id_identificacion),
	constraint PK_IDEMPLEADO primary key(id_empleado)
);

create table Sucursales(
	id_sucursal int,
	nombreSucursal nvarchar(45),
	RUC nvarchar(20),
	FechaConstitucion date,
	ubicacion int,

	constraint FK_IDUBICACION_SUCURSALES foreign key(ubicacion) references Ubicaciones(id_ubicacion),
	constraint PK_IDSUCURSAL primary key(id_sucursal)
)


create table Areas(
	id_area int,
	area nvarchar(30),
	constraint PK_IDAREA primary key(id_area)
)

create table Cargos(
	id_cargo int,
	area int,
	cargo varchar(30),
	abreviaturaCargo nvarchar(5),
	descripcion nvarchar(100)

	constraint FK_IDAREA foreign key(area) references Areas(id_area),
	constraint PK_IDCARGO primary key(id_cargo)
);

create table TelefonosEmpleados(
	id_telefono int,
	numeroArea nvarchar(6),
	estado bit,
	numeroTelefonico nvarchar(18),
	tipo nvarchar(45),

	constraint PK_IDTELEFONO primary key(id_telefono),
)

create table DetallesEmpleado(
	empleado int,
	estadoCivil nvarchar(20),
	ubicacion int,
	estado bit,
	cargo int,
	sucursal int,
	telefono int,
	correoElectronico nvarchar(25),

	constraint FK_IDTELEFONO_DETALLES foreign key(telefono) references TelefonosEmpleados(id_telefono),
	constraint FK_IDSUCURSAL_DETALLES foreign key(sucursal) references Sucursales(id_sucursal),
	constraint FK_IDCARGO_DETALLES foreign key(cargo) references Cargos(id_cargo),
	constraint FK_IDUBICACION_DETALLES foreign key(ubicacion) references Ubicaciones(id_ubicacion),
	constraint FK_IDEMPLEADO_DETALLESEMPLEADO foreign key(empleado) references Empleados(id_empleado)
)

create table DetallesSucursales(
	sucursal int,
	horaApertura time,
	horaCierre time,
	encargado int,

	constraint FK_IDEMPLEADO_DETALLESSUCURSAL foreign key(encargado) references Empleados(id_empleado),
	constraint FK_IDSUCURSAL_DETALLESSUCURSAL foreign key(sucursal) references Sucursales(id_sucursal)
)

create table HistorialCargosEmpleados(
	empleado int,
	cargo int,
	fechaAsignacion datetime,
	fechaRevocacion datetime,
	sucursal int,

	constraint FK_IDSUCUSAL_HISTORIAL foreign key(sucursal) references Sucursales(id_sucursal),
	constraint FK_IDEMPLEADO_HISTORIAL foreign key(empleado) references Empleados(id_empleado),
	constraint FK_IDCARGO_HISTORIAL foreign key(cargo) references Cargos(id_cargo) 
)


create table HistorialEmpleados(
	empleado int,
	sucursal int,
	cargo int,
	fechaRegistro datetime,
	fechaIngreso datetime,
	fechaSalida datetime,

	constraint FK_IDCARGO_HISTORIALEMPLEADO foreign key(cargo) references Cargos(id_cargo),
	constraint FK_IDSUCURSAL_HISTORIALEMPLEADO foreign key(sucursal) references Sucursales(id_sucursal),
	constraint FK_IDEMPLEADOHISTORIALEMPLEADO foreign key(empleado) references Empleados(id_empleado)
)
--Proveedor
 create table Proveedores (
    id_proveedor int primary key,
    nombre nvarchar(50),
	razon_social nvarchar(50),
 );

 create table TelefonosProveedor(
	id_telefono int,
	numeroArea nvarchar(6),
	estado bit,
	numeroTelefonico nvarchar(18),
	tipo nvarchar(45),
	constraint PK_IDTELEFONOProv primary key(id_telefono),
);

create table detalle_proveedor(
	id_prov int,
	telefono int,
	estado bit,
 	Correo nvarchar (50),
 	id_direccion int not null,
   constraint FK_UBI_PROV foreign key (id_direccion) references Ubicaciones(id_ubicacion),
   constraint FK_PROV_DET foreign key (id_prov) references Proveedores(id_proveedor),
   constraint FK_IDTELEFONO_DETALLESProv foreign key(telefono) references TelefonosProveedor(id_telefono),

);

/*== Productos ==*/

create table Cat_Medidas (
	id_unidadMedida int,
	nombreUnidad VARCHAR(100) NOT NULL,
	abreviatura VARCHAR(10),
	unidad int,

	constraint PK_IDUNIDADMEDIDA primary key(id_unidadMedida)
);

create table Cat_Colores(
	id_color int,
	color nvarchar(30)
	constraint PK_IDCOLOR primary key(id_color)
)

create table Cat_Cueros(
	id_cuero int,
	cuero nvarchar(45),
	descripcion  nvarchar(100),

	constraint PK_IDCUERO primary key(id_cuero)
)

create table Categorias(
	id_categoria int,
	categoria int,
	constraint PK_IDCATEGORIA primary key(id_categoria)
)

create table Subcategorias(
	id_subcategoria int,
	subcategoria nvarchar(45),
	categoria int,
	descripcion nvarchar(45),

	constraint PK_IDSUBCATEGORIA primary key(id_subcategoria),
	constraint FK_IDCATEGORIA_SUBCATEGORIA foreign key(categoria) references Categorias(id_categoria)
)

create table Impuestos(
	id_impuesto int,
	impuesto float,
	descripcionImp text,

	constraint PK_IDIMPUESTO primary key(id_impuesto)
)

create table Productos(
	id_producto int,
	nombre nvarchar(40),
	color int,
	categoria int,
	cuero int,

	constraint FK_IDCUERO_PRODUCTO foreign key(cuero) references Cat_Cueros(id_cuero), 
	constraint FK_IDCOLOR_PRODUCTO foreign key(color) references Cat_Colores(id_color),
	constraint FK_IDCATEGORIA_PRODUCTO foreign key(categoria) references Subcategorias(id_subcategoria),
	constraint PK_IDPRODUCTO primary key(id_producto)
)

create table Precios(
	id_precio int,
	fechaInicio datetime,
	fechaFin datetime,
	precio float,
	tipoMoneda nvarchar(10),

	constraint PK_IDPRECIO primary key(id_precio)
)

create table DetallesProductos(
	producto int,
	precio int,
	descripcionprod nvarchar(250),

	constraint FK_IDPRODUCTO foreign key(producto) references Productos(id_producto),
	constraint FK_IDPRECIO foreign key(precio) references Precios(id_precio),
)

--Produccion

create table PlanesProduccionProductos(
	id_planProduccion int,
	Estilo nvarchar(30),
	empleado int,
	unidades int,
	producto int,
	fechaProduccion datetime,
	descripcion nvarchar(100),
	tiempoEstimadoMin time,
	realizado bit,

	constraint PK_IDPLANPROD primary key (id_planProduccion),
	constraint FK_IDPRODUCTO_PLAN foreign key(producto) references Productos(id_producto),
	constraint FK_IDEMPLEADO_PLAN foreign key(empleado) references Empleados(id_empleado)
)
CREATE TABLE Materiales (
    id_material INT PRIMARY KEY,
    nombreMaterial NVARCHAR(100) NOT NULL,
    tipoMaterial NVARCHAR(50) NOT NULL,
    color int,
    unidadMedida int,
	id_cuero int,
    proveedor int,             
    costo int,
    fechaAdquisicion DATE,
    cantidadDisponible DECIMAL(10, 2),
    ubicacionAlmacen NVARCHAR(100),

	constraint FK_Prov_MAT foreign key (proveedor) references Proveedores(id_proveedor),
	constraint FK_Color_Mat foreign key (color) references Cat_Colores(id_color),
	constraint FK_MEDIDA_MAT foreign key (unidadMedida) references Cat_Medidas(id_unidadMedida),
	constraint FK_PRECIO_MAT foreign key (costo) references Precios(id_precio),
	constraint FK_CUERO_MAT foreign KEY (id_cuero) references Cat_Cueros(id_cuero)
);


create table MaterialesUsadosPlanesProduccion(
	planProduccion int,
	material int,
	cantidad int,
	fechaHora datetime,
    CONSTRAINT FK_PlanProduccion FOREIGN KEY (planProduccion) REFERENCES PlanesProduccionProductos(id_planProduccion),
    CONSTRAINT FK_Material FOREIGN KEY (material) REFERENCES Materiales(id_material),
	CONSTRAINT PK_IDmaterialesPLan PRIMARY KEY (planProduccion, material)
);

--Inventario
CREATE TABLE Inventario (
    id_inventario INT PRIMARY KEY,
    id_entidad INT NOT NULL,
    tipo_entidad NVARCHAR(20) NOT NULL,
    cantidad DECIMAL(10, 2) NOT NULL,

    CONSTRAINT FK_Producto_Inventario FOREIGN KEY (id_entidad) REFERENCES Productos(id_producto) ON DELETE CASCADE,
    CONSTRAINT FK_Material_Inventario FOREIGN KEY (id_entidad) REFERENCES Materiales(id_material) ON DELETE CASCADE
);
--VENTAS

create table venta (
	id_venta int primary key,
	Cliente int,
	fechaVenta datetime,
	foreign key (Cliente) references clientes(id_cliente)
);

create table detalleventa (
	id_detalle_venta int identity(1,1) primary key,
	id_venta int not null,
	id_producto int not null,
	Impuesto int,
	cantidad_vendida int not null,
	precio_unitario decimal(10, 2) not null,
	total_venta decimal(10, 2) not null,
	constraint FK_IMPUESTO_DET foreign key (Impuesto) references Impuestos(id_impuesto),
	constraint FK_VENTA_DET foreign key (id_venta) references venta(id_venta),
	constraint FK_VENTA_PROD foreign key (id_producto) references productos(id_producto)
);

--caja
create table Cajas(
	id_caja int,
	noCaja int,

	constraint PK_IDCAJA PRIMARY KEY(id_caja)
)

create table HistorialAperturasCajas(
	id_apertura int,
	caja int,
	emplado int,
	fechaHoraApertura datetime,
	
	constraint PK_IDAPER primary key (id_apertura),
	constraint FK_EMPLEADO_APER foreign key (emplado) references Empleados(id_empleado),
	constraint FK_CAJA_APER foreign key(caja) references Cajas(id_Caja)
)

create table HistorialCierresCajas(
	id_cierre int,
	aperturacaja int,
	FechaHoracierre datetime,

	constraint PK_IDCLOSE primary key (id_cierre),
	constraint FK_APERT_Close foreign key (aperturacaja) references HistorialAperturasCajas(id_apertura)
)

CREATE TABLE Transacciones (
    id_transaccion INT PRIMARY KEY,
    caja INT,
	cliente int,
    tipo_transaccion NVARCHAR(20), -- E.g., 'Venta', 'Devolución', 'Gasto'
    monto DECIMAL(10, 2),
    fechaHoraTransaccion DATETIME,
    descripcion NVARCHAR(255),

	constraint FK_CAJA_CLIENTE foreign key(cliente) references Clientes(id_cliente),
    CONSTRAINT FK_Caja_Transaccion FOREIGN KEY (caja) references Cajas(id_caja)
);


--seguridad

CREATE TABLE Usuarios(
   id_usuario int PRIMARY KEY,
   ip nvarchar(35), 
   NombreUsuario nvarchar(30) NOT NULL,
   Empleado nvarchar(20) NOT NULL, -- Cambiado a nvarchar
   ClaveHash nvarchar(64) NOT NULL,
   Habilitado bit NOT NULL
);

CREATE TABLE HistorialClaves(
   Usuario int,
   ClaveHash nvarchar(64),
   ultimaFechaModificacion datetime NOT NULL,
   FOREIGN KEY (Usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE GruposUsuarios(
   id_grupo int PRIMARY KEY,
   NombreGrupo nvarchar(50) NOT NULL
);

CREATE TABLE UsuariosGrupos(
   id_usuario int,
   id_grupo int,
   PRIMARY KEY(id_usuario, id_grupo),
   FOREIGN KEY(id_usuario) REFERENCES Usuarios(id_usuario),
   FOREIGN KEY(id_grupo) REFERENCES GruposUsuarios(id_grupo)
);

CREATE TABLE Cat_TipoConexiones(
   id_tipoConexion int PRIMARY KEY,
   tipoConexion nvarchar(30) NOT NULL,
   ipLocal nvarchar(15) NOT NULL,
   Pais char(4) NOT NULL
);

CREATE TABLE Conexiones(
   id_conexion int PRIMARY KEY,
   TipoConexion int NOT NULL,
   NombreHost nvarchar(15) NOT NULL,
   EstadoConexion bit DEFAULT 1,
   FechaHoraInicio datetime DEFAULT GETDATE(), -- Añadido
   FechaHoraFin datetime, -- Añadido
   FOREIGN KEY (TipoConexion) REFERENCES Cat_TipoConexiones(id_tipoConexion)
);

CREATE TABLE HistorialSesiones(
   id_historial int PRIMARY KEY,
   id_Session int,
   Usuario int,
   FechaInicio datetime NOT NULL,
   FechaSalida datetime,
   IPOrigen nvarchar(45),
   Resultado nvarchar(20),
   FOREIGN KEY (id_Session) REFERENCES Conexiones(id_conexion), -- Corregido
   FOREIGN KEY (Usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE TablaControlSessiones(
   id_sesiones int PRIMARY KEY,
   Usuario int NOT NULL,
   FechaInicio datetime NOT NULL,
   FechaSalida datetime,
   Conexion int NOT NULL,
   FOREIGN KEY (Conexion) REFERENCES Conexiones(id_conexion),
   FOREIGN KEY (Usuario) REFERENCES Usuarios(id_usuario)
);

create table ListaBlanca(
	id_ip int,
	usuario int,
	habilitada bit,

	constraint PK_IDIP primary key(id_ip),
	constraint FK_IP_USER foreign key(usuario) references Usuarios(id_usuario),
)

CREATE INDEX idx_NombreUsuario ON Usuarios (NombreUsuario);
CREATE INDEX idx_Usuario ON HistorialClaves (Usuario);
CREATE INDEX idx_Usuario_TablaControl ON TablaControlSessiones (Usuario);
CREATE INDEX idx_TipoConexion ON Conexiones (TipoConexion);

