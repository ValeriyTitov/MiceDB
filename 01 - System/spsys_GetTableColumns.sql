CREATE OR ALTER PROCEDURE [dbo].[spsys_GetTableColumns] @TableName VARCHAR(80) 
AS
BEGIN
IF NOT EXISTS
(SELECT 1
 FROM     INFORMATION_SCHEMA.COLUMNS
 WHERE    (TABLE_NAME = @TableName COLLATE cyrillic_general_ci_as)
)
 BEGIN
--resourcestring
  DECLARE @Message VARCHAR(100) = FORMATMESSAGE('[spsys_GetTableColumns] Table not found - %s on database %s',@TableName,DB_NAME());
  THROW 51000,@Message, 1;  
 END

SELECT ORDINAL_POSITION,
	   COLUMN_NAME,
	   COLUMN_DEFAULT, 
	   IS_NULLABLE, 
	   DATA_TYPE, 
	   CHARACTER_MAXIMUM_LENGTH, 
	   CHARACTER_OCTET_LENGTH, 
	   CONVERT(int, NUMERIC_PRECISION) as NUMERIC_PRECISION
FROM   INFORMATION_SCHEMA.COLUMNS
WHERE  (TABLE_NAME = @TableName COLLATE cyrillic_general_ci_as)
ORDER BY ORDINAL_POSITION
END

GO



