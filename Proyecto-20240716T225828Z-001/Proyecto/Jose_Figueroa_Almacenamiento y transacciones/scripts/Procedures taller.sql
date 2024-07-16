-- Crear el procedimiento almacenado para insertar un nuevo empleado
CREATE PROCEDURE sp_InsertarEmpleado
--Creacion de variables
    @nombres VARCHAR(20),                  -- Nombre del empleado
    @apellidos VARCHAR(15),                -- Apellidos del empleado
    @inss VARCHAR(10),                     -- INSS del empleado
    @numeroIdentificacion NVARCHAR(30),    -- Número de identificación
    @tipoIdentificacion NVARCHAR(30),      -- Tipo de identificación
    @fechavencimiento DATE                 -- Fecha de vencimiento de la identificación
AS
BEGIN
    -- Iniciar una transacción para asegurarse de que ambas inserciones sean atómicas
    BEGIN TRANSACTION;
    BEGIN TRY
        -- Insertar la nueva identificación en la tabla Identificaciones
        INSERT INTO Identificaciones (numeroIdentificacion, tipoIdentificacion, fechavencimiento)
        VALUES (@numeroIdentificacion, @tipoIdentificacion, @fechavencimiento);
        
        -- Obtener el ID de la identificación recién insertada
        DECLARE @id_identificacion INT;
        SET @id_identificacion = SCOPE_IDENTITY();
        
        -- Insertar el nuevo empleado en la tabla Empleados
        INSERT INTO Empleados (nombres, apellidos, inss, identificacion)
        VALUES (@nombres, @apellidos, @inss, @id_identificacion);
        
        -- Confirmar la transacción si todo va bien
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Revertir la transacción en caso de error
        ROLLBACK TRANSACTION;
        
        -- Lanzar el error para que el llamador pueda manejarlo
        THROW;
    END CATCH
END;
GO

-- Crear el procedimiento almacenado para eliminar un empleado basado en su nombre
CREATE PROCEDURE sp_EliminarEmpleadoPorNombre
    @nombres VARCHAR(20),  -- Nombre del empleado
    @apellidos VARCHAR(15) -- Apellidos del empleado
AS
BEGIN
    -- Iniciar una transacción para asegurarse de que ambas eliminaciones sean atómicas
    BEGIN TRANSACTION;
    BEGIN TRY
        -- Declarar una variable para almacenar el ID de la identificación
        DECLARE @id_identificacion INT;

        -- Obtener el ID de la identificación del empleado que se desea eliminar
        SELECT @id_identificacion = identificacion
        FROM Empleados
        WHERE nombres = @nombres AND apellidos = @apellidos;

        -- Verificar si se encontró el empleado
        IF @id_identificacion IS NULL
        BEGIN
            -- Si no se encontró el empleado, lanzar un error
            THROW 50001, 'Empleado no encontrado.', 1;
        END

        -- Eliminar el empleado de la tabla Empleados
        DELETE FROM Empleados
        WHERE nombres = @nombres AND apellidos = @apellidos;

        -- Eliminar la identificación correspondiente de la tabla Identificaciones
        DELETE FROM Identificaciones
        WHERE id_identificacion = @id_identificacion;

        -- Confirmar la transacción si todo va bien
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        -- Revertir la transacción en caso de error
        ROLLBACK TRANSACTION;

        -- Lanzar el error para que el llamador pueda manejarlo
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_InsertarUnidadMedida
    @nombreUnidad VARCHAR(100),  
    @abreviatura VARCHAR(10),    
    @unidad FLOAT              
AS
BEGIN
   
    BEGIN TRANSACTION;
    BEGIN TRY
       
        INSERT INTO Cat_Medidas (nombreUnidad, abreviatura, unidad)
        VALUES (@nombreUnidad, @abreviatura, @unidad);

      
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
      
        ROLLBACK TRANSACTION;

      
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_EliminarUnidadMedidaPorNombre
    @nombreUnidad VARCHAR(100) 
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Cat_Medidas WHERE nombreUnidad = @nombreUnidad)
        BEGIN
            THROW 50001, 'Unidad de medida no encontrada.', 1;
        END

        DELETE FROM Cat_Medidas
        WHERE nombreUnidad = @nombreUnidad;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_InsertarColor
    @color NVARCHAR(30)  
AS
BEGIN
   
    BEGIN TRANSACTION;
    BEGIN TRY
       
        INSERT INTO Cat_Colores (color)
        VALUES (@color);

       
        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
   
        ROLLBACK TRANSACTION;

      
        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_EliminarColorPorID
    @id_color INT  
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Cat_Colores WHERE id_color = @id_color)
        BEGIN
            THROW 50001, 'Color no encontrado.', 1;
        END

        DELETE FROM Cat_Colores
        WHERE id_color = @id_color;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_InsertarPais
    @nombre NVARCHAR(30),           
    @abreviatura NVARCHAR(5),      
    @codigoEntrada NVARCHAR(5),    
    @nacionalidad NVARCHAR(30)     
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        INSERT INTO Cat_Paises (nombre, abreviatura, codigoEntrada, nacionalidad)
        VALUES (@nombre, @abreviatura, @codigoEntrada, @nacionalidad);

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        THROW;
    END CATCH
END;
GO

CREATE PROCEDURE sp_EliminarPaisPorID
    @id_pais INT  
AS
BEGIN
    BEGIN TRANSACTION;
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Cat_Paises WHERE id_pais = @id_pais)
        BEGIN
            THROW 50001, 'País no encontrado.', 1;
        END

        DELETE FROM Cat_Paises
        WHERE id_pais = @id_pais;

        COMMIT TRANSACTION;
    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;

        THROW;
    END CATCH
END;
GO
