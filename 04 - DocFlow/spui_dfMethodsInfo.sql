CREATE OR ALTER PROCEDURE [dbo].[spui_dfMethodsInfo] @dfMethodsId int
AS
BEGIN
 SELECT d.*,
        p.FolderType,
		p.CodeName
 FROM dfMethods d WITH (NOLOCK)
 INNER JOIN dfPathFolders p WITH (NOLOCK) ON p.dfPathFoldersId=d.dfPathFoldersIdTarget
 WHERE (d.dfMethodsId=@dfMethodsId) AND (d.Active=1)
END

GO


