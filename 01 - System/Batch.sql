CREATE OR ALTER PROCEDURE [dbo].[spds_DataScriptPublish] @ScriptName VARCHAR(80), @ScriptText VARCHAR(MAX)
AS
BEGIN
 --resourcestring
 DECLARE @Message VARCHAR(MAX) = FORMATMESSAGE('Cannot run script %s directly from SQL server', @ScriptName);
 THROW 51000,@Message, 1;  
 RETURN
END


GO


CREATE OR ALTER PROCEDURE [dbo].[spds_DataScriptRun] @ScriptName VARCHAR(80), @ScriptText VARCHAR(MAX)
AS
BEGIN
--resourcestring
 DECLARE @Message VARCHAR(MAX) = FORMATMESSAGE('Cannot run script %s directly from SQL server', @ScriptName);
 THROW 51000,@Message, 1;  
 RETURN
END

GO



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
  DECLARE @Message VARCHAR(100) = FORMATMESSAGE('[spsys_GetNextSequenceValue] Sequence not found - %s on database %s', @SequenceName,DB_NAME());
  THROW 51000,@Message, 1;  
  RETURN
 END

DECLARE @SQLString nvarchar(200),  @ParmDefinition nvarchar(100)
SET @SQLString = 'SELECT NEXT VALUE FOR '+@ASequenceName + ' AS NewID';

EXECUTE sp_executesql @SQLString
END

GO



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



CREATE OR ALTER PROCEDURE [dbo].[spsys_GetProcedureParams] @ProcedureName VARCHAR(128) 
AS
BEGIN


IF NOT EXISTS
(SELECT 1
FROM         INFORMATION_SCHEMA.ROUTINES AS R
WHERE        (SPECIFIC_NAME = @ProcedureName COLLATE cyrillic_general_ci_as AND ROUTINE_TYPE='PROCEDURE')
)
 BEGIN
--resourcestring
  DECLARE @Message VARCHAR(255) = FORMATMESSAGE('[spsys_GetProcedureParams] Stored procedure not found - %s on database %s', @ProcedureName,DB_NAME());
  THROW 51000,@Message, 1;  
 END

SELECT       ORDINAL_POSITION, 
             PARAMETER_NAME,
			 DATA_TYPE,
			 PARAMETER_MODE, 
			 CHARACTER_MAXIMUM_LENGTH, 
             CHARACTER_OCTET_LENGTH, 
			 NUMERIC_PRECISION, 
			 NUMERIC_SCALE

FROM         INFORMATION_SCHEMA.PARAMETERS AS R
WHERE        (SPECIFIC_NAME = @ProcedureName COLLATE cyrillic_general_ci_as)

ORDER BY ORDINAL_POSITION
END

GO



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



CREATE OR ALTER PROCEDURE [dbo].[spsys_SysObjectList] @iType int 
AS
BEGIN
/*
  Returns set of database objects to display on screen.
  Возвращает список объектов базы данных для отображения на экране
  @iType=-4 --STORED PROCEDURES, TABLES, VIEWS
  @iType=-3 --TABLES, VIEWS (for appDialog  table browser)
  @iType=-2 --PROCEDURES
  @iType=-7 --SEQUENCE
  @iType=-8 --VIEWS ONLY
  @iType=-9 --TABLES ONLY
*/

DECLARE @Result TABLE
(
	[ID] [int] IDENTITY,
	[ObjectID] int,
	[Catery] VARCHAR(32),
	[Caption] [varchar](256),
	[ImageIndex] int,
	[Description] [varchar](255)
)

SET NOCOUNT ON 

IF @iType=-9 --TABLES ONLY
 BEGIN
  INSERT INTO @Result (ObjectID,[Catery],[Caption], [ImageIndex], [Description])
  SELECT NULL,'Table', TABLE_NAME, 86, TABLE_NAME
  FROM INFORMATION_SCHEMA.TABLES
 END
 ELSE

IF @iType=-8 --VIEWS ONLY
 BEGIN
  INSERT INTO @Result (ObjectID,[Catery],[Caption], [ImageIndex], [Description])
  SELECT NULL,'View', TABLE_NAME, 477, 'IS UPDATABLE: '+CONVERT(VARCHAR(8), IS_UPDATABLE)
  FROM INFORMATION_SCHEMA.VIEWS
 END
 ELSE


IF @iType=-7 --SEQUENCES
 BEGIN
  INSERT INTO @Result (ObjectID,[Catery],[Caption], [ImageIndex], [Description])
  SELECT NULL,'Sequence', SEQUENCE_NAME, 233, 'Max value: '+CONVERT(VARCHAR(32), MAXIMUM_VALUE)
  FROM INFORMATION_SCHEMA.SEQUENCES
 END 
 ELSE

IF @iType=-4 --STORED PROCEDURES, TABLES, VIEWS
 BEGIN
  INSERT INTO @Result (ObjectID,[Catery],[Caption], [ImageIndex], [Description])
  SELECT NULL,'Stored procedure', SPECIFIC_NAME, 506, 'Last change: '+CONVERT(VARCHAR(16), LAST_ALTERED, 120)
  FROM INFORMATION_SCHEMA.ROUTINES
  WHERE ROUTINE_TYPE='PROCEDURE'
  
  INSERT INTO @Result (ObjectID,[Catery],[Caption], [ImageIndex], [Description])
  SELECT NULL,'Table', TABLE_NAME, 86, TABLE_NAME
  FROM INFORMATION_SCHEMA.TABLES
  
  INSERT INTO @Result (ObjectID,[Catery],[Caption], [ImageIndex], [Description])
  SELECT NULL,'View', TABLE_NAME, 477, 'IS UPDATABLE: '+CONVERT(VARCHAR(8), IS_UPDATABLE)
  FROM INFORMATION_SCHEMA.VIEWS
 END
 ELSE

IF @iType=-3 --TABLES, VIEWS (for appDialog  table browser)
 BEGIN
  INSERT INTO @Result (ObjectID,[Catery],[Caption], [ImageIndex], [Description])
  SELECT NULL,'Table', TABLE_NAME, 86, TABLE_NAME
  FROM INFORMATION_SCHEMA.TABLES
  
  INSERT INTO @Result (ObjectID,[Catery],[Caption], [ImageIndex], [Description])
  SELECT NULL,'View', TABLE_NAME, 477, 'IS UPDATABLE: '+CONVERT(VARCHAR(8), IS_UPDATABLE)
  FROM INFORMATION_SCHEMA.VIEWS
 END
 ELSE

IF @iType=-2 --STORED PROCEDURES ONLY
 BEGIN
  INSERT INTO @Result (ObjectID,[Catery],[Caption], [ImageIndex], [Description])
  SELECT NULL,'Stored procedures', SPECIFIC_NAME, 506, 'Last change: '+CONVERT(VARCHAR(16), LAST_ALTERED, 120)
  FROM INFORMATION_SCHEMA.ROUTINES
  WHERE ROUTINE_TYPE='PROCEDURE'
 END

  ELSE

 BEGIN
  --resourcestring
  DECLARE @Message VARCHAR(100) = FORMATMESSAGE('[spui_SysObjectList] unknown iType: %d',@iType);
  THROW 51000,@Message, 1;  
 END

SELECT    R.*
FROM @Result R
ORDER BY  R.[Catery]

END


GO



