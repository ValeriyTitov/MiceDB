CREATE OR ALTER PROCEDURE [dbo].[spui_dfMethodsListTarget] @dfPathFoldersId int
AS
BEGIN
 SELECT *
 FROM dfMethods m WITH (NOLOCK)
 WHERE m.dfPathFoldersIdTarget = @dfPathFoldersId
END

GO


