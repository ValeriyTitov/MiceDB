CREATE OR ALTER PROCEDURE [dbo].[spui_dfUpdateMethodSource] @dfMethodsId int, @dfPathFoldersIdSource int
AS
BEGIN
 UPDATE dfMethods
 SET dfPathFoldersIdSource=@dfPathFoldersIdSource
 WHERE dfMethodsId=@dfMethodsId
END

GO


