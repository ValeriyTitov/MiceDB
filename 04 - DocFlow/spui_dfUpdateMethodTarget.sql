CREATE OR ALTER PROCEDURE [dbo].[spui_dfUpdateMethodTarget] @dfMethodsId int, @dfPathFoldersIdTarget int
AS
BEGIN
 UPDATE dfMethods
 SET dfPathFoldersIdTarget=@dfPathFoldersIdTarget
 WHERE dfMethodsId=@dfMethodsId
END

GO


