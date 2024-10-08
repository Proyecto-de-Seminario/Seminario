USE [e-shoes_dev]
GO
/****** Object:  StoredProcedure [dbo].[SP_CRUD_CLIENTES]    Script Date: 14/08/2024 17:10:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_CRUD_CLIENTES]
	@NombreCliente varchar(150),
	@DireccionCliente varchar(MAX),
	@TelefonoCliente int,
	@CorreoCliente varchar(150),
	@NIT varchar(20),
	@IdCliente int,
	@id_usuario int NULL,
	@Operacion varchar(50)
AS

BEGIN
	IF @Operacion ='select' 
	BEGIN
	SET NOCOUNT ON;
	SELECT * FROM clientes WHERE id = @IdCliente;
	END

	IF @Operacion ='selectPorUsuarioId' 
	BEGIN
	SET NOCOUNT ON;
	SELECT * FROM clientes WHERE id_usuario = @id_usuario;
	END

    ELSE IF @Operacion = 'insert'
    BEGIN
            INSERT INTO clientes(nombre, direccion, telefono, correo, NIT, id_usuario) 
            VALUES (@NombreCliente, @DireccionCliente, @TelefonoCliente, @CorreoCliente, @NIT, @id_usuario);
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
