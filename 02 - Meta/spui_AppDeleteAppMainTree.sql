CREATE OR ALTER PROCEDURE [dbo].[spui_AppDeleteAppMainTree] @AppMainTreeID int
AS
BEGIN
 DECLARE @IType int;

 SELECT @IType = iType
 FROM AppMainTree
 WHERE AppMainTreeID = @AppMainTreeID
 
 IF (@iType IN (6,8))  --iTypeCommonCommand=6  iTypeCommonFilter=8
  BEGIN
   DELETE AppPluginsCommonCmd
   WHERE AppMainTreeID=@AppMainTreeID
  END

 DELETE AppMainTree
 WHERE AppMainTreeID = @AppMainTreeID
END


GO


