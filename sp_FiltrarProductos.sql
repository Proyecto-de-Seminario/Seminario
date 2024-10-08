USE [e-shoes_dev]
GO
/****** Object:  StoredProcedure [dbo].[sp_FiltrarProductos]    Script Date: 23/08/2024 11:04:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_FiltrarProductos]
 @categoriaId INT,
 @nombreProducto VARCHAR(100),
 @precioMin DECIMAL(16, 2),
 @precioMax DECIMAL(16, 2)
AS
BEGIN
	Select productos.id, productos.detalle, productos.nombre, productos.image_url, 
	existencia,categoria_productos.nombre AS nombre_categoria, 
	precios_producto.precio_unidad AS precioUnidad, precios_producto.descuento_producto, promociones.descripcion
	from productos
	LEFT JOIN categoria_productos
	ON productos.id_categoria = categoria_productos.id
	LEFT JOIN precios_producto
	ON productos.id = precios_producto.id_producto
	LEFT JOIN promociones
	ON promociones.id = productos.id_promocion
	WHERE(categoria_productos.id = @categoriaId OR @categoriaId IS NULL)
	AND(productos.nombre LIKE '%'+ @nombreProducto +'%' OR @nombreProducto IS NULL)
	AND(precios_producto.precio_unidad BETWEEN @precioMin AND @precioMax OR @precioMin IS NULL AND @precioMax IS NULL)
END
