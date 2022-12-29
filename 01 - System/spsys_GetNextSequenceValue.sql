CREATE OR ALTER PROCEDURE [dbo].[spsys_GetNextSequenceValue] @SequenceName VARCHAR(128)
AS
BEGIN
DECLARE @ASequenceName VARCHAR(128)

SELECT @ASequenceName = SEQUENCE_NAME
FROM INFORMATION_SCHEMA.SEQUENCES
WHERE SEQUENCE_NAME = @SequenceName

IF @ASequenceName IS NULL
 BEGIN
  --resourcestring
  DECLARE @Message VARCHAR(100);
  SET @Message = FORMATMESSAGE('[spsys_GetNextSequenceValue] Sequence "%s" not found on database %s', @SequenceName,DB_NAME());
  THROW 51000,@Message, 1;  
  RETURN
 END

DECLARE @SQLString nvarchar(200),  @ParmDefinition nvarchar(100)
SET @SQLString = 'SELECT NEXT VALUE FOR '+@ASequenceName + ' AS NewID';

EXECUTE sp_executesql @SQLString
END

GO



