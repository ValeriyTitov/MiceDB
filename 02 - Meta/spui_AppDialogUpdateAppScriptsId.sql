CREATE OR ALTER PROCEDURE [dbo].[spui_AppDialogUpdateAppScriptsId] @AppDialogsId int, @AppScriptsId int
AS
BEGIN
 UPDATE AppDialogs 
 SET AppScriptsId=@AppScriptsId
 WHERE AppDialogsId=@AppDialogsId
END

GO


