DECLARE @Tmp TABLE (Id INT IDENTITY PRIMARY KEY, AMonth VARCHAR(32), Amount INT)

INSERT INTO @Tmp VALUES ('Январь', 100);
INSERT INTO @Tmp VALUES ('Январь', 200);
INSERT INTO @Tmp VALUES ('Январь', 300);
INSERT INTO @Tmp VALUES ('Январь', 500);
INSERT INTO @Tmp VALUES ('Февраль', 10);
INSERT INTO @Tmp VALUES ('Февраль', 30);
INSERT INTO @Tmp VALUES ('Февраль', 60);
INSERT INTO @Tmp VALUES ('Февраль', 100);
INSERT INTO @Tmp VALUES ('Март', 10);
INSERT INTO @Tmp VALUES ('Март', 122);
INSERT INTO @Tmp VALUES ('Март', 472);
INSERT INTO @Tmp VALUES ('Март', 841);

SELECT *, SUM(Amount) OVER (PARTITION BY AMonth
                            ORDER BY Id
							ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
							)
FROM @Tmp
ORDER BY Id