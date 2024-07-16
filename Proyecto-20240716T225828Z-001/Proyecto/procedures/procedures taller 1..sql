USE TallerCuero_final;
GO

-- Tabla: Cat_Paises
CREATE PROCEDURE InsertarPais
    @nombre NVARCHAR(30),
    @abreviatura NVARCHAR(5),
    @codigoEntrada NVARCHAR(5),
    @nacionalidad NVARCHAR(30)
AS
BEGIN
    INSERT INTO Cat_Paises (nombre, abreviatura, codigoEntrada, nacionalidad)
    VALUES (@nombre, @abreviatura, @codigoEntrada, @nacionalidad);
END;
GO

CREATE PROCEDURE ActualizarPais
    @id_pais INT,
    @nombre NVARCHAR(30),
    @abreviatura NVARCHAR(5),
    @codigoEntrada NVARCHAR(5),
    @nacionalidad NVARCHAR(30)
AS
BEGIN
    UPDATE Cat_Paises
    SET nombre = @nombre, abreviatura = @abreviatura, codigoEntrada = @codigoEntrada, nacionalidad = @nacionalidad
    WHERE id_pais = @id_pais;
END;
GO

CREATE PROCEDURE EliminarPais
    @id_pais INT
AS
BEGIN
    DELETE FROM Cat_Paises
    WHERE id_pais = @id_pais;
END;
GO

-- Tabla: Departamentos
CREATE PROCEDURE InsertarDepartamento
    @departamento NVARCHAR(45),
    @abreviatura NVARCHAR(5),
    @pais INT
AS
BEGIN
    INSERT INTO Departamentos (departamento, abreviatura, pais)
    VALUES (@departamento, @abreviatura, @pais);
END;
GO

CREATE PROCEDURE ActualizarDepartamento
    @id_departamento INT,
    @departamento NVARCHAR(45),
    @abreviatura NVARCHAR(5),
    @pais INT
AS
BEGIN
    UPDATE Departamentos
    SET departamento = @departamento, abreviatura = @abreviatura, pais = @pais
    WHERE id_departamento = @id_departamento;
END;
GO

CREATE PROCEDURE EliminarDepartamento
    @id_departamento INT
AS
BEGIN
    DELETE FROM Departamentos
    WHERE id_departamento = @id_departamento;
END;
GO

-- Tabla: Municipios
CREATE PROCEDURE InsertarMunicipio
    @municipio NVARCHAR(35),
    @abreviatura NVARCHAR(5),
    @departamento INT
AS
BEGIN
    INSERT INTO Municipios (municipio, abreviatura, departamento)
    VALUES (@municipio, @abreviatura, @departamento);
END;
GO

CREATE PROCEDURE ActualizarMunicipio
    @id_municipio INT,
    @municipio NVARCHAR(35),
    @abreviatura NVARCHAR(5),
    @departamento INT
AS
BEGIN
    UPDATE Municipios
    SET municipio = @municipio, abreviatura = @abreviatura, departamento = @departamento
    WHERE id_municipio = @id_municipio;
END;
GO

CREATE PROCEDURE EliminarMunicipio
    @id_municipio INT
AS
BEGIN
    DELETE FROM Municipios
    WHERE id_municipio = @id_municipio;
END;
GO

-- Tabla: Ubicaciones
CREATE PROCEDURE InsertarUbicacion
    @direccion NVARCHAR(50),
    @municipio INT,
    @codigoPostal INT,
    @calle NVARCHAR(35)
AS
BEGIN
    INSERT INTO Ubicaciones (direccion, municipio, codigoPostal, calle)
    VALUES (@direccion, @municipio, @codigoPostal, @calle);
END;
GO

CREATE PROCEDURE ActualizarUbicacion
    @id_ubicacion INT,
    @direccion NVARCHAR(50),
    @municipio INT,
    @codigoPostal INT,
    @calle NVARCHAR(35)
AS
BEGIN
    UPDATE Ubicaciones
    SET direccion = @direccion, municipio = @municipio, codigoPostal = @codigoPostal, calle = @calle
    WHERE id_ubicacion = @id_ubicacion;
END;
GO

CREATE PROCEDURE EliminarUbicacion
    @id_ubicacion INT
AS
BEGIN
    DELETE FROM Ubicaciones
    WHERE id_ubicacion = @id_ubicacion;
END;
GO

-- Tabla: Areas
CREATE PROCEDURE InsertarArea
    @area NVARCHAR(30)
