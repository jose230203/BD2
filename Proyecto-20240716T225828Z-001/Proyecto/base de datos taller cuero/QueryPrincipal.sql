create database TallerCuero_final
go
use TallerCuero_final
go

 -- ✔
create table Cat_Medidas (
	id_unidadMedida int,
	nombreUnidad VARCHAR(100) NOT NULL,
	abreviatura VARCHAR(10),
	unidad int,

	constraint PK_IDUNIDADMEDIDA primary key(id_unidadMedida)
);
go
-- ✔
create table Cat_Colores(
	id_color int,
	color nvarchar(30)
	constraint PK_IDCOLOR primary key(id_color)
)
go
-- ✔
create table Cat_Distritos(
	id_distrito int,
	distrito nvarchar(30),
	abreviatura nvarchar(6),

	constraint PK_IDDISTRITO primary key(id_distrito)
)
go
-- ✔
create table Cat_Paises(
	id_pais int,
	nombre nvarchar(30),
	abreviatura nvarchar(5),
	codigoEntrada nvarchar(5),
	nacionalidad nvarchar(30)

	constraint PK_IDPAIS primary key(id_pais)
);
go
-- ✔
create table Departamentos(
	id_departamento int,
	departamento nvarchar(45),
	abreviatura nvarchar(5),
	pais int,

	constraint PK_IDDEPARTAMENTO primary key(id_departamento),
	constraint FK_IDPAIS_DEPARTAMENTO foreign key(pais) references Cat_Paises(id_pais)
)
go
-- ✔
create table Municipios(
	id_municipio int,
	municipio nvarchar(35),
	abreviatura nvarchar(5),
	departamento int,
	distrito int,

	constraint PK_IDMUNICIPIO primary key(id_municipio),
	constraint FK_IDDISTRITO_MUNICIPIOS foreign key(distrito) references Cat_Distritos(id_distrito),
	constraint FK_IDDEPARTAMENTO_MUNICIPIOS foreign key(departamento) references Departamentos(id_departamento)
)
go
-- ✔
create table Ubicaciones(
	id_ubicacion int,
	direccion nvarchar(50),
	municipio int,
	codigoPostal int,
	calle nvarchar(35),

	constraint FK_IDMUNICIPIO foreign key(municipio) references Municipios(id_municipio),
	constraint PK_IDUBICACION primary key(id_ubicacion)
);
go

/* ===== Empleados =====*/
-- ✔
create table Areas(
	id_area int,
	area nvarchar(30),
	constraint PK_IDAREA primary key(id_area)
)
go
-- ✔
create table Cargos(
	id_cargo int,
	area int,
	cargo varchar(30),
	abreviaturaCargo nvarchar(5),
	descripcion nvarchar(100)

	constraint FK_IDAREA foreign key(area) references Areas(id_area),
	constraint PK_IDCARGO primary key(id_cargo)
);
go
-- ✔
create table Sucursales(
	id_sucursal int,
	nombreSucursal nvarchar(45),
	RUC nvarchar(20),
	FechaConstitucion date,
	ubicacion int,

	constraint FK_IDUBICACION_SUCURSALES foreign key(ubicacion) references Ubicaciones(id_ubicacion),
	constraint PK_IDSUCURSAL primary key(id_sucursal)
)
go
-- ✔
create table Identificaciones(
	id_identificacion int,
	numeroIdentificacion nvarchar(30),
	tipoIdentificacion nvarchar(30),
	fechavencimiento date,

	constraint PK_IDIDENTIFICACION primary key(id_identificacion)
)
go
-- ✔
create table Empleados(
	id_empleado int,
	nombres varchar (20),
	apellidos varchar (15),
	inss varchar(10),	
	identificacion int,
	Genero char(10),

	constraint FK_IDIDENTIFICACION foreign key (identificacion) references Identificaciones(id_identificacion),
	constraint PK_IDEMPLEADO primary key(id_empleado)
);
go
-- ✔
create table Cat_Telefonos(
	id_telefono int,
	numeroArea nvarchar(6),
	numeroTelefonico nvarchar(18),
	tipo nvarchar(45),
	habilitado bit,

	constraint PK_IDTELEFONO primary key(id_telefono),
)
go

