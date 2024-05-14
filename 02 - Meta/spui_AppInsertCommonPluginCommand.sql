CREATE OR ALTER PROCEDURE [dbo].[spui_AppInsertCommonPluginCommand] @AppPluginsCommonCmdId int, @AppPluginsId int, @AppCmdId int, @OrderId int, @AppMainTreeId int
AS
BEGIN
 INSERT INTO AppPluginsCommonCmd (AppPluginsCommonCmdId,   AppPluginsID,  AppCmdID,  FullPerm, OrderID, AppMainTreeID)
 VALUES                          (@AppPluginsCommonCmdId, @AppPluginsID, @AppCmdID, 1,        @OrderID, @AppMainTreeID)
 
 SELECT @AppPluginsCommonCmdId as AppPluginsCommonCmdId
END


GO


