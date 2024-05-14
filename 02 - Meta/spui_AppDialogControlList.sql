CREATE OR ALTER PROCEDURE [dbo].[spui_AppDialogControlList] @AppDialogsID int
AS
BEGIN
 SELECT * 
 FROM AppDialogControls WITH (NOLOCK)
 WHERE AppDialogsID=@AppDialogsID
END


GO

