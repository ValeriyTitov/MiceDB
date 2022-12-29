CREATE OR ALTER PROCEDURE [dbo].[spds_DataScriptPublish] @ScriptName VARCHAR(80), @ScriptText VARCHAR(MAX)
AS
BEGIN
 --resourcestring
 DECLARE @Message VARCHAR(MAX) = FORMATMESSAGE('Cannot run script %s directly from SQL server', @ScriptName);
 THROW 51000,@Message, 1;  
 RETURN
END


GO