create table DetallesEmpleado(
	empleado int,
	estadoCivil nvarchar(20),
	ubicacion int,
	estado bit,
	cargo int,
	sucursal int,
	telefono int,
	correoElectronico nvarchar(25),

	constraint FK_IDTELEFONO_DETALLES foreign key(telefono) references Cat_Telefonos(id_telefono),
	constraint FK_IDSUCURSAL_DETALLES foreign key(sucursal) references Sucursales(id_sucursal),
	constraint FK_IDCARGO_DETALLES foreign key(cargo) references Cargos(id_cargo),
	constraint FK_IDUBICACION_DETALLES foreign key(ubicacion) references Ubicaciones(id_ubicacion),
	constraint FK_IDEMPLEADO_DETALLESEMPLEADO foreign key(empleado) references Empleados(id_empleado)
)
go
-- ✔
create table DetallesSucursales(
	sucursal int,
	horaApertura time,
	horaCierre time,
	encargadoSucursal int,
	Telefono int,

	constraint FK_IDTELEFONO_DETALLESSUCURSAL foreign key(Telefono) references Cat_Telefonos(id_telefono),
	constraint FK_IDEMPLEADO_DETALLESSUCURSAL foreign key(encargadoSucursal) references Empleados(id_empleado),
	constraint FK_IDSUCURSAL_DETALLESSUCURSAL foreign key(sucursal) references Sucursales(id_sucursal)
)
go
-- ✔
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
go
-- ✔
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
go
-- Productos, Producto final y proveedores
-- ✔
create table Cat_Cueros(
	id_cuero int,
	cuero nvarchar(45),
	descripcion  nvarchar(100),

	constraint PK_IDCUERO primary key(id_cuero)
)
-- ✔
create table Categorias(
	id_categoria int,
	categoria int,
	constraint PK_IDCATEGORIA primary key(id_categoria)
)
-- ✔
create table Subcategorias(
	id_subcategoria int,
	subcategoria nvarchar(45),
	categoria int,
	descripcion nvarchar(45),

	constraint PK_IDSUBCATEGORIA primary key(id_subcategoria),
	constraint FK_IDCATEGORIA_SUBCATEGORIA foreign key(categoria) references Categorias(id_categoria)
)
-- ✔
create table Impuestos(
	id_impuesto int,
	impuesto float,
	descripcionImp text,

	constraint PK_IDIMPUESTO primary key(id_impuesto)
)
-- ✔
create table PresentacionProducto(
	id_presentacion int,
	descripcion text,
	abreviatura char(3),
	subcategoria int,

	constraint FK_IDSUBCATEGORIA_Presentacion foreign key(subcategoria) references Subcategorias(id_subcategoria),
	constraint PK_IDPRESENTACION primary key(id_presentacion)
)

-- ✔
create table Productos(
	id_producto int,
	nombre nvarchar(40),
	color int,
	cuero int,
	impuesto int,
	imagenProducto image,


	constraint FK_IDIMPUESTO_PRODUCTO foreign key(impuesto) references Impuestos(id_impuesto),
	constraint FK_IDCUERO_PRODUCTO foreign key(cuero) references Cat_Cueros(id_cuero), 
	constraint FK_IDCOLOR_PRODUCTO foreign key(color) references Cat_Colores(id_color),
	constraint PK_IDPRODUCTO primary key(id_producto)
)

