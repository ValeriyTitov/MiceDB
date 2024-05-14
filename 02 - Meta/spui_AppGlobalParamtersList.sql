CREATE OR ALTER PROCEDURE [dbo].[spui_AppGlobalParamtersList] @AppGlobalParametersId int = NULL
AS
BEGIN
SELECT AppGlobalParametersId, 
       ParentId, 
	   ItemType, 
	   ParameterName, 
	   ParameterValue, 
	   ParameterDescription,
	   CASE
	    WHEN ItemType=0 THEN 253
		ELSE 416
	   END AS ImageIndex
FROM   AppGlobalParameters AS G WITH (NOLOCK)
WHERE  (AppGlobalParametersId=@AppGlobalParametersId OR @AppGlobalParametersId IS NULL) 
END    


GO


