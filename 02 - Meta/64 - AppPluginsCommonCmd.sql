/*

Meta SQL Script for Mice 6 
This is used to create Meta(Main) part of Mice 6
Titov Valeriy, 2022

Мета скрипт для Майс 6
Используется для создания основной Мета-части Майс 6
Титов Валерий, 2022

https://github.com/ValeriyTitov/MiceDB

*/


CREATE TABLE [dbo].[AppPluginsCommonCmd]
(
	[AppPluginsCommonCmdId] [int] NOT NULL PRIMARY KEY,
	[AppPluginsId] [int] NOT NULL FOREIGN KEY (AppPluginsId) REFERENCES AppPlugins(AppPluginsId) ON DELETE CASCADE INDEX idx_AppPluginsId,
	[AppCmdId] [int] NOT NULL FOREIGN KEY (AppCmdId) REFERENCES AppCmd(AppCmdId) INDEX idx_AppCmdId,
	[OrderID] [int] NOT NULL,
	[FullPerm] [bit] NOT NULL,
	[AppMainTreeId] [int] NOT NULL UNIQUE FOREIGN KEY (AppMainTreeId) REFERENCES AppMainTree(AppMainTreeId),
)


GO


