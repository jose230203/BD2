-- Creación de la base de datos y cambio de uso
use master;
go
drop database TallerCuero_final;
go
create database TallerCuero_final;
go
use TallerCuero_final;
go

--*
create table Cat_Paises(
    id_pais int,
    nombre nvarchar(30),
    abreviatura nvarchar(5),
    codigoEntrada nvarchar(5),
    nacionalidad nvarchar(30),
    constraint PK_IDPAIS primary key(id_pais)
);
--*
create table Departamentos(
    id_departamento int,
    departamento nvarchar(45),
    abreviatura nvarchar(5),
    pais int,
    constraint PK_IDDEPARTAMENTO primary key(id_departamento),
    constraint FK_IDPAIS_DEPARTAMENTO foreign key(pais) references Cat_Paises(id_pais)
);
--*
create table Municipios(
    id_municipio int,
    municipio nvarchar(35),
    abreviatura nvarchar(5),
    departamento int,
    constraint PK_IDMUNICIPIO primary key(id_municipio),
    constraint FK_IDDEPARTAMENTO_MUNICIPIOS foreign key(departamento) references Departamentos(id_departamento)
);
--*
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
);

create table Cargos(
    id_cargo int,
    area int,
    cargo varchar(30),
    abreviaturaCargo nvarchar(5),
    descripcion nvarchar(100),
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
);

create table Cat_TipoIdentificaciones(
    id_tipoIdentificacion int,
    tipoID nvarchar(30) NOT NULL,
    constraint PK_TipoIdentificacion primary key(id_tipoIdentificacion)
);

create table Identificaciones(
    id_identificacion int,
    numeroIdentificacion nvarchar(30),
    tipoIdentificacion int,
    fechavencimiento date,
    constraint PK_IDIDENTIFICACION primary key(id_identificacion),
	constraint FK_TIP_ID foreign key (tipoIdentificacion) references Cat_TipoIdentificaciones(id_tipoIdentificacion),
);

create table Cat_Generos(
    id_genero int,
    genero nvarchar(10) NOT NULL,
    constraint PK_Genero primary key(id_genero)
);
create table Empleados(
    id_empleado int,
    nombres varchar(20),
    apellidos varchar(15),
    inss varchar(10),
    identificacion int,
    genero int,
    constraint FK_IDIDENTIFICACION foreign key (identificacion) references Identificaciones(id_identificacion),
    constraint FK_Genero foreign key (genero) references Cat_Generos(id_genero),
    constraint PK_IDEMPLEADO primary key(id_empleado)
);


create table Cat_Telefonos(
    id_telefono int,
    numeroArea nvarchar(6),
    numeroTelefonico nvarchar(18),
    tipo nvarchar(45),
    habilitado bit,
    constraint PK_IDTELEFONO primary key(id_telefono)
);

create table Empleados_Telefonos(
    id_empleado int,
    id_telefono int,
    constraint FK_Empleado foreign key(id_empleado) references Empleados(id_empleado),
    constraint FK_Telefono foreign key(id_telefono) references Cat_Telefonos(id_telefono),
    primary key (id_empleado, id_telefono)
);

create table DetallesEmpleado(
    empleado int,
    estadoCivil nvarchar(20),
    ubicacion int,
    estado bit,
    cargo int,
    sucursal int,
    correoElectronico nvarchar(45),
    constraint FK_IDSUCURSAL_DETALLES foreign key(sucursal) references Sucursales(id_sucursal),
    constraint FK_IDCARGO_DETALLES foreign key(cargo) references Cargos(id_cargo),
    constraint FK_IDUBICACION_DETALLES foreign key(ubicacion) references Ubicaciones(id_ubicacion),
    constraint FK_IDEMPLEADO_DETALLESEMPLEADO foreign key(empleado) references Empleados(id_empleado)
);

create table DetallesSucursales(
    sucursal int,
    horaApertura time,
    horaCierre time,
    encargadoSucursal int,
    Telefono int,
    constraint FK_IDTELEFONO_DETALLESSUCURSAL foreign key(Telefono) references Cat_Telefonos(id_telefono),
    constraint FK_IDEMPLEADO_DETALLESSUCURSAL foreign key(encargadoSucursal) references Empleados(id_empleado),
    constraint FK_IDSUCURSAL_DETALLESSUCURSAL foreign key(sucursal) references Sucursales(id_sucursal)
);

create table HistorialCargosEmpleados(
    empleado int,
    cargo int,
    fechaAsignacion datetime,
    fechaRevocacion datetime,
    sucursal int,
    constraint FK_IDSUCUSAL_HISTORIAL foreign key(sucursal) references Sucursales(id_sucursal),
    constraint FK_IDEMPLEADO_HISTORIAL foreign key(empleado) references Empleados(id_empleado),
    constraint FK_IDCARGO_HISTORIAL foreign key(cargo) references Cargos(id_cargo) 
);

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
);

--producto
create table Cat_Medidas (
    id_unidadMedida int,
    nombreUnidad VARCHAR(100) NOT NULL,
    abreviatura VARCHAR(10),
    unidad float,
    constraint PK_IDUNIDADMEDIDA primary key(id_unidadMedida)
);
--**
create table Cat_Colores(
    id_color int,
    color nvarchar(30),
    constraint PK_IDCOLOR primary key(id_color)
);


