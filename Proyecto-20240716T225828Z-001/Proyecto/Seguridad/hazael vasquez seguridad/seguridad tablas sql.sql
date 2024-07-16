CREATE DATABASE seguridadtablas;
GO

USE seguridadtablas;

CREATE TABLE Usuarios(
   id_usuario INT PRIMARY KEY,
   NombreUsuario NVARCHAR(50) NOT NULL,
   Empleado NVARCHAR(50) NOT NULL, 
   ClaveHash NVARCHAR(64) NOT NULL,
   Habilitado BIT NOT NULL
);

CREATE TABLE HistorialClaves(
   Usuario INT,
   ClaveHash NVARCHAR(64),
   ultimaFechaModificacion DATETIME NOT NULL,
   FOREIGN KEY (Usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE GruposUsuarios(
   id_grupo INT PRIMARY KEY,
   NombreGrupo NVARCHAR(50) NOT NULL
);

CREATE TABLE UsuariosGrupos(
   id_usuario INT,
   id_grupo INT,
   PRIMARY KEY(id_usuario, id_grupo),
   FOREIGN KEY(id_usuario) REFERENCES Usuarios(id_usuario),
   FOREIGN KEY(id_grupo) REFERENCES GruposUsuarios(id_grupo)
);

CREATE TABLE Cat_TipoConexiones(
   id_tipoConexion INT PRIMARY KEY,
   tipoConexion NVARCHAR(30) NOT NULL,
   ipLocal NVARCHAR(15) NOT NULL,
   Pais CHAR(4) NOT NULL
);

CREATE TABLE Conexiones(
   id_conexion INT PRIMARY KEY,
   TipoConexion INT NOT NULL,
   NombreHost NVARCHAR(15) NOT NULL,
   EstadoConexion BIT DEFAULT 1,
   FechaHoraInicio DATETIME DEFAULT GETDATE(), 
   FechaHoraFin DATETIME, 
   FOREIGN KEY (TipoConexion) REFERENCES Cat_TipoConexiones(id_tipoConexion)
);

CREATE TABLE HistorialSesiones(
   id_historial INT PRIMARY KEY,
   id_Session INT,
   Usuario INT,
   FechaInicio DATETIME NOT NULL,
   FechaSalida DATETIME,
   IPOrigen NVARCHAR(45),
   Resultado NVARCHAR(20),
   FOREIGN KEY (id_Session) REFERENCES Conexiones(id_conexion), 
   FOREIGN KEY (Usuario) REFERENCES Usuarios(id_usuario)
);

CREATE TABLE TablaControlSessiones(
   id_sesiones INT PRIMARY KEY,
   Usuario INT NOT NULL,
   FechaInicio DATETIME NOT NULL,
   FechaSalida DATETIME,
   Conexion INT NOT NULL,
   FOREIGN KEY (Conexion) REFERENCES Conexiones(id_conexion),
   FOREIGN KEY (Usuario) REFERENCES Usuarios(id_usuario)
);

CREATE INDEX idx_NombreUsuario ON Usuarios (NombreUsuario);
CREATE INDEX idx_Usuario ON HistorialClaves (Usuario);
CREATE INDEX idx_Usuario_TablaControl ON TablaControlSessiones (Usuario);
CREATE INDEX idx_TipoConexion ON Conexiones (TipoConexion);
GO

CREATE PROCEDURE sp_InsertarUsuario
    @NombreUsuario NVARCHAR(50),
    @Empleado NVARCHAR(50), 
    @ClaveAcceso NVARCHAR(64),
    @Habilitado BIT
AS
BEGIN
    BEGIN TRY
        IF NOT EXISTS (SELECT 1 FROM Usuarios WHERE NombreUsuario = @NombreUsuario)
        BEGIN
            IF NOT EXISTS (SELECT 1 FROM Usuarios WHERE Empleado = @Empleado)
            BEGIN
                INSERT INTO Usuarios (NombreUsuario, Empleado, ClaveHash, Habilitado)
                VALUES (@NombreUsuario, @Empleado, HASHBYTES('SHA2_256', @ClaveAcceso), @Habilitado);

                INSERT INTO HistorialClaves (Usuario, ClaveHash, ultimaFechaModificacion)
                VALUES (SCOPE_IDENTITY(), HASHBYTES('SHA2_256', @ClaveAcceso), GETDATE());
            END
            ELSE
            BEGIN
                RAISERROR ('El empleado ya existe', 16, 1);
            END
        END
        ELSE
        BEGIN
            RAISERROR ('El nombre de usuario ya existe', 16, 1);
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;
GO

CREATE PROCEDURE sp_CambiarClave
    @NombreUsuario NVARCHAR(50),
    @ClaveAccesoAntigua NVARCHAR(64),
    @ClaveAccesoNueva NVARCHAR(64)
AS
BEGIN
    BEGIN TRY
        IF EXISTS (SELECT 1 FROM Usuarios WHERE NombreUsuario = @NombreUsuario)
        BEGIN
            IF HASHBYTES('SHA2_256', @ClaveAccesoAntigua) = (SELECT ClaveHash FROM Usuarios WHERE NombreUsuario = @NombreUsuario)
            BEGIN
                IF HASHBYTES('SHA2_256', @ClaveAccesoNueva) <> HASHBYTES('SHA2_256', @ClaveAccesoAntigua)
                BEGIN
                    UPDATE Usuarios
                    SET ClaveHash = HASHBYTES('SHA2_256', @ClaveAccesoNueva)
                    WHERE NombreUsuario = @NombreUsuario;

                    INSERT INTO HistorialClaves (Usuario, ClaveHash, ultimaFechaModificacion)
                    VALUES ((SELECT id_usuario FROM Usuarios WHERE NombreUsuario = @NombreUsuario), HASHBYTES('SHA2_256', @ClaveAccesoNueva), GETDATE());
                END
                ELSE
                BEGIN
                    RAISERROR ('La contraseña nueva es igual a la contraseña antigua', 16, 1);
                END
            END
            ELSE
            BEGIN
                RAISERROR ('La contraseña antigua es incorrecta', 16, 1);
            END
        END
        ELSE
        BEGIN
            RAISERROR ('El nombre de usuario no existe', 16, 1);
        END
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000);
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
    DECLARE @UsuarioId INT
    SELECT @UsuarioId = id_usuario FROM Usuarios WHERE NombreUsuario = @NombreUsuario AND ClaveHash = HASHBYTES('SHA2_256', @Clave)

    IF @UsuarioId IS NOT NULL
    BEGIN
        DECLARE @ConexionId INT
        SELECT @ConexionId = id_conexion FROM Conexiones WHERE TipoConexion = 'INICIO_SESION' AND NombreHost = HOST_NAME()

        IF @ConexionId IS NULL
        BEGIN
            INSERT INTO Conexiones (TipoConexion, NombreHost, FechaHoraInicio) VALUES ('INICIO_SESION', HOST_NAME(), GETDATE())
        END
        ELSE
        BEGIN
            UPDATE Conexiones SET FechaHoraFin = GETDATE() WHERE id_conexion = @ConexionId
        END

        SELECT 'INICIO_SESION_EXITOSO'
    END
    ELSE
    BEGIN
        SELECT 'NO_SE_PUDO_INICIAR_SESION'
    END
END;

CREATE PROCEDURE sp_InsertarHistorialInicioSesion
    @id_conexion INT,
    @Usuario INT,
    @FechaInicio DATETIME,
    @FechaSalida DATETIME,
    @IPOrigen NVARCHAR(45),
    @Resultado NVARCHAR(20)
AS
BEGIN
    BEGIN TRY
        INSERT INTO HistorialSesiones (id_Session, Usuario, FechaInicio, FechaSalida, IPOrigen, Resultado)
        VALUES (@id_conexion, @Usuario, @FechaInicio, @FechaSalida, @IPOrigen, @Resultado);
    END TRY
    BEGIN CATCH
        DECLARE @ErrorMessage NVARCHAR(4000);
        SET @ErrorMessage = ERROR_MESSAGE();
        RAISERROR (@ErrorMessage, 16, 1);
    END CATCH
END;
