CREATE OR ALTER PROCEDURE [dbo].[spui_AppDialogGetLayout] @AppDialogsID int, @AppDialogsLayoutID int=NULL
AS
BEGIN
IF (@AppDialogsLayoutID IS NULL) OR (@AppDialogsLayoutID<=0)
SELECT TOP 1 @AppDialogsLayoutID=AppDialogsLayoutID
FROM AppDialogsLayout a WITH (NOLOCK)
WHERE a.AppDialogsID=@AppDialogsID AND a.Active=1


DECLARE @HasFlags bit
SELECT TOP 1 @HasFlags=1
FROM AppDialogsLayoutFlags F WITH (NOLOCK)
WHERE AppDialogsLayoutID = @AppDialogsLayoutID


SELECT TOP 1 
        a.*,
		@HasFlags as HasFlags
FROM AppDialogsLayout a WITH (NOLOCK)
WHERE a.AppDialogsID=@AppDialogsID 
  AND AppDialogsLayoutID=@AppDialogsLayoutID 
  AND a.Active=1

END


GO

