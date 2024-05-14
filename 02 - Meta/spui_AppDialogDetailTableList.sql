CREATE OR ALTER PROCEDURE [dbo].[spui_AppDialogDetailTableList] @AppDialogsId int
AS
BEGIN
 SELECT * 
 FROM AppDialogDetailTables WITH (NOLOCK)
 WHERE AppDialogsID=@AppDialogsId
END

GO


