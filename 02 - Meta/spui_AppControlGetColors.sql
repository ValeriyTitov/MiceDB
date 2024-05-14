CREATE OR ALTER PROCEDURE [dbo].[spui_AppControlGetColors] @AppDialogControlsID int
AS
BEGIN
 SELECT *
 FROM AppGridColors A WITH (NOLOCK)
 WHERE AppDialogControlsID=@AppDialogControlsID
 ORDER BY A.CreateOrder
END

GO


