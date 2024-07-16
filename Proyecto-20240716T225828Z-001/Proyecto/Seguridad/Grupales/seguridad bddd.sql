CREATE TABLE Usuarios(
   id_usuario int PRIMARY KEY,
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

CREATE INDEX idx_NombreUsuario ON Usuarios (NombreUsuario);
CREATE INDEX idx_Usuario ON HistorialClaves (Usuario);
CREATE INDEX idx_Usuario_TablaControl ON TablaControlSessiones (Usuario);
CREATE INDEX idx_TipoConexion ON Conexiones (TipoConexion);

CREATE PROCEDURE sp_InsertarUsuario
    @NombreUsuario nvarchar(30),
    @Empleado nvarchar(20), -- Cambiado a nvarchar
    @ClaveAcceso nvarchar(64),
    @Habilitado bit
AS
BEGIN
    BEGIN TRY
        -- Verificar si el nombre de usuario ya existe
        IF NOT EXISTS (SELECT 1 FROM Usuarios WHERE NombreUsuario = @NombreUsuario)
        BEGIN
            -- Verificar si el empleado ya existe
            IF NOT EXISTS (SELECT 1 FROM Usuarios WHERE Empleado = @Empleado)
            BEGIN
                -- Insertar nuevo usuario
                INSERT INTO Usuarios (NombreUsuario, Empleado, ClaveHash, Habilitado)
                VALUES (@NombreUsuario, @Empleado, HASHBYTES('SHA2_256', @ClaveAcceso), @Habilitado);

                -- Insertar historial de contraseñas
                INSERT INTO HistorialClaves (Usuario, ClaveHash, ultimaFechaModificacion)
                VALUES (SCOPE_IDENTITY(), HASHBYTES('SHA2_256', @ClaveAcceso), GETDATE());
            END
            ELSE
            BEGIN
                -- El empleado ya existe, lanzar excepción
                RAISERROR ('El empleado ya existe', 16, 1);
            END
        END
        ELSE
        BEGIN
            -- El nombre de usuario ya existe, lanzar excepción
            RAISERROR ('El nombre de usuario ya existe', 16, 1);
        END
    END TRY
    BEGIN CATCH
        -- Manejar errores
        DECLARE @ErrorMessage nvarchar(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;
GO

CREATE PROCEDURE sp_CambiarClave
    @NombreUsuario nvarchar(30),
    @ClaveAccesoAntigua nvarchar(64),
    @ClaveAccesoNueva nvarchar(64)
AS
BEGIN
    BEGIN TRY
        -- Verificar si el nombre de usuario existe
        IF EXISTS (SELECT 1 FROM Usuarios WHERE NombreUsuario = @NombreUsuario)
        BEGIN
            -- Verificar si la contraseña antigua es correcta
            IF HASHBYTES('SHA2_256', @ClaveAccesoAntigua) = (SELECT ClaveHash FROM Usuarios WHERE NombreUsuario = @NombreUsuario)
            BEGIN
                -- Verificar si la contraseña nueva es diferente a la contraseña antigua
                IF HASHBYTES('SHA2_256', @ClaveAccesoNueva) <> HASHBYTES('SHA2_256', @ClaveAccesoAntigua)
                BEGIN
                    -- Actualizar contraseña hashada en la tabla Usuarios
                    UPDATE Usuarios
                    SET ClaveHash = HASHBYTES('SHA2_256', @ClaveAccesoNueva)
                    WHERE NombreUsuario = @NombreUsuario;

                    -- Agregar nuevo registro en la tabla HistorialClaves
                    INSERT INTO HistorialClaves (Usuario, ClaveHash, ultimaFechaModificacion)
                    VALUES ((SELECT id_usuario FROM Usuarios WHERE NombreUsuario = @NombreUsuario), HASHBYTES('SHA2_256', @ClaveAccesoNueva), GETDATE());
                END
                ELSE
                BEGIN
                    -- La contraseña nueva es igual a la contraseña antigua, lanzar excepción
                    RAISERROR ('La contraseña nueva es igual a la contraseña antigua', 16, 1);
                END
            END
            ELSE
            BEGIN
                -- La contraseña antigua es incorrecta, lanzar excepción
                RAISERROR ('La contraseña antigua es incorrecta', 16, 1);
            END
        END
        ELSE
        BEGIN
            -- El nombre de usuario no existe, lanzar excepción
            RAISERROR ('El nombre de usuario no existe', 16, 1);
        END
    END TRY
    BEGIN CATCH
        -- Manejar errores
        DECLARE @ErrorMessage nvarchar(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;
GO

CREATE PROCEDURE sp_ValidarInicioSesion
    @NombreUsuario NVARCHAR(50),
    @Clave NVARCHAR(50)
AS
BEGIN
    -- Verifica si el usuario y la contraseña son válidos
    DECLARE @UsuarioId INT
    SELECT @UsuarioId = id_usuario FROM Usuarios WHERE NombreUsuario = @NombreUsuario AND ClaveHash = HASHBYTES('SHA2_256', @Clave)

    IF @UsuarioId IS NOT NULL
    BEGIN
        -- Verifica si la conexión ya existe
        DECLARE @ConexionId INT
        SELECT @ConexionId = id_conexion FROM Conexiones WHERE TipoConexion = 'INICIO_SESION' AND NombreHost = HOST_NAME()

        IF @ConexionId IS NULL
        BEGIN
            -- Inserta un nuevo registro en la tabla Conexiones
            INSERT INTO Conexiones (TipoConexion, NombreHost, FechaHoraInicio) VALUES ('INICIO_SESION', HOST_NAME(), GETDATE())
        END
        ELSE
        BEGIN
            -- Actualiza el campo FechaHoraFin de la conexión existente
            UPDATE Conexiones SET FechaHoraFin = GETDATE() WHERE id_conexion = @ConexionId
        END

        -- Devuelve un mensaje de éxito
        SELECT 'INICIO_SESION_EXITOSO'
    END
    ELSE
    BEGIN
        -- Devuelve un mensaje de error
        SELECT 'NO_SE_PUDO_INICIAR_SESION'
    END
END;

CREATE PROCEDURE sp_InsertarHistorialInicioSesion
    @id_conexion int,
    @Usuario int,
    @FechaInicio datetime,
    @FechaSalida datetime,
    @IPOrigen nvarchar(45),
    @Resultado nvarchar(20)
AS
BEGIN
    BEGIN TRY
        -- Insertar el registro en el historial de inicio de sesión
        INSERT INTO HistorialSesiones (id_Session, Usuario, FechaInicio, FechaSalida, IPOrigen, Resultado)
        VALUES (@id_conexion, @Usuario, @FechaInicio, @FechaSalida, @IPOrigen, @Resultado);
    END TRY
    BEGIN CATCH
        -- Manejar errores
        DECLARE @ErrorMessage nvarchar(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;

