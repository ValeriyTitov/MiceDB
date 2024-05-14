CREATE OR ALTER PROCEDURE [dbo].[spui_dfCreateNewMethod] @dfMethodsId int,@dfClassesId int,@dfTypesId int,@dfPathFoldersIdSource int, @dfPathFoldersIdTarget int, @Caption VARCHAR(255)
AS
BEGIN
 INSERT INTO dfMethods (dfMethodsId,  dfClassesId, dfTypesId,  dfPathFoldersIdSource,  dfPathFoldersIdTarget, Caption, Check_iError)
 SELECT                @dfMethodsId, @dfClassesId, @dfTypesId, @dfPathFoldersIdSource, @dfPathFoldersIdTarget, @Caption, 0

END

GO


