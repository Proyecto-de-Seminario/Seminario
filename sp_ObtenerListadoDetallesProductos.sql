USE [e-shoes_dev]
GO
/****** Object:  StoredProcedure [dbo].[sp_ObtenerListadoDetallesProductos]    Script Date: 28/08/2024 19:26:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[sp_ObtenerListadoDetallesProductos]
    @IdsProductos VARCHAR(MAX)
AS
BEGIN
    -- Convertir la lista de IDs en una tabla
    DECLARE @Productos TABLE (IdProducto INT);

    INSERT INTO @Productos (IdProducto)
    SELECT CAST(value AS INT)
    FROM STRING_SPLIT(@IdsProductos, ',');

    -- Obtener los detalles de los productos coincidentes
    SELECT 
        p.Id AS IdProducto,
		p.image_url AS ImageUrl,
        p.Nombre AS NombreProducto,
        p.existencia AS Existencia,
		pp.precio_unidad as PrecioUnidad 
    FROM Productos p
	LEFT JOIN precios_producto pp on pp.id_producto = p.id
    WHERE p.Id IN (SELECT IdProducto FROM @Productos);
END;
