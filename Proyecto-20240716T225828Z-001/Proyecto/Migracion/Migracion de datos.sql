use TallerCuero_final;
go

-- Inserción de datos en la tabla Cat_Paises
insert into Cat_Paises (id_pais, nombre, abreviatura, codigoEntrada, nacionalidad)
values 
(31, 'Nicaragua', 'NIC', '+505', 'Nicaragüense'),
(32, 'Costa Rica', 'CRC', '+506', 'Costarricense');

-- Inserción de datos en la tabla Departamentos
insert into Departamentos (id_departamento, departamento, abreviatura, pais)
values 
(31, 'Managua', 'MGA', 31),
(32, 'San José', 'SJO', 32);

-- Inserción de datos en la tabla Municipios
insert into Municipios (id_municipio, municipio, abreviatura, departamento)
values 
(31, 'Managua', 'MGA', 31),
(32, 'Escazú', 'ESC', 32);

-- Inserción de datos en la tabla Ubicaciones
insert into Ubicaciones (id_ubicacion, direccion, municipio, codigoPostal, calle)
values 
(31, 'Avenida Bolivar', 31, 10000, 'Calle 1'),
(32, 'Barrio Escalante', 32, 20000, 'Calle 2');

-- Inserción de datos en la tabla Areas
insert into Areas (id_area, area)
values 
(31, 'Producción'),
(32, 'Ventas');

-- Inserción de datos en la tabla Cargos
insert into Cargos (id_cargo, area, cargo, abreviaturaCargo, descripcion)
values 
(31, 31, 'Operario', 'OPE', 'Operario de Producción'),
(32, 32, 'Vendedor', 'VEN', 'Vendedor de Tienda');

-- Inserción de datos en la tabla Sucursales
insert into Sucursales (id_sucursal, nombreSucursal, RUC, FechaConstitucion, ubicacion)
values 
(31, 'Sucursal Central', 'J03100000001', '2020-01-01', 31),
(32, 'Sucursal Escazú', 'J03100000002', '2021-01-01', 32);

-- Inserción de datos en la tabla Cat_TipoIdentificaciones
insert into Cat_TipoIdentificaciones (id_tipoIdentificacion, tipoID)
values 
(31, 'Cédula'),
(32, 'Pasaporte');

-- Inserción de datos en la tabla Identificaciones
insert into Identificaciones (id_identificacion, numeroIdentificacion, tipoIdentificacion, fechavencimiento)
values 
(31, '001-010101-0000A', 31, '2025-01-01'),
(32, '002-020202-0000B', 32, '2026-01-01');

-- Inserción de datos en la tabla Cat_Generos
insert into Cat_Generos (id_genero, genero)
values 
(31, 'Masculino'),
(32, 'Femenino');

-- Inserción de datos en la tabla Empleados
insert into Empleados (id_empleado, nombres, apellidos, inss, identificacion, genero)
values 
(31, 'Juan', 'Pérez', '123456', 31, 31),
(32, 'María', 'González', '654321', 32, 32);

-- Inserción de datos en la tabla Cat_Telefonos
insert into Cat_Telefonos (id_telefono, numeroArea, numeroTelefonico, tipo, habilitado)
values 
(31, '505', '88888888', 'Móvil', 1),
(32, '506', '99999999', 'Fijo', 1);

-- Inserción de datos en la tabla Empleados_Telefonos
insert into Empleados_Telefonos (id_empleado, id_telefono)
values 
(31, 31),
(32, 32);

-- Inserción de datos en la tabla DetallesEmpleado
insert into DetallesEmpleado (empleado, estadoCivil, ubicacion, estado, cargo, sucursal, correoElectronico)
values 
(31, 'Soltero', 31, 1, 31, 31, 'juan.perez@example.com'),
(32, 'Casada', 32, 1, 32, 32, 'maria.gonzalez@example.com');

-- Inserción de datos en la tabla DetallesSucursales
insert into DetallesSucursales (sucursal, horaApertura, horaCierre, encargadoSucursal, Telefono)
values 
(31, '08:00:00', '18:00:00', 31, 31),
(32, '09:00:00', '19:00:00', 32, 32);

