CREATE OR ALTER PROCEDURE [dbo].[sysdf_DocumentPush]  @DocumentsId int, @dfPathFoldersIdSource int, @dfMethodsIdTarget int, @dfEventsId int
AS
BEGIN
--resourcestring
 DECLARE @Message VARCHAR(255) = 'Cannot run sysdf_DocumentPush directly from SQL server';
 THROW 51000,@Message, 1;  
 RETURN
END


GO


