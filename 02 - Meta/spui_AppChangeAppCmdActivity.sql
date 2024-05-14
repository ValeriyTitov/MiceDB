CREATE OR ALTER PROCEDURE [dbo].[spui_AppChangeAppCmdActivity] @AppCmdID int, @Active bit
AS
BEGIN
 UPDATE AppCmd
 SET Active=@Active
 WHERE AppCmdID=@AppCmdID
END

GO


