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
	[Category] VARCHAR(32),
	[Caption] [varchar](256),
	[ImageIndex] int,
	[Description] [varchar](255)
)

SET NOCOUNT ON 

IF @iType=-9 --TABLES ONLY
 BEGIN
  INSERT INTO @Result (ObjectID,[Category],[Caption], [ImageIndex], [Description])
  SELECT NULL,'Table', TABLE_NAME, 86, TABLE_NAME
  FROM INFORMATION_SCHEMA.TABLES
 END
 ELSE

IF @iType=-8 --VIEWS ONLY
 BEGIN
  INSERT INTO @Result (ObjectID,[Category],[Caption], [ImageIndex], [Description])
  SELECT NULL,'View', TABLE_NAME, 477, 'IS UPDATABLE: '+CONVERT(VARCHAR(8), IS_UPDATABLE)
  FROM INFORMATION_SCHEMA.VIEWS
 END
 ELSE


IF @iType=-7 --SEQUENCES
 BEGIN
  INSERT INTO @Result (ObjectID,[Category],[Caption], [ImageIndex], [Description])
  SELECT NULL,'Sequence', SEQUENCE_NAME, 233, 'Max value: '+CONVERT(VARCHAR(32), MAXIMUM_VALUE)
  FROM INFORMATION_SCHEMA.SEQUENCES
 END 
 ELSE

IF @iType=-4 --STORED PROCEDURES, TABLES, VIEWS
 BEGIN
  INSERT INTO @Result (ObjectID,[Category],[Caption], [ImageIndex], [Description])
  SELECT NULL,'Stored procedure', SPECIFIC_NAME, 506, 'Last change: '+CONVERT(VARCHAR(16), LAST_ALTERED, 120)
  FROM INFORMATION_SCHEMA.ROUTINES
  WHERE ROUTINE_TYPE='PROCEDURE'
  
  INSERT INTO @Result (ObjectID,[Category],[Caption], [ImageIndex], [Description])
  SELECT NULL,'Table', TABLE_NAME, 86, TABLE_NAME
  FROM INFORMATION_SCHEMA.TABLES
  
  INSERT INTO @Result (ObjectID,[Category],[Caption], [ImageIndex], [Description])
  SELECT NULL,'View', TABLE_NAME, 477, 'IS UPDATABLE: '+CONVERT(VARCHAR(8), IS_UPDATABLE)
  FROM INFORMATION_SCHEMA.VIEWS
 END
 ELSE

IF @iType=-3 --TABLES, VIEWS (for appDialog  table browser)
 BEGIN
  INSERT INTO @Result (ObjectID,[Category],[Caption], [ImageIndex], [Description])
  SELECT NULL,'Table', TABLE_NAME, 86, TABLE_NAME
  FROM INFORMATION_SCHEMA.TABLES
  
  INSERT INTO @Result (ObjectID,[Category],[Caption], [ImageIndex], [Description])
  SELECT NULL,'View', TABLE_NAME, 477, 'IS UPDATABLE: '+CONVERT(VARCHAR(8), IS_UPDATABLE)
  FROM INFORMATION_SCHEMA.VIEWS
 END
 ELSE

IF @iType=-2 --STORED PROCEDURES ONLY
 BEGIN
  INSERT INTO @Result (ObjectID,[Category],[Caption], [ImageIndex], [Description])
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
ORDER BY  R.[Category]

END


GO



