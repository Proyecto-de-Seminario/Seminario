USE [e-shoes_dev]

select * from productos;

Alter table productos
add stock_minimo int;

GO
/****** Object:  StoredProcedure [dbo].[SP_CRUD_PRODUCTOS]    Script Date: 26/09/2024 8:38:11 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SP_CRUD_PRODUCTOS]
	@DetalleProducto varchar(MAX),
	@Existencia int,
	@IdCategoria int,
	@IdProveedor int,
	@IdPromocion int,
	@IdProducto int,
	@PrecioUnidad decimal(16,2),
	@Nombre VARCHAR(255),
	@ImageUrl VARCHAR(255),
	@Operacion VARCHAR(50),
	@minimum int
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
			INSERT INTO productos (detalle, existencia, id_categoria, id_proveedor, id_promocion, image_url, nombre, stock_minimo) 
			VALUES (@DetalleProducto, @Existencia, @IdCategoria, @IdProveedor, @IdPromocion, @ImageUrl, @Nombre, @minimum)
			
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
		SELECT p.*,p.id_categoria,pr.precio_unidad AS PrecioUnidadString, p.nombre, p.image_url
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
			
			-- Obtener el precio por unidad, para ser o no actualizado más adelante.
			SELECT @PrecioAnterior = precio_unidad FROM precios_producto WHERE id_producto = @IdProducto
			
			-- Actualizar propiedades del producto.
			UPDATE TOP(1) productos SET 
				detalle = @DetalleProducto, 
				existencia = @Existencia, 
				id_categoria = @IdCategoria, 
				id_proveedor = @IdProveedor,  
				id_promocion = @IdPromocion, 
				nombre = @Nombre, 
				image_url = @ImageUrl,
				stock_minimo = @minimum
			WHERE id = @IdProducto; 

			-- Evaluar si se cambió el precio.
			IF (@PrecioUnidad != @PrecioAnterior)
			BEGIN
				-- Actualizar precio de unidad de producto
				UPDATE TOP(1) precios_producto
				SET precio_unidad = @PrecioUnidad
				WHERE id_producto = @IdProducto
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