-- Inserción de datos en la tabla HistorialCargosEmpleados
insert into HistorialCargosEmpleados (empleado, cargo, fechaAsignacion, fechaRevocacion, sucursal)
values 
(31, 31, '2022-01-01', '2023-01-01', 31),
(32, 32, '2022-02-01', '2023-02-01', 32);

-- Inserción de datos en la tabla HistorialEmpleados
insert into HistorialEmpleados (empleado, sucursal, cargo, fechaRegistro, fechaIngreso, fechaSalida)
values 
(31, 31, 31, '2022-01-01', '2022-01-01', '2023-01-01'),
(32, 32, 32, '2022-02-01', '2022-02-01', '2023-02-01');

-- Inserción de datos en la tabla Cat_Medidas
insert into Cat_Medidas (id_unidadMedida, nombreUnidad, abreviatura, unidad)
values 
(31, 'Centímetro', 'cm', 1.0),
(32, 'Metro', 'm', 100.0);

-- Inserción de datos en la tabla Cat_Colores
insert into Cat_Colores (id_color, color)
values 
(31, 'Rojo'),
(32, 'Azul');

-- Inserción de datos en la tabla Cat_Cueros
insert into Cat_Cueros (id_cuero, cuero, descripcion)
values 
(31, 'Cuero de Vaca', 'Cuero de alta calidad'),
(32, 'Cuero de Cabra', 'Cuero resistente');

-- Inserción de datos en la tabla Categorias
insert into Categorias (id_categoria, categoria)
values 
(31, 31),
(32, 32);

-- Inserción de datos en la tabla Subcategorias
insert into Subcategorias (id_subcategoria, subcategoria, categoria, descripcion)
values 
(31, 'Bolsos', 31, 'Bolsos de cuero'),
(32, 'Zapatos', 32, 'Zapatos de cuero');

-- Inserción de datos en la tabla Impuestos
insert into Impuestos (id_impuesto, impuesto, descripcionImp)
values 
(31, 15.0, 'IVA 15%'),
(32, 13.0, 'IVA 13%');

-- Inserción de datos en la tabla PresentacionProducto
insert into PresentacionProducto (id_presentacion, descripcion, abreviatura, subcategoria)
values 
(31, 'Presentación de lujo', 'LUX', 31),
(32, 'Presentación estándar', 'STD', 32);

-- Inserción de datos en la tabla Productos
insert into Productos (id_producto, nombre, color, cuero, imagenProducto)
values 
(31, 'Bolso Elegante', 31, 31, null),
(32, 'Zapato Formal', 32, 32, null);

-- Inserción de datos en la tabla Cat_Monedas
insert into Cat_Monedas (id_moneda, Abreviatura, NombreMoneda, Simbolo, Pais, TipoCambio)
values 
(31, 'NIO', 'Córdoba', 'C$', 31, 36.0),
(32, 'CRC', 'Colón', '₡', 32, 620.0);

-- Inserción de datos en la tabla Precios
insert into Precios (id_precio, producto, fechaInicio, fechaFin, precio, tipoMoneda)
values 
(31, 31, '20230101', '20231231', 100.0, 31),
(32, 32, '20230101', '20231231', 150.0, 32);

-- Inserción de datos en la tabla DetallesProductos
insert into DetallesProductos (producto, precio, dimensiones, presentacion)
values 
(31, 31, '30x20x10 cm', 31),
(32, 32, '40x25x15 cm', 32);
-- Inserción de datos en la tabla Proveedores
insert into Proveedores (id_proveedor, nombre, razon_social)
values 
(31, 'Proveedor 1', 'Proveedor 1 S.A.'),
(32, 'Proveedor 2', 'Proveedor 2 S.A.');

-- Inserción de datos en la tabla detalle_proveedor
insert into detalle_proveedor (id_prov, telefono, estado, Correo, id_direccion)
values 
(31, 1, 1, 'contacto1@proveedor.com', 1),
(32, 2, 1, 'contacto2@proveedor.com', 2);

