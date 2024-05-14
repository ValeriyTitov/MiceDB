CREATE OR ALTER PROCEDURE [dbo].[spui_dfPathFoldersInfo] @dfPathFoldersId int
AS
BEGIN
SELECT p.*,
	   t.Caption AS dfTypesCaption, 
	   t.ShortName,
	   t.FullAccess, 
	   t.CanAddFromDesktop, 
	   c.Caption AS dfClassesCaption, 
	   c.MainTable,
	   c.DataView,
	   c.FullAccess AS dfClassesFullAccess, 
	   c.CanAddFromDesktop AS dfClassesCanAddFromDesktop, 
	   c.AppDialogsId, 
	   c.EnableDfEvents,
	   c.KeyField,
       c.LogProviderName
FROM   dfPathFolders AS p WITH (NOLOCK) 
INNER JOIN dfTypes AS t WITH (NOLOCK) ON t.dfTypesId = p.dfTypesId
INNER JOIN dfClasses AS c WITH (NOLOCK) ON p.dfClassesId = c.dfClassesId
WHERE (p.dfPathFoldersId = @dfPathFoldersId) AND (p.Active=1)
END

GO


