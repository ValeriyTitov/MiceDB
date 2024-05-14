CREATE OR ALTER PROCEDURE [dbo].[spui_AppObjectList] @iType int 
AS
BEGIN

/*
  iTypeMiceGrids       =-7;
  iTypeControlColumns  =-6;
  iTypePluginColumms   =-5;
  iTypeAllSQLObjects   =-4;
  iTypeTableOrViews    =-3;
  iTypeStoredProc      =-2;
  iTypeAppColumnsID    =-1;

  iTypeFolder          = 0;
  iTypePlugin          = 1;
  iTypeDialog          = 2;
  iTypeAppDialogLayout = 3;
  iTypeCommonCommand   = 6;
  iTypeCommand         = 7;
  iTypeCommonFilter    = 8;
  iTypeFilter          = 9;
  iTypeCommandGroup    = 10;
  iTypeSQLScript       = 11;
  iTypePascalScript    = 12;
  iTypeCSharpScript    = 13;
  iTypeJsonText        = 14;
  iTypeXMLText         = 15;
  iTypeDataSet         = 16;
  iTypeExternalFile    = 17;
  iTypeExportTemplate  = 18;
  iTypeDFClass         = 19;
  iTypeDfType          = 20;
  iTypeDFScheme        = 21;
  iTypeDFMethod        = 22;
  iTypeDFPathFolder    = 23;
  iTypeDfRule          = 24;
  iTypeDfAction        = 25;
  iTypeAppReport       = 26;


*/
SET NOCOUNT ON 

DECLARE @Tmp TABLE
(
	[ObjectId] int,
	[Category] VARCHAR(32),
	[Caption] [varchar](256),
	[ImageIndex] int,
	[Description] [varchar](1024)
)

IF @iType=-7 --iTypeMiceGrids       =-7;
 BEGIN
  INSERT INTO @Tmp (ObjectID,[Category],[Caption], [ImageIndex], [Description])
  SELECT AppDialogControlsId, 
         'Grids', 
		 CONVERT(VARCHAR(16),a.AppDialogControlsId)+' '+ISNULL(d.Caption,'')+'.'+ISNULL(a.Caption,''),
		 163,
		 ClassName
  FROM AppDialogControls a WITH (NOLOCK)
  INNER JOIN AppDialogs d WITH (NOLOCK) on D.AppDialogsID=A.AppDialogsID
  WHERE ClassName IN ('TMiceGridFrame') 
 END

ELSE

IF @iType=-6 --iTypeControlColumns  =-6
 BEGIN
  INSERT INTO @Tmp (ObjectID,[Category],[Caption], [ImageIndex], [Description])
  SELECT AppDialogControlsId, 
         'Grids', 
		 CONVERT(VARCHAR(16),a.AppDialogControlsId)+' '+ISNULL(d.Caption,'')+'.'+ISNULL(a.Caption,''),
		 CASE 
		  WHEN ClassName ='TMiceEditableGridFrame' THEN 212
		  WHEN ClassName ='TMiceGridFrame' THEN 163
		  WHEN ClassName ='TMiceTreeGridFrame' THEN 654
		  ELSE 227
		 END,
		 ClassName
  FROM AppDialogControls a WITH (NOLOCK)
  INNER JOIN AppDialogs d WITH (NOLOCK) on D.AppDialogsID=A.AppDialogsID
  WHERE ClassName IN ('TMiceEditableGridFrame','TMiceGridFrame','TMiceTreeGridFrame') 
 END

ELSE

IF @iType=-5 --iTypePluginColumms
 BEGIN
  INSERT INTO @Tmp (ObjectID,[Category],[Caption], [ImageIndex], [Description])
  SELECT AppPluginsId, 
         'Plugin', 
		 CONVERT(VARCHAR(16),p.AppPluginsID)+' '+ISNULL(p.[Name],''), 
		 CASE 
		  WHEN p.PluginType=0 THEN 163
		  WHEN p.PluginType=1 THEN 653
		  WHEN p.PluginType=2 THEN 468 
		  WHEN p.PluginType=3 THEN 122 
		  ELSE 227
		 END,
		 CONVERT(VARCHAR(1024), p.[Description])
  FROM AppPlugins p WITH (NOLOCK)
 END 

ELSE

