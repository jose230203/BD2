--logins
USE [master]
GO
CREATE LOGIN [Gerente administrativo] WITH PASSWORD=N'1234', DEFAULT_DATABASE=[tallercuero], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
CREATE LOGIN [Dise�ador Jefe] WITH PASSWORD=N'1234', DEFAULT_DATABASE=[tallercuero], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
CREATE LOGIN [Gerente de ventas] WITH PASSWORD=N'1234', DEFAULT_DATABASE=[tallercuero], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
CREATE LOGIN [Gerente producci�n] WITH PASSWORD=N'1234', DEFAULT_DATABASE=[tallercuero], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
CREATE LOGIN [contadores] WITH PASSWORD=N'1234', DEFAULT_DATABASE=[tallercuero], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
CREATE LOGIN [Dise�adores de productos] WITH PASSWORD=N'1234', DEFAULT_DATABASE=[tallercuero], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
CREATE LOGIN [Representantes de ventas] WITH PASSWORD=N'1234', DEFAULT_DATABASE=[tallercuero], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
CREATE LOGIN [Artesanos] WITH PASSWORD=N'1234', DEFAULT_DATABASE=[tallercuero], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
CREATE LOGIN [Ayudantes de produccion] WITH PASSWORD=N'1234', DEFAULT_DATABASE=[tallercuero], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
--users
USE [tallercuero]
GO
CREATE USER [Gerente administrativo] FOR LOGIN [Gerente administrativo]
GO
CREATE USER [Dise�ador Jefe] FOR LOGIN [Dise�ador Jefe]
GO
CREATE USER [Gerente de ventas] FOR LOGIN [Gerente de ventas]
GO
CREATE USER [Gerente producci�n] FOR LOGIN [Gerente producci�n]
GO
CREATE USER [contadores] FOR LOGIN [contadores]
GO
CREATE USER [Dise�adores de productos] FOR LOGIN [Dise�adores de productos]
GO
CREATE USER [Representantes de ventas] FOR LOGIN [Representantes de ventas]
GO
CREATE USER [Artesanos] FOR LOGIN [Artesanos]
GO
CREATE USER [Ayudantes de produccion] FOR LOGIN [Ayudantes de produccion]
GO
--permisos
use [tallercuero]
GO
GRANT SELECT ON [dbo].[UsuariosGrupos] TO [Gerente administrativo]
GO
use [tallercuero]
GO
GRANT SELECT ON [dbo].[Usuarios] TO [Gerente administrativo]
GO
use [tallercuero]
GO
GRANT UPDATE ON [dbo].[HistorialCierresCajas] TO [Gerente administrativo]
GO
use [tallercuero]
GO
GRANT INSERT ON [dbo].[HistorialCierresCajas] TO [Gerente administrativo]
GO
use [tallercuero]
GO
GRANT SELECT ON [dbo].[HistorialCierresCajas] TO [Gerente administrativo]
GO
use [tallercuero]
GO
GRANT SELECT ON [dbo].[HistorialSesiones] TO [Gerente administrativo]
GO
use [tallercuero]
GO
GRANT UPDATE ON [dbo].[Cajas] TO [Gerente administrativo]
GO
use [tallercuero]
GO
GRANT DELETE ON [dbo].[Cajas] TO [Gerente administrativo]
GO
use [tallercuero]
GO
GRANT INSERT ON [dbo].[Cajas] TO [Gerente administrativo]
GO
use [tallercuero]
GO
GRANT SELECT ON [dbo].[Cajas] TO [Gerente administrativo]
GO
use [tallercuero]
GO
GRANT UPDATE ON [dbo].[HistorialClaves] TO [Gerente administrativo]
GO
use [tallercuero]
GO
GRANT UPDATE ON [dbo].[Transacciones] TO [Gerente administrativo]
GO
use [tallercuero]
GO
GRANT INSERT ON [dbo].[Transacciones] TO [Gerente administrativo]
GO
use [tallercuero]
GO
GRANT SELECT ON [dbo].[Transacciones] TO [Gerente administrativo]
GO
use [tallercuero]
GO
GRANT UPDATE ON [dbo].[venta] TO [Gerente administrativo]
GO
use [tallercuero]
GO
GRANT INSERT ON [dbo].[venta] TO [Gerente administrativo]
GO
use [tallercuero]
GO
GRANT SELECT ON [dbo].[venta] TO [Gerente administrativo]
GO
use [tallercuero]
GO
GRANT UPDATE ON [dbo].[detalleventa] TO [Gerente administrativo]
GO
use [tallercuero]
GO
GRANT INSERT ON [dbo].[detalleventa] TO [Gerente administrativo]
GO
use [tallercuero]
GO
GRANT SELECT ON [dbo].[detalleventa] TO [Gerente administrativo]
GO
use [tallercuero]
GO
GRANT UPDATE ON [dbo].[HistorialAperturasCajas] TO [Gerente administrativo]
GO
use [tallercuero]
GO
GRANT INSERT ON [dbo].[HistorialAperturasCajas] TO [Gerente administrativo]
GO

