CREATE OR ALTER PROCEDURE [dbo].[spui_AppDialogGetProperties]  @AppDialogsId int
AS
BEGIN
 SET NOCOUNT ON

 DECLARE @HasDetailsTables bit
 SELECT TOP 1 @HasDetailsTables=1
 FROM AppDialogDetailTables D WITH (NOLOCK)
 WHERE AppDialogsID=@AppDialogsId

 SELECT a.*, 
        s.Script as Script,
		@HasDetailsTables as HasDetailsTables
 FROM AppDialogs a WITH (NOLOCK)
 LEFT JOIN AppScripts s WITH (NOLOCK) ON a.AppScriptsID=s.AppScriptsID
 WHERE a.AppDialogsID=@AppDialogsId
END


GO


