CREATE OR ALTER PROCEDURE [dbo].[spui_AppDialogFindLayout] @DocumentsId int, @dfClassesId int, @dfTypesId int, @dfPathFoldersId int
AS
BEGIN

SELECT p.*,
       d.Caption as [dfClassCaption]
FROM dfClasses d WITH (NOLOCK)
INNER JOIN dfPathFolders p WITH (NOLOCK) ON p.dfClassesId=d.dfClassesId
WHERE d.dfClassesId=@dfClassesId 
  AND p.dfPathFoldersId=@dfPathFoldersId 
  AND p.Active=1 

END

GO

