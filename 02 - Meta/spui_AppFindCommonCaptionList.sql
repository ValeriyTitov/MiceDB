CREATE OR ALTER PROCEDURE [dbo].[spui_AppFindCommonCaptionList] @DataField varchar(80)
AS
BEGIN
SET NOCOUNT ON

DECLARE @Tmp TABLE
(
	[ID] [int] IDENTITY,
	[ColType] [smallint] NOT NULL DEFAULT (0),
	[Caption] [varchar](256) NOT NULL,
	[Visible] [bit] NOT NULL DEFAULT (1),
	[Width] [smallint] NOT NULL DEFAULT (100),
	[Sizing] [bit] NOT NULL DEFAULT (1),
	[Filter] [bit] NOT NULL DEFAULT (0),
	[CountOf] int
)

INSERT INTO @Tmp (ColType,   Caption, Visible,     Width,   Sizing,   Filter, CountOf)
 SELECT TOP 5           0, a.Caption, 1,           100,        1,        1, COUNT(1)
 FROM AppColumns a WITH (NOLOCK)
 WHERE (FieldName=@DataField)
 GROUP BY a.Caption
 
INSERT INTO @Tmp (ColType,   Caption, Visible,      Width, Sizing, Filter, CountOf)
 SELECT TOP 5           0, a.Caption,       1,      100,      1,      1, COUNT(1)
 FROM AppDialogControls a WITH (NOLOCK)
 LEFT JOIN @Tmp t ON a.Caption=t.Caption --Исключить совпадающие по именам
 WHERE DataField=@DataField AND t.ID IS NULL
 GROUP BY a.Caption

UPDATE @Tmp 
SET ColType=a.ColType,
	Width=a.Width,
	Sizing=a.Sizing,
	[Filter]=a.[Filter]

FROM ( SELECT TOP 5 a.Caption as ACaption, a.ColType, a.Width, a.Sizing, a.Filter
       FROM @Tmp t
       INNER JOIN AppColumns a WITH (NOLOCK) ON a.Caption=t.Caption) as a
WHERE Caption=ACaption
 
SELECT *
FROM @Tmp 
ORDER BY CountOf DESC

END

GO