go
-- ✔
create table Precios(
	id_precio int,
	producto int,
	fechaInicio datetime,
	fechaFin datetime,
	precio float,
	tipoMoneda int,

	constraint FK_IDPRODUCTO_PRECIOS foreign key(producto) references Productos(id_producto),
	constraint FK_IDTIPOMONEDA_PRECIOS foreign key(tipoMoneda) references Cat_Monedas(id_moneda),
	constraint PK_IDPRECIO primary key(id_precio)
)
go
-- ✔
create table DetallesProductos(
	producto int,
	precio int,
	dimenciones text,
	presentacion int

	constraint FK_IDPRESENTACION foreign key (presentacion) references PresentacionProducto(id_presentacion),
	constraint FK_IDPRODUCTO foreign key(producto) references Productos(id_producto)
)
-- ✔
go
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

	constraint FK_IDPRODUCTO_PLAN foreign key(producto) references Productos(id_producto),
	constraint FK_IDEMPLEADO_PLAN foreign key(empleado) references Empleados(id_empleado)
)
go

-- ✔
create table Cat_Monedas(
	id_moneda int,
	Abreviatura char(4),
	NombreMoneda nvarchar(35),
	Simbolo char,
	Pais int,
	TipoCambio float,

	constraint PK_IDMONEDA primary key(id_moneda)
)
-- ✔
go
create table Cajas(
	id_caja int,
	nombreCaja nvarchar(45),
	noCaja int,
	Sucursal int,
	tipoCaja nvarchar(35),
	EstadoCaja nvarchar(15),
	ipCaja int,

	constraint PK_IDCAJA primary key(id_caja),
	constraint FK_IDSUCURSAL_CAJAS foreign key(Sucursal) references Sucursales(id_sucursal)
)
go
-- ✔
create table AperturasCajas(
	id_apertura int,
	caja int,
	Empleado int,
	fechaHoraApertura datetime,
	Observaciones text,


	constraint PK_IDAPERTURA primary key(id_apertura),
	constraint FK_IDCAJA_APERTURAS foreign key(Caja) references Cajas(id_caja),
	constraint FK_IDEMPLEADO_APERTURAS foreign key(Empleado) references Empleados(id_empleado)
)

go
-- ✔
create table DetalleAperturaCajas(
	id_Apertura int,
	DineroApertura float,
	TipoMoneda int,
	AprobadoPor nvarchar(35),

	constraint FK_IDAPERTURA_DETALLESAPERTURA foreign key(id_Apertura) references AperturasCajas(id_apertura),
	constraint FK_IDTIPOMONEDA_DETALLESAPERTURA foreign key(TipoMoneda) references Cat_Monedas(id_moneda)
)
go
-- ✔
create table ArqueoCaja(
	id_arqueo int,
	Caja int,
	FechaArqueo datetime,
	TipoArqueo nvarchar(45),

	constraint FK_IDCAJA_ARQUEO foreign key(Caja) references Cajas(id_caja),
	constraint PK_IDARQUEO primary key(id_arqueo)
)
go
-- ✔
create table CierresCajas(
	id_cierre int,
	Caja int,
	fechaCierra datetime,
	Empleado int,
	Observaciones text

	constraint FK_IDEMPLEADO_CIERRES foreign key(Empleado) references(id_cierre),
	constraint FK_IDCAJA_CIERRES foreign key(Caja) references Cajas(id_caja),
	constraint PK_IDCIERRE primary key(id_cierre)
)
go


-- ❌
create table Clientes(
	id_client int,
	Nombre nvarchar(45),

)

create table venta (
	id_venta int,
	Cliente int,
	fechaVenta datetime,
	foreign key (id_cliente) references clientes(id_cliente)
);

-- tabla que guarda los detalles de la venta permitiendo ingresar mas de 1 producto utilizando el id de la venta para ingresar distintos productos
create table detalleventa (
	id_detalle_venta int identity(1,1) primary key,
	id_venta int not null,
	id_producto int not null,
	cantidad_vendida int not null,
	precio_unitario decimal(10, 2) not null,
	total_venta decimal(10, 2) not null,
	foreign key (id_venta) references venta(id_venta),
	foreign key (id_producto) references productos(id_producto)
);