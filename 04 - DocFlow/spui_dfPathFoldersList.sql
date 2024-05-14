CREATE OR ALTER PROCEDURE spui_dfPathFoldersList @dfTypesId int
AS
BEGIN
 SELECT *
 FROM dfPathFolders D WITH (NOLOCK)
 WHERE D.dfTypesId = @dfTypesId
END;


GO