-- Inserción de datos en la tabla Clientes
insert into Clientes (id_cliente, nombre, apellido)
values 
(31, 'Carlos', 'Méndez'),
(32, 'Ana', 'Ramírez');

-- Inserción de datos en la tabla Detalle_Cliente
INSERT INTO Detalle_Cliente (id_detalle_cliente, id_cliente, fecha_ultimo_contacto, Telefono, estado_cliente, direccion, talla_zapatos, medida_talla, talla_faldas, medida_faldas)
VALUES 
(31, 31, '2023-06-15', 1, 'Activo', 1, 1, 27.5, 1, 70.5),
(32, 32, '2023-07-10', 2, 'Inactivo', 2, 2, 25.0, 2, 75.0);

-- Inserción de datos en la tabla Favoritos
insert into Favoritos (cliente, producto)
values 
(31, 31),
(32, 32);

-- Inserción de datos en la tabla PlanesProduccionProductos
insert into PlanesProduccionProductos (id_planProduccion, Estilo, empleado, unidades, producto, fechaProduccion, descripcion, tiempoEstimadoMin, realizado)
values 
(31, 'Estilo Clásico', 1, 50, 31, '2023-03-01', 'Producción de 50 bolsos clásicos', '01:00:00', 0),
(32, 'Estilo Moderno', 2, 30, 32, '2023-04-01', 'Producción de 30 zapatos modernos', '00:45:00', 0);

-- Inserción de datos en la tabla Materiales
insert into Materiales (id_material, nombreMaterial, tipoMaterial, color, unidadMedida, id_cuero, proveedor, costo, fechaAdquisicion, cantidadDisponible, ubicacionAlmacen)
values 
(31, 'Cuero Premium', 'Cuero', 1, 1, 1, 31, 1, '2023-01-01', 500.0, 'Almacén A'),
(32, 'Cuero Básico', 'Cuero', 2, 2, 2, 32, 2, '2023-02-01', 300.0, 'Almacén B');

-- Inserción de datos en la tabla MaterialesUsadosPlanesProduccion
insert into MaterialesUsadosPlanesProduccion (planProduccion, material, cantidad, fechaHora)
values 
(31, 31, 25.0, '2023-03-01 08:00:00'),
(32, 32, 15.0, '2023-04-01 09:00:00');

-- Inserción de datos en la tabla Inventario
insert into Inventario (id_inventario, id_entidad, tipo_entidad, cantidad)
values 
(31, 31, 'Producto', 50.0),
(32, 32, 'Producto', 30.0);

-- Inserción de datos en la tabla venta
insert into venta (id_venta, Cliente, fechaVenta, subtotal)
values 
(31, 31, '2023-05-01', 5000.0),
(32, 32, '2023-06-01', 4500.0);

-- Inserción de datos en la tabla detalleventa
insert into detalleventa (id_venta, id_producto, Tipo_Mon, cantidad_vendida, precio_unitario)
values 
(31, 31, 1, 50.0, 100.0),
(32, 32, 2, 30.0, 150.0);

-- Inserción de datos en la tabla controlPago
insert into controlPago (id_controlPago, id_venta, Impuesto, total)
values 
(31, 31, 1, 5750.0),
(32, 32, 2, 5085.0);

-- Inserción de datos en la tabla Cajas
insert into Cajas (id_caja, nombreCaja, noCaja, Sucursal, tipoCaja, EstadoCaja)
values 
(31, 'Caja Principal', 1, 1, 'Efectivo', 'Activa'),
(32, 'Caja Secundaria', 2, 1, 'Mixta', 'Inactiva');


-- Inserción de datos en la tabla AperturasCajas
insert into AperturasCajas (id_apertura, caja, Empleado, fechaHoraApertura, Observaciones)
values 
(31, 31, 1, '2023-01-01 08:00:00', 'Apertura diaria'),
(32, 32, 2, '2023-01-02 08:00:00', 'Apertura especial');

