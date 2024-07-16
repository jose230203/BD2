use master
go

use TallerCuero_final;
go

BULK INSERT Cat_TipoIdentificaciones
FROM 'C:\Users\Jose\Desktop\Excel\CATID.csv'
WITH
(
FIELDTERMINATOR =';',
ROWTERMINATOR = '\n'

)

BULK INSERT Identificaciones
FROM 'C:\Users\Jose\Desktop\Excel\Identificaciones.csv'
WITH
(
FIELDTERMINATOR =';',
ROWTERMINATOR = '\n'

)

BULK INSERT Cat_Generos
FROM 'C:\Users\Jose\Desktop\Excel\genero.csv'
WITH
(
FIELDTERMINATOR =';',
ROWTERMINATOR = '\n'

)

BULK INSERT Empleados
FROM 'C:\Users\Jose\Desktop\Excel\Empleados.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n'
);



BULK INSERT Cat_Colores
FROM 'C:\Users\Jose\Desktop\Excel\CATcolor.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n'
);


BULK INSERT Cat_Medidas
FROM 'C:\Users\Jose\Desktop\Excel\Cat_Medidas.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n'
);



BULK INSERT Cat_Paises
FROM 'C:\Users\Jose\Desktop\Excel\Cat_Paises.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n'
)


BULK INSERT Departamentos
FROM 'C:\Users\Jose\Desktop\Excel\Departamentos.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n'
)


BULK INSERT Municipios
FROM 'C:\Users\Jose\Desktop\Excel\Municipios.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n'
)


BULK INSERT Ubicaciones
FROM 'C:\Users\Jose\Desktop\Excel\Ubicaciones.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n'
);


BULK INSERT Areas
FROM 'C:\Users\Jose\Desktop\Excel\Areas.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);



BULK INSERT Cargos
FROM 'C:\Users\Jose\Desktop\Excel\Cargos.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);



BULK INSERT Sucursales
FROM 'C:\Users\Jose\Desktop\Excel\Sucursales.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n'
);



BULK INSERT Cat_Telefonos
FROM 'C:\Users\Jose\Desktop\Excel\Cat_Telefonos.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);



BULK INSERT DetallesEmpleado
FROM 'C:\Users\Jose\Desktop\Excel\DetallesEmpleado.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT DetallesSucursales
FROM 'C:\Users\Jose\Desktop\Excel\DetallesSucursales.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT HistorialCargosEmpleados
FROM 'C:\Users\Jose\Desktop\Excel\HistorialCargosEmpleados.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT HistorialEmpleados
FROM 'C:\Users\Jose\Desktop\Excel\HistorialEmpleados.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT Cat_Cueros
FROM 'C:\Users\Jose\Desktop\Excel\Cat_Cueros.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT Categorias
FROM 'C:\Users\Jose\Desktop\Excel\Categorias.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT subcategorias
FROM 'C:\Users\Jose\Desktop\Excel\Subcategorias.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);


BULK INSERT Impuestos
FROM 'C:\Users\Jose\Desktop\Excel\Impuestos.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);


BULK INSERT PresentacionProducto
FROM 'C:\Users\Jose\Desktop\Excel\Presentacion.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT Productos
FROM 'C:\Users\Jose\Desktop\Excel\Productos.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
select *from productos

BULK INSERT Cat_Monedas
FROM 'C:\Users\Jose\Desktop\Excel\Monedas.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT Precios
FROM 'C:\Users\Jose\Desktop\Excel\Precios.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT DetallesProductos
FROM 'C:\Users\Jose\Desktop\Excel\Detallesprod.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT Proveedores
FROM 'C:\Users\Jose\Desktop\Excel\Provedor.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

select * from Productos


BULK INSERT Cargos
FROM 'C:\Users\Jose\Desktop\Excel\Cargos.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
BULK INSERT detalle_proveedor
FROM 'C:\Users\Jose\Desktop\Excel\Detalleprov.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT Clientes
FROM 'C:\Users\Jose\Desktop\Excel\Clientes.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT Detalle_Cliente
FROM 'C:\Users\Jose\Desktop\Excel\DetalleCliente.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT PlanesProduccionProductos
FROM 'C:\Users\Jose\Desktop\Excel\Produccion.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT Materiales
FROM 'C:\Users\Jose\Desktop\Excel\Materiales.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT MaterialesUsadosPlanesProduccion
FROM 'C:\Users\Jose\Desktop\Excel\MaterialesUsados.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT Inventario
FROM 'C:\Users\Jose\Desktop\Excel\Inventario.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT venta
FROM 'C:\Users\Jose\Desktop\Excel\venta.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT detalleventa
FROM 'C:\Users\Jose\Desktop\Excel\detalleventa.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT controlPago
FROM 'C:\Users\Jose\Desktop\Excel\controlpago.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);


BULK INSERT Cajas
FROM 'C:\Users\Jose\Desktop\Excel\Cajas.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT AperturasCajas
FROM 'C:\Users\Jose\Desktop\Excel\AperturasCajas.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT DetalleAperturaCajas
FROM 'C:\Users\Jose\Desktop\Excel\DetalleAperturaCajas.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT ArqueoCaja
FROM 'C:\Users\Jose\Desktop\Excel\ArqueoCaja.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT CierresCajas
FROM 'C:\Users\Jose\Desktop\Excel\CierresCajas.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);

BULK INSERT Transacciones
FROM 'C:\Users\Jose\Desktop\Excel\Transacciones.csv'
WITH (
    FIELDTERMINATOR = ';',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2
);
use master
go
