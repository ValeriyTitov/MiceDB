/*

Meta SQL Script for Mice 6 
This is used to create Meta(Main) part of Mice 6
Titov Valeriy, 2022

Мета скрипт для Майс 6
Используется для создания основной Мета-части Майс 6
Титов Валерий, 2022

https://github.com/ValeriyTitov/MiceDB

*/


CREATE TABLE [dbo].[AppDialogs]
(
	[AppDialogsId] [int] NOT NULL PRIMARY KEY,
	[Description] [varchar](MAX) NULL,
	[Caption] [varchar](80) NULL,
	[AppScriptsId] [int] NULL FOREIGN KEY (AppScriptsId) REFERENCES AppScripts(AppScriptsId),
	[TableName] [varchar](256) NOT NULL,
	[KeyField] [varchar](64) NOT NULL,
	[CheckSPName] [varchar](32) NULL,
	[UpdateSPName] [varchar](32) NULL,
	[RefreshPlugin] [bit] NULL,
	[DBName] [varchar](32) NULL,
	[SequenceName] [varchar](128) NULL,
	[SequenceDBName] [varchar](32) NULL,
	[InitString] [varchar](MAX) NULL,
)

GO

ALTER TABLE [dbo].[AppDialogs] ADD  DEFAULT ((1)) FOR [RefreshPlugin]


GO


