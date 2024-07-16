/****** Generando el script de la configuración de replicación. Fecha del script: 17/05/2024 12:11:17 ******/
/****** Tenga en cuenta que, por motivos de seguridad, se asignó el valor Null o una cadena vacía a todos los parámetros de contraseña. ******/

/****** Instalando el servidor como distribuidor. Fecha del script: 17/05/2024 12:11:17 ******/
use master
exec sp_adddistributor @distributor = N'DESKTOP-SQQF78L', @password = N''
GO
exec sp_adddistributiondb @database = N'Distribuidotaller', @data_folder = N'D:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Data', @log_folder = N'D:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Data', @log_file_size = 2, @min_distretention = 0, @max_distretention = 72, @history_retention = 48, @deletebatchsize_xact = 5000, @deletebatchsize_cmd = 2000, @security_mode = 1
GO

use [Distribuidotaller] 
if (not exists (select * from sysobjects where name = 'UIProperties' and type = 'U ')) 
	create table UIProperties(id int) 
if (exists (select * from ::fn_listextendedproperty('SnapshotFolder', 'user', 'dbo', 'table', 'UIProperties', null, null))) 
	EXEC sp_updateextendedproperty N'SnapshotFolder', N'D:\replic', 'user', dbo, 'table', 'UIProperties' 
else 
	EXEC sp_addextendedproperty N'SnapshotFolder', N'D:\replic', 'user', dbo, 'table', 'UIProperties'
GO

exec sp_adddistpublisher @publisher = N'DESKTOP-SQQF78L', @distribution_db = N'Distribuidotaller', @security_mode = 1, @working_directory = N'D:\replic', @trusted = N'false', @thirdparty_flag = 0, @publisher_type = N'MSSQLSERVER'
GO
