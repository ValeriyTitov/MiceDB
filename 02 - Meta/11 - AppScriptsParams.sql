/*

Meta SQL Script for Mice 6 
This is used to create Meta(Main) part of Mice 6
Titov Valeriy, 2022

Мета скрипт для Майс 6
Используется для создания основной Мета-части Майс 6
Титов Валерий, 2022

https://github.com/ValeriyTitov/MiceDB

*/

CREATE TABLE [dbo].[AppScriptsParams]
(
	[AppScriptsParamsId] [int] NOT NULL PRIMARY KEY,
	[AppScriptsId] [int] NOT NULL FOREIGN KEY (AppScriptsId) REFERENCES AppScripts(AppScriptsId) ON DELETE CASCADE INDEX idx_AppScriptsId,
	[Name] [varchar](64) NOT NULL,
	[Value] [varchar](255) NULL
)

GO


