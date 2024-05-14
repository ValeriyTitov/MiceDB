CREATE OR ALTER PROCEDURE [dbo].[spui_AppTreeInsertItem] @AppMainTreeId int, @Description varchar(80),  @ParentId int,  @iType int,  @ObjectId int,  @ImageIndex int, @DBName varchar(32)
AS
BEGIN
 IF (@iType=10) AND EXISTS (SELECT 1 
                            FROM AppMainTree 
							WHERE ObjectID=@ObjectID AND iType=10 AND ParentId=@ParentId)
  BEGIN
   SELECT AppMainTreeId 
   FROM AppMainTree 
   WHERE ObjectID=@ObjectId AND iType=10 AND ParentId=@ParentId
  END
  
  ELSE
  
  BEGIN
   INSERT INTO AppMainTree (AppMainTreeId, [Description], ParentId, iType, ObjectId, ImageIndex, DBName)
   VALUES (@AppMainTreeId, @Description, @ParentId, @iType, @ObjectID, @ImageIndex, @DBName)
   SELECT @AppMainTreeId as AppMainTreeId
  END
END


GO


