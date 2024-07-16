CREATE TRIGGER tr_AfterInsert_HistorialSesiones
ON HistorialSesiones
AFTER INSERT
AS
BEGIN
    DECLARE @id_session INT, @Usuario INT, @FechaInicio DATETIME, @FechaSalida DATETIME, @IPOrigen NVARCHAR(45), @Resultado NVARCHAR(20);
    
    SELECT @id_session = id_Session, @Usuario = Usuario, @FechaInicio = FechaInicio, @FechaSalida = FechaSalida, @IPOrigen = IPOrigen, @Resultado = Resultado
    FROM inserted;
    
    PRINT 'Se insertaron los siguientes datos en la tabla HistorialSesiones:';
    PRINT 'ID de Sesión: ' + CAST(@id_session AS NVARCHAR(10));
    PRINT 'Usuario: ' + CAST(@Usuario AS NVARCHAR(10));
    PRINT 'Fecha de Inicio: ' + CONVERT(NVARCHAR(30), @FechaInicio, 120);
    PRINT 'Fecha de Salida: ' + ISNULL(CONVERT(NVARCHAR(30), @FechaSalida, 120), 'N/A');
    PRINT 'IP de Origen: ' + @IPOrigen;
    PRINT 'Resultado: ' + @Resultado;
END;

CREATE TRIGGER tr_AfterInsert_Usuarios
ON Usuarios
AFTER INSERT
AS
BEGIN
    PRINT 'Se han insertado datos en la tabla Usuario.';
END;

CREATE TRIGGER ActualizarInventarioDespuesDeVenta
ON detalleventa
AFTER INSERT
AS
BEGIN
    DECLARE @id_venta INT;
    DECLARE @id_producto INT;
    DECLARE @cantidad_vendida INT;

    -- Iterar sobre cada fila insertada
    DECLARE inserted_cursor CURSOR FOR
    SELECT id_venta, id_producto, cantidad_vendida
    FROM inserted;

    OPEN inserted_cursor;

    FETCH NEXT FROM inserted_cursor INTO @id_venta, @id_producto, @cantidad_vendida;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        -- Actualizar la cantidad en el inventario solo si es un producto
        UPDATE Inventario
        SET cantidad = cantidad - @cantidad_vendida
        WHERE id_entidad = @id_producto AND tipo_entidad = 'Producto';

        FETCH NEXT FROM inserted_cursor INTO @id_venta, @id_producto, @cantidad_vendida;
    END

    CLOSE inserted_cursor;
    DEALLOCATE inserted_cursor;
END;

--Cada vez que se inserte un nuevo precio o se actualice un precio existente, se debe insertar un nuevo registro en HistorialPrecios.
CREATE TRIGGER trg_InsertUpdatePrecios
ON Precios
AFTER INSERT, UPDATE
AS
BEGIN
    DECLARE @id_precio INT;
    DECLARE @fechaInicio DATETIME;
    DECLARE @fechaFin DATETIME;
    DECLARE @precio DECIMAL(10, 2);
    DECLARE @tipoMoneda NVARCHAR(10);
    DECLARE @id_producto INT;

    SELECT @id_precio = id_precio, 
           @fechaInicio = fechaInicio, 
           @fechaFin = fechaFin, 
           @precio = precio, 
           @tipoMoneda = tipoMoneda
    FROM inserted;

    -- Insertar el nuevo registro en HistorialPrecios
    INSERT INTO HistorialPrecios (id_producto, precio, fechaInicio, fechaFin, tipoMoneda)
    VALUES (@id_precio, @precio, @fechaInicio, NULL, @tipoMoneda);

    -- Actualizar el campo id_historial_precio en Precios
    UPDATE Precios
    SET id_historial_precio = SCOPE_IDENTITY()
    WHERE id_precio = @id_precio;
END;