create table Cat_Cueros(
    id_cuero int,
    cuero nvarchar(45),
    descripcion  nvarchar(100),
    constraint PK_IDCUERO primary key(id_cuero)
);

create table Categorias(
    id_categoria int,
    categoria int,
    constraint PK_IDCATEGORIA primary key(id_categoria)
);

create table Subcategorias(
    id_subcategoria int,
    subcategoria nvarchar(45),
    categoria int,
    descripcion nvarchar(45),
    constraint PK_IDSUBCATEGORIA primary key(id_subcategoria),
    constraint FK_IDCATEGORIA_SUBCATEGORIA foreign key(categoria) references Categorias(id_categoria)
);

create table Impuestos(
    id_impuesto int,
    impuesto float,
    descripcionImp text,
    constraint PK_IDIMPUESTO primary key(id_impuesto)
);

create table PresentacionProducto(
    id_presentacion int,
    descripcion text,
    abreviatura char(3),
    subcategoria int,
    constraint FK_IDSUBCATEGORIA_Presentacion foreign key(subcategoria) references Subcategorias(id_subcategoria),
    constraint PK_IDPRESENTACION primary key(id_presentacion)
);

create table Productos(
    id_producto int,
    nombre nvarchar(40),
    color int,
    cuero int,
    imagenProducto image,
    constraint FK_IDCUERO_PRODUCTO foreign key(cuero) references Cat_Cueros(id_cuero), 
    constraint FK_IDCOLOR_PRODUCTO foreign key(color) references Cat_Colores(id_color),
    constraint PK_IDPRODUCTO primary key(id_producto)
);
create table Cat_Monedas(
    id_moneda int,
    Abreviatura char(4),
    NombreMoneda nvarchar(35),
    Simbolo nvarchar(5),
    Pais int,
    TipoCambio float,
    constraint PK_IDMONEDA primary key(id_moneda)
);

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
);

create table DetallesProductos(
    producto int,
    precio int,
    dimensiones text,
    presentacion int,
    constraint FK_IDPRESENTACION foreign key (presentacion) references PresentacionProducto(id_presentacion),
    constraint FK_IDPRODUCTO_DETALLES foreign key(producto) references Productos(id_producto)
);

--Proveedor
 create table Proveedores (
    id_proveedor int primary key,
    nombre nvarchar(50),
	razon_social nvarchar(50),
 );

create table detalle_proveedor(
	id_prov int,
	telefono int,
	estado bit,
 	Correo nvarchar (50),
 	id_direccion int not null,
   constraint FK_UBI_PROV foreign key (id_direccion) references Ubicaciones(id_ubicacion),
   constraint FK_PROV_DET foreign key (id_prov) references Proveedores(id_proveedor),
   constraint FK_IDTELEFONO_DETALLESProv foreign key(telefono) references Cat_Telefonos(id_telefono),

);
--Cliente

CREATE TABLE Clientes (
    id_cliente INT,
    nombre NVARCHAR(45) NOT NULL,
    apellido NVARCHAR(45) NOT NULL,

	constraint PK_CLIENTE primary key (id_cliente),
);

CREATE TABLE Detalle_Cliente (
    id_detalle_cliente INT PRIMARY KEY,
    id_cliente INT NOT NULL,
    fecha_ultimo_contacto DATE,
	Telefono int,
    estado_cliente nvarchar(20),
	direccion int,
    talla_zapatos int,
	medida_talla float,
    talla_faldas int,
	medida_faldas float,

	constraint FK_CATMED_DETCLI_FAL foreign key (talla_faldas) references Cat_Medidas(id_unidadMedida),
	constraint FK_CATMED_DETCLI_ZAP foreign key (talla_zapatos) references Cat_Medidas(id_unidadMedida),
	CONSTRAINT FK_TELEFONO_CLIENTE FOREIGN KEY (Telefono) REFERENCES Cat_Telefonos(id_telefono),
    CONSTRAINT FK_DETALLE_CLIENTE FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
	constraint FK_CLIENTES_UBI foreign key (direccion) references Ubicaciones(id_ubicacion),

);

create table Favoritos
(
	cliente int,
	producto int,

	constraint FK_CLIENTE_FAV foreign key(cliente) references Clientes(id_cliente),
	constraint FK_PROD_FAV foreign key (producto) references Productos(id_producto),
);

--produccion
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
);