-- Inserción de datos en la tabla DetalleAperturaCajas
insert into DetalleAperturaCajas (id_Apertura, DineroApertura, TipoMoneda, AprobadoPor)
values 
(31, 1000.0, 1, 'Gerente 1'),
(32, 1500.0, 2, 'Gerente 2');

-- Inserción de datos en la tabla ArqueoCaja
insert into ArqueoCaja (id_arqueo, Caja, FechaArqueo, TipoArqueo)
values 
(31, 31, '2023-03-01', 'Parcial'),
(32, 32, '2023-04-01', 'Total');

-- Inserción de datos en la tabla CierresCajas
insert into CierresCajas (id_cierre, Caja, fechaCierra, Empleado, Observaciones)
values 
(31, 31, '2023-01-01 18:00:00', 1, 'Cierre diario'),
(32, 32, '2023-01-02 18:00:00', 2, 'Cierre especial');

-- Inserción de datos en la tabla Transacciones
insert into Transacciones (id_transaccion, caja, cliente, tipo_transaccion, id_Venta, fechaHoraTransaccion, descripcion)
values 
(31, 31, 31, 'Venta', 31, '2023-01-01 09:00:00', 'Venta de productos'),
(32, 32, 32, 'Devolución', 32, '2023-01-02 10:00:00', 'Devolución de productos');

-- Inserción de datos en la tabla Usuarios
insert into Usuarios (id_usuario, ip, NombreUsuario, Empleado, ClaveHash, Habilitado)
values 
(31, '192.168.1.1', 'usuario1', 1, 'hash1', 1),
(32, '192.168.1.2', 'usuario2', 2, 'hash2', 1);

-- Inserción de datos en la tabla HistorialClaves
insert into HistorialClaves (Usuario, ClaveHash, ultimaFechaModificacion)
values 
(31, 'hash1', '2023-01-01'),
(32, 'hash2', '2023-02-01');

-- Inserción de datos en la tabla GruposUsuarios
insert into GruposUsuarios (id_grupo, NombreGrupo)
values 
(31, 'Administradores'),
(32, 'Usuarios');

-- Inserción de datos en la tabla UsuariosGrupos
insert into UsuariosGrupos (id_usuario, id_grupo)
values 
(31, 31),
(32, 32);

-- Inserción de datos en la tabla Cat_TipoConexiones
insert into Cat_TipoConexiones (id_tipoConexion, tipoConexion, ipLocal, Pais)
values 
(31, 'WiFi', '192.168.1.1', 'NIC'),
(32, 'Ethernet', '192.168.1.2', 'CRC');

-- Inserción de datos en la tabla Conexiones
insert into Conexiones (id_conexion, TipoConexion, NombreHost, EstadoConexion, FechaHoraInicio, FechaHoraFin)
values 
(31, 31, 'Host1', 1, '2023-01-01 08:00:00', '2023-01-01 17:00:00'),
(32, 32, 'Host2', 1, '2023-01-02 08:00:00', '2023-01-02 17:00:00');

-- Inserción de datos en la tabla HistorialSesiones
insert into HistorialSesiones (id_historial, id_Session, Usuario, FechaInicio, FechaSalida, IPOrigen, Resultado)
values 
(31, 31, 31, '2023-01-01 08:00:00', '2023-01-01 17:00:00', '192.168.1.1', 'Éxito'),
(32, 32, 32, '2023-01-02 08:00:00', '2023-01-02 17:00:00', '192.168.1.2', 'Éxito');

-- Inserción de datos en la tabla TablaControlSessiones
insert into TablaControlSessiones (id_sesiones, Usuario, FechaInicio, FechaSalida, Conexion)
values 
(31, 31, '2023-01-01 08:00:00', '2023-01-01 17:00:00', 31),
(32, 32, '2023-01-02 08:00:00', '2023-01-02 17:00:00', 32);

-- Inserción de datos en la tabla ListaBlanca
insert into ListaBlanca (id_ip, usuario, habilitada)
values 
(31, 31, 1),
(32, 32, 1);