GRANT UPDATE ON [dbo].[Usuarios] TO [Gerente administrativo]
GO
GRANT DELETE ON [dbo].[Usuarios] TO [Gerente administrativo]
GO
GRANT INSERT ON [dbo].[Usuarios] TO [Gerente administrativo]
GO
GRANT ALTER ON [dbo].[Usuarios] TO [Gerente administrativo]
GO



use [tallercuero]
GO
GRANT SELECT ON [dbo].[UsuariosGrupos] TO [Gerente de ventas]
GO

GRANT SELECT ON [dbo].[Usuarios] TO [Gerente de ventas]
GO

GRANT UPDATE ON [dbo].[HistorialCierresCajas] TO [Gerente de ventas]
GO

GRANT INSERT ON [dbo].[HistorialCierresCajas] TO [Gerente de ventas]
GO

GRANT SELECT ON [dbo].[HistorialCierresCajas] TO [Gerente de ventas]
GO

GRANT SELECT ON [dbo].[HistorialSesiones] TO [Gerente de ventas]
GO

GRANT UPDATE ON [dbo].[Cajas] TO [Gerente de ventas]
GO

GRANT DELETE ON [dbo].[Cajas] TO [Gerente de ventas]
GO

GRANT INSERT ON [dbo].[Cajas] TO [Gerente de ventas]
GO

GRANT SELECT ON [dbo].[Cajas] TO [Gerente de ventas]
GO

GRANT UPDATE ON [dbo].[HistorialClaves] TO [Gerente de ventas]
GO

GRANT UPDATE ON [dbo].[Transacciones] TO [Gerente de ventas]
GO

GRANT INSERT ON [dbo].[Transacciones] TO [Gerente de ventas]
GO

GRANT SELECT ON [dbo].[Transacciones] TO [Gerente de ventas]
GO

GRANT UPDATE ON [dbo].[venta] TO [Gerente de ventas]
GO

GRANT INSERT ON [dbo].[venta] TO [Gerente de ventas]
GO

GRANT SELECT ON [dbo].[venta] TO [Gerente de ventas]
GO

GRANT UPDATE ON [dbo].[detalleventa] TO [Gerente de ventas]
GO

GRANT INSERT ON [dbo].[detalleventa] TO [Gerente de ventas]
GO

GRANT SELECT ON [dbo].[detalleventa] TO [Gerente de ventas]
GO

GRANT UPDATE ON [dbo].[HistorialAperturasCajas] TO [Gerente de ventas]
GO

GRANT INSERT ON [dbo].[HistorialAperturasCajas] TO [Gerente de ventas]
GO


GRANT UPDATE ON [dbo].[MaterialesUsadosPlanesProduccion] TO [Gerente producci�n]
GO

GRANT DELETE ON [dbo].[MaterialesUsadosPlanesProduccion] TO [Gerente producci�n]
GO

GRANT INSERT ON [dbo].[MaterialesUsadosPlanesProduccion] TO [Gerente producci�n]
GO

GRANT ALTER ON [dbo].[MaterialesUsadosPlanesProduccion] TO [Gerente producci�n]
GO

GRANT SELECT ON [dbo].[MaterialesUsadosPlanesProduccion] TO [Gerente producci�n]
GO

GRANT UPDATE ON [dbo].[Inventario] TO [Gerente producci�n]
GO

GRANT CONTROL ON [dbo].[Inventario] TO [Gerente producci�n]
GO

GRANT DELETE ON [dbo].[Inventario] TO [Gerente producci�n]
GO

GRANT INSERT ON [dbo].[Inventario] TO [Gerente producci�n]
GO

GRANT SELECT ON [dbo].[Inventario] TO [Gerente producci�n]
GO

GRANT UPDATE ON [dbo].[Cat_Paises] TO [Gerente producci�n]
GO