AS
BEGIN
    INSERT INTO Areas (area)
    VALUES (@area);
END;
GO

CREATE PROCEDURE ActualizarArea
    @id_area INT,
    @area NVARCHAR(30)
AS
BEGIN
    UPDATE Areas
    SET area = @area
    WHERE id_area = @id_area;
END;
GO

CREATE PROCEDURE EliminarArea
    @id_area INT
AS
BEGIN
    DELETE FROM Areas
    WHERE id_area = @id_area;
END;
GO

-- Tabla: Cargos
CREATE PROCEDURE InsertarCargo
    @area INT,
    @cargo NVARCHAR(30),
    @abreviaturaCargo NVARCHAR(5),
    @descripcion NVARCHAR(100)
AS
BEGIN
    INSERT INTO Cargos (area, cargo, abreviaturaCargo, descripcion)
    VALUES (@area, @cargo, @abreviaturaCargo, @descripcion);
END;
GO

CREATE PROCEDURE ActualizarCargo
    @id_cargo INT,
    @area INT,
    @cargo NVARCHAR(30),
    @abreviaturaCargo NVARCHAR(5),
    @descripcion NVARCHAR(100)
AS
BEGIN
    UPDATE Cargos
    SET area = @area, cargo = @cargo, abreviaturaCargo = @abreviaturaCargo, descripcion = @descripcion
    WHERE id_cargo = @id_cargo;
END;
GO

CREATE PROCEDURE EliminarCargo
    @id_cargo INT
AS
BEGIN
    DELETE FROM Cargos
    WHERE id_cargo = @id_cargo;
END;
GO

-- Tabla: Sucursales
CREATE PROCEDURE InsertarSucursal
    @nombreSucursal NVARCHAR(45),
    @RUC NVARCHAR(20),
    @FechaConstitucion DATE,
    @ubicacion INT
AS
BEGIN
    INSERT INTO Sucursales (nombreSucursal, RUC, FechaConstitucion, ubicacion)
    VALUES (@nombreSucursal, @RUC, @FechaConstitucion, @ubicacion);
END;
GO

CREATE PROCEDURE ActualizarSucursal
    @id_sucursal INT,
    @nombreSucursal NVARCHAR(45),
    @RUC NVARCHAR(20),
    @FechaConstitucion DATE,
    @ubicacion INT
AS
BEGIN
    UPDATE Sucursales
    SET nombreSucursal = @nombreSucursal, RUC = @RUC, FechaConstitucion = @FechaConstitucion, ubicacion = @ubicacion
    WHERE id_sucursal = @id_sucursal;
END;
GO

CREATE PROCEDURE EliminarSucursal
    @id_sucursal INT
AS
BEGIN
    DELETE FROM Sucursales
    WHERE id_sucursal = @id_sucursal;
END;
GO

-- Tabla: Cat_TipoIdentificaciones
CREATE PROCEDURE InsertarTipoIdentificacion
    @tipoID NVARCHAR(30)
AS
BEGIN
    INSERT INTO Cat_TipoIdentificaciones (tipoID)
    VALUES (@tipoID);
END;
GO

CREATE PROCEDURE ActualizarTipoIdentificacion
    @id_tipoIdentificacion INT,
    @tipoID NVARCHAR(30)
AS
BEGIN
    UPDATE Cat_TipoIdentificaciones
    SET tipoID = @tipoID
    WHERE id_tipoIdentificacion = @id_tipoIdentificacion;
END;
GO

CREATE PROCEDURE EliminarTipoIdentificacion
    @id_tipoIdentificacion INT
AS
BEGIN
    DELETE FROM Cat_TipoIdentificaciones
    WHERE id_tipoIdentificacion = @id_tipoIdentificacion;
END;
GO

-- Tabla: Identificaciones
CREATE PROCEDURE InsertarIdentificacion
    @numeroIdentificacion NVARCHAR(30),
    @tipoIdentificacion INT,
    @fechavencimiento DATE
AS
BEGIN
    INSERT INTO Identificaciones (numeroIdentificacion, tipoIdentificacion, fechavencimiento)
    VALUES (@numeroIdentificacion, @tipoIdentificacion, @fechavencimiento);
END;
GO

CREATE PROCEDURE ActualizarIdentificacion
    @id_identificacion INT,
    @numeroIdentificacion NVARCHAR(30),
    @tipoIdentificacion INT,
    @fechavencimiento DATE
