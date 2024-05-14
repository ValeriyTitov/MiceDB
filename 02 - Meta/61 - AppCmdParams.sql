/*

Meta SQL Script for Mice 6 
This is used to create Meta(Main) part of Mice 6
Titov Valeriy, 2022

Мета скрипт для Майс 6
Используется для создания основной Мета-части Майс 6
Титов Валерий, 2022

https://github.com/ValeriyTitov/MiceDB

*/

CREATE TABLE [dbo].[AppCmdParams]
(
	[AppCmdParamsId] [int] NOT NULL PRIMARY KEY,
	[AppCmdId] [int] NOT NULL FOREIGN KEY (AppCmdId) REFERENCES AppCmd(AppCmdId) ON DELETE CASCADE INDEX idx_AppCmdId,
	[Name] [varchar](32) NOT NULL,
	[ParamType] [smallint] NOT NULL,
	[Value] [varchar](255) NOT NULL
)

GO


ALTER TABLE [dbo].[AppCmdParams] ADD  DEFAULT ((0)) FOR [ParamType]
GO


