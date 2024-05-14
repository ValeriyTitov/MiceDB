CREATE OR ALTER PROCEDURE [dbo].[spui_AppTreeUpdateItemImageIndex]  @AppMainTreeId int, @ImageIndex int
AS
BEGIN
 SET NOCOUNT ON

 DECLARE @iType int, @ObjectId int;
 
 SELECT @iType=iType,
        @ObjectID=ObjectID
 FROM AppMainTree WITH (NOLOCK)
 WHERE AppMainTreeId=@AppMainTreeId

 UPDATE AppMainTree 
 SET ImageIndex=@ImageIndex
 WHERE AppMainTreeId=@AppMainTreeId

 IF @iType IN (6,7,8,9) --AppCmd
 BEGIN
  UPDATE AppCmd
  SET ImageIndex=@ImageIndex
  WHERE AppCmdID=@ObjectId
 END
  
END


GO


