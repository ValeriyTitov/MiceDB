CREATE OR ALTER PROCEDURE [dbo].[spui_dfMethodsListForRollback]  @dfTypesId int, @dfPathFoldersId int, @AllowDesktop bit
AS
BEGIN
 SELECT m.dfMethodsId, 
        m.dfClassesId, 
		m.dfTypesId, 
		m.dfPathFoldersIdSource, 
		m.dfPathFoldersIdTarget, 
		m.Caption, 
		m.AllowDesktop, 
		m.AllowRollback, 
		m.IsDefault, 
		m.ImageIndex, 
		m.Info,
		m.Active,
		p.dfPathFoldersId,
		p.Caption as dfPathFoldersCaption
FROM  dfMethods m WITH (NOLOCK)
INNER JOIN dfPathFolders p WITH (NOLOCK) ON p.dfPathFoldersId=m.dfPathFoldersIdSource
WHERE m.dfTypesId=@dfTypesId
  AND m.dfPathFoldersIdTarget=@dfPathFoldersId
  AND m.Active=1
  AND m.AllowRollback=1
  AND (m.AllowDesktop=@AllowDesktop OR @AllowDesktop IS NULL)


ORDER BY IsDefault DESC

END

GO