AS
BEGIN
    UPDATE Identificaciones
    SET numeroIdentificacion = @numeroIdentificacion, tipoIdentificacion = @tipoIdentificacion, fechavencimiento = @fechavencimiento
    WHERE id_identificacion = @id_identificacion;
END;
GO

CREATE PROCEDURE EliminarIdentificacion
    @id_identificacion INT
AS
BEGIN
    DELETE FROM Identificaciones
    WHERE id_identificacion = @id_identificacion;
END;
GO

-- Tabla: Cat_Generos
CREATE PROCEDURE InsertarGenero
    @genero NVARCHAR(10)
AS
BEGIN
    INSERT INTO Cat_Generos (genero)
    VALUES (@genero);
END;
GO

CREATE PROCEDURE ActualizarGenero
    @id_genero INT,
    @genero NVARCHAR(10)
AS
BEGIN
    UPDATE Cat_Generos
    SET genero = @genero
    WHERE id_genero = @id_genero;
END;
GO

CREATE PROCEDURE EliminarGenero
    @id_genero INT
AS
BEGIN
    DELETE FROM Cat_Generos
    WHERE id_genero = @id_genero;
END;
GO

-- Tabla: Personas
CREATE PROCEDURE InsertarPersona
    @nombre NVARCHAR(30),
    @apellido NVARCHAR(30),
    @genero INT,
    @fechaNacimiento DATE,
    @identificacion INT,
    @telefono NVARCHAR(20),
    @correo NVARCHAR(50),
    @nacionalidad INT
AS
BEGIN
    INSERT INTO Personas (nombre, apellido, genero, fechaNacimiento, identificacion, telefono, correo, nacionalidad)
    VALUES (@nombre, @apellido, @genero, @fechaNacimiento, @identificacion, @telefono, @correo, @nacionalidad);
END;
GO

CREATE PROCEDURE ActualizarPersona
    @id_persona INT,
    @nombre NVARCHAR(30),
    @apellido NVARCHAR(30),
    @genero INT,
    @fechaNacimiento DATE,
    @identificacion INT,
    @telefono NVARCHAR(20),
    @correo NVARCHAR(50),
    @nacionalidad INT
AS
BEGIN
    UPDATE Personas
    SET nombre = @nombre, apellido = @apellido, genero = @genero, fechaNacimiento = @fechaNacimiento, identificacion = @identificacion, telefono = @telefono, correo = @correo, nacionalidad = @nacionalidad
    WHERE id_persona = @id_persona;
END;
GO

CREATE PROCEDURE EliminarPersona
    @id_persona INT
AS
BEGIN
    DELETE FROM Personas
    WHERE id_persona = @id_persona;
END;
GO

-- Tabla: Empleados
CREATE PROCEDURE InsertarEmpleado
    @id_persona INT,
    @id_sucursal INT,
    @id_cargo INT,
    @fechaContratacion DATE,
    @fechaFinalizacion DATE
AS
BEGIN
    INSERT INTO Empleados (id_persona, id_sucursal, id_cargo, fechaContratacion, fechaFinalizacion)
    VALUES (@id_persona, @id_sucursal, @id_cargo, @fechaContratacion, @fechaFinalizacion);
END;
GO

CREATE PROCEDURE ActualizarEmpleado
    @id_empleado INT,
    @id_persona INT,
    @id_sucursal INT,
    @id_cargo INT,
    @fechaContratacion DATE,
    @fechaFinalizacion DATE
AS
BEGIN
    UPDATE Empleados
    SET id_persona = @id_persona, id_sucursal = @id_sucursal, id_cargo = @id_cargo, fechaContratacion = @fechaContratacion, fechaFinalizacion = @fechaFinalizacion
    WHERE id_empleado = @id_empleado;
END;
GO

CREATE PROCEDURE EliminarEmpleado
    @id_empleado INT
AS
BEGIN
    DELETE FROM Empleados
    WHERE id_empleado = @id_empleado;
END;
GO

-- Tabla: Proveedores
CREATE PROCEDURE InsertarProveedor
    @id_persona INT,
    @id_ubicacion INT
AS
BEGIN
    INSERT INTO Proveedores (id_persona, id_ubicacion)
    VALUES (@id_persona, @id_ubicacion);
END;
GO

CREATE PROCEDURE ActualizarProveedor
    @id_proveedor INT,
    @id_persona INT,
    @id_ubicacion INT
AS
BEGIN
    UPDATE Proveedores
    SET id_persona = @id_persona, id_ubicacion = @id_ubicacion
    WHERE id_proveedor = @id_proveedor;
