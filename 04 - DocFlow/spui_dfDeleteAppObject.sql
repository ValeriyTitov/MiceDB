CREATE OR ALTER PROCEDURE [dbo].[spui_dfDeleteAppObject] @ObjectId int, @iType int
AS
BEGIN
 SET NOCOUNT ON
/*
  iTypeDFClass         = 19;
  iTypeDfType          = 20;
  iTypeDFScheme        = 21;
*/
 
 IF (@iType IN (19)) 
  BEGIN
   DELETE dfClasses
   WHERE dfClassesId = @ObjectId
  END
  ELSE
  IF (@iType IN (20)) 
  BEGIN
   DELETE dfTypes
   WHERE dfTypesId = @ObjectId
  END

 ELSE

  BEGIN
    DECLARE @Message VARCHAR(MAX) = FORMATMESSAGE('[spui_dfDeleteAppObject] cannot delete Doc flow object with iType: %d', @iType);
    THROW 51000,@Message, 1;  
    RETURN
 END
END


GO


