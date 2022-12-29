CREATE OR ALTER PROCEDURE [dbo].[spsys_GetObjectType] @ObjectName VARCHAR(255) 
AS
BEGIN
 DECLARE @AType VARCHAR(3)
 SELECT @AType=[Type]
 FROM sys.objects o 
 WHERE (o.[name] = @ObjectName )
 
 IF @AType IS NULL
 BEGIN
--resourcestring
  DECLARE @Message VARCHAR(100) = FORMATMESSAGE('[spsys_GetObjectType] Object not found - %s on database %s', @ObjectName,DB_NAME());
  THROW 51000,@Message, 1;  
 END

 SELECT @AType as [Type]
END

GO



