use master
go
drop database tallercuero
go
create database tallercuero
go
use tallercuero
go

create table Cat_Medidas (
	id_unidadMedida int,
	nombreUnidad VARCHAR(100) NOT NULL,
	abreviatura VARCHAR(10),
	unidad float,

	constraint PK_IDUNIDADMEDIDA primary key(id_unidadMedida)
);

create table Cat_Colores(
	id_color int,
	color nvarchar(30)
	constraint PK_IDCOLOR primary key(id_color)
)

create table Cat_Distritos(
	id_distrito int,
	distrito nvarchar(30),
	abreviatura nvarchar(6),

	constraint PK_IDDISTRITO primary key(id_distrito)
)

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

create table Sucursales(
	id_sucursal int,
	nombreSucursal nvarchar(45),
	RUC nvarchar(20),
	FechaConstitucion date,
	ubicacion int,

	constraint FK_IDUBICACION_SUCURSALES foreign key(ubicacion) references Ubicaciones(id_ubicacion),
	constraint PK_IDSUCURSAL primary key(id_sucursal)
)

create table Identificaciones(
	id_identificacion int,
	numeroIdentificacion nvarchar(30),
	tipoIdentificacion nvarchar(30),
	fechavencimiento date,

	constraint PK_IDIDENTIFICACION primary key(id_identificacion)
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

/*== Productos ==*/

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
	producto int,
	fechaInicio datetime,
	fechaFin datetime,
	precio float,
	tipoMoneda nvarchar(10),

	constraint PK_IDPRECIO primary key(id_precio)
)

create table DetallesProductos(
	producto int,
	precio int,
	

	constraint FK_IDPRODUCTO foreign key(producto) references Productos(id_producto)
)

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


create table Inventario(
	id_inventario int,
	producto int,

	constraint PK_IDINVENTARIO primary key(id_inventario)
)

-- Seguridad --

create table ListaBlanca(
	id_ip int,
	ip nvarchar(35),
	habilitada bit,

	constraint PK_IDIP primary key(id_ip)
)

create table Roles(
	id_rol int,
	rol nvarchar(35),
	habilitado bit,

	constraint PK_IDROL primary key(id_rol)
)

create table Usuarios(
	id_usuario int,
	nombreUsuario nvarchar(15),
	contraseña nvarchar(60),
	rol int,
	habilidato bit,

	constraint PK_IDUSUARIO primary key(id_usuario),
	constraint FK_IDROL_USUARIOS foreign key(rol) references Roles(id_rol)
)

create table Cajas(
	id_caja int,
	noCaja int,
	ip int,
)

create table HistorialAperturasCajas(
	caja int,
	emplado int,
	fechaHoraApertura datetime,

)

create table HistorialCierresCajas(
	caja int

)

create table Transacciones(
	id_transaccion int,

);


create table MaterialesUsadosPlanesProduccion(
	planProduccion int,
	material int,
	cuero int,
	cantidad int,
	fechaHora datetime,
)


create table Clientes(
	id_cliente int primary key,
	Nombre nvarchar(45),
)
drop table Clientes

create table venta (
	id_venta int primary key,
	Cliente int,
	fechaVenta datetime,
	foreign key (Cliente) references Clientes(id_cliente)
);
drop table venta

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

-- create table tiempo_estimado(
--     id_producto int,
--     id_area int,
--     tiempo float not null,
--     foreign key(id_producto) references productos(id_producto),
--     foreign key (id_area) references areas(id_area),
--     primary key (id_producto, id_area)
-- );


-- -- crea la tabla "product_inventory" para gestionar el inventario de productos
-- create table product_inventory(
--     product_id int primary key,
--     cant int not null,
--    foreign key (product_id) references productos(id_producto)
-- );

-- -- tabla de control de productos
-- create table control_productos (
--     id_control int primary key,
--     id_producto int not null,
--     tipo_movimiento varchar(20) not null, -- entrada o salida
--     cantidad int not null,
--     fecha_movimiento date not null,
--     foreign key (id_producto) references productos(id_producto)
-- );

-- create table disponibilidad_producto (
--     id_producto int primary key,
--     cantidad_disponible int not null,
--     foreign key (id_producto) references productos(id_producto)
-- );

-- -- tabla de existencia del producto
-- create table existencia_producto (
--     id_existencia int primary key,
--     id_producto int not null,
--     id_disp int not null,
--     cantidad_total int not null,
--     fecha_registro date not null,
--     foreign key (id_disp) references disponibilidad_producto(id_producto),
--     foreign key (id_producto) references productos(id_producto)
-- );

-- -- crea la tabla "gastos" para registrar los gastos
-- create table gastos (
--     id_gasto int identity(1,1) primary key,
--     nombre varchar(30) not null,
--     cantidad float not null
-- );

-- -- crea la tabla "clientes" para gestionar la información de los clientes
-- create table clientes (
--     id_cliente int primary key,
--     id_persona int,
-- 	id_direccion int,
-- 	Correo varchar (30),
-- 	foreign key(id_direccion) references direcciones(id_direccion),
--     foreign key (id_persona) references personas(num_persona)
-- );

