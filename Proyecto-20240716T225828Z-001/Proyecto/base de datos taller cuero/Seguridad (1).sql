-- Tablas de seguridad Bases de datos

use TallerCuero_final

create table Usuarios(
   id_usuario int,
   NombreUsuario nvarchar(30),
   Habilitado bit,
   Empleado int,

   constraint FK_IDEMPLEADO_USUARIOS foreign key(Empleado) references Empleados(id_empleado),
   constraint PK_IDUSUARIO primary key(id_usuario)
)

create table Permisos(
   id_permiso int,
   NombrePermiso nvarchar(100),
   DescripcionPermiso nvarchar(100),
   Permitido bit,
   Usuario int,

   constraint FK_IDUSUARIO_PERMISOS foreign key(Usuario) references Usuarios(id_usuario),
   constraint PK_IDPERMISO primary key(id_permiso)
)

create table ClavesAccesosUsuarios(
   id_clave int,
   Usuario int,
   ClaveActual nvarchar(100),

   constraint FK_IDUSUARIOS_CLAVESACCESO foreign key(Usuario) references Usuarios(id_usuario)
)


CREATE TABLE ConexionesOrigenPermitidas(
    id_conexionPermitida int,
    Pais int,
    Habilitada bit,
    CONSTRAINT FK_IDPAIS_CONEXIONESPERRMITIDAS FOREIGN KEY (Pais) REFERENCES Cat_Paises(id_pais),
    CONSTRAINT PK_IDCONEXIONPERMITIDA PRIMARY KEY (id_conexionPermitida)
);


create table RegistroConexiones(
   id_conexion int,
   NombreHost nvarchar(15),
   IP_Origen nvarchar(15),
   EstadoConexion bit default 1,
   ConexionOrigenPais int,

   constraint FK_IDCONEXIONORIGEN_CONEXIONES foreign key(ConexionOrigenPais) references ConexionesOrigenPermitidas(id_conexionPermitida),
   constraint PK_IDTIPOCONEXION primary key(id_conexion)
)

create table HistorialClavesUsuarios(
   Usuario int,
   ClaveAnterior nvarchar(30),
   ultimaFechaModificacion datetime,
   UltimaConexion int,
   Conexion int,

   constraint FK_IDCONEXION_HISTORIALCLAVES foreign key(Conexion) references RegistroConexiones(id_conexion),
   constraint FK_IDUSUARIO_HISTORIALCLAVES foreign key(Usuario) references Usuarios(id_usuario)
)


create table TablaControlSessiones(
   id_sesiones int,
   Usuario int,
   FechaInicio datetime,
   FechaSalida datetime,   
   Conexion int,

   constraint FK_IDCONEXTION_TABLACONTROL foreign key(Conexion) references RegistroConexiones(id_conexion),
   constraint FK_IDUSUARIO_TABLACONTROL foreign key(Usuario) references Usuarios(id_usuario)
)