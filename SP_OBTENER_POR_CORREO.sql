USE [e-shoes_dev]
GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENER_OBTENER_POR_CORREO]    Script Date: 15/08/2024 23:49:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_OBTENER_OBTENER_POR_CORREO]
	@correo varchar (150)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT usuarios.id, nombre_usuario, contrasennia, correo, usuarios.Id_role, Nombre AS Rol, activo
	FROM usuarios 
	LEFT JOIN rol
	ON usuarios.Id_role = rol.Id
	WHERE correo =@correo
	AND (usuarios.activo = 1)
	AND usuarios.confirmado=1
END
