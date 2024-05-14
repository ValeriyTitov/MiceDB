CREATE OR ALTER PROCEDURE [dbo].[spui_AppDeleteObject] @ObjectId int, @iType int
AS
BEGIN
 SET NOCOUNT ON
/*
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

*/
 IF (@iType = 1 )  --iTypePlugin = 1
  BEGIN
   DELETE AppPlugins
   WHERE AppPluginsId = @ObjectId
  END
ELSE

 IF (@iType = 2)   --iTypeDialog=2
  BEGIN
   DELETE AppDialogs
   WHERE AppDialogsId = @ObjectId
  END
ELSE

 IF (@iType = 3)   --iTypeAppDialogLayout=3
  BEGIN
   DELETE AppDialogsLayout
   WHERE AppDialogsLayoutId = @ObjectId
  END
ELSE 
 
 IF (@iType IN (6,8))  --iTypeCommonCommand=6  iTypeCommonFilter=8
  BEGIN
   --Cannot delete AppCommonCmd from here.
   --AppCommonCmd нельзя здесь удалять.
   --Общие команды имееют одинаковый AppCmdID, и удаляя по @ObjectId он удаляется для всех плагинов.
   --AppCommonCmd удаяется через spui_AppDeleteAppMainTree по AppMainTreeID
   RETURN
  END
ELSE
 
 IF (@iType IN (7,9))  --iTypeCommand=7  iTypeFilter=9
  BEGIN
   DELETE AppCmd
   WHERE AppCmdId = @ObjectId
  END
ELSE
 
IF (@iType IN (11,12,13, 14,15))--iTypeSQLScript=11, iTypePascalScript = 12, iTypeCSharpScript = 13,   iTypeJsonText= 14,  iTypeXMLText = 15;
  BEGIN
   DELETE AppScripts
   WHERE AppScriptsId = @ObjectId
  END
ELSE


 IF (@iType IN (17)) --iTypeExternalFile    = 17;
  BEGIN
   DELETE AppBinaryFiles
   WHERE AppBinaryFilesId = @ObjectId
  END
ELSE


 IF (@iType IN (16)) -- iTypeDataSet  = 16;
  BEGIN
   DELETE AppDataSets
   WHERE AppDataSetsId = @ObjectId
  END
ELSE

 IF (@iType IN (18)) --iTypeExportTemplate  = 18;
  BEGIN
   DELETE AppTemplates
   WHERE AppTemplatesId = @ObjectId
  END
ELSE
   
  BEGIN
    DECLARE @Message VARCHAR(MAX) = FORMATMESSAGE('[spui_AppDeleteObject] cannot delete an AppObject with iType: %d', @iType);
    THROW 51000,@Message, 1;  
    RETURN
 END
END


GO


