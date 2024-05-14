CREATE OR ALTER PROCEDURE [dbo].[spui_AppDialogGetLayoutFlags] @AppDialogsLayoutId int
AS
BEGIN
 SELECT *
 FROM AppDialogsLayoutFlags a WITH (NOLOCK)
 WHERE a.AppDialogsLayoutID=@AppDialogsLayoutId AND FlagType IN (1,2)
END

GO



