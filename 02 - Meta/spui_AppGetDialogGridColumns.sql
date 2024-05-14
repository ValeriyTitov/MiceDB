CREATE OR ALTER PROCEDURE [dbo].[spui_AppGetDialogGridColumns]  @AppDialogControlsID int
AS
BEGIN
 SELECT *
 FROM AppColumns WITH (NOLOCK)
 WHERE AppDialogControlsID=@AppDialogControlsID
 ORDER BY CreateOrder
END


GO