IF @iType=-4 --STORED PROCEDURES, TABLES, VIEWS
 BEGIN
  INSERT INTO @Tmp (ObjectID,[Category],[Caption], [ImageIndex], [Description])
  SELECT NULL,'Stored procedure', SPECIFIC_NAME, 506, 'Last change: '+CONVERT(VARCHAR(16), LAST_ALTERED, 120)
  FROM INFORMATION_SCHEMA.ROUTINES
  WHERE ROUTINE_TYPE='PROCEDURE'
  
  INSERT INTO @Tmp (ObjectID,[Category],[Caption], [ImageIndex], [Description])
  SELECT NULL,'Table', TABLE_NAME, 86, TABLE_NAME
  FROM INFORMATION_SCHEMA.TABLES
  
  INSERT INTO @Tmp (ObjectID,[Category],[Caption], [ImageIndex], [Description])
  SELECT NULL,'View', TABLE_NAME, 477, 'IS UPDATABLE: '+CONVERT(VARCHAR(3), IS_UPDATABLE)
  FROM INFORMATION_SCHEMA.VIEWS
 END
 
 
ELSE

IF @iType=-3 --for dialog: table or views
 BEGIN
  INSERT INTO @Tmp (ObjectID,[Category],[Caption], [ImageIndex], [Description])
  SELECT NULL,'Table', TABLE_NAME, 86, TABLE_NAME
  FROM INFORMATION_SCHEMA.TABLES
  
  INSERT INTO @Tmp (ObjectID,[Category],[Caption], [ImageIndex], [Description])
  SELECT NULL,'View', TABLE_NAME, 477, 'IS UPDATABLE: '+CONVERT(VARCHAR(3), IS_UPDATABLE)
  FROM INFORMATION_SCHEMA.VIEWS
 END
 
ELSE

IF @iType=-2 --PROCEDURES ONLY
 BEGIN
  INSERT INTO @Tmp (ObjectID,[Category],[Caption], [ImageIndex], [Description])
  SELECT NULL,'Stored procedure', SPECIFIC_NAME, 506, 'Last change: '+CONVERT(VARCHAR(16), LAST_ALTERED, 120)
  FROM INFORMATION_SCHEMA.ROUTINES
  WHERE ROUTINE_TYPE='PPROCEDURE'
 END

ELSE

IF @iType=1 --AppPlugins
 BEGIN
  INSERT INTO @Tmp (ObjectID,[Category],[Caption], [ImageIndex], [Description])
  SELECT A.AppPluginsID, 
         A.PluginType, 
		 A.Name + '('+CONVERT(VARCHAR(8),A.AppPluginsID)+')',
         CASE 
          WHEN A.PluginType=1 THEN 653
	      WHEN A.PluginType=2 THEN 468
	      WHEN A.PluginType=3 THEN 122
	      ELSE 471
         END,
		 CONVERT(VARCHAR(1024),[Description])
  FROM AppPlugins A WITH (NOLOCK)
 END


ELSE

IF @iType=2 --AppDialogs
 BEGIN
  INSERT INTO @Tmp (ObjectID,[Category],[Caption], [ImageIndex], [Description])
  SELECT AppDialogsID, 0, [Caption], 181, CONVERT(VARCHAR(1024),  [Description])
  FROM AppDialogs WITH (NOLOCK)
 END
ELSE

IF @iType=3 --AppDialogLayouts
 BEGIN
  INSERT INTO @Tmp (ObjectID,[Category],[Caption], [ImageIndex], [Description])
  SELECT AppDialogsLayoutID, 0, [Description], 313, 'AppDialogsID='+CONVERT(VARCHAR(8),AppDialogsID)
  FROM AppDialogsLayout WITH (NOLOCK)
 END
ELSE

IF @iType=18 --iTypeAppTemplates
 BEGIN
  INSERT INTO @Tmp (ObjectID,[Category],[Caption], [ImageIndex], [Description])
  SELECT AppTemplatesID, 0, [Name], 319, [Description]
  FROM AppTemplates WITH (NOLOCK)
 END
ELSE

IF @iType=26 --iTypeAppReport
 BEGIN
  INSERT INTO @Tmp (ObjectID,[Category],[Caption], [ImageIndex], [Description])
  SELECT R.AppReportsID, 0, [Caption], 481, R.[Description]
  FROM AppReports R WITH (NOLOCK)
 END

ELSE

BEGIN
   --resourcestring
 DECLARE @Message VARCHAR(100) = FORMATMESSAGE('[spui_AppObjectList] unknown iType: %d',@iType);
 THROW 51000,@Message, 1; 
 RETURN
END

  
SELECT    T1.*
FROM @Tmp T1
ORDER BY  T1.[Category]
END


GO