GRANT DELETE ON [dbo].[Cat_Paises] TO [Gerente producci�n]
GO

GRANT INSERT ON [dbo].[Cat_Paises] TO [Gerente producci�n]
GO

GRANT ALTER ON [dbo].[Cat_Paises] TO [Gerente producci�n]
GO

GRANT SELECT ON [dbo].[Cat_Paises] TO [Gerente producci�n]
GO

GRANT UPDATE ON [dbo].[Cat_Cueros] TO [Gerente producci�n]
GO

GRANT DELETE ON [dbo].[Cat_Cueros] TO [Gerente producci�n]
GO

GRANT INSERT ON [dbo].[Cat_Cueros] TO [Gerente producci�n]
GO
use [tallercuero]
GO
GRANT ALTER ON [dbo].[Cat_Cueros] TO [Gerente producci�n]
GO

GRANT SELECT ON [dbo].[Cat_Cueros] TO [Gerente producci�n]
GO

GRANT UPDATE ON [dbo].[DetallesProductos] TO [Gerente producci�n]
GO

GRANT DELETE ON [dbo].[DetallesProductos] TO [Gerente producci�n]
GO

GRANT INSERT ON [dbo].[DetallesProductos] TO [Gerente producci�n]
GO

GRANT ALTER ON [dbo].[DetallesProductos] TO [Gerente producci�n]
GO

GRANT SELECT ON [dbo].[DetallesProductos] TO [Gerente producci�n]
GO

GRANT UPDATE ON [dbo].[Materiales] TO [Gerente producci�n]
GO

GRANT DELETE ON [dbo].[Materiales] TO [Gerente producci�n]
GO

GRANT INSERT ON [dbo].[Materiales] TO [Gerente producci�n]
GO

GRANT ALTER ON [dbo].[Materiales] TO [Gerente producci�n]
GO

GRANT SELECT ON [dbo].[Materiales] TO [Gerente producci�n]
GO

GRANT UPDATE ON [dbo].[Productos] TO [Gerente producci�n]
GO

GRANT DELETE ON [dbo].[Productos] TO [Gerente producci�n]
GO

GRANT INSERT ON [dbo].[Productos] TO [Gerente producci�n]
GO

GRANT ALTER ON [dbo].[Productos] TO [Gerente producci�n]
GO

GRANT SELECT ON [dbo].[Productos] TO [Gerente producci�n]
GO

GRANT UPDATE ON [dbo].[Categorias] TO [Gerente producci�n]
GO

GRANT DELETE ON [dbo].[Categorias] TO [Gerente producci�n]
GO

GRANT INSERT ON [dbo].[Categorias] TO [Gerente producci�n]
GO

GRANT ALTER ON [dbo].[Categorias] TO [Gerente producci�n]
GO

GRANT SELECT ON [dbo].[Categorias] TO [Gerente producci�n]
GO

GRANT UPDATE ON [dbo].[Cat_Medidas] TO [Gerente producci�n]
GO

GRANT DELETE ON [dbo].[Cat_Medidas] TO [Gerente producci�n]
GO

GRANT INSERT ON [dbo].[Cat_Medidas] TO [Gerente producci�n]
GO

GRANT ALTER ON [dbo].[Cat_Medidas] TO [Gerente producci�n]
GO

GRANT SELECT ON [dbo].[Cat_Medidas] TO [Gerente producci�n]
GO

GRANT UPDATE ON [dbo].[PlanesProduccionProductos] TO [Gerente producci�n]
GO

GRANT DELETE ON [dbo].[PlanesProduccionProductos] TO [Gerente producci�n]
GO

GRANT INSERT ON [dbo].[PlanesProduccionProductos] TO [Gerente producci�n]
GO

GRANT ALTER ON [dbo].[PlanesProduccionProductos] TO [Gerente producci�n]
GO

GRANT SELECT ON [dbo].[PlanesProduccionProductos] TO [Gerente producci�n]
GO

GRANT UPDATE ON [dbo].[Cat_Colores] TO [Gerente producci�n]
GO

GRANT DELETE ON [dbo].[Cat_Colores] TO [Gerente producci�n]
GO

GRANT INSERT ON [dbo].[Cat_Colores] TO [Gerente producci�n]
GO
GRANT ALTER ON [dbo].[Cat_Colores] TO [Gerente producci�n]
GO

GRANT SELECT ON [dbo].[Cat_Colores] TO [Gerente producci�n]
GO
