CREATE OR ALTER PROCEDURE [dbo].[spui_AppCommonCommandsList]
AS
BEGIN
 SELECT AppCmdID, 
        CommandType, 
		ActionType, 
		PluginMethod, 
		Name, 
		Location, 
		Caption, 
		ImageIndex,
		Active,
		iType

FROM    AppCmd AS a WITH (NOLOCK)
WHERE   iType IN (6,8)
END

GO


