CREATE OR ALTER PROCEDURE [dbo].[spui_dfTypeObjectList] @dfTypesId int
AS
BEGIN
 DECLARE @Result TABLE (ObjectId int, 
                        iType int, 
						dfPathFoldersIdSource int, 
						dfPathFoldersIdTarget int, 
						Caption VARCHAR(255), 
						ImageIndex int)

 INSERT INTO @Result (ObjectId, iType,dfPathFoldersIdSource,dfPathFoldersIdTarget,Caption,ImageIndex)
 SELECT m.dfMethodsId, 1, m.dfPathFoldersIdSource, m.dfPathFoldersIdTarget, m.Caption, m.ImageIndex
 FROM dfMethods m WITH (NOLOCK)
 WHERE m.dfTypesId=@dfTypesId


 INSERT INTO @Result (ObjectId, iType,dfPathFoldersIdSource,dfPathFoldersIdTarget,Caption,ImageIndex)
 SELECT p.dfPathFoldersId, 2, NULL,NULL, Caption, ImageIndex
 FROM dfPathFolders p WITH (NOLOCK)
 WHERE p.dfTypesId=@dfTypesId

 SELECT *
 FROM @Result
END

GO


