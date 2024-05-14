CREATE OR ALTER PROCEDURE [dbo].[spui_AppDialogLayoutList] @AppDialogsID int, @AppDialogsLayoutId int = NULL
AS
BEGIN
SELECT *
FROM AppDialogsLayout a WITH (NOLOCK)
WHERE a.AppDialogsID=@AppDialogsID
  AND a.Active=1
  AND (AppDialogsLayoutId=@AppDialogsLayoutId or @AppDialogsLayoutId IS NULL)

END

GO



