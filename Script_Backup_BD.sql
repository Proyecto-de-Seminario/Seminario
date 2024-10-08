CREATE DATABASE tiendaLCDE
GO
USE [tiendaLCDE]
GO
/****** Object:  Table [dbo].[auditoria]    Script Date: 06/06/2023 22:29:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auditoria](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NOT NULL,
	[hora] [time](7) NOT NULL,
	[tipo_transaccion] [varchar](150) NOT NULL,
	[descripcion] [varchar](max) NOT NULL,
	[usuario] [varchar](150) NOT NULL,
 CONSTRAINT [PK__auditori__3213E83F1914763C] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[caja]    Script Date: 06/06/2023 22:29:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[caja](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero_caja] [int] NOT NULL,
	[monto_ultimo_cierre] [decimal](16, 2) NOT NULL,
	[estado] [varchar](50) NOT NULL,
 CONSTRAINT [PK__caja__3213E83FF0CBB370] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[categoria_productos]    Script Date: 06/06/2023 22:29:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[categoria_productos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 06/06/2023 22:29:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[clientes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](150) NOT NULL,
	[direccion] [varchar](max) NOT NULL,
	[telefono] [int] NULL,
	[correo] [varchar](150) NULL,
	[NIT] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[despacho]    Script Date: 06/06/2023 22:29:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[despacho](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_encabezado_factura] [int] NOT NULL,
	[fecha_despacho] [datetime] NOT NULL,
	[estado] [varchar](50) NOT NULL,
 CONSTRAINT [PK_despacho] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[detalle_factura]    Script Date: 06/06/2023 22:29:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[detalle_factura](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[subtotal] [decimal](16, 2) NOT NULL,
	[cantidad] [int] NOT NULL,
	[id_producto] [int] NOT NULL,
	[id_encabezado_factura] [int] NOT NULL,
	[descuento] [decimal](16, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[devoluciones]    Script Date: 06/06/2023 22:29:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[devoluciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cantidad] [int] NOT NULL,
	[motivo] [varchar](max) NOT NULL,
	[id_producto] [int] NOT NULL,
	[fecha] [date] NULL,
	[tipo_devolucion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[encabezado_factura]    Script Date: 06/06/2023 22:29:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[encabezado_factura](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[serie] [varchar](150) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[id_tipo_pago] [int] NOT NULL,
	[id_cliente] [int] NOT NULL,
 CONSTRAINT [PK__encabeza__3213E83F5228E1D7] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[precios_producto]    Script Date: 06/06/2023 22:29:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[precios_producto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[id_producto] [int] NOT NULL,
	[precio_unidad] [decimal](16, 2) NOT NULL,
	[descuento_producto] [decimal](16, 2) NULL,
	[fecha_modificacion_precio] [datetime] NULL,
 CONSTRAINT [PK_precios_producto] PRIMARY KEY CLUSTERED 
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productos]    Script Date: 06/06/2023 22:29:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[detalle] [varchar](max) NOT NULL,
	[existencia] [int] NOT NULL,
	[id_categoria] [int] NOT NULL,
	[id_proveedor] [int] NOT NULL,
	[id_promocion] [int] NULL,
 CONSTRAINT [PK__producto__3213E83F7DA98DEF] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[promociones]    Script Date: 06/06/2023 22:29:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[promociones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[proveedores]    Script Date: 06/06/2023 22:29:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proveedores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](150) NOT NULL,
	[direccion] [varchar](max) NOT NULL,
	[telefono] [int] NOT NULL,
	[Correo] [varchar](150) NULL,
	[NIT] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Registro_de_caja]    Script Date: 06/06/2023 22:29:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registro_de_caja](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[turno] [int] NOT NULL,
	[id_caja] [int] NOT NULL,
	[id_usuario] [varchar](150) NOT NULL,
	[tipo_registro] [varchar](20) NOT NULL,
	[monto] [decimal](16, 2) NOT NULL,
 CONSTRAINT [PK__Registro__3213E83FB4EE6748] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipo_pago]    Script Date: 06/06/2023 22:29:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_pago](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](100) NOT NULL,
 CONSTRAINT [PK_tipo_pago] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usuarios]    Script Date: 06/06/2023 22:29:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usuarios](
	[id] [varchar](150) NOT NULL,
	[nombre_usuario] [varchar](100) NOT NULL,
	[contrasennia] [varchar](max) NOT NULL,
	[correo] [varchar](150) NOT NULL,
 CONSTRAINT [PK__usuarios__3213E83F4C3D9306] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  View [dbo].[DevolucionesPorCategoria]    Script Date: 06/06/2023 22:29:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DevolucionesPorCategoria] AS
SELECT
categoria_productos.nombre AS Categoria,
devoluciones.cantidad AS CantidadDevuelta,
detalle_factura.cantidad  AS CantidadVendida,
detalle_factura.subtotal AS MontoVendido
FROM detalle_factura
INNER JOIN devoluciones ON detalle_factura.id_producto=devoluciones.id_producto
INNER JOIN categoria_productos ON devoluciones.id_producto=categoria_productos.id
GO
/****** Object:  View [dbo].[Reporte_Diario_Venta_por_Categoria]    Script Date: 06/06/2023 22:29:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE VIEW [dbo].[Reporte_Diario_Venta_por_Categoria] AS 
	SELECT
	categoria_productos.nombre AS Categoria,
	CAST(encabezado_factura.fecha AS DATE) AS Fecha,
	SUM(detalle_factura.cantidad) AS CantidadVendida,
	SUM(detalle_factura.subtotal) AS MontoVendido,
	SUM(detalle_factura.descuento) AS MontoDescuento
	FROM detalle_factura 
	INNER JOIN productos ON detalle_factura.id_producto=productos.id
	INNER JOIN encabezado_factura ON encabezado_factura.id=detalle_factura.id_encabezado_factura
	INNER JOIN categoria_productos ON productos.id_categoria=categoria_productos.id
	GROUP BY categoria_productos.nombre, CAST(encabezado_factura.fecha AS DATE)
GO
/****** Object:  View [dbo].[ReporteCorteCajaPorTurno]    Script Date: 06/06/2023 22:29:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ReporteCorteCajaPorTurno] AS
	SELECT 
	Registro_de_caja.fecha AS Fecha,
	Registro_de_caja.turno	AS Turno,
	caja.numero_caja AS NumeroDeCaja,
	SUM(Registro_de_caja.monto) AS MontoVendido
	FROM Registro_de_caja
	INNER JOIN caja ON Registro_de_caja.id_caja=caja.id
	GROUP BY Registro_de_caja.fecha, Registro_de_caja.turno, caja.numero_caja
GO
/****** Object:  View [dbo].[ReporteDevolucionesPorCategoria]    Script Date: 06/06/2023 22:29:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ReporteDevolucionesPorCategoria] AS
SELECT
categoria_productos.nombre AS Categoria,
devoluciones.cantidad AS CantidadDevuelta,
devoluciones.motivo AS Motivo,
devoluciones.fecha AS Fecha
FROM devoluciones
INNER JOIN productos ON devoluciones.id_producto=productos.id
INNER JOIN categoria_productos ON productos.id_categoria=categoria_productos.id
GO
/****** Object:  View [dbo].[ReporteVentasPorCategoria]    Script Date: 06/06/2023 22:29:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ReporteVentasPorCategoria] AS
SELECT
categoria_productos.nombre AS Categoria,
productos.detalle AS Producto,
detalle_factura.cantidad  AS CantidadVendida,
detalle_factura.subtotal AS MontoVendido,
CAST(encabezado_factura.fecha AS DATE) AS Fecha
FROM detalle_factura
INNER JOIN productos ON detalle_factura.id_producto=productos.id
INNER JOIN categoria_productos ON productos.id_categoria=categoria_productos.id
INNER JOIN encabezado_factura ON encabezado_factura.id=detalle_factura.id_encabezado_factura
GO
SET IDENTITY_INSERT [dbo].[auditoria] ON 

INSERT [dbo].[auditoria] ([id], [fecha], [hora], [tipo_transaccion], [descripcion], [usuario]) VALUES (2, CAST(N'2023-06-03' AS Date), CAST(N'05:23:55.2166667' AS Time), N'INSERT', N'DEVOLUCION CREADA NO.12', N'sa')
INSERT [dbo].[auditoria] ([id], [fecha], [hora], [tipo_transaccion], [descripcion], [usuario]) VALUES (3, CAST(N'2023-06-03' AS Date), CAST(N'05:27:33.3900000' AS Time), N'DELETE', N'DEVOLUCION BORRADA NO.12', N'sa')
INSERT [dbo].[auditoria] ([id], [fecha], [hora], [tipo_transaccion], [descripcion], [usuario]) VALUES (4, CAST(N'2023-06-03' AS Date), CAST(N'05:37:58.8733333' AS Time), N'INSERT', N'VENTA CREADA NO.94', N'sa')
INSERT [dbo].[auditoria] ([id], [fecha], [hora], [tipo_transaccion], [descripcion], [usuario]) VALUES (5, CAST(N'2023-06-03' AS Date), CAST(N'06:09:12.1100000' AS Time), N'INSERT', N'VENTA CREADA NO.95', N'sa')
INSERT [dbo].[auditoria] ([id], [fecha], [hora], [tipo_transaccion], [descripcion], [usuario]) VALUES (6, CAST(N'2023-06-03' AS Date), CAST(N'06:11:03.9600000' AS Time), N'INSERT', N'VENTA CREADA NO.96', N'sa')
INSERT [dbo].[auditoria] ([id], [fecha], [hora], [tipo_transaccion], [descripcion], [usuario]) VALUES (7, CAST(N'2023-06-03' AS Date), CAST(N'06:11:14.1166667' AS Time), N'INSERT', N'CAJA CEDRRADA NO.47', N'sa')
INSERT [dbo].[auditoria] ([id], [fecha], [hora], [tipo_transaccion], [descripcion], [usuario]) VALUES (8, CAST(N'2023-06-03' AS Date), CAST(N'07:41:03.3500000' AS Time), N'INSERT', N'VENTA CREADA NO.97', N'sa')
INSERT [dbo].[auditoria] ([id], [fecha], [hora], [tipo_transaccion], [descripcion], [usuario]) VALUES (9, CAST(N'2023-06-03' AS Date), CAST(N'07:41:24.0933333' AS Time), N'INSERT', N'CAJA CEDRRADA NO.48', N'sa')
INSERT [dbo].[auditoria] ([id], [fecha], [hora], [tipo_transaccion], [descripcion], [usuario]) VALUES (10, CAST(N'2023-06-03' AS Date), CAST(N'07:44:19.0866667' AS Time), N'INSERT', N'DEVOLUCION CREADA NO.13', N'sa')
INSERT [dbo].[auditoria] ([id], [fecha], [hora], [tipo_transaccion], [descripcion], [usuario]) VALUES (11, CAST(N'2023-06-03' AS Date), CAST(N'07:44:31.5766667' AS Time), N'DELETE', N'DEVOLUCION BORRADA NO.13', N'sa')
INSERT [dbo].[auditoria] ([id], [fecha], [hora], [tipo_transaccion], [descripcion], [usuario]) VALUES (12, CAST(N'2023-06-03' AS Date), CAST(N'07:45:04.7100000' AS Time), N'INSERT', N'VENTA CREADA NO.98', N'sa')
INSERT [dbo].[auditoria] ([id], [fecha], [hora], [tipo_transaccion], [descripcion], [usuario]) VALUES (13, CAST(N'2023-06-03' AS Date), CAST(N'08:31:04.8433333' AS Time), N'INSERT', N'DEVOLUCION CREADA NO.14', N'sa')
INSERT [dbo].[auditoria] ([id], [fecha], [hora], [tipo_transaccion], [descripcion], [usuario]) VALUES (14, CAST(N'2023-06-03' AS Date), CAST(N'08:31:26.0833333' AS Time), N'INSERT', N'DEVOLUCION CREADA NO.15', N'sa')
INSERT [dbo].[auditoria] ([id], [fecha], [hora], [tipo_transaccion], [descripcion], [usuario]) VALUES (15, CAST(N'2023-06-03' AS Date), CAST(N'08:32:03.9133333' AS Time), N'INSERT', N'DEVOLUCION CREADA NO.16', N'sa')
INSERT [dbo].[auditoria] ([id], [fecha], [hora], [tipo_transaccion], [descripcion], [usuario]) VALUES (16, CAST(N'2023-06-03' AS Date), CAST(N'08:32:31.6466667' AS Time), N'INSERT', N'DEVOLUCION CREADA NO.17', N'sa')
INSERT [dbo].[auditoria] ([id], [fecha], [hora], [tipo_transaccion], [descripcion], [usuario]) VALUES (17, CAST(N'2023-06-03' AS Date), CAST(N'08:51:51.6766667' AS Time), N'INSERT', N'VENTA CREADA NO.99', N'sa')
INSERT [dbo].[auditoria] ([id], [fecha], [hora], [tipo_transaccion], [descripcion], [usuario]) VALUES (18, CAST(N'2023-06-03' AS Date), CAST(N'08:52:45.6900000' AS Time), N'INSERT', N'VENTA CREADA NO.100', N'sa')
INSERT [dbo].[auditoria] ([id], [fecha], [hora], [tipo_transaccion], [descripcion], [usuario]) VALUES (19, CAST(N'2023-06-03' AS Date), CAST(N'09:03:02.4333333' AS Time), N'INSERT', N'VENTA CREADA NO.101', N'sa')
INSERT [dbo].[auditoria] ([id], [fecha], [hora], [tipo_transaccion], [descripcion], [usuario]) VALUES (20, CAST(N'2023-06-03' AS Date), CAST(N'13:26:53.8733333' AS Time), N'INSERT', N'VENTA CREADA NO.102', N'sa')
INSERT [dbo].[auditoria] ([id], [fecha], [hora], [tipo_transaccion], [descripcion], [usuario]) VALUES (21, CAST(N'2023-06-03' AS Date), CAST(N'13:35:09.4233333' AS Time), N'INSERT', N'VENTA CREADA NO.103', N'sa')
INSERT [dbo].[auditoria] ([id], [fecha], [hora], [tipo_transaccion], [descripcion], [usuario]) VALUES (22, CAST(N'2023-06-03' AS Date), CAST(N'13:50:28.6766667' AS Time), N'INSERT', N'VENTA CREADA NO.104', N'sa')
INSERT [dbo].[auditoria] ([id], [fecha], [hora], [tipo_transaccion], [descripcion], [usuario]) VALUES (23, CAST(N'2023-06-03' AS Date), CAST(N'13:52:22.7333333' AS Time), N'INSERT', N'DEVOLUCION CREADA NO.18', N'sa')
INSERT [dbo].[auditoria] ([id], [fecha], [hora], [tipo_transaccion], [descripcion], [usuario]) VALUES (24, CAST(N'2023-06-04' AS Date), CAST(N'03:05:45.8900000' AS Time), N'INSERT', N'VENTA CREADA NO.105', N'sa')
INSERT [dbo].[auditoria] ([id], [fecha], [hora], [tipo_transaccion], [descripcion], [usuario]) VALUES (25, CAST(N'2023-06-04' AS Date), CAST(N'03:07:18.7166667' AS Time), N'INSERT', N'VENTA CREADA NO.106', N'sa')
INSERT [dbo].[auditoria] ([id], [fecha], [hora], [tipo_transaccion], [descripcion], [usuario]) VALUES (26, CAST(N'2023-06-04' AS Date), CAST(N'03:18:39.3333333' AS Time), N'INSERT', N'CAJA CEDRRADA NO.49', N'sa')
SET IDENTITY_INSERT [dbo].[auditoria] OFF
GO
SET IDENTITY_INSERT [dbo].[caja] ON 

INSERT [dbo].[caja] ([id], [numero_caja], [monto_ultimo_cierre], [estado]) VALUES (1, 1, CAST(148047.75 AS Decimal(16, 2)), N'abierto')
SET IDENTITY_INSERT [dbo].[caja] OFF
GO
SET IDENTITY_INSERT [dbo].[categoria_productos] ON 

INSERT [dbo].[categoria_productos] ([id], [nombre]) VALUES (1, N'Lacteos')
INSERT [dbo].[categoria_productos] ([id], [nombre]) VALUES (2, N'Bebidas')
INSERT [dbo].[categoria_productos] ([id], [nombre]) VALUES (3, N'Pastas')
INSERT [dbo].[categoria_productos] ([id], [nombre]) VALUES (4, N'Granos y Cereales')
INSERT [dbo].[categoria_productos] ([id], [nombre]) VALUES (5, N'Cuidado Personal')
INSERT [dbo].[categoria_productos] ([id], [nombre]) VALUES (6, N'Limpieza')
INSERT [dbo].[categoria_productos] ([id], [nombre]) VALUES (7, N'Enlatados')
INSERT [dbo].[categoria_productos] ([id], [nombre]) VALUES (8, N'Golosinas')
INSERT [dbo].[categoria_productos] ([id], [nombre]) VALUES (9, N'Embutidos')
INSERT [dbo].[categoria_productos] ([id], [nombre]) VALUES (10, N'Abarrotes')
SET IDENTITY_INSERT [dbo].[categoria_productos] OFF
GO
SET IDENTITY_INSERT [dbo].[clientes] ON 

INSERT [dbo].[clientes] ([id], [nombre], [direccion], [telefono], [correo], [NIT]) VALUES (1011, N'Edgar Fernando Ajset Nimacaché', N'5ta av. 9-38 Siquinalá', 48173198, N'fernando_ajset@hotmail.com', N'84030577')
INSERT [dbo].[clientes] ([id], [nombre], [direccion], [telefono], [correo], [NIT]) VALUES (1012, N'Brizeth Jazmin Alvarado López', N'Siquinala', 42296658, N'brizalvarado@outlook.com', N'88998533')
INSERT [dbo].[clientes] ([id], [nombre], [direccion], [telefono], [correo], [NIT]) VALUES (1016, N'Tienda El Edén', N'km87, carretera a Masagua, Escuintla', 48792361, N'jorgeLucast01@gmail.com', N'54698732')
INSERT [dbo].[clientes] ([id], [nombre], [direccion], [telefono], [correo], [NIT]) VALUES (1017, N'Almacén Karina', N'8a av. 8 calle, 3-21, zona 0, Coyuta', 58972314, N'karinAlfonsokik@yahoo.es', N'8877457-8')
INSERT [dbo].[clientes] ([id], [nombre], [direccion], [telefono], [correo], [NIT]) VALUES (1018, N'Surtitienda Salmo 33', N'1a calle, colonia Las Victorias', 78895465, N'tiendasalmo33Coyuta@gmail.com', N'5647892')
INSERT [dbo].[clientes] ([id], [nombre], [direccion], [telefono], [correo], [NIT]) VALUES (1019, N'Abarroteria Los Hermanos', N'Callejon el Milagro, zona 9, San Lucas', 75486932, N'sergioreies@outlook.com', N'89764-K')
INSERT [dbo].[clientes] ([id], [nombre], [direccion], [telefono], [correo], [NIT]) VALUES (1020, N'Tortillería Mari´s', N'local 89, mercado central, La Democracia', 56478922, N'lorena978657@gmail.com', N'95624790')
INSERT [dbo].[clientes] ([id], [nombre], [direccion], [telefono], [correo], [NIT]) VALUES (1021, N'Depósito San Judas', N'9Av. 6-21, El Recreo', 56312548, N'judasariel@gmail.com', N'562487-L')
INSERT [dbo].[clientes] ([id], [nombre], [direccion], [telefono], [correo], [NIT]) VALUES (1022, N'Tienda El Centro', N'3ave. 98-02, El Pilar', 88971236, N'mariamaria897@gmail.com', N'48793654')
INSERT [dbo].[clientes] ([id], [nombre], [direccion], [telefono], [correo], [NIT]) VALUES (1025, N'Almacén Zafiro', N'km33 RN30, Tapulapa', 78896532, N'MascielDoming3z@gmail.com', N'26598-J')
INSERT [dbo].[clientes] ([id], [nombre], [direccion], [telefono], [correo], [NIT]) VALUES (1027, N'Astrid Yadira Recancoj Samayoa', N'4ta ave. 3-56 calle ancha, Santa Lucia Cotz', 50001563, N'arecancojs@gmail.com', N'58796432')
SET IDENTITY_INSERT [dbo].[clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[detalle_factura] ON 

INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (10, CAST(31.00 AS Decimal(16, 2)), 2, 3, 1, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (12, CAST(11.25 AS Decimal(16, 2)), 3, 4, 1, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (13, CAST(17.00 AS Decimal(16, 2)), 1, 5, 1, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (16, CAST(8.50 AS Decimal(16, 2)), 1, 5, 1, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (17, CAST(17.00 AS Decimal(16, 2)), 1, 5, 1, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (18, CAST(12.00 AS Decimal(16, 2)), 1, 6, 1, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (19, CAST(24.00 AS Decimal(16, 2)), 3, 6, 1, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (20, CAST(36.00 AS Decimal(16, 2)), 3, 6, 1, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (25, CAST(46.50 AS Decimal(16, 2)), 3, 3, 1, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (26, CAST(46.50 AS Decimal(16, 2)), 3, 3, 1, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (27, CAST(31.50 AS Decimal(16, 2)), 2, 3, 9, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (28, CAST(11.25 AS Decimal(16, 2)), 3, 4, 9, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (29, CAST(42.50 AS Decimal(16, 2)), 3, 5, 9, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (30, CAST(48.00 AS Decimal(16, 2)), 5, 6, 9, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (31, CAST(375.00 AS Decimal(16, 2)), 5, 7, 9, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (32, CAST(17.50 AS Decimal(16, 2)), 1, 38, 9, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (33, CAST(28.40 AS Decimal(16, 2)), 2, 41, 9, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (34, CAST(42.60 AS Decimal(16, 2)), 3, 41, 10, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (35, CAST(11.25 AS Decimal(16, 2)), 3, 4, 10, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (36, CAST(78.75 AS Decimal(16, 2)), 5, 3, 10, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (37, CAST(17.00 AS Decimal(16, 2)), 1, 5, 10, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (38, CAST(48.00 AS Decimal(16, 2)), 5, 6, 10, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (39, CAST(35.00 AS Decimal(16, 2)), 2, 38, 10, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (40, CAST(15.75 AS Decimal(16, 2)), 1, 3, 11, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (41, CAST(3.75 AS Decimal(16, 2)), 1, 4, 11, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (42, CAST(42.50 AS Decimal(16, 2)), 3, 5, 11, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (43, CAST(48.00 AS Decimal(16, 2)), 5, 6, 11, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (44, CAST(75.00 AS Decimal(16, 2)), 1, 7, 11, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (45, CAST(17.50 AS Decimal(16, 2)), 1, 38, 11, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (46, CAST(14.20 AS Decimal(16, 2)), 1, 41, 11, NULL)
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (47, CAST(15.75 AS Decimal(16, 2)), 1, 3, 12, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (48, CAST(3.75 AS Decimal(16, 2)), 1, 4, 12, CAST(1.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (49, CAST(42.50 AS Decimal(16, 2)), 3, 5, 12, CAST(8.50 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (50, CAST(36.00 AS Decimal(16, 2)), 4, 6, 12, CAST(12.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (51, CAST(150.00 AS Decimal(16, 2)), 2, 7, 12, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (52, CAST(17.50 AS Decimal(16, 2)), 1, 38, 12, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (53, CAST(14.20 AS Decimal(16, 2)), 1, 41, 12, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (54, CAST(7.50 AS Decimal(16, 2)), 2, 4, 17, CAST(1.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (55, CAST(75.00 AS Decimal(16, 2)), 1, 7, 18, CAST(5.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (56, CAST(31.50 AS Decimal(16, 2)), 2, 3, 19, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (57, CAST(31.50 AS Decimal(16, 2)), 2, 3, 20, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (58, CAST(25.50 AS Decimal(16, 2)), 2, 5, 21, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (59, CAST(25.50 AS Decimal(16, 2)), 2, 5, 22, CAST(8.50 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (60, CAST(24.00 AS Decimal(16, 2)), 2, 6, 23, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (61, CAST(24.00 AS Decimal(16, 2)), 2, 6, 24, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (62, CAST(35.00 AS Decimal(16, 2)), 2, 38, 25, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (63, CAST(25.50 AS Decimal(16, 2)), 2, 5, 26, CAST(8.50 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (64, CAST(25.50 AS Decimal(16, 2)), 2, 5, 27, CAST(8.50 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (65, CAST(75.00 AS Decimal(16, 2)), 1, 7, 28, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (66, CAST(24.00 AS Decimal(16, 2)), 2, 6, 29, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (67, CAST(24.00 AS Decimal(16, 2)), 2, 6, 30, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (68, CAST(17.00 AS Decimal(16, 2)), 1, 5, 31, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (69, CAST(24.00 AS Decimal(16, 2)), 2, 6, 32, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (70, CAST(12.00 AS Decimal(16, 2)), 1, 6, 33, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (71, CAST(17.50 AS Decimal(16, 2)), 1, 38, 34, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (72, CAST(75.00 AS Decimal(16, 2)), 1, 7, 35, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (73, CAST(17.50 AS Decimal(16, 2)), 1, 38, 36, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (74, CAST(17.50 AS Decimal(16, 2)), 1, 38, 37, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (75, CAST(14.20 AS Decimal(16, 2)), 1, 41, 38, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (76, CAST(14.20 AS Decimal(16, 2)), 1, 41, 39, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (77, CAST(75.00 AS Decimal(16, 2)), 1, 7, 40, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (78, CAST(75.00 AS Decimal(16, 2)), 1, 7, 41, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (79, CAST(17.00 AS Decimal(16, 2)), 1, 5, 42, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (80, CAST(17.00 AS Decimal(16, 2)), 1, 5, 43, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (81, CAST(75.00 AS Decimal(16, 2)), 1, 7, 44, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (82, CAST(75.00 AS Decimal(16, 2)), 1, 7, 45, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (83, CAST(75.00 AS Decimal(16, 2)), 1, 7, 46, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (84, CAST(75.00 AS Decimal(16, 2)), 1, 7, 47, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (85, CAST(14.20 AS Decimal(16, 2)), 1, 41, 48, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (86, CAST(75.00 AS Decimal(16, 2)), 1, 7, 49, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (87, CAST(75.00 AS Decimal(16, 2)), 1, 7, 50, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (88, CAST(150.00 AS Decimal(16, 2)), 2, 7, 51, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (89, CAST(150.00 AS Decimal(16, 2)), 2, 7, 52, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (90, CAST(150.00 AS Decimal(16, 2)), 2, 7, 53, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (91, CAST(150.00 AS Decimal(16, 2)), 2, 7, 54, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (92, CAST(75.00 AS Decimal(16, 2)), 1, 7, 55, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (93, CAST(75.00 AS Decimal(16, 2)), 1, 7, 56, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (94, CAST(150.00 AS Decimal(16, 2)), 2, 7, 57, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (95, CAST(42.50 AS Decimal(16, 2)), 3, 5, 58, CAST(8.50 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (96, CAST(75.00 AS Decimal(16, 2)), 1, 7, 59, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (97, CAST(75.00 AS Decimal(16, 2)), 1, 7, 60, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (98, CAST(75.00 AS Decimal(16, 2)), 1, 7, 61, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (99, CAST(75.00 AS Decimal(16, 2)), 1, 7, 62, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (100, CAST(75.00 AS Decimal(16, 2)), 1, 7, 63, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (101, CAST(300.00 AS Decimal(16, 2)), 4, 7, 64, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (102, CAST(31.50 AS Decimal(16, 2)), 2, 3, 65, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (103, CAST(42.50 AS Decimal(16, 2)), 3, 5, 66, CAST(8.50 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (104, CAST(25.50 AS Decimal(16, 2)), 2, 5, 67, CAST(8.50 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (105, CAST(24.00 AS Decimal(16, 2)), 2, 6, 68, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (106, CAST(75.00 AS Decimal(16, 2)), 1, 7, 69, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (107, CAST(75.00 AS Decimal(16, 2)), 1, 7, 70, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (108, CAST(25.50 AS Decimal(16, 2)), 2, 5, 71, CAST(8.50 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (109, CAST(25.50 AS Decimal(16, 2)), 2, 5, 72, CAST(8.50 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (110, CAST(161.50 AS Decimal(16, 2)), 10, 5, 73, CAST(8.50 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (111, CAST(24.00 AS Decimal(16, 2)), 2, 6, 74, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (112, CAST(42.60 AS Decimal(16, 2)), 3, 41, 74, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (113, CAST(42.50 AS Decimal(16, 2)), 3, 5, 74, CAST(8.50 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (114, CAST(35.00 AS Decimal(16, 2)), 2, 38, 74, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (115, CAST(31.50 AS Decimal(16, 2)), 2, 3, 74, CAST(0.00 AS Decimal(16, 2)))
GO
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (116, CAST(25.50 AS Decimal(16, 2)), 2, 5, 75, CAST(8.50 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (117, CAST(31.50 AS Decimal(16, 2)), 2, 3, 76, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (118, CAST(225.00 AS Decimal(16, 2)), 3, 7, 77, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (119, CAST(157.50 AS Decimal(16, 2)), 10, 3, 78, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (120, CAST(105.00 AS Decimal(16, 2)), 6, 38, 78, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (121, CAST(42.50 AS Decimal(16, 2)), 3, 5, 78, CAST(8.50 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (122, CAST(48.00 AS Decimal(16, 2)), 5, 6, 78, CAST(12.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (123, CAST(113.60 AS Decimal(16, 2)), 8, 41, 78, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (124, CAST(225.00 AS Decimal(16, 2)), 3, 7, 79, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (125, CAST(71.00 AS Decimal(16, 2)), 5, 41, 79, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (126, CAST(110.25 AS Decimal(16, 2)), 7, 3, 79, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (127, CAST(11.25 AS Decimal(16, 2)), 3, 4, 79, CAST(9.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (128, CAST(42.50 AS Decimal(16, 2)), 3, 5, 79, CAST(8.50 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (129, CAST(108.00 AS Decimal(16, 2)), 10, 6, 80, CAST(12.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (130, CAST(78.75 AS Decimal(16, 2)), 5, 3, 80, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (131, CAST(105.00 AS Decimal(16, 2)), 6, 38, 80, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (132, CAST(113.60 AS Decimal(16, 2)), 8, 41, 80, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (133, CAST(15.00 AS Decimal(16, 2)), 4, 4, 80, CAST(4.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (134, CAST(36.00 AS Decimal(16, 2)), 3, 6, 81, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (135, CAST(11.25 AS Decimal(16, 2)), 3, 4, 81, CAST(729.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (136, CAST(42.50 AS Decimal(16, 2)), 3, 5, 81, CAST(8.50 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (137, CAST(63.00 AS Decimal(16, 2)), 4, 3, 81, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (138, CAST(150.00 AS Decimal(16, 2)), 2, 7, 81, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (139, CAST(52.50 AS Decimal(16, 2)), 3, 38, 81, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (140, CAST(85.20 AS Decimal(16, 2)), 6, 41, 81, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (141, CAST(47.25 AS Decimal(16, 2)), 3, 3, 82, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (142, CAST(11.25 AS Decimal(16, 2)), 3, 4, 82, CAST(1.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (143, CAST(105.00 AS Decimal(16, 2)), 6, 38, 82, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (144, CAST(225.00 AS Decimal(16, 2)), 3, 7, 82, CAST(5.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (145, CAST(85.20 AS Decimal(16, 2)), 6, 41, 82, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (146, CAST(11.25 AS Decimal(16, 2)), 3, 4, 83, CAST(3.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (147, CAST(31.50 AS Decimal(16, 2)), 2, 3, 83, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (148, CAST(375.00 AS Decimal(16, 2)), 5, 7, 83, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (149, CAST(85.20 AS Decimal(16, 2)), 6, 41, 83, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (150, CAST(25.50 AS Decimal(16, 2)), 2, 5, 83, CAST(8.50 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (151, CAST(60.00 AS Decimal(16, 2)), 6, 6, 83, CAST(12.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (152, CAST(70.00 AS Decimal(16, 2)), 4, 38, 83, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (153, CAST(76.50 AS Decimal(16, 2)), 5, 5, 84, CAST(8.50 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (154, CAST(375.00 AS Decimal(16, 2)), 5, 7, 84, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (155, CAST(70.00 AS Decimal(16, 2)), 4, 38, 84, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (156, CAST(22.50 AS Decimal(16, 2)), 6, 4, 84, CAST(6.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (157, CAST(142.00 AS Decimal(16, 2)), 10, 41, 84, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (158, CAST(60.00 AS Decimal(16, 2)), 6, 6, 84, CAST(12.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (159, CAST(18.75 AS Decimal(16, 2)), 5, 4, 85, CAST(5.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (160, CAST(76.50 AS Decimal(16, 2)), 5, 5, 85, CAST(8.50 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (161, CAST(52.50 AS Decimal(16, 2)), 3, 38, 85, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (162, CAST(47.25 AS Decimal(16, 2)), 3, 3, 85, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (163, CAST(60.00 AS Decimal(16, 2)), 6, 6, 85, CAST(12.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (164, CAST(600.00 AS Decimal(16, 2)), 8, 7, 85, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (165, CAST(56.80 AS Decimal(16, 2)), 4, 41, 85, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (166, CAST(11.25 AS Decimal(16, 2)), 3, 4, 86, CAST(3.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (167, CAST(76.50 AS Decimal(16, 2)), 5, 5, 86, CAST(8.50 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (168, CAST(750.00 AS Decimal(16, 2)), 10, 7, 86, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (169, CAST(56.80 AS Decimal(16, 2)), 4, 41, 86, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (170, CAST(94.50 AS Decimal(16, 2)), 6, 3, 86, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (171, CAST(48.00 AS Decimal(16, 2)), 5, 6, 86, CAST(12.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (172, CAST(35.00 AS Decimal(16, 2)), 2, 38, 86, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (173, CAST(157.50 AS Decimal(16, 2)), 10, 3, 87, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (174, CAST(25.50 AS Decimal(16, 2)), 2, 5, 87, CAST(8.50 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (175, CAST(48.00 AS Decimal(16, 2)), 5, 6, 87, CAST(12.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (176, CAST(22.50 AS Decimal(16, 2)), 6, 4, 87, CAST(6.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (177, CAST(175.00 AS Decimal(16, 2)), 10, 38, 87, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (178, CAST(85.20 AS Decimal(16, 2)), 6, 41, 87, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (179, CAST(24.00 AS Decimal(16, 2)), 2, 6, 88, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (180, CAST(7.50 AS Decimal(16, 2)), 2, 4, 88, CAST(2.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (181, CAST(94.50 AS Decimal(16, 2)), 6, 3, 89, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (182, CAST(22.50 AS Decimal(16, 2)), 6, 4, 90, CAST(6.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (183, CAST(48.00 AS Decimal(16, 2)), 5, 6, 91, CAST(12.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (184, CAST(31.50 AS Decimal(16, 2)), 2, 3, 91, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (185, CAST(225.00 AS Decimal(16, 2)), 3, 7, 91, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (186, CAST(93.50 AS Decimal(16, 2)), 6, 5, 92, CAST(8.50 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (187, CAST(150.00 AS Decimal(16, 2)), 2, 7, 92, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (188, CAST(24.00 AS Decimal(16, 2)), 2, 6, 93, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (189, CAST(24.00 AS Decimal(16, 2)), 2, 6, 94, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (190, CAST(25.50 AS Decimal(16, 2)), 2, 5, 95, CAST(8.50 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (191, CAST(7.50 AS Decimal(16, 2)), 2, 4, 96, CAST(2.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (192, CAST(24.00 AS Decimal(16, 2)), 2, 6, 97, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (193, CAST(35.00 AS Decimal(16, 2)), 2, 38, 98, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (194, CAST(24.00 AS Decimal(16, 2)), 2, 6, 99, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (195, CAST(22.50 AS Decimal(16, 2)), 6, 4, 99, CAST(6.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (196, CAST(14.20 AS Decimal(16, 2)), 1, 41, 99, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (197, CAST(31.50 AS Decimal(16, 2)), 2, 3, 99, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (198, CAST(42.50 AS Decimal(16, 2)), 3, 5, 100, CAST(8.50 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (199, CAST(105.00 AS Decimal(16, 2)), 6, 38, 100, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (200, CAST(11.25 AS Decimal(16, 2)), 3, 4, 100, CAST(3.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (201, CAST(375.00 AS Decimal(16, 2)), 5, 7, 100, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (202, CAST(28.40 AS Decimal(16, 2)), 2, 41, 100, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (203, CAST(60.00 AS Decimal(16, 2)), 6, 6, 100, CAST(12.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (204, CAST(31.50 AS Decimal(16, 2)), 2, 3, 100, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (205, CAST(37.50 AS Decimal(16, 2)), 10, 4, 101, CAST(10.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (206, CAST(60.00 AS Decimal(16, 2)), 6, 6, 101, CAST(12.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (207, CAST(35.00 AS Decimal(16, 2)), 2, 38, 101, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (208, CAST(56.80 AS Decimal(16, 2)), 4, 41, 101, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (209, CAST(157.50 AS Decimal(16, 2)), 10, 3, 102, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (210, CAST(25.50 AS Decimal(16, 2)), 2, 5, 102, CAST(8.50 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (211, CAST(35.00 AS Decimal(16, 2)), 2, 38, 102, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (212, CAST(3.75 AS Decimal(16, 2)), 1, 4, 103, CAST(1.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (213, CAST(12.00 AS Decimal(16, 2)), 1, 6, 104, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (214, CAST(375.00 AS Decimal(16, 2)), 5, 7, 104, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (215, CAST(63.00 AS Decimal(16, 2)), 4, 3, 104, CAST(0.00 AS Decimal(16, 2)))
GO
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (216, CAST(52.50 AS Decimal(16, 2)), 3, 38, 104, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (217, CAST(3.75 AS Decimal(16, 2)), 1, 4, 105, CAST(1.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (218, CAST(59.50 AS Decimal(16, 2)), 4, 5, 105, CAST(8.50 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (219, CAST(450.00 AS Decimal(16, 2)), 6, 7, 105, CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (220, CAST(59.50 AS Decimal(16, 2)), 4, 5, 106, CAST(8.50 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (221, CAST(36.00 AS Decimal(16, 2)), 4, 6, 106, CAST(12.00 AS Decimal(16, 2)))
INSERT [dbo].[detalle_factura] ([id], [subtotal], [cantidad], [id_producto], [id_encabezado_factura], [descuento]) VALUES (222, CAST(450.00 AS Decimal(16, 2)), 6, 7, 106, CAST(0.00 AS Decimal(16, 2)))
SET IDENTITY_INSERT [dbo].[detalle_factura] OFF
GO
SET IDENTITY_INSERT [dbo].[devoluciones] ON 

INSERT [dbo].[devoluciones] ([id], [cantidad], [motivo], [id_producto], [fecha], [tipo_devolucion]) VALUES (9, 1, N'INCONFORMIDAD', 3, CAST(N'2023-06-02' AS Date), N'Empaque roto')
INSERT [dbo].[devoluciones] ([id], [cantidad], [motivo], [id_producto], [fecha], [tipo_devolucion]) VALUES (10, 2, N'empaque roto', 3, CAST(N'2023-06-02' AS Date), N'Empaque roto')
INSERT [dbo].[devoluciones] ([id], [cantidad], [motivo], [id_producto], [fecha], [tipo_devolucion]) VALUES (14, 5, N'aplastamiento', 6, CAST(N'2023-06-03' AS Date), N'Empaque roto')
INSERT [dbo].[devoluciones] ([id], [cantidad], [motivo], [id_producto], [fecha], [tipo_devolucion]) VALUES (15, 2, N'3', 41, CAST(N'2023-06-03' AS Date), N'Vencido')
INSERT [dbo].[devoluciones] ([id], [cantidad], [motivo], [id_producto], [fecha], [tipo_devolucion]) VALUES (16, 5, N'mal sabor', 7, CAST(N'2023-06-03' AS Date), N'Empaque roto')
INSERT [dbo].[devoluciones] ([id], [cantidad], [motivo], [id_producto], [fecha], [tipo_devolucion]) VALUES (17, 2, N'Mal olor', 5, CAST(N'2023-06-03' AS Date), N'Empaque roto')
INSERT [dbo].[devoluciones] ([id], [cantidad], [motivo], [id_producto], [fecha], [tipo_devolucion]) VALUES (18, 1, N'MEMPAQUE ROTO', 3, CAST(N'2023-06-03' AS Date), N'Empaque roto')
SET IDENTITY_INSERT [dbo].[devoluciones] OFF
GO
SET IDENTITY_INSERT [dbo].[encabezado_factura] ON 

INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (1, N'85elk23', CAST(N'2023-05-25T00:00:00.000' AS DateTime), 1, 1021)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (2, N'85elk23', CAST(N'2023-05-25T00:00:00.000' AS DateTime), 2, 1022)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (9, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 2, 1011)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (10, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1, 1012)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (11, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1, 1011)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (12, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1, 1017)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (17, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (18, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (19, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1, 1012)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (20, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1, 1012)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (21, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1, 1012)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (22, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 2, 1017)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (23, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (24, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 2, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (25, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1, 1017)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (26, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (27, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (28, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (29, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (30, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (31, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1, 1012)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (32, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 2, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (33, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 2, 1017)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (34, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1, 1012)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (35, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1, 1017)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (36, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 2, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (37, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1, 1017)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (38, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 2, 1018)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (39, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1, 1025)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (40, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 2, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (41, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1, 1017)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (42, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1, 1012)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (43, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 2, 1018)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (44, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 2, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (45, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 2, 1018)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (46, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1, 1018)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (47, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (48, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 2, 1012)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (49, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 2, 1018)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (50, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (51, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 2, 1017)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (52, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1, 1018)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (53, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 1, 1018)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (54, N'FA0152', CAST(N'2023-06-01T00:00:00.000' AS DateTime), 2, 1017)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (55, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 2, 1017)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (56, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 1, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (57, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 2, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (58, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 2, 1017)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (59, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 2, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (60, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 1, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (61, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 2, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (62, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 2, 1017)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (63, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 2, 1017)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (64, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 1, 1017)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (65, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 1, 1018)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (66, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 1, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (67, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 1, 1017)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (68, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 1, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (69, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 2, 1017)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (70, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 1, 1018)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (71, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 1, 1017)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (72, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 1, 1018)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (73, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 2, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (74, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 1, 1018)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (75, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 2, 1019)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (76, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 1, 1017)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (77, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 1, 1017)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (78, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 1, 1017)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (79, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 2, 1017)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (80, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 1, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (81, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 2, 1011)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (82, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 1, 1017)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (83, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 2, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (84, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 1, 1011)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (85, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 2, 1012)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (86, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 2, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (87, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 1, 1012)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (88, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 1, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (89, N'FA0152', CAST(N'2023-06-02T00:00:00.000' AS DateTime), 1, 1012)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (90, N'FA0152', CAST(N'2023-06-02T22:06:43.447' AS DateTime), 1, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (91, N'FA0152', CAST(N'2023-06-02T22:07:53.347' AS DateTime), 1, 1011)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (92, N'FA0152', CAST(N'2023-06-02T22:12:56.197' AS DateTime), 1, 1018)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (93, N'FA0152', CAST(N'2023-06-02T23:36:32.680' AS DateTime), 1, 1017)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (94, N'FA0152', CAST(N'2023-06-02T23:38:05.373' AS DateTime), 2, 1018)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (95, N'FA0152', CAST(N'2023-06-03T00:09:18.820' AS DateTime), 1, 1017)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (96, N'FA0152', CAST(N'2023-06-03T00:11:10.690' AS DateTime), 1, 1012)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (97, N'FA0152', CAST(N'2023-06-03T01:41:10.753' AS DateTime), 1, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (98, N'FA0152', CAST(N'2023-06-03T01:45:03.867' AS DateTime), 1, 1017)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (99, N'FA0152', CAST(N'2023-06-03T02:51:59.623' AS DateTime), 1, 1017)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (100, N'FA0152', CAST(N'2023-06-03T02:52:53.483' AS DateTime), 1, 1017)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (101, N'FA0152', CAST(N'2023-06-03T03:03:10.367' AS DateTime), 1, 1011)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (102, N'FA0152', CAST(N'2023-06-03T07:26:53.093' AS DateTime), 1, 1011)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (103, N'FA0152', CAST(N'2023-06-03T07:35:08.677' AS DateTime), 1, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (104, N'FA0152', CAST(N'2023-06-03T07:50:28.043' AS DateTime), 1, 1016)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (105, N'FA0152', CAST(N'2023-06-03T21:05:45.530' AS DateTime), 1, 1011)
INSERT [dbo].[encabezado_factura] ([id], [serie], [fecha], [id_tipo_pago], [id_cliente]) VALUES (106, N'FA0152', CAST(N'2023-06-03T21:07:18.440' AS DateTime), 1, 1016)
SET IDENTITY_INSERT [dbo].[encabezado_factura] OFF
GO
SET IDENTITY_INSERT [dbo].[precios_producto] ON 

INSERT [dbo].[precios_producto] ([id], [id_producto], [precio_unidad], [descuento_producto], [fecha_modificacion_precio]) VALUES (1, 3, CAST(15.75 AS Decimal(16, 2)), CAST(0.00 AS Decimal(16, 2)), CAST(N'2023-05-28T17:58:22.800' AS DateTime))
INSERT [dbo].[precios_producto] ([id], [id_producto], [precio_unidad], [descuento_producto], [fecha_modificacion_precio]) VALUES (2, 4, CAST(4.75 AS Decimal(16, 2)), CAST(1.00 AS Decimal(16, 2)), CAST(N'2023-05-25T02:27:51.713' AS DateTime))
INSERT [dbo].[precios_producto] ([id], [id_producto], [precio_unidad], [descuento_producto], [fecha_modificacion_precio]) VALUES (3, 5, CAST(17.00 AS Decimal(16, 2)), CAST(0.00 AS Decimal(16, 2)), CAST(N'2023-05-25T02:27:51.713' AS DateTime))
INSERT [dbo].[precios_producto] ([id], [id_producto], [precio_unidad], [descuento_producto], [fecha_modificacion_precio]) VALUES (4, 6, CAST(12.00 AS Decimal(16, 2)), CAST(2.00 AS Decimal(16, 2)), CAST(N'2023-05-25T02:27:51.713' AS DateTime))
INSERT [dbo].[precios_producto] ([id], [id_producto], [precio_unidad], [descuento_producto], [fecha_modificacion_precio]) VALUES (5, 7, CAST(75.00 AS Decimal(16, 2)), CAST(5.00 AS Decimal(16, 2)), CAST(N'2023-05-25T02:27:51.713' AS DateTime))
INSERT [dbo].[precios_producto] ([id], [id_producto], [precio_unidad], [descuento_producto], [fecha_modificacion_precio]) VALUES (28, 38, CAST(17.50 AS Decimal(16, 2)), CAST(0.00 AS Decimal(16, 2)), CAST(N'2023-05-28T20:56:59.853' AS DateTime))
INSERT [dbo].[precios_producto] ([id], [id_producto], [precio_unidad], [descuento_producto], [fecha_modificacion_precio]) VALUES (31, 41, CAST(14.20 AS Decimal(16, 2)), CAST(0.00 AS Decimal(16, 2)), CAST(N'2023-05-29T01:43:48.120' AS DateTime))
SET IDENTITY_INSERT [dbo].[precios_producto] OFF
GO
SET IDENTITY_INSERT [dbo].[productos] ON 

INSERT [dbo].[productos] ([id], [detalle], [existencia], [id_categoria], [id_proveedor], [id_promocion]) VALUES (3, N'CAJA LECHE PRIMAVERA', 25, 1, 7, NULL)
INSERT [dbo].[productos] ([id], [detalle], [existencia], [id_categoria], [id_proveedor], [id_promocion]) VALUES (4, N'ARROZ LIBRA', 34, 4, 4, 1)
INSERT [dbo].[productos] ([id], [detalle], [existencia], [id_categoria], [id_proveedor], [id_promocion]) VALUES (5, N'LITRO DESINFECTANTE', 29, 6, 6, 3)
INSERT [dbo].[productos] ([id], [detalle], [existencia], [id_categoria], [id_proveedor], [id_promocion]) VALUES (6, N'ELOTITOS LATA', 25, 7, 2, 4)
INSERT [dbo].[productos] ([id], [detalle], [existencia], [id_categoria], [id_proveedor], [id_promocion]) VALUES (7, N'CERV GALLO SIX', 39, 2, 2, 2)
INSERT [dbo].[productos] ([id], [detalle], [existencia], [id_categoria], [id_proveedor], [id_promocion]) VALUES (38, N'AZUCAR CAÑA REAL 1 KG', 39, 10, 6, NULL)
INSERT [dbo].[productos] ([id], [detalle], [existencia], [id_categoria], [id_proveedor], [id_promocion]) VALUES (41, N'Queso seco', 29, 1, 7, 5)
SET IDENTITY_INSERT [dbo].[productos] OFF
GO
SET IDENTITY_INSERT [dbo].[promociones] ON 

INSERT [dbo].[promociones] ([id], [descripcion]) VALUES (1, N'DESCUENTO')
INSERT [dbo].[promociones] ([id], [descripcion]) VALUES (2, N'Sobre de una porción de cereal GRATIS')
INSERT [dbo].[promociones] ([id], [descripcion]) VALUES (3, N'Segundo producto a mitad de precio')
INSERT [dbo].[promociones] ([id], [descripcion]) VALUES (4, N'Cuarta unidad del producto es GRATIS')
INSERT [dbo].[promociones] ([id], [descripcion]) VALUES (5, N'2 puntos por articulo')
SET IDENTITY_INSERT [dbo].[promociones] OFF
GO
SET IDENTITY_INSERT [dbo].[proveedores] ON 

INSERT [dbo].[proveedores] ([id], [nombre], [direccion], [telefono], [Correo], [NIT]) VALUES (1, N'Plasticos Interfoam S.A.', N'5ta av. 4a calle 9-87, zona 3 Guatemala', 78800620, N'ventas@interfoam.com', N'4879562-0')
INSERT [dbo].[proveedores] ([id], [nombre], [direccion], [telefono], [Correo], [NIT]) VALUES (2, N'Alimentos Maravilla S.A.', N'km 48, carretera occidente', 79256348, N'info@maravilla.com', N'4879562-1')
INSERT [dbo].[proveedores] ([id], [nombre], [direccion], [telefono], [Correo], [NIT]) VALUES (3, N'Moldeados del Sur', N'km77 autopista Puerto San Juan, Totouca', 74659876, N'comprar@moldeadosdelsur.com', N'48952-7')
INSERT [dbo].[proveedores] ([id], [nombre], [direccion], [telefono], [Correo], [NIT]) VALUES (4, N'Granos El Triufo', N'Casa 103, calle del estadio, San Felipe', 78968210, N'ventas@interfoam.com', N'9756124-k')
INSERT [dbo].[proveedores] ([id], [nombre], [direccion], [telefono], [Correo], [NIT]) VALUES (5, N'Rodrigo Huslar', N'Fica El Orizonte', 70061035, N'HuslarRo@gmail.com', N'45162587')
INSERT [dbo].[proveedores] ([id], [nombre], [direccion], [telefono], [Correo], [NIT]) VALUES (6, N'Distribuidora Celsa', N'Edificio Solana, 5a ave 8-95, zona 8', 78880504, N'dep-ventas@celsa.es', N'9988744-L')
INSERT [dbo].[proveedores] ([id], [nombre], [direccion], [telefono], [Correo], [NIT]) VALUES (7, N'Lacteos El Tejar', N'calle de la cofradia, La libertad, Oltepeque', 78821576, N'comunicacion@eltejar.com', N'98642-4')
INSERT [dbo].[proveedores] ([id], [nombre], [direccion], [telefono], [Correo], [NIT]) VALUES (8, N'Pastas Selectas', N'3a. av. 5-33, sector Los Jardines, Villa Alfonso, Ciudad Nueva Luz', 76894521, N'tuscompras@selectas.com', N'548972-0')
INSERT [dbo].[proveedores] ([id], [nombre], [direccion], [telefono], [Correo], [NIT]) VALUES (9, N'Naturales Iris', N'9a. ave. 6-32, San Agustin, zona 10', 89755069, N'pedidos@iris.com', N'89564-F')
INSERT [dbo].[proveedores] ([id], [nombre], [direccion], [telefono], [Correo], [NIT]) VALUES (11, N'Distribuidora Aguilar S.A.', N'1ra av 8-31 zona 3', 78820527, N'distaguilarsa@hotmail.com', N'5448487-2')
SET IDENTITY_INSERT [dbo].[proveedores] OFF
GO
SET IDENTITY_INSERT [dbo].[Registro_de_caja] ON 

INSERT [dbo].[Registro_de_caja] ([id], [fecha], [turno], [id_caja], [id_usuario], [tipo_registro], [monto]) VALUES (8, CAST(N'2023-05-25T23:59:00.000' AS DateTime), 1, 1, N'3', N'Corte', CAST(500.00 AS Decimal(16, 2)))
INSERT [dbo].[Registro_de_caja] ([id], [fecha], [turno], [id_caja], [id_usuario], [tipo_registro], [monto]) VALUES (9, CAST(N'2023-05-01T23:59:00.000' AS DateTime), 1, 1, N'3', N'Corte', CAST(500.00 AS Decimal(16, 2)))
INSERT [dbo].[Registro_de_caja] ([id], [fecha], [turno], [id_caja], [id_usuario], [tipo_registro], [monto]) VALUES (10, CAST(N'2023-06-01T23:59:00.000' AS DateTime), 1, 1, N'3', N'Corte', CAST(500.00 AS Decimal(16, 2)))
INSERT [dbo].[Registro_de_caja] ([id], [fecha], [turno], [id_caja], [id_usuario], [tipo_registro], [monto]) VALUES (41, CAST(N'2023-06-02T22:07:18.450' AS DateTime), 1, 1, N'3', N'Corte final', CAST(8272.70 AS Decimal(16, 2)))
INSERT [dbo].[Registro_de_caja] ([id], [fecha], [turno], [id_caja], [id_usuario], [tipo_registro], [monto]) VALUES (42, CAST(N'2023-06-02T22:07:35.893' AS DateTime), 1, 1, N'3', N'Corte final', CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[Registro_de_caja] ([id], [fecha], [turno], [id_caja], [id_usuario], [tipo_registro], [monto]) VALUES (43, CAST(N'2023-06-02T22:08:06.133' AS DateTime), 1, 1, N'3', N'Corte final', CAST(304.50 AS Decimal(16, 2)))
INSERT [dbo].[Registro_de_caja] ([id], [fecha], [turno], [id_caja], [id_usuario], [tipo_registro], [monto]) VALUES (44, CAST(N'2023-06-02T22:08:30.567' AS DateTime), 1, 1, N'3', N'Corte final', CAST(0.00 AS Decimal(16, 2)))
INSERT [dbo].[Registro_de_caja] ([id], [fecha], [turno], [id_caja], [id_usuario], [tipo_registro], [monto]) VALUES (45, CAST(N'2023-06-02T22:13:10.963' AS DateTime), 1, 1, N'3', N'Corte final', CAST(243.50 AS Decimal(16, 2)))
INSERT [dbo].[Registro_de_caja] ([id], [fecha], [turno], [id_caja], [id_usuario], [tipo_registro], [monto]) VALUES (46, CAST(N'2023-06-03T00:09:34.577' AS DateTime), 1, 1, N'3', N'Corte final', CAST(73.50 AS Decimal(16, 2)))
INSERT [dbo].[Registro_de_caja] ([id], [fecha], [turno], [id_caja], [id_usuario], [tipo_registro], [monto]) VALUES (47, CAST(N'2023-06-03T00:11:20.833' AS DateTime), 1, 1, N'3', N'Corte final', CAST(7.50 AS Decimal(16, 2)))
INSERT [dbo].[Registro_de_caja] ([id], [fecha], [turno], [id_caja], [id_usuario], [tipo_registro], [monto]) VALUES (48, CAST(N'2023-06-03T01:41:31.420' AS DateTime), 2, 1, N'3', N'Corte final', CAST(24.00 AS Decimal(16, 2)))
INSERT [dbo].[Registro_de_caja] ([id], [fecha], [turno], [id_caja], [id_usuario], [tipo_registro], [monto]) VALUES (49, CAST(N'2023-06-03T21:18:40.560' AS DateTime), 1, 1, N'3', N'Corte final', CAST(2753.15 AS Decimal(16, 2)))
SET IDENTITY_INSERT [dbo].[Registro_de_caja] OFF
GO
SET IDENTITY_INSERT [dbo].[tipo_pago] ON 

INSERT [dbo].[tipo_pago] ([id], [tipo]) VALUES (1, N'Efectivo')
INSERT [dbo].[tipo_pago] ([id], [tipo]) VALUES (2, N'Pago con tarjeta')
SET IDENTITY_INSERT [dbo].[tipo_pago] OFF
GO


select * from [usuarios];
INSERT [dbo].[usuarios] ([id], [nombre_usuario], [contrasennia], [correo]) VALUES (N'10', N'Carmelina Xioc', N'xi0c023', N'cxioc@lcde.com')
INSERT [dbo].[usuarios] ([id], [nombre_usuario], [contrasennia], [correo]) VALUES (N'11', N'Pedro Lopez', N'P3dr0', N'plopez@lcde.com')
INSERT [dbo].[usuarios] ([id], [nombre_usuario], [contrasennia], [correo]) VALUES (N'12', N'Junnior Solorzano', N'Jnuui0r', N'jsolorzano@lcde.com')
INSERT [dbo].[usuarios] ([id], [nombre_usuario], [contrasennia], [correo]) VALUES (N'13', N'Dilia Montenegro', N'D1l1a', N'dmontenegro@lcde.com')
INSERT [dbo].[usuarios] ([id], [nombre_usuario], [contrasennia], [correo]) VALUES (N'14', N'Edgar Fernando Ajset', N'AQAAAAEAACcQAAAAELFnbjeZNnQnuAfgAe7uFXS4nPArYgyF9iqYj1UreglnWlTh8hM1jt38vk0iql9tTA==', N'EAJSET@LUCALZA.COM')
INSERT [dbo].[usuarios] ([id], [nombre_usuario], [contrasennia], [correo]) VALUES (N'15', N'Miguel Samayoa', N'AQAAAAEAACcQAAAAECs2xiCzb1T3RW6smR37LyoF2ug9AzZdjEoadxSKM3OcG6B85H5UWQZy+M7ZoUv9Dw==', N'MSAMAYOA@MIUMG.EDU.GT')
INSERT [dbo].[usuarios] ([id], [nombre_usuario], [contrasennia], [correo]) VALUES (N'2', N'Brizeth Jazmin Alvarado', N'AQAAAAEAACcQAAAAEOx+l3KYPQvk5P0m0pw3GFg9Vxus5kTxcteX9YBXY+Mx6b9I0wy0IlTDyawebfVgjQ==', N'BALVARADOL3@MIUMG.EDU.GT')
INSERT [dbo].[usuarios] ([id], [nombre_usuario], [contrasennia], [correo]) VALUES (N'3', N'Edgar Fernando Ajset', N'AQAAAAEAACcQAAAAEJxpn9ulnsBK1CXnyBu49ZH2V7aZVYiHegR0KIyGKMQXSh35colaI9UVpCPTid/M2w==', N'EAJSETN@MIUMG.EDU.GT')
INSERT [dbo].[usuarios] ([id], [nombre_usuario], [contrasennia], [correo]) VALUES (N'4', N'Jessica Fuentes', N'Jess2023', N'jfuentes@lcde.com')
INSERT [dbo].[usuarios] ([id], [nombre_usuario], [contrasennia], [correo]) VALUES (N'5', N'Melva Diaz', N'MDi@z', N'mdiaz@lcde.com')
INSERT [dbo].[usuarios] ([id], [nombre_usuario], [contrasennia], [correo]) VALUES (N'6', N'Adolfo de León', N'Ad3l3on', N'adleon@lcde.com')
INSERT [dbo].[usuarios] ([id], [nombre_usuario], [contrasennia], [correo]) VALUES (N'7', N'Sonia Gutierrez', N'S0n!a23', N'sgutierrez@lcde.com')
INSERT [dbo].[usuarios] ([id], [nombre_usuario], [contrasennia], [correo]) VALUES (N'8', N'Mynor Aguilar', N'm@guil@r', N'maguilar@lcde.com')
INSERT [dbo].[usuarios] ([id], [nombre_usuario], [contrasennia], [correo]) VALUES (N'9', N'Juan Dominguez', N'Jn@u', N'jdominguez@lcde.com')
GO
/****** Object:  Index [IDX_auditoria]    Script Date: 06/06/2023 22:29:20 ******/
CREATE NONCLUSTERED INDEX [IDX_auditoria] ON [dbo].[auditoria]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_categoria_producto]    Script Date: 06/06/2023 22:29:20 ******/
CREATE NONCLUSTERED INDEX [IDX_categoria_producto] ON [dbo].[categoria_productos]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_CLIENTES]    Script Date: 06/06/2023 22:29:20 ******/
CREATE NONCLUSTERED INDEX [IDX_CLIENTES] ON [dbo].[clientes]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_CLIENTES_NIT]    Script Date: 06/06/2023 22:29:20 ******/
CREATE NONCLUSTERED INDEX [IDX_CLIENTES_NIT] ON [dbo].[clientes]
(
	[NIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_PROVEEDORES]    Script Date: 06/06/2023 22:29:20 ******/
CREATE NONCLUSTERED INDEX [IDX_PROVEEDORES] ON [dbo].[clientes]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_PROVEEDORES_NIT]    Script Date: 06/06/2023 22:29:20 ******/
CREATE NONCLUSTERED INDEX [IDX_PROVEEDORES_NIT] ON [dbo].[clientes]
(
	[NIT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DET_FACTURA]    Script Date: 06/06/2023 22:29:20 ******/
CREATE NONCLUSTERED INDEX [IDX_DET_FACTURA] ON [dbo].[detalle_factura]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DET_FACTURA_ENC_FAC]    Script Date: 06/06/2023 22:29:20 ******/
CREATE NONCLUSTERED INDEX [IDX_DET_FACTURA_ENC_FAC] ON [dbo].[detalle_factura]
(
	[id_encabezado_factura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DEVOLUCIONES_FECHA]    Script Date: 06/06/2023 22:29:20 ******/
CREATE NONCLUSTERED INDEX [IDX_DEVOLUCIONES_FECHA] ON [dbo].[devoluciones]
(
	[fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DEVOLUCIONES_ID]    Script Date: 06/06/2023 22:29:20 ******/
CREATE NONCLUSTERED INDEX [IDX_DEVOLUCIONES_ID] ON [dbo].[devoluciones]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_DEVOLUCIONES_ID_PRODUCTO]    Script Date: 06/06/2023 22:29:20 ******/
CREATE NONCLUSTERED INDEX [IDX_DEVOLUCIONES_ID_PRODUCTO] ON [dbo].[devoluciones]
(
	[id_producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_ENC_FAC_ID]    Script Date: 06/06/2023 22:29:20 ******/
CREATE NONCLUSTERED INDEX [IDX_ENC_FAC_ID] ON [dbo].[encabezado_factura]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_ENC_FAC_ID_CLIENTE]    Script Date: 06/06/2023 22:29:20 ******/
CREATE NONCLUSTERED INDEX [IDX_ENC_FAC_ID_CLIENTE] ON [dbo].[encabezado_factura]
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_PRODUCTO_ID]    Script Date: 06/06/2023 22:29:20 ******/
CREATE NONCLUSTERED INDEX [IDX_PRODUCTO_ID] ON [dbo].[productos]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_PROMOCIONES]    Script Date: 06/06/2023 22:29:20 ******/
CREATE NONCLUSTERED INDEX [IDX_PROMOCIONES] ON [dbo].[promociones]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_REGISTRO_CAJA_ID]    Script Date: 06/06/2023 22:29:20 ******/
CREATE NONCLUSTERED INDEX [IDX_REGISTRO_CAJA_ID] ON [dbo].[Registro_de_caja]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_REGISTRO_CAJA_ID_CAJA]    Script Date: 06/06/2023 22:29:20 ******/
CREATE NONCLUSTERED INDEX [IDX_REGISTRO_CAJA_ID_CAJA] ON [dbo].[Registro_de_caja]
(
	[id_caja] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_REGISTRO_CAJA_ID_USUARIO]    Script Date: 06/06/2023 22:29:20 ******/