CREATE TABLE Materiales (
    id_material INT PRIMARY KEY,
    nombreMaterial NVARCHAR(100) NOT NULL,
    tipoMaterial NVARCHAR(50) NOT NULL,
    color int,
    unidadMedida int,
	id_cuero int,
    proveedor int,             
    costo int,
    fechaAdquisicion Datetime,
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

--ventas

create table venta (
	id_venta int,
	Cliente int,
	fechaVenta datetime,
	subtotal DECIMAL(10, 2),
	constraint FK_VENTA_CLIENTE foreign key (Cliente) references clientes(id_cliente),
	constraint PK_VENTA primary key(id_venta),
);

create table detalleventa (
	id_venta int not null,
	id_producto int not null,
	Tipo_Mon int,
	cantidad_vendida int not null,
    precio_unitario DECIMAL(10, 2) NOT NULL,
   
	CONSTRAINT FK_MON_DETV FOREIGN KEY (Tipo_Mon) references Cat_Monedas(id_moneda),
	
	constraint FK_VENTA_DET foreign key (id_venta) references venta(id_venta),
	constraint FK_VENTA_PROD foreign key (id_producto) references productos(id_producto)
);

create table controlPago (
id_controlPago int not null,
id_venta int not null,
Impuesto int,
total float,
constraint PK_CONTROLPAGO primary key (id_controlPago),
constraint FK_VENTA_CONT foreign key (id_venta) references venta(id_venta),
constraint FK_IMPUESTO_CONT foreign key (Impuesto) references Impuestos(id_impuesto),

);

create table Cajas(
    id_caja int,
    nombreCaja nvarchar(45),
    noCaja int,
    Sucursal int,
    tipoCaja nvarchar(35),
    EstadoCaja nvarchar(15),
    constraint PK_IDCAJA primary key(id_caja),
    constraint FK_IDSUCURSAL_CAJAS foreign key(Sucursal) references Sucursales(id_sucursal)
);

create table AperturasCajas(
    id_apertura int,
    caja int,
    Empleado int,
    fechaHoraApertura datetime,
    Observaciones text,
    constraint PK_IDAPERTURA primary key(id_apertura),
    constraint FK_IDCAJA_APERTURAS foreign key(Caja) references Cajas(id_caja),
    constraint FK_IDEMPLEADO_APERTURAS foreign key(Empleado) references Empleados(id_empleado)
);

create table DetalleAperturaCajas(
    id_Apertura int,
    DineroApertura float,
    TipoMoneda int,
    AprobadoPor nvarchar(35),
    constraint FK_IDAPERTURA_DETALLESAPERTURA foreign key(id_Apertura) references AperturasCajas(id_apertura),
    constraint FK_IDTIPOMONEDA_DETALLESAPERTURA foreign key(TipoMoneda) references Cat_Monedas(id_moneda)
);

create table ArqueoCaja(
    id_arqueo int,
    Caja int,
    FechaArqueo datetime,
    TipoArqueo nvarchar(45),
    constraint FK_IDCAJA_ARQUEO foreign key(Caja) references Cajas(id_caja),
    constraint PK_IDARQUEO primary key(id_arqueo)
);

create table CierresCajas(
    id_cierre int,
    Caja int,
    fechaCierra datetime,
    Empleado int,
    Observaciones text,
    constraint FK_IDEMPLEADO_CIERRES foreign key(Empleado) references Empleados(id_empleado),
    constraint FK_IDCAJA_CIERRES foreign key(Caja) references Cajas(id_caja),
    constraint PK_IDCIERRE primary key(id_cierre)
);

CREATE TABLE Transacciones (
    id_transaccion INT PRIMARY KEY,
    caja INT,
	cliente int,
    tipo_transaccion NVARCHAR(20),
    id_Venta int,
    fechaHoraTransaccion DATETIME,
    descripcion NVARCHAR(255),
	constraint FK_CAJA_VENTA foreign key(id_Venta) references venta(id_venta),
	constraint FK_CAJA_CLIENTE foreign key(cliente) references Clientes(id_cliente),
    CONSTRAINT FK_Caja_Transaccion FOREIGN KEY (caja) references Cajas(id_caja)
);
--seguridad

CREATE TABLE Usuarios(
   id_usuario int PRIMARY KEY,
   ip nvarchar(35), 
   NombreUsuario nvarchar(30) NOT NULL,
   Empleado int NOT NULL,
   ClaveHash nvarchar(64) NOT NULL,
   Habilitado bit NOT NULL,

   constraint FK_USUARIO_EMPLEADO foreign key(Empleado) references Empleados(id_empleado),
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
   FechaHoraInicio datetime DEFAULT GETDATE(), 
   FechaHoraFin datetime,
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
   FOREIGN KEY (id_Session) REFERENCES Conexiones(id_conexion),
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

create index IDX_Pais_Nombre on Cat_Paises(nombre);
create index IDX_Departamento_Departamento on Departamentos(departamento);
create index IDX_Municipio_Municipio on Municipios(municipio);
create index IDX_Area_Area on Areas(area);
create index IDX_Cargo_Cargo on Cargos(cargo);
create index IDX_Sucursal_Nombre on Sucursales(nombreSucursal);
create index IDX_Identificacion_Numero on Identificaciones(numeroIdentificacion);
create index IDX_Empleado_Nombres on Empleados(nombres);
create index IDX_Telefono_Numero on Cat_Telefonos(numeroTelefonico);
create index IDX_Producto_Nombre on Productos(nombre);
create index IDX_Proveedor_Nombre on Proveedores(nombre);
create index IDX_Cliente_Nombre on Clientes(nombre);
create index IDX_Venta_Documento on venta(id_venta);