END;
GO

CREATE PROCEDURE EliminarProveedor
    @id_proveedor INT
AS
BEGIN
    DELETE FROM Proveedores
    WHERE id_proveedor = @id_proveedor;
END;
GO

-- Tabla: Cat_TipoProductos
CREATE PROCEDURE InsertarTipoProducto
    @tipoProducto NVARCHAR(35)
AS
BEGIN
    INSERT INTO Cat_TipoProductos (tipoProducto)
    VALUES (@tipoProducto);
END;
GO

CREATE PROCEDURE ActualizarTipoProducto
    @id_tipoProducto INT,
    @tipoProducto NVARCHAR(35)
AS
BEGIN
    UPDATE Cat_TipoProductos
    SET tipoProducto = @tipoProducto
    WHERE id_tipoProducto = @id_tipoProducto;
END;
GO

CREATE PROCEDURE EliminarTipoProducto
    @id_tipoProducto INT
AS
BEGIN
    DELETE FROM Cat_TipoProductos
    WHERE id_tipoProducto = @id_tipoProducto;
END;
GO

-- Tabla: Productos
CREATE PROCEDURE InsertarProducto
    @tipoProducto INT,
    @nombreProducto NVARCHAR(45),
    @descripcion NVARCHAR(100)
AS
BEGIN
    INSERT INTO Productos (tipoProducto, nombreProducto, descripcion)
    VALUES (@tipoProducto, @nombreProducto, @descripcion);
END;
GO

CREATE PROCEDURE ActualizarProducto
    @id_producto INT,
    @tipoProducto INT,
    @nombreProducto NVARCHAR(45),
    @descripcion NVARCHAR(100)
AS
BEGIN
    UPDATE Productos
    SET tipoProducto = @tipoProducto, nombreProducto = @nombreProducto, descripcion = @descripcion
    WHERE id_producto = @id_producto;
END;
GO

CREATE PROCEDURE EliminarProducto
    @id_producto INT
AS
BEGIN
    DELETE FROM Productos
    WHERE id_producto = @id_producto;
END;
GO

-- Tabla: Inventarios
CREATE PROCEDURE InsertarInventario
    @producto INT,
    @cantidad INT,
    @ubicacion INT
AS
BEGIN
    INSERT INTO Inventarios (producto, cantidad, ubicacion)
    VALUES (@producto, @cantidad, @ubicacion);
END;
GO

CREATE PROCEDURE ActualizarInventario
    @id_inventario INT,
    @producto INT,
    @cantidad INT,
    @ubicacion INT
AS
BEGIN
    UPDATE Inventarios
    SET producto = @producto, cantidad = @cantidad, ubicacion = @ubicacion
    WHERE id_inventario = @id_inventario;
END;
GO

CREATE PROCEDURE EliminarInventario
    @id_inventario INT
AS
BEGIN
    DELETE FROM Inventarios
    WHERE id_inventario = @id_inventario;
END;
GO

-- Tabla: Clientes
CREATE PROCEDURE InsertarCliente
    @id_persona INT,
    @id_ubicacion INT
AS
BEGIN
    INSERT INTO Clientes (id_persona, id_ubicacion)
    VALUES (@id_persona, @id_ubicacion);
END;
GO

CREATE PROCEDURE ActualizarCliente
    @id_cliente INT,
    @id_persona INT,
    @id_ubicacion INT
AS
BEGIN
    UPDATE Clientes
    SET id_persona = @id_persona, id_ubicacion = @id_ubicacion
    WHERE id_cliente = @id_cliente;
END;
GO

CREATE PROCEDURE EliminarCliente
    @id_cliente INT
AS
BEGIN
    DELETE FROM Clientes
    WHERE id_cliente = @id_cliente;
END;
GO

-- Tabla: Cat_FormasPago
CREATE PROCEDURE InsertarFormaPago
    @formaPago NVARCHAR(30)
AS
BEGIN
    INSERT INTO Cat_FormasPago (formaPago)
    VALUES (@formaPago);
END;
GO

CREATE PROCEDURE ActualizarFormaPago
    @id_formaPago INT,
    @formaPago NVARCHAR(30)
AS
BEGIN
    UPDATE Cat_FormasPago
    SET formaPago = @formaPago
    WHERE id_formaPago = @id_formaPago;
END;
GO

CREATE PROCEDURE EliminarFormaPago
    @id_formaPago INT
AS
BEGIN
    DELETE FROM Cat_FormasPago
    WHERE id_formaPago = @id_formaPago;