CREATE NONCLUSTERED INDEX [IDX_REGISTRO_CAJA_ID_USUARIO] ON [dbo].[Registro_de_caja]
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_TIPO_PAGO]    Script Date: 06/06/2023 22:29:20 ******/
CREATE NONCLUSTERED INDEX [IDX_TIPO_PAGO] ON [dbo].[tipo_pago]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_usuarios]    Script Date: 06/06/2023 22:29:20 ******/
CREATE NONCLUSTERED INDEX [IDX_usuarios] ON [dbo].[usuarios]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_usuarios_correo]    Script Date: 06/06/2023 22:29:20 ******/
CREATE NONCLUSTERED INDEX [IDX_usuarios_correo] ON [dbo].[usuarios]
(
	[correo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[despacho] ADD  CONSTRAINT [DF_despacho_fecha_despacho]  DEFAULT (getdate()) FOR [fecha_despacho]
GO
ALTER TABLE [dbo].[detalle_factura] ADD  CONSTRAINT [DF_detalle_factura_descuento]  DEFAULT ((0)) FOR [descuento]
GO
ALTER TABLE [dbo].[devoluciones] ADD  DEFAULT (getdate()) FOR [fecha]
GO
ALTER TABLE [dbo].[precios_producto] ADD  DEFAULT ((0)) FOR [descuento_producto]
GO
ALTER TABLE [dbo].[despacho]  WITH CHECK ADD  CONSTRAINT [FK_despacho_encabezado_factura] FOREIGN KEY([id_encabezado_factura])
REFERENCES [dbo].[encabezado_factura] ([id])
GO
ALTER TABLE [dbo].[despacho] CHECK CONSTRAINT [FK_despacho_encabezado_factura]
GO
ALTER TABLE [dbo].[detalle_factura]  WITH CHECK ADD  CONSTRAINT [fk_detalle_factura_productos] FOREIGN KEY([id_producto])
REFERENCES [dbo].[productos] ([id])
GO
ALTER TABLE [dbo].[detalle_factura] CHECK CONSTRAINT [fk_detalle_factura_productos]
GO
ALTER TABLE [dbo].[detalle_factura]  WITH CHECK ADD  CONSTRAINT [fk_encabezado_factura_productos] FOREIGN KEY([id_encabezado_factura])
REFERENCES [dbo].[encabezado_factura] ([id])
GO
ALTER TABLE [dbo].[detalle_factura] CHECK CONSTRAINT [fk_encabezado_factura_productos]
GO
ALTER TABLE [dbo].[devoluciones]  WITH CHECK ADD  CONSTRAINT [fk_devoluciones_tipo_productos] FOREIGN KEY([id_producto])
REFERENCES [dbo].[productos] ([id])
GO
ALTER TABLE [dbo].[devoluciones] CHECK CONSTRAINT [fk_devoluciones_tipo_productos]
GO
ALTER TABLE [dbo].[encabezado_factura]  WITH CHECK ADD  CONSTRAINT [fk_encabezado_factura_clientes] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[clientes] ([id])
GO
ALTER TABLE [dbo].[encabezado_factura] CHECK CONSTRAINT [fk_encabezado_factura_clientes]
GO
ALTER TABLE [dbo].[encabezado_factura]  WITH CHECK ADD  CONSTRAINT [fk_encabezado_factura_tipo_pago] FOREIGN KEY([id_tipo_pago])
REFERENCES [dbo].[tipo_pago] ([id])
GO
ALTER TABLE [dbo].[encabezado_factura] CHECK CONSTRAINT [fk_encabezado_factura_tipo_pago]
GO
ALTER TABLE [dbo].[precios_producto]  WITH CHECK ADD  CONSTRAINT [FK__precios_p__id_pr__5AEE82B9] FOREIGN KEY([id_producto])
REFERENCES [dbo].[productos] ([id])
GO
ALTER TABLE [dbo].[precios_producto] CHECK CONSTRAINT [FK__precios_p__id_pr__5AEE82B9]
GO
ALTER TABLE [dbo].[productos]  WITH CHECK ADD  CONSTRAINT [FK__productos__id_pr__5BE2A6F2] FOREIGN KEY([id_proveedor])
REFERENCES [dbo].[proveedores] ([id])
GO
ALTER TABLE [dbo].[productos] CHECK CONSTRAINT [FK__productos__id_pr__5BE2A6F2]
GO
ALTER TABLE [dbo].[productos]  WITH CHECK ADD  CONSTRAINT [FK__productos__id_pr__5DCAEF64] FOREIGN KEY([id_promocion])
REFERENCES [dbo].[promociones] ([id])
GO
ALTER TABLE [dbo].[productos] CHECK CONSTRAINT [FK__productos__id_pr__5DCAEF64]
GO
ALTER TABLE [dbo].[productos]  WITH CHECK ADD  CONSTRAINT [fk_proveedores_categoria_productos] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[categoria_productos] ([id])
GO
ALTER TABLE [dbo].[productos] CHECK CONSTRAINT [fk_proveedores_categoria_productos]
GO
ALTER TABLE [dbo].[Registro_de_caja]  WITH CHECK ADD  CONSTRAINT [fk_id_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuarios] ([id])
GO
ALTER TABLE [dbo].[Registro_de_caja] CHECK CONSTRAINT [fk_id_usuario]
GO
ALTER TABLE [dbo].[Registro_de_caja]  WITH CHECK ADD  CONSTRAINT [fk_registroCaja_caja] FOREIGN KEY([id_caja])
REFERENCES [dbo].[caja] ([id])
GO
ALTER TABLE [dbo].[Registro_de_caja] CHECK CONSTRAINT [fk_registroCaja_caja]
GO
/****** Object:  StoredProcedure [dbo].[SP_CREAR_USUARIO]    Script Date: 06/06/2023 22:29:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CREAR_USUARIO]

	@NombreUsuario varchar(100),
	@Contrasennia varchar(MAX),
	@Correo varchar(150)

AS
BEGIN
	SET NOCOUNT ON;
	INSERT INTO usuarios (nombre_usuario, contrasennia, correo)
	VALUES
	(@NombreUsuario, @Contrasennia, @Correo) 
	SELECT SCOPE_IDENTITY();
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_CRUD_CAJA]    Script Date: 06/06/2023 22:29:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CRUD_CAJA]
	@IdCaja int,
	@NumeroCaja int,
	@MontoUltimoCierre decimal,
	@Estado varchar(50),
	@Operacion varchar(50)
AS

BEGIN

	IF @Operacion ='select' 
	BEGIN
	SET NOCOUNT ON;
	SELECT * FROM caja WHERE id = @IdCaja;
	END

	IF @Operacion ='todo' 
	BEGIN
	SET NOCOUNT ON;
	SELECT * FROM caja
	END

	ELSE IF @Operacion ='update' 
	BEGIN
	SET NOCOUNT ON;
	UPDATE TOP(1) caja SET numero_caja=@NumeroCaja, monto_ultimo_cierre=@MontoUltimoCierre, estado=@Estado
	WHERE id = @IdCaja; 
	END

END;
GO
/****** Object:  StoredProcedure [dbo].[SP_CRUD_CATEGORIA_PRODUCTOS]    Script Date: 06/06/2023 22:29:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CRUD_CATEGORIA_PRODUCTOS]
	@IdCategoriaProducto int,
	@NombreCategoria varchar(100),
	@Operacion varchar(50)

AS

BEGIN
	IF @Operacion = 'insert'
	BEGIN
	SET NOCOUNT ON;
	INSERT INTO categoria_productos (nombre)
	VALUES (@NombreCategoria)
	END

	IF @Operacion = 'select'
	BEGIN
	SET NOCOUNT ON;
	SELECT * FROM categoria_productos WHERE id=@IdCategoriaProducto;
	END

	ELSE IF @Operacion ='delete' 
	BEGIN
	SET NOCOUNT ON;
	DELETE TOP(1) FROM categoria_productos WHERE id = @IdCategoriaProducto;
	END

	ELSE IF @Operacion ='update' 
	BEGIN
	SET NOCOUNT ON;
	UPDATE TOP(1) categoria_productos SET nombre=@NombreCategoria
	WHERE id = @IdCategoriaProducto; 
	END

	IF @Operacion = 'todo'
	BEGIN
	SET NOCOUNT ON;
	SELECT * FROM categoria_productos;
	END

END;
GO
/****** Object:  StoredProcedure [dbo].[SP_CRUD_CLIENTES]    Script Date: 06/06/2023 22:29:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CRUD_CLIENTES]
	@NombreCliente varchar(150),
	@DireccionCliente varchar(MAX),
	@TelefonoCliente int,
	@CorreoCliente varchar(150),
	@NIT varchar(20),
	@IdCliente int,
	@Operacion varchar(50)
AS

BEGIN
	IF @Operacion ='select' 
	BEGIN
	SET NOCOUNT ON;
	SELECT * FROM clientes WHERE id = @IdCliente;
	END

    ELSE IF @Operacion = 'insert'
    BEGIN
            INSERT INTO clientes(nombre, direccion, telefono, correo, NIT) 
            VALUES (@NombreCliente, @DireccionCliente, @TelefonoCliente, @CorreoCliente, @NIT);
            SELECT SCOPE_IDENTITY()
    END
    ELSE IF @Operacion ='delete'
    BEGIN

            DELETE TOP(1) FROM clientes WHERE id = @IdCliente;
    END
    ELSE IF @Operacion ='update'
    BEGIN
            UPDATE TOP(1) clientes SET nombre=@NombreCliente, direccion=@DireccionCliente, 
            telefono=@TelefonoCliente, correo=@CorreoCliente, NIT=@NIT
            WHERE id = @IdCliente;
    END

	ELSE IF @Operacion ='todo' 
	BEGIN
	SET NOCOUNT ON;
	SELECT * FROM clientes;
	END

	ELSE IF @Operacion ='selectPorNit' 
	BEGIN
	SET NOCOUNT ON;
	SELECT * FROM clientes WHERE NIT = @NIT
	AND id!=@IdCliente;
	END
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_CRUD_DESPACHOS]    Script Date: 06/06/2023 22:29:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CRUD_DESPACHOS]
	@IdDespacho int,
	@IdEncabezadoFactura int,
	@FechaDespacho datetime,
	@Estado varchar(50),
	@Operacion varchar (50)


AS
BEGIN
	IF @Operacion = 'insert' 
	BEGIN
	SET NOCOUNT ON;
	INSERT INTO despacho ( id_encabezado_factura, fecha_despacho, estado)
	VALUES (@IdEncabezadoFactura, @FechaDespacho, @Estado)
	END

	ELSE IF @Operacion ='delete' 
	BEGIN
	SET NOCOUNT ON;
	DELETE TOP(1) FROM despacho WHERE id= @IdDespacho;
	END

	ELSE IF @Operacion ='todo' 
	BEGIN
	SET NOCOUNT ON;
	SELECT * FROM despacho;
	END

END;
GO
/****** Object:  StoredProcedure [dbo].[SP_CRUD_DEVOLUCIONES]    Script Date: 06/06/2023 22:29:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CRUD_DEVOLUCIONES]
	@IdDevolucion int,
	@Cantidad int,
	@Motivo varchar (MAX),
	@IdProducto int,
	@Fecha date,
	@TipoDevolucion varchar(50),
	@Operacion VARCHAR(50)

AS

BEGIN
DECLARE 
@existenciaAnteriorProducto int,
@IdNuevaDevolucion int
	IF @Operacion = 'insert'
	BEGIN TRY
    BEGIN TRANSACTION;
		SET NOCOUNT ON;

		-- obtener existencia antes de la operacion
		SELECT @existenciaAnteriorProducto = ISNULL(existencia,0) FROM productos WHERE id = @IdProducto 


		INSERT INTO devoluciones (cantidad, motivo, id_producto, fecha, tipo_devolucion)
		VALUES (@Cantidad, @Motivo, @IdProducto, @Fecha, @TipoDevolucion)
		SELECT @IdNuevaDevolucion = SCOPE_IDENTITY();
		-- ACTUALIZAR EXISTENCIA DE PRODUCTOS
		UPDATE TOP(1) productos
		SET existencia=@existenciaAnteriorProducto+@Cantidad
		WHERE id=@IdProducto

		-- Realizar commit
        COMMIT;
		SELECT @IdNuevaDevolucion;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
	-- Realizar Rollback si algo falla
            ROLLBACK;
        -- mostrar el mensaje de error
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH;

	ELSE IF @Operacion ='select' 
	BEGIN
	SET NOCOUNT ON;
	SELECT * FROM devoluciones WHERE id = @IdDevolucion;
	END;

	ELSE IF @Operacion ='delete' 
    BEGIN TRY
        BEGIN TRANSACTION;
	SET NOCOUNT ON;
	-- ACTUALIZAR EXISTENCIA DE PRODUCTOS
	IF EXISTS (SELECT 1 FROM devoluciones WHERE id = @IdDevolucion)
	BEGIN
	SELECT @IdProducto = id_producto FROM devoluciones WHERE id = @IdDevolucion;
		-- obtener existencia antes de la operacion
		SELECT @existenciaAnteriorProducto = ISNULL(existencia,0) FROM productos WHERE id = @IdProducto 
		-- Cantidad del registro de devolución
		SELECT @Cantidad = cantidad FROM devoluciones WHERE id = @IdDevolucion
		-- Eliminar devolución
		DELETE TOP(1) FROM devoluciones WHERE id = @IdDevolucion;
		-- ACTUALIZAR EXISTENCIA DE PRODUCTOS
		UPDATE TOP(1) productos
		SET existencia=@existenciaAnteriorProducto-@Cantidad
		WHERE id=@IdProducto
	END
	-- Realizar commit
        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
	-- Realizar Rollback si algo falla
            ROLLBACK;
        -- mostrar el mensaje de error
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH;

	ELSE IF @Operacion ='update' 
	BEGIN
	SET NOCOUNT ON;
	UPDATE TOP(1) devoluciones SET cantidad=@Cantidad, motivo=@Motivo, fecha=@Fecha, tipo_devolucion=@TipoDevolucion
	WHERE id = @IdDevolucion;
	END;

	ELSE IF @Operacion ='todo' 
	BEGIN
	SET NOCOUNT ON;
	SELECT devoluciones.*, productos.detalle AS NombreProducto 
	FROM devoluciones
	INNER JOIN productos
	ON devoluciones.id_producto=productos.id
	;
	END

END;
GO
/****** Object:  StoredProcedure [dbo].[SP_CRUD_FACTURA]    Script Date: 06/06/2023 22:29:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CRUD_FACTURA]
	@IdEncabezado int,
	@Serie varchar(150),
	@Fecha datetime,
	@IdTipoPago int,
	@IdCliente int,
	@Operacion VARCHAR(50)

AS

BEGIN
	IF @Operacion = 'insert' 
	BEGIN
	SET NOCOUNT ON;
	INSERT INTO encabezado_factura (serie, fecha, id_tipo_pago, id_cliente)
	VALUES
	(@Serie, @Fecha, @IdTipoPago, @IdCliente) 
	SELECT SCOPE_IDENTITY();
	END

	ELSE IF @Operacion ='select' 
	BEGIN
	SET NOCOUNT ON;
	SELECT EF.id, EF.serie, EF.fecha, CL.direccion, 
	CL.NIT,
	CL.nombre, '' AS QrImagen, 
	(SELECT SUM(subtotal) FROM detalle_factura WHERE id_encabezado_factura=ef.id) AS TotalFactura
	FROM encabezado_factura AS EF
	INNER JOIN clientes AS CL 
	ON EF.id_cliente=CL.id
	WHERE EF.id = @IdEncabezado;
	END

	ELSE IF @Operacion ='delete' 
	BEGIN
	SET NOCOUNT ON;
	DELETE TOP(1) FROM encabezado_factura WHERE id = @IdEncabezado;
	END

	ELSE IF @Operacion ='update' 
	BEGIN
	SET NOCOUNT ON;
	UPDATE TOP(1) encabezado_factura SET serie=@Serie, fecha=@Fecha, id_tipo_pago=@IdTipoPago, id_cliente=@IdCliente
	WHERE id = @IdEncabezado; 
	END

	
	ELSE IF @Operacion ='todo' 
	BEGIN
	SET NOCOUNT ON;
	SELECT * FROM encabezado_factura;
	END
	   
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_CRUD_PRECIOS]    Script Date: 06/06/2023 22:29:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CRUD_PRECIOS]
	@IdProducto int,
	@PrecioUnidad decimal(16,2),	
	@DescuentoProducto decimal(16,2),
	@FechaModificacionPrecio datetime,
	@Operacion varchar (50)
AS

BEGIN
	IF @Operacion = 'insert' 
	BEGIN
	SET NOCOUNT ON;
	INSERT INTO precios_producto(precio_unidad, descuento_producto, fecha_modificacion_precio) 
	VALUES (@PrecioUnidad, @DescuentoProducto, @FechaModificacionPrecio)
	END

	ELSE IF @Operacion ='select' 
	BEGIN
	SET NOCOUNT ON;
	SELECT * FROM precios_producto WHERE id_producto = @IdProducto;
	END

	ELSE IF @Operacion ='delete' 
	BEGIN
	SET NOCOUNT ON;
	DELETE TOP(1) FROM precios_producto WHERE id_producto = @IdProducto;
	END

	ELSE IF @Operacion ='update' 
	BEGIN
	SET NOCOUNT ON;
	UPDATE TOP(1) precios_producto SET precio_unidad=@PrecioUnidad, descuento_producto=@DescuentoProducto, 
	fecha_modificacion_precio=@FechaModificacionPrecio
	WHERE id_producto = @IdProducto; 
	END

	ELSE IF @Operacion ='todo' 
	BEGIN
	SET NOCOUNT ON;
	SELECT * FROM precios_producto;
	END
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_CRUD_PRODUCTOS]    Script Date: 06/06/2023 22:29:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_CRUD_PRODUCTOS]
	@DetalleProducto varchar(MAX),
	@Existencia int,
	@IdCategoria int,
	@IdProveedor int,
	@IdPromocion int,
	@IdProducto int,
	@PrecioUnidad decimal(16,2),
	@Operacion VARCHAR(50)
AS
BEGIN
	DECLARE 
	@IdProductoNuevo int,
	@PrecioAnterior decimal(16,2)

	IF @Operacion = 'insert' 
	BEGIN
		BEGIN TRY
			BEGIN TRANSACTION;

			SET NOCOUNT ON;
			
			-- Insertar el nuevo registro de producto.
			INSERT INTO productos (detalle, existencia, id_categoria, id_proveedor, id_promocion) 
			VALUES (@DetalleProducto, @Existencia, @IdCategoria, @IdProveedor, @IdPromocion)
			
			-- Recuperar el ID del nuevo registro de producto.
			SELECT @IdProductoNuevo = SCOPE_IDENTITY()
			
			-- Evaluar si se obtuvo el nuevo ID.
			IF (@IdProductoNuevo IS NOT NULL AND @IdProductoNuevo > 0)
			BEGIN
				-- Insertar el precio del producto.
				INSERT INTO precios_producto (id_producto, precio_unidad, descuento_producto,fecha_modificacion_precio)
				VALUES (@IdProductoNuevo, @PrecioUnidad, 0,GETDATE())
			END

			-- Realizar commit
			COMMIT;

			-- Devolver el ID del nuevo producto creado.
			SELECT @IdProductoNuevo AS NuevoIdProducto;
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
				-- Realizar Rollback si algo falla.
				ROLLBACK;
			
			-- Mostrar el mensaje de error.
			SELECT ERROR_MESSAGE() AS ErrorMessage;
		END CATCH;
	END

	ELSE IF @Operacion ='select' 
		BEGIN
		SET NOCOUNT ON;
		SELECT p.*,p.id_categoria,pr.precio_unidad AS PrecioUnidadString
		FROM productos p
		INNER JOIN precios_producto pr
		ON pr.id_producto=p.id
		WHERE p.id = @IdProducto;
	END

	ELSE IF @Operacion ='delete' 
	BEGIN
		BEGIN TRY
		BEGIN TRANSACTION;
			SET NOCOUNT ON;
			DELETE TOP(1) FROM precios_producto
			WHERE id_producto=@IdProducto

			DELETE TOP(1) FROM productos 
			WHERE id = @IdProducto;

		-- Realizar commit
		COMMIT;
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
				-- Realizar Rollback si algo falla.
				ROLLBACK;
			
			-- Mostrar el mensaje de error.
			SELECT ERROR_MESSAGE() AS ErrorMessage;
		END CATCH;
	END

	ELSE IF @Operacion ='update' 
	BEGIN
		BEGIN TRY
		BEGIN TRANSACTION;
			SET NOCOUNT ON;
			-- Obtener el precio por unidad, para ser o no actualizado mas adelante.
			SELECT @PrecioAnterior = precio_unidad FROM precios_producto WHERE id_producto=@IdProducto
			-- Actualizar propiedades del producto.
			UPDATE TOP(1) productos SET 
			detalle=@DetalleProducto, existencia=@Existencia, 
			id_categoria=@IdCategoria, id_proveedor=@IdProveedor,  
			id_promocion=@IdPromocion
			WHERE id = @IdProducto; 
				-- Evaluar si se cambio el precio.
			IF (@PrecioUnidad!=@PrecioAnterior)
			BEGIN
				-- Actualizar precio de unidad de producto
				UPDATE TOP(1) precios_producto
				SET precio_unidad=@PrecioUnidad
				WHERE id_producto=@IdProducto
			END
			-- Realizar commit
			COMMIT;
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
				-- Realizar Rollback si algo falla.
				ROLLBACK;
			
			-- Mostrar el mensaje de error.
			SELECT ERROR_MESSAGE() AS ErrorMessage;
		END CATCH;
	END

	ELSE IF @Operacion ='selectPorNombre' 
		BEGIN
		SET NOCOUNT ON;
		SELECT * FROM productos WHERE detalle = @DetalleProducto
		AND id!=@IdProducto;
	END

	ELSE IF @Operacion ='todo' 
	BEGIN
		SET NOCOUNT ON;
		SELECT p.*, ca.nombre AS NombreCategoria,
		prov.nombre AS NombreProveedor, pr.precio_unidad AS PrecioUnidad,
		ISNULL(promo.id,0) AS IdPromocion,
		ISNULL(promo.descripcion,'Sin promoción') AS promocion,
		ISNULL(pr.descuento_producto,0) AS Descuento
		FROM productos p
		INNER JOIN proveedores prov
		ON p.id_proveedor = prov.id
		INNER JOIN categoria_productos ca
		ON p.id_categoria=ca.id
		INNER JOIN precios_producto pr
		ON pr.id_producto=p.id
		LEFT JOIN promociones promo
		ON p.id_promocion=promo.id
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CRUD_PROVEEDORES]    Script Date: 06/06/2023 22:29:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CRUD_PROVEEDORES]
	@NombreProveedor varchar(150),
	@DireccionProveedor varchar(MAX),
	@TelefonoProveedor int,
	@CorreoProveedor varchar(150),
	@NITProveedor varchar(20),
	@IdProveedor int,
	@Operacion varchar(50)

AS

BEGIN
	IF @Operacion = 'insert' 
	BEGIN
	SET NOCOUNT ON;
	INSERT INTO proveedores (nombre, direccion, telefono, correo, NIT) 
	VALUES (@NombreProveedor, @DireccionProveedor, @TelefonoProveedor, @CorreoProveedor, @NITProveedor)
	SELECT SCOPE_IDENTITY()
	END

	ELSE IF @Operacion ='select' 
	BEGIN
	SET NOCOUNT ON;
	SELECT * FROM proveedores WHERE id = @IdProveedor;
	END

	ELSE IF @Operacion ='delete' 
	BEGIN
	SET NOCOUNT ON;
	DELETE TOP(1) FROM proveedores WHERE id = @IdProveedor;
	END

	ELSE IF @Operacion ='update' 
	BEGIN
	SET NOCOUNT ON;
	UPDATE TOP(1) proveedores SET nombre=@NombreProveedor, 
	direccion=@DireccionProveedor, telefono=@TelefonoProveedor, 
	correo=@CorreoProveedor, NIT=@NITProveedor
	WHERE id = @IdProveedor;
	END

	ELSE IF @Operacion ='todo' 
	BEGIN
	SET NOCOUNT ON;
	SELECT * FROM proveedores;
	END

	ELSE IF @Operacion ='selectPorNit' 
	BEGIN
	SET NOCOUNT ON;
	SELECT * FROM proveedores WHERE NIT = @NITProveedor
	AND id!=@IdProveedor;
	END

END;
GO
/****** Object:  StoredProcedure [dbo].[SP_DETALLE_FACTURA]    Script Date: 06/06/2023 22:29:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_DETALLE_FACTURA]
	@IdDetalleFactura int,
	@Subtotal decimal(16,2),
	@Cantidad int,
	@IdProducto int,
	@IdEncabezadoFactura int,
	@DescuentoTotal decimal(16,2),
	@Operacion varchar(50)

AS

BEGIN 
DECLARE
@descuento decimal(16,2), 
@cantidad_anterior_producto_en_factura int,
@precioUnidad decimal(16,2),
@existenciaAnteriorProducto int

	IF @Operacion = 'insert' 
    BEGIN TRY
        BEGIN TRANSACTION;
	SET NOCOUNT ON;
	-- obtener existencia antes de la operacion
	SELECT @existenciaAnteriorProducto = ISNULL(existencia,0) FROM productos WHERE id = @IdProducto 
	-- Validar que cantidad no supere la existencia
	IF(@existenciaAnteriorProducto<@Cantidad)
	BEGIN
		-- mostrar el mensaje de error
        SELECT 'Existencia insuficiente' AS ErrorMessage;
		COMMIT;
		RETURN;
	END
	ELSE
	BEGIN
		-- CALCULAR DESCUENTOS SEGUN PROMOCIONES
	SELECT @cantidad_anterior_producto_en_factura = ISNULL(SUM(cantidad),0) -- Obtener la sumatoria del mismo producto en la factura actual 
													FROM detalle_factura 
													WHERE id_encabezado_factura = @IdEncabezadoFactura
													AND id_producto = @IdProducto
	-- Obtener el precio por unidad del producto para el detalle
	SELECT @precioUnidad = precio_unidad FROM precios_producto
						   WHERE id_producto=@IdProducto
	-- Obtener el descuento, según las promociones validas.
	SELECT @descuento =  
	CASE 
	WHEN P.id_promocion = 1 THEN (@Cantidad * ISNULL(PP.descuento_producto,0)) -- Cuando la promoción es 1, descuento por cada producto 
	WHEN P.id_promocion = 3 AND @cantidad_anterior_producto_en_factura <2 AND (@cantidad_anterior_producto_en_factura+
								@Cantidad)>=2				-- Cuando la promoción es 3, se hace descuento de la segunda unidad   
							THEN (pp.precio_unidad/2)   -- a mitad de precio, solo aplica una promoción por factura
	WHEN P.id_promocion = 4 AND @cantidad_anterior_producto_en_factura <4 
							AND (@cantidad_anterior_producto_en_factura+	-- Cuando la promoción es 4, se hace descuento total
								 @Cantidad)>=4								-- del cuarto artículo, solo aplica una oferta por factura
							THEN (pp.precio_unidad)
	ELSE 0 -- Valor por defecto cuando no se cumple ninguna de las condiciones anteriores
	END 
	FROM productos p
	INNER JOIN precios_producto  pp
	ON p.id =pp.id_producto
	LEFT JOIN promociones pro 
	ON p.id_promocion =pro.id
	WHERE P.id= @IdProducto

	-- SETEAR SUBTOTAL
	SET @Subtotal = (@Cantidad*@precioUnidad)-@descuento
	-- REALIZAR INSERT DE DETALLE_FACTURA
	INSERT INTO detalle_factura(subtotal,descuento, cantidad, id_producto, id_encabezado_factura) 
	VALUES (@Subtotal, @DescuentoTotal, @Cantidad, @IdProducto, @IdEncabezadoFactura)

	-- ACTUALIZAR EXISTENCIA DE PRODUCTOS
	UPDATE TOP(1) productos
	SET existencia=@existenciaAnteriorProducto-@Cantidad
	WHERE id=@IdProducto

	-- Realizar commit
        COMMIT;
	END
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
	-- Realizar Rollback si algo falla
            ROLLBACK;
        -- mostrar el mensaje de error
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH;

	ELSE IF @Operacion ='delete' 
    BEGIN TRY
        BEGIN TRANSACTION;
	SET NOCOUNT ON;
	-- ACTUALIZAR EXISTENCIA DE PRODUCTOS
	IF EXISTS (SELECT 1 FROM detalle_factura WHERE id = @IdDetalleFactura)
	BEGIN
		-- obtener existencia antes de la operacion
		SELECT @existenciaAnteriorProducto = existencia FROM productos WHERE id = @IdProducto 

		SELECT @Cantidad = ISNULL(cantidad,0) FROM detalle_factura WHERE id = @IdDetalleFactura
		DELETE TOP(1) FROM detalle_factura WHERE id = @IdDetalleFactura;
		UPDATE TOP(1) productos
		SET existencia=@existenciaAnteriorProducto+@Cantidad
		WHERE id=@IdProducto
	END
	-- Realizar commit
        COMMIT;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
	-- Realizar Rollback si algo falla
            ROLLBACK;
        -- mostrar el mensaje de error
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH;

	ELSE IF @Operacion ='todo' 
	BEGIN
	SET NOCOUNT ON;


	SELECT productos.detalle, detalle_factura.cantidad, precios_producto.precio_unidad, detalle_factura.descuento, detalle_factura.subtotal
	FROM detalle_factura
	INNER JOIN productos ON detalle_factura.id_producto=productos.id
	INNER JOIN precios_producto ON productos.id=precios_producto.id_producto
	WHERE id_encabezado_factura=@IdEncabezadoFactura;
	END
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENER_USUARIO]    Script Date: 06/06/2023 22:29:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--obtener usuario traer todos los datos del usuario por medio de su correo
CREATE PROCEDURE [dbo].[SP_OBTENER_USUARIO]

	@NombreUsuario varchar(100),
	@Contrasennia varchar(MAX),
	@Correo varchar(150)

AS

BEGIN
	SET NOCOUNT ON;
	SELECT * FROM usuarios WHERE correo = @Correo;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_PROMOCIONES_FACTURA]    Script Date: 06/06/2023 22:29:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_PROMOCIONES_FACTURA]
@IdFactura int
AS
BEGIN

	SELECT det.*, promo.descripcion, pro.detalle
	FROM detalle_factura det 
	INNER JOIN encabezado_factura enc
	ON det.id_encabezado_factura=enc.id
	INNER JOIN productos PRO
	ON det.id_producto=pro.id
	INNER JOIN promociones promo
	ON promo.id=pro.id_promocion
	WHERE enc.id=12


	SELECT * FROM detalle_factura
	WHERE id_encabezado_factura=@IdFactura
END
GO
/****** Object:  StoredProcedure [dbo].[SP_REGISTRO_CAJA]    Script Date: 06/06/2023 22:29:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_REGISTRO_CAJA]

	@IdCaja int,
	@FechaRegistroCaja datetime,
	@Turno int,
	@IdUsuario int,
	@TipoRegistro varchar(20),
	@Monto decimal(16,2),
	@Operacion varchar(50)

AS
BEGIN
	IF @Operacion = 'insert'
    BEGIN TRY
        BEGIN TRANSACTION;
		SET NOCOUNT ON;
	
		-- CIERRE DE CAJA
		DECLARE
		@UltimoCorte datetime,
		@MontoVendido decimal(16,2),
		@IdNuevoRegistro int

	-- OBTENER FECHA Y HORA DE ULTIMO CIERRE
		SELECT TOP 1 @UltimoCorte = fecha
		FROM Registro_de_caja
		ORDER BY FECHA DESC;
--SELECT @UltimoCorte


-- OBTENER LA SUMA VENDIDA DESDE EL ULTIMO CIERRE
	SELECT @MontoVendido=
	ISNULL(SUM(detalle_factura.subtotal),0) 
	FROM 
	detalle_factura
	INNER JOIN encabezado_factura
	ON encabezado_factura.id=detalle_factura.id_encabezado_factura
	WHERE encabezado_factura.fecha>@UltimoCorte

--SELECT @MontoVendido
		IF(@MontoVendido>0)
		BEGIN
			INSERT INTO Registro_de_caja (fecha, turno, id_caja, id_usuario, tipo_registro, monto) 
			VALUES (@FechaRegistroCaja, @Turno, @IdCaja, @IdUsuario, @TipoRegistro, @MontoVendido);
			SELECT @IdNuevoRegistro = SCOPE_IDENTITY();

			UPDATE caja
			SET monto_ultimo_cierre=monto_ultimo_cierre+@MontoVendido
		END
		ELSE
		BEGIN
			SET @IdNuevoRegistro=1;
		END
		-- Realizar commit
        COMMIT;
		SELECT @IdNuevoRegistro;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
	-- Realizar Rollback si algo falla
            ROLLBACK;
        -- mostrar el mensaje de error
        SELECT ERROR_MESSAGE() AS ErrorMessage;
    END CATCH;
	ELSE IF @Operacion ='select' 
		BEGIN
		SET NOCOUNT ON;
		SELECT * FROM Registro_de_caja
		WHERE id_caja=@IdCaja;
	END;
END;
GO
/****** Object:  StoredProcedure [dbo].[SP_REPORTES]    Script Date: 06/06/2023 22:29:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_REPORTES]
@Fecha varchar(10),
@Turno int,
@Categoria varchar(100),
@Operacion VARCHAR(50)

AS
BEGIN
	IF @Operacion = 'VentasDiariasPorCategoria' 
	BEGIN
	SET NOCOUNT ON;
	SELECT * FROM Reporte_Diario_Venta_por_Categoria
	WHERE fecha=@Fecha;
	END

	ELSE IF (@Operacion='CorteCajaPorTurno')
	BEGIN
	SET NOCOUNT ON;
	SELECT * FROM ReporteCorteCajaPorTurno
	END

	ELSE IF (@Operacion='VentasPorCategoria')
	BEGIN
	SET NOCOUNT ON;
	SELECT * FROM ReporteVentasPorCategoria
	WHERE Categoria=@Categoria AND Fecha=@Fecha;
	END

	ELSE IF (@Operacion='DevolucionesPorCategoria')
	BEGIN
	SET NOCOUNT ON;
	SELECT * FROM ReporteDevolucionesPorCategoria
	WHERE Categoria=@Categoria AND Fecha=@Fecha;
	END
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TIPO_PAGO]    Script Date: 06/06/2023 22:29:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TIPO_PAGO]
	@IdTipoPago int,
	@Tipo varchar(100),
	@Operacion varchar(50)
AS
BEGIN
	IF @Operacion ='todo' 
	BEGIN
	SET NOCOUNT ON;
	SELECT * FROM tipo_pago;
	END;
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TODAS_PROMOCIONES]    Script Date: 06/06/2023 22:29:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_TODAS_PROMOCIONES]
	@IdPromociones int,
	@Descripcion varchar (150),
	@Operacion varchar (50)

AS
BEGIN
	IF @Operacion ='todo' 
	BEGIN
	SET NOCOUNT ON;
	SELECT * FROM promociones;
	END

END;
GO
/****** Object:  Trigger [dbo].[TR_BorrarDevolucion]    Script Date: 06/06/2023 22:29:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TR_BorrarDevolucion] 
   ON  [dbo].[devoluciones]
   AFTER DELETE
AS 
BEGIN
	DECLARE
	@IdDevolucion int

	SELECT @IdDevolucion=id FROM DELETED 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO auditoria (fecha, hora, tipo_transaccion, descripcion, usuario)
	VALUES 
	(GETDATE(),CONVERT(TIME,GETDATE()), 'DELETE', CONCAT('DEVOLUCION BORRADA NO.',@IdDevolucion),SYSTEM_USER);
    -- Insert statements for trigger here
END
GO
ALTER TABLE [dbo].[devoluciones] ENABLE TRIGGER [TR_BorrarDevolucion]
GO
/****** Object:  Trigger [dbo].[TR_CrearDevolucion]    Script Date: 06/06/2023 22:29:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TR_CrearDevolucion] 
   ON  [dbo].[devoluciones]
   AFTER INSERT
AS 
BEGIN
	DECLARE
	@IdDevolucion int

	SELECT @IdDevolucion=id FROM INSERTED 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO auditoria (fecha, hora, tipo_transaccion, descripcion, usuario)
	VALUES 
	(GETDATE(),CONVERT(TIME,GETDATE()), 'INSERT', CONCAT('DEVOLUCION CREADA NO.',@IdDevolucion),SYSTEM_USER);
    -- Insert statements for trigger here
END
GO
ALTER TABLE [dbo].[devoluciones] ENABLE TRIGGER [TR_CrearDevolucion]
GO
/****** Object:  Trigger [dbo].[TR_BorrarVenta]    Script Date: 06/06/2023 22:30:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TR_BorrarVenta]
	ON  [dbo].[encabezado_factura]
	AFTER DELETE
AS 
BEGIN
	DECLARE
	@IdVenta int

	SELECT
	@IdVenta=id FROM DELETED 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO auditoria (fecha, hora, tipo_transaccion, descripcion, usuario)
	VALUES 
	(GETDATE(),CONVERT(TIME,GETDATE()), 'DELETE', CONCAT('VENTA BORRADA NO.',@IdVenta),SYSTEM_USER);
    -- Insert statements for trigger here

END
GO
ALTER TABLE [dbo].[encabezado_factura] ENABLE TRIGGER [TR_BorrarVenta]
GO
/****** Object:  Trigger [dbo].[TR_CrearVenta]    Script Date: 06/06/2023 22:30:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TR_CrearVenta]
   ON  [dbo].[encabezado_factura]
   AFTER INSERT
AS 
BEGIN
	DECLARE
	@IdVenta int

	SELECT
	@IdVenta=id FROM INSERTED 
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO auditoria (fecha, hora, tipo_transaccion, descripcion, usuario)
	VALUES 
	(GETDATE(),CONVERT(TIME,GETDATE()), 'INSERT', CONCAT('VENTA CREADA NO.',@IdVenta),SYSTEM_USER);
    -- Insert statements for trigger here
END
GO
ALTER TABLE [dbo].[encabezado_factura] ENABLE TRIGGER [TR_CrearVenta]
GO
/****** Object:  Trigger [dbo].[ACTUALIZAR_FECHA_PRECIO]    Script Date: 06/06/2023 22:31:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[ACTUALIZAR_FECHA_PRECIO]
   ON  [dbo].[precios_producto]
   AFTER UPDATE
AS 
BEGIN
DECLARE 
@idProducto int
SELECT @idProducto=inserted.id_producto FROM inserted
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	UPDATE TOP(1)
	precios_producto
	SET fecha_modificacion_precio=GETDATE()
	WHERE id_producto=@idProducto
END
GO
ALTER TABLE [dbo].[precios_producto] ENABLE TRIGGER [ACTUALIZAR_FECHA_PRECIO]
GO
/****** Object:  Trigger [dbo].[TR_CierreDeCaja]    Script Date: 06/06/2023 22:31:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[TR_CierreDeCaja] 
ON  [dbo].[Registro_de_caja] 
   AFTER INSERT
AS 
BEGIN
	DECLARE
	@IdCierre int

	SELECT @IdCierre=id FROM INSERTED
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	INSERT INTO auditoria (fecha, hora, tipo_transaccion, descripcion, usuario)
	VALUES
	(GETDATE(),CONVERT(TIME,GETDATE()), 'INSERT', CONCAT('CAJA CEDRRADA NO.',@IdCierre),SYSTEM_USER);
    -- Insert statements for trigger here
END
GO
ALTER TABLE [dbo].[Registro_de_caja] ENABLE TRIGGER [TR_CierreDeCaja]
GO
