CREATE OR ALTER PROCEDURE [dbo].[spui_dfStartingFolderList] @dfClassesId int, @AllowDeskTop bit
AS
BEGIN
 /*
  iTypeDFClass         = 19;
  iTypeDfType          = 20;
  iTypeDFScheme        = 21;
  iTypeDFMethod        = 22;
  iTypeDFPathFolder    = 23;
 
 */
 DECLARE @Result TABLE (Id INT PRIMARY KEY IDENTITY, 
                        ParentId int, 
						Caption VARCHAR(255), 
						ImageIndex int, 
						UserDescription VARCHAR(255), 
						ObjectId int, 
						iType int,
						AppDialogsLayoutId int )

 DECLARE @FolderTypeStartEvent int = 6;

 INSERT INTO @Result
 SELECT NULL,c.Caption, 253, NULL, c.dfClassesId, 19, NULL
 FROM dfClasses c WITH (NOLOCK)
 WHERE c.dfClassesId=@dfClassesId

 INSERT INTO @Result
 SELECT r.ID, d.Caption, 253, NULL, dfTypesId, 20, NULL
 FROM dfTypes d WITH (NOLOCK)
 INNER JOIN @Result r ON r.ObjectId=d.dfClassesId AND r.iType=19
 WHERE (d.CanAddFromDesktop=@AllowDeskTop OR @AllowDeskTop IS NULL)


 INSERT INTO @Result
 SELECT  r.Id , p.Caption, ISNULL(p.ImageIndex,0), p.UserInformation, p.dfPathFoldersId, 23, p.AppDialogsLayoutIdEdit
 FROM dfPathFolders p WITH (NOLOCK)
 INNER JOIN @Result r ON r.ObjectId=p.dfTypesId AND r.iType=20
 WHERE p.FolderType=@FolderTypeStartEvent
 AND (p.AllowDesktop=@AllowDeskTop OR @AllowDeskTop IS NULL)

 DELETE @Result  --Удалить все типы, у которых нет стартового фолдера
 WHERE iType=20 AND Id NOT IN 
   (
    SELECT r1.ParentId
    FROM @Result r1
	INNER JOIN @Result r2 ON r1.ParentId=r2.Id
	WHERE r1.iType=23
   )
              

 SELECT *
 FROM @Result

END




GO


