USE [e-shoes_dev]
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerDetalleProducto]    Script Date: 23/08/2024 11:05:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_ObtenerDetalleProducto]
 @IdProducto INT
AS
BEGIN
	Select productos.id, productos.nombre, productos.detalle, existencia,categoria_productos.nombre AS NombreCategoria, 
	precios_producto.precio_unidad AS precioUnidad, 
	productos.image_url,
	precios_producto.descuento_producto, promociones.descripcion
	from productos
	LEFT JOIN categoria_productos
	ON productos.id_categoria = categoria_productos.id
	LEFT JOIN precios_producto
	ON productos.id = precios_producto.id_producto
	LEFT JOIN promociones
	ON promociones.id = productos.id_promocion
	WHERE(productos.id = @IdProducto)
END