END;
GO

-- Tabla: Facturas
CREATE PROCEDURE InsertarFactura
    @cliente INT,
    @fecha DATE,
    @formaPago INT,
    @total DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO Facturas (cliente, fecha, formaPago, total)
    VALUES (@cliente, @fecha, @formaPago, @total);
END;
GO

CREATE PROCEDURE ActualizarFactura
    @id_factura INT,
    @cliente INT,
    @fecha DATE,
    @formaPago INT,
    @total DECIMAL(10, 2)
AS
BEGIN
    UPDATE Facturas
    SET cliente = @cliente, fecha = @fecha, formaPago = @formaPago, total = @total
    WHERE id_factura = @id_factura;
END;
GO

CREATE PROCEDURE EliminarFactura
    @id_factura INT
AS
BEGIN
    DELETE FROM Facturas
    WHERE id_factura = @id_factura;
END;
GO

-- Tabla: FacturaDetalle
CREATE PROCEDURE InsertarFacturaDetalle
    @factura INT,
    @producto INT,
    @cantidad INT,
    @precio DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO FacturaDetalle (factura, producto, cantidad, precio)
    VALUES (@factura, @producto, @cantidad, @precio);
END;
GO

CREATE PROCEDURE ActualizarFacturaDetalle
    @id_detalle INT,
    @factura INT,
    @producto INT,
    @cantidad INT,
    @precio DECIMAL(10, 2)
AS
BEGIN
    UPDATE FacturaDetalle
    SET factura = @factura, producto = @producto, cantidad = @cantidad, precio = @precio
    WHERE id_detalle = @id_detalle;
END;
GO

CREATE PROCEDURE EliminarFacturaDetalle
    @id_detalle INT
AS
BEGIN
    DELETE FROM FacturaDetalle
    WHERE id_detalle = @id_detalle;
END;
GO

-- Tabla: Compras
CREATE PROCEDURE InsertarCompra
    @proveedor INT,
    @fecha DATE,
    @total DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO Compras (proveedor, fecha, total)
    VALUES (@proveedor, @fecha, @total);
END;
GO

CREATE PROCEDURE ActualizarCompra
    @id_compra INT,
    @proveedor INT,
    @fecha DATE,
    @total DECIMAL(10, 2)
AS
BEGIN
    UPDATE Compras
    SET proveedor = @proveedor, fecha = @fecha, total = @total
    WHERE id_compra = @id_compra;
END;
GO

CREATE PROCEDURE EliminarCompra
    @id_compra INT
AS
BEGIN
    DELETE FROM Compras
    WHERE id_compra = @id_compra;
END;
GO

-- Tabla: CompraDetalle
CREATE PROCEDURE InsertarCompraDetalle
    @compra INT,
    @producto INT,
    @cantidad INT,
    @precio DECIMAL(10, 2)
AS
BEGIN
    INSERT INTO CompraDetalle (compra, producto, cantidad, precio)
    VALUES (@compra, @producto, @cantidad, @precio);
END;
GO

CREATE PROCEDURE ActualizarCompraDetalle
    @id_detalle INT,
    @compra INT,
    @producto INT,
    @cantidad INT,
    @precio DECIMAL(10, 2)
AS
BEGIN
    UPDATE CompraDetalle
    SET compra = @compra, producto = @producto, cantidad = @cantidad, precio = @precio
    WHERE id_detalle = @id_detalle;
END;
GO

CREATE PROCEDURE EliminarCompraDetalle
    @id_detalle INT
AS
BEGIN
    DELETE FROM CompraDetalle
    WHERE id_detalle = @id_detalle;
END;
GO

-- Tabla: FavoritosCliente
CREATE PROCEDURE InsertarFavoritoCliente
    @id_cliente INT,
    @id_producto INT
AS
BEGIN
    INSERT INTO FavoritosCliente (id_cliente, id_producto)
    VALUES (@id_cliente, @id_producto);
END;
GO

CREATE PROCEDURE ActualizarFavoritoCliente
    @id_favorito INT,
    @id_cliente INT,
    @id_producto INT
AS
BEGIN
    UPDATE FavoritosCliente
    SET id_cliente = @id_cliente, id_producto = @id_producto
    WHERE id_favorito = @id_favorito;
END;
GO

CREATE PROCEDURE EliminarFavoritoCliente
    @id_favorito INT
AS
BEGIN
    DELETE FROM FavoritosCliente
    WHERE id_favorito = @id_favorito;
END;
GO

