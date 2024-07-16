USE [tallercuero]
GO
CREATE USER [Vendedores] FOR LOGIN [Vendedor1]
GO
use [tallercuero]
GO
GRANT UPDATE ON [dbo].[venta] TO [Vendedores]
GO
use [tallercuero]
GO
GRANT INSERT ON [dbo].[venta] TO [Vendedores]
GO
use [tallercuero]
GO
GRANT UPDATE ON [dbo].[Cajas] TO [Vendedores]
GO
use [tallercuero]
GO
GRANT INSERT ON [dbo].[Cajas] TO [Vendedores]
GO
use [tallercuero]
GO
GRANT UPDATE ON [dbo].[detalleventa] TO [Vendedores]
GO
use [tallercuero]
GO
GRANT INSERT ON [dbo].[detalleventa] TO [Vendedores]
GO
