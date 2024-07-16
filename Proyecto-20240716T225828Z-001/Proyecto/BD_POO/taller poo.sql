
create database tallercuero_oo
go
use tallercuero_oo
go


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

create table tipodepersona(
Numtippers int primary key,
nombretippers nvarchar(10),
Descriptippers nvarchar(250),
numCatEst int,
);

create table Persona(
Num_persona int primary key,
Num_Ubicacion int,
Nombrepers nvarchar(30),
Num_tipper int,

foreign key (Num_tipper) references tipodepersona(Numtippers),
foreign key (Num_Ubicacion) references Ubicaciones(id_ubicacion),
);

create table TipoDeDocumento(
NumTipDOC int primary key,
NumTipPer int,
NombreTipDoc nvarchar(50),
Descriptipdoc nvarchar(250),
foreign key (NumTipPer) references tipodepersona(Numtippers),
);

create table persona_nat(
Numpernat int primary key,
apellidopersnat nvarchar(100),
numtipdoc int,
docpersnat nvarchar(25) unique,
Lugardenacpernat nvarchar(30),
GeneropersNat char(1),
fechanacpernac date,
foreign key (numtipdoc) references TipoDeDocumento(NumTipDOC),
);

create table personaJuridica(
NumPerJur int primary key,
NumPer int,
NumTipDoc int,
DocPerJur nvarchar(25) unique,
razonSocial nvarchar(50),
FecContPer date,
);

create table proveedor(
NumProvee int primary key,
NumPer int,
Impuestoprovee float,
creditoprovee int,
SectorComercial nvarchar(60),
DiasdeEntrega int,
FecIngProvee datetime,

foreign key (NumPer) references Persona(Num_persona),
);

Create table Cargo(
NumCarg int primary key,
NombreCarg nvarchar(50),
DescripCarg nvarchar(250),
abreviaturacar nvarchar(10),
);

create table CatEstCivil(
NumEstciv int primary key,
NombreEstCiv nvarchar(25),
AbreviaturaEstCiv nvarchar(10),
)

Create table Trabajador(
NumTrab int primary key,
NumPersNat int,
numInss int unique,
NumEstCiv int,
fechaing datetime,
foreign key (NumEstCiv) references CatEstCivil(NumEstciv),
foreign key (NumPersNat) references persona_nat(Numpernat),
);

Create table CargoTrabajador(
NumcarTrab int primary key,
NumCarg int,
NumTrab int,
Fecinicartrab datetime,
fechafincartrab datetime,
AasigCatTrab nvarchar(50),
MotivoCarTrab nvarchar(100),

foreign key(NumCarg) references Cargo(NumCarg),
foreign key(NumTrab) references Trabajador(NumTrab),
);

create table Compañiatelefono(
NumComTel int primary key,
NombNumCompTel nvarchar(25),
descripComTel nvarchar(250),
abreviaturaComp nvarchar(10),
);

create table Telefono(
NumTel int primary key,
Numper int,
NumPais int,
NumeroTel int,
Lineanumcomtel nvarchar(25),
Numcom int,

foreign key (Numcom) references Compañiatelefono(NumcomTel),
);

create table Categoria(
numcat int primary key,
Nombrecat nvarchar(100),
descriipcion nvarchar(250),

);

create table subcat(
Numsubcat int primary key,
Numcat int,
nombresubcat nvarchar(100),

foreign key (Numcat) references Categoria(numcat),
);

create table tipoproducto(
numtipprod int primary key,
nombretipproduct nvarchar(50),
descripciontipprod nvarchar(100),
abreviaturatipprod nvarchar(100),
);

create table Cat_Medidas (
	id_unidadMedida int,
	nombreUnidad VARCHAR(100) NOT NULL,
	abreviatura VARCHAR(10),
	unidad int,

	constraint PK_IDUNIDADMEDIDA primary key(id_unidadMedida)
);


create table Cat_Colores(
	id_color int,
	color nvarchar(30),
	constraint PK_IDCOLOR primary key(id_color)
);

create table presentacion(
numpres int primary key,
nombrepres nvarchar(100),
descripes nvarchar(250),
abreviatura nvarchar(10),
);

create table impuesto(
Numimp int primary key,
impuesto decimal(18,2),
descripimp nvarchar(100),

);

create table cat_marca(
num_marca int primary key,
nombre nvarchar(50),
descripcionmarca nvarchar(250),
abreviatura nvarchar(10),
);

create table producto(
Numprod int primary key,
codprod nvarchar(40) unique,
numsubcat int,
numpres int,
numcolor int,
nummarca int,
numtipprod int,
numunidadmedida int,
Nombrevaloragregado nvarchar(100),
numimp int,

foreign key (numsubcat) references subcat(Numsubcat),
foreign key (numpres) references presentacion(numpres),
foreign key (numcolor) references Cat_Colores(id_color),
foreign key (nummarca) references cat_marca(num_marca),
foreign key (numtipprod) references tipoproducto(numtipprod),
foreign key (numimp) references impuesto(Numimp),
);

create table detalledeactivofijodeproducto(
NumDeactivofijo int primary key,
Numprod int,
NumMarca int,
Nombredeactivofijo nvarchar(100),
dimencionactivofijo nvarchar(100),
);

CREATE TABLE Compras (
    NumLotProd INT PRIMARY KEY,
    CodLotProd VARCHAR(50),
    NombLotProd VARCHAR(100),
    RegistSanit VARCHAR(100),
    HechoEnLotProd INT,
    FecFabricacionLotProd DATE
);

CREATE TABLE VencimientoDelLote (
    NumVenLot INT PRIMARY KEY,
    NumLotProd INT,
    FecCaducacionLotProd DATE,
    FOREIGN KEY (NumLotProd) REFERENCES Compras(NumLotProd)
);

CREATE TABLE GarantiaDelLote (
    NumGarantLot INT PRIMARY KEY,
    NumLotProd INT,
    DiasGarantLot INT,
    FOREIGN KEY (NumLotProd) REFERENCES Compras(NumLotProd)
);

CREATE TABLE HistorialCompras (
    NumDetLotProd INT PRIMARY KEY,
    NumLotProd INT,
    NumProd INT,
    NumProvee INT,
    CantidadDetLotProd INT,
    CostoUnitarioDetLotProd DECIMAL(18, 2),
    CostoTotalDetLotProd DECIMAL(18, 2),
    FecDetLotProd DATETIME,
    FOREIGN KEY (NumLotProd) REFERENCES Compras(NumLotProd)
);

CREATE TABLE TipoDeMovimientoDelLoteDeProducto (
    NumTipMovLotProd INT PRIMARY KEY,
    NombTipMovLotProd VARCHAR(50),
    DescripTipMovLotProd VARCHAR(250),
    AbreviaturaTipMovLotProd VARCHAR(10),
);