/*

Meta SQL Script for Mice 6 
This is used to create Meta(Main) part of Mice 6
Titov Valeriy, 2022

Мета скрипт для Майс 6
Используется для создания основной Мета-части Майс 6
Титов Валерий, 2022

https://github.com/ValeriyTitov/MiceDB

*/


CREATE TABLE [dbo].[AppScripts]
(
	[AppScriptsId] [int] NOT NULL PRIMARY KEY,
	[Name] [varchar](80) NULL,
	[Description] [varchar](1024) NULL,
	[Script] [varchar](MAX) NULL,
	[ADate] [datetime] NULL,
	[UserName] [varchar](32) NULL,
	[Syntax] [varchar](8) NULL, --C#, Pascal, SQL...
	[DBName] [varchar](16) NULL
)


GO


CREATE UNIQUE INDEX uidx_NameSyntax
ON AppScripts ([Name],Syntax)
WHERE Syntax='c#'

GO


