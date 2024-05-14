CREATE OR ALTER PROCEDURE [dbo].[sysdf_DocumentRollback]  @DocumentsId int, @dfPathFoldersIdSource int, @dfMethodsIdTarget int, @dfEventsId int
AS
BEGIN
 DECLARE @Message VARCHAR(255) = 'Cannot run sysdf_DocumentRollback directly from SQL server';
 THROW 51000,@Message, 1;  
 RETURN
END


GO


