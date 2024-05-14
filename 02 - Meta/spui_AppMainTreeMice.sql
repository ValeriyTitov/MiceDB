CREATE OR ALTER PROCEDURE [dbo].[spui_AppMainTreeMice]
AS
BEGIN

DECLARE @Tmp TABLE
(
 AppMainTreeId INT PRIMARY KEY,
 ParentId int
)

DECLARE @NonEmpty TABLE (AppMainTreeId int)

;WITH Rec AS 
 (
   SELECT a.AppMainTreeId, a.ParentId, a.UseOnMainTree
   FROM AppMainTree a WITH (NOLOCK)
   WHERE ParentId IS NULL AND iType IN (0,1) 

   UNION ALL 

   SELECT a.AppMainTreeId, a.ParentId, a.UseOnMainTree
   FROM Rec r 
   INNER JOIN AppMainTree a WITH (NOLOCK) ON r.AppMainTreeID=a.ParentId AND r.UseOnMainTree=1  AND iType IN (0,1)
   --Сюда надо будет добавить права юзеров
 )
 
INSERT INTO @Tmp
SELECT AppMainTreeId, ParentId
FROM Rec


;WITH Rec2 AS 
 (
   SELECT a.AppMainTreeID, a.ParentId
   FROM AppMainTree a 
   WHERE iType=1 AND a.UseOnMainTree=1

   UNION ALL 

   SELECT a.AppMainTreeID, a.ParentId
   FROM Rec2 r 
   INNER JOIN AppMainTree a WITH (NOLOCK) ON r.ParentId=a.AppMainTreeID AND iType IN ( 0,1) AND a.UseOnMainTree=1
 )

INSERT INTO @NonEmpty
SELECT AppMainTreeID 
FROM Rec2 --Ищем всё то, что последнем дочернем элементе имеет плагин


DELETE @Tmp --Удаляем всё дерево фолдеров, у которых в конце нету Плагина
WHERE AppMainTreeID NOT IN
( 
  SELECT AppMainTreeID
  FROM @NonEmpty
)  

SELECT 
       a.AppMainTreeId, 
	   a.ParentId, 
	   a.[Description],
	   a.ImageIndex,
	   a.UseOnMainTree, 
	   a.iType, 
	   a.ObjectID, 
	   a.OrderID, 
	   a.DBName,
       p.AppPluginsID,
	   p.PluginType

FROM   @Tmp t
INNER JOIN AppMainTree a WITH (NOLOCK) ON a.AppMainTreeId=t.AppMainTreeId
LEFT JOIN AppPlugins p WITH (NOLOCK) ON (a.ObjectID = p.AppPluginsID) AND (iType=1)
END


GO


