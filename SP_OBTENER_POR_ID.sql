USE [e-shoes_dev]
GO
/****** Object:  StoredProcedure [dbo].[SP_OBTENER_OBTENER_POR_ID]    Script Date: 15/08/2024 23:49:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_OBTENER_OBTENER_POR_ID]
	@Idusuario int
AS
BEGIN
	SET NOCOUNT ON;
	SELECT usuarios.id, nombre_usuario, contrasennia, correo, Id_role, activo
	FROM usuarios 
	LEFT JOIN rol
	ON usuarios.Id_role = rol.Id
	WHERE (usuarios.id= @Idusuario)
	AND (usuarios.activo = 1)
	AND usuarios.confirmado=1
END