-- -- creación de la tabla para enviar la cantidad de salario a la tabla gasto
-- create table salario (
-- 	id_salario int primary key,
-- 	salario decimal(10,2),
-- 	id_empleado int,
-- 	id_gasto int,
-- 	foreign key (id_empleado) references empleado(id_empleado),
-- 	foreign key (id_gasto) references gastos(id_gasto)
-- );

-- -- crea la tabla "venta" para registrar las ventas esta registra unicamente la fecha de venta para crear una llave a esta venta en especifico y la tabla detalles de venta guarda los detalles especificos

-- -- gestión de proveedores
-- create table proveedores (
--     id_proveedor int primary key,
--     nombre varchar(100),
-- 	Correo varchar (30),   
--     terminos_pago varchar(50),
-- 	id_direccion int not null,
--     foreign key (id_direccion) references direcciones (id_direccion),
-- );

-- create table costoM (
-- 	id_costo int primary key,
-- 	id_material int,
-- 	id_provedor int,
-- 	cantidad float, 
-- 	foreign key (id_material) references materiales(id_material),
-- 	foreign key (id_provedor) references proveedores(id_proveedor)
-- );

-- -- pedidos de materiales
-- create table pedidosmateriales (
--     id_pedido int primary key,
--     id_material int,
--     id_proveedor int,
--     fecha_pedido date,
--     fecha_entrega_esperada date,
--     cantidad_solicitada int,
--     estado_pedido varchar(20),
--     foreign key (id_material) references materiales(id_material),
-- 	foreign key (id_proveedor) references proveedores(id_proveedor)
-- );

-- -- registro de producción
-- create table registroproduccion (
--     id_registro int primary key,
-- 	id_producto int,
--     fecha date,
--     cantidad_productos_fabricados int,
-- 	tiempo_estimado_producto float,
--     empleado_id int,
--     observaciones text,
-- 	constraint fk_registroproduccion_productos foreign key (id_producto) references productos(id_producto),
--     foreign key (empleado_id) references empleado(id_empleado)
-- );

-- --Tabla para controlar el registro de produccion para ingresar los distintos empleados y las areas por las que pase el producto


-- create table asignacion_empleado_produccion (
--     id_asignacion int primary key,
--     id_registro int,
--     empleado_id int,
-- 	foreign key (id_area) references areas(id_area),
--     foreign key (id_registro) references registroproduccion(id_registro),
--     constraint fk_asignacion_empleado_produccion_empleado foreign key (empleado_id) references empleado(id_empleado)
-- );

-- -- registro de ventas por producto
-- create table ventasporproducto (
-- 	id_venta_producto int primary key,
-- 	id_producto int,
-- 	fecha_venta date,
-- 	cantidad_vendida int,
-- 	precio_unitario decimal(10, 2),
-- 	total_venta decimal(10, 2),
-- 	foreign key (id_producto) references productos(id_producto)
-- );

-- -- registro de mantenimiento de equipos
-- create table mantenimientoequipos (
-- 	id_mantenimiento int primary key,
-- 	id_gastos int,
-- 	equipo varchar(100),
-- 	fecha_mantenimiento date,
-- 	descripcion text,
-- 	costo_mantenimiento decimal(10, 2),
-- 	foreign key (id_gastos) references gastos(id_gasto)
-- );

-- -- registro de devoluciones
-- create table devoluciones (
--     id_devolucion int primary key,
--     id_venta int,
--     motivo text,
--     producto_devuelto int,
--     cantidad_devuelta int,
--     foreign key (id_venta) references venta(id_venta),
--     foreign key (producto_devuelto) references productos(id_producto)
-- );

-- -- gestión de proyectos especiales
-- create table proyectosespeciales (
--     id_proyecto int primary key,
--     id_cliente int,
--     descripcion text,
--     fecha_inicio date,
--     fecha_fin date,
--     estado_proyecto varchar(20),
--     foreign key (id_cliente) references clientes(id_cliente)
-- );

-- -- crea la tabla "telefonos_empleado" para almacenar los números de teléfono de los empleados
-- /*create table telefonos_empleado (
--     id_telefono int identity(1,1) primary key,
--     id_empleado int not null,
--     numero_telefono varchar(15) not null,
--     foreign key (id_empleado) references empleado(id_empleado)
-- );

-- -- crea la tabla "telefonos_cliente" para almacenar los números de teléfono de los clientes
-- create table telefonos_cliente (
--     id_telefono int identity(1,1) primary key,
--     id_cliente int not null,
--     numero_telefono varchar(15) not null,
--     foreign key (id_cliente) references clientes(id_cliente)
-- );

-- -- crea la tabla "telefonos_proveedor" para almacenar los números de teléfono de los proveedores
-- create table telefonos_proveedor (
--     id_telefono int identity(1,1) primary key,
--     id_proveedor int not null,
--     numero_telefono varchar(15) not null,
--     foreign key (id_proveedor) references proveedores(id_proveedor)
-- );
-- */

-- -- gestión de patrones y diseños
-- create table patronesdisenos (
--     id_patron int primary key,
--     nombre varchar(100),
--     descripcion text,
--     fecha_creacion date,
-- 	id_producto int,
-- 	foreign key (id_producto) references productos(id_producto)
-- );
