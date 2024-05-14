CREATE OR ALTER PROCEDURE [dbo].[spui_AppMainTreeManager]
AS
BEGIN

SELECT 
       AppMainTreeID, 
	   ParentId, 
	   [Description] = CASE
	                    WHEN iType=17 THEN '*'+[Description]+' (file)' 
		                ELSE [Description]
				       END,
       ImageIndex    = CASE 
                        WHEN UseOnMainTree=1 THEN ImageIndex
                        ELSE 335
					   END, 
	   UseOnMainTree, 
	   iType, 
	   ObjectID, 
	   OrderID, 
	   CanExport, 
	   DBName
FROM   AppMainTree A WITH (NOLOCK)

END



GO


