DECLARE @StartDate  date = '19900101', @EndDate date = '20991231'

DECLARE @Tmp TABLE (TheDate DATE PRIMARY KEY, IsHoliday bit NOT NULL, IsTradingDay BIT NOT NULL, TheWeekDay INT, TheWeekDayStr VARCHAR(32),  Comment VARCHAR(255))
DECLARE @Holidays TABLE (AMonth int, ADay int, Comment VARCHAR(255), IsHoliday bit)


INSERT INTO @Holidays VALUES (1,1,'Новогоние праздники', 1);
INSERT INTO @Holidays VALUES (1,2,'Новогоние праздники', 1);
INSERT INTO @Holidays VALUES (1,3,'Новогоние праздники', 1);
INSERT INTO @Holidays VALUES (1,4,'Новогоние праздники', 1);
INSERT INTO @Holidays VALUES (1,5,'Новогоние праздники', 1);
INSERT INTO @Holidays VALUES (1,6,'Новогоние праздники', 1);
INSERT INTO @Holidays VALUES (1,7,'Рождество', 1);
INSERT INTO @Holidays VALUES (2,23,'День защитников отечества', 1);
INSERT INTO @Holidays VALUES (2,29,'Весокосный день', 0);
INSERT INTO @Holidays VALUES (3,8,'Международный женский день', 1);
INSERT INTO @Holidays VALUES (5,1,'Первое Мая - День труда',1);
INSERT INTO @Holidays VALUES (5,9,'День победы над фашизмом',1);
INSERT INTO @Holidays VALUES (6,12,'День России',1);
INSERT INTO @Holidays VALUES (11,4,'День народного единства',1);
INSERT INTO @Holidays VALUES (11,7,'День Великой Октябрьской Социалистической Революции',0);
INSERT INTO @Holidays VALUES (12,31,'Новый год',0);


SET DATEFIRST 1;  

;WITH Rec(Depth) AS 
(
  SELECT 0 
  UNION ALL 
  SELECT Depth + 1 FROM Rec
  WHERE Depth < DATEDIFF(DAY, @StartDate, @EndDate)
),

Rec2(TheDate) AS 
(
  SELECT DATEADD(DAY, Depth, @StartDate) 
  FROM Rec
)

INSERT INTO @Tmp (TheDate, IsHoliday, IsTradingDay)
SELECT TheDate, 0, 1
FROM Rec2
ORDER BY TheDate
OPTION (MAXRECURSION 0);


UPDATE @Tmp
SET  TheWeekDay=DATEPART(WEEKDAY, TheDate)
    ,TheWeekDayStr = FORMAT(TheDate, 'dddd', 'ru-RU') --Comment ?


UPDATE @Tmp
SET IsHoliday = 1,
    IsTradingDay = 0
WHERE TheWeekDay IN (6,7)


UPDATE @Tmp
SET IsHoliday=1
FROM @Holidays H
WHERE (DATEPART(MONTH,[@Tmp].TheDate) = H.AMonth) AND (DATEPART(DAY,[@Tmp].TheDate)=H.ADay) AND H.IsHoliday=1


UPDATE @Tmp
SET Comment=H.Comment
FROM @Holidays H
WHERE (DATEPART(MONTH,[@Tmp].TheDate) = H.AMonth) AND (DATEPART(DAY,[@Tmp].TheDate)=H.ADay)

SELECT *
FROM @Tmp
ORDER BY TheDate
