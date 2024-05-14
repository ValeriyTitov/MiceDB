CREATE OR ALTER PROCEDURE [dbo].[spui_dfMethodsListForPush]  @dfTypesId int, @dfPathFoldersId int, @AllowDesktop bit = NULL
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
		m.Active
FROM  dfMethods m WITH (NOLOCK)
WHERE m.dfTypesId=@dfTypesId
  AND m.dfPathFoldersIdSource=@dfPathFoldersId
  AND m.Active=1
  AND (m.AllowDesktop=@AllowDesktop OR @AllowDesktop IS NULL)

ORDER BY IsDefault DESC

END

GO


