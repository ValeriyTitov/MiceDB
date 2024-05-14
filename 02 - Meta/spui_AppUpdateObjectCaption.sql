CREATE OR ALTER PROCEDURE [dbo].[spui_AppUpdateObjectCaption]  @iType int, @ObjectId int, @Caption varchar(80)
AS
BEGIN
IF @iType=1 --Plugin
 BEGIN
  UPDATE AppPlugins 
  SET Name=@Caption
  WHERE AppPluginsId=@ObjectId
 END 
 
 ELSE

IF @iType=2 --AppDialog
 BEGIN
  UPDATE AppDialogs
  SET Caption = @Caption
  WHERE AppDialogsId=@ObjectId
 END 
 
 ELSE

IF @iType=3 --AppDialogsLayout
 BEGIN
  UPDATE AppDialogsLayout
  SET [Description]=@Caption
  WHERE AppDialogsLayoutId=@ObjectId
 END 
 
 ELSE

 IF @iType=7 --AppCmd
 BEGIN
  UPDATE AppCmd
  SET [Caption]=@Caption
  WHERE AppCmdId=@ObjectId
 END 
 
 ELSE

IF @iType IN (8,9) --Filter, command
 BEGIN
  UPDATE AppCmd
  SET Caption=@Caption
  WHERE AppCmdId=@ObjectId
 END 
 
 ELSE

 IF @iType IN (11,12,13,14,15) --Scripts
 BEGIN
  UPDATE AppScripts
  SET [Name]=@Caption
  WHERE AppScriptsId=@ObjectId
 END 
 
 ELSE
 
 IF @iType = (17)
 BEGIN
  UPDATE AppBinaryFiles
  SET [FileName]=@Caption
  WHERE AppBinaryFilesId=@ObjectId
 END 
 
 ELSE

 BEGIN
    DECLARE @iTypeStr VARCHAR(80);
	SET @iTypeStr = FORMATMESSAGE('[spui_UpdateAppObjectCaption] cannot rename AppObject with iType: %d' , @iType);
	
	THROW 51000,@iTypeStr, 1;
	RETURN
 END
END


GO


