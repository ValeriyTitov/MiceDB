CREATE OR ALTER PROCEDURE [dbo].[spui_dfMethodsListSource] @dfPathFoldersId int
AS
BEGIN
 SELECT *
 FROM dfMethods m WITH (NOLOCK)
 WHERE m.dfPathFoldersIdSource=@dfPathFoldersId
END

GO


