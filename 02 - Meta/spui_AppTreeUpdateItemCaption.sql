CREATE OR ALTER PROCEDURE [dbo].[spui_AppTreeUpdateItemCaption]  @AppMainTreeId int, @Description varchar(80)
AS
BEGIN
 UPDATE AppMainTree 
 SET [Description]= @Description
 WHERE AppMainTreeId=@AppMainTreeId
END


GO


