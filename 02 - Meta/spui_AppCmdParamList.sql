CREATE OR ALTER PROCEDURE [dbo].[spui_AppCmdParamList] @AppCmdID int
AS
BEGIN
 SELECT *
 FROM   AppCmdParams a WITH (NOLOCK)
 WHERE  AppCmdID = @AppCmdID
END


GO


