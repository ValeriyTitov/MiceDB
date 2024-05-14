/*

Meta SQL Script for Mice 6 
This is used to create Meta(Main) part of Mice 6
Titov Valeriy, 2022

Мета скрипт для Майс 6
Используется для создания основной Мета-части Майс 6
Титов Валерий, 2022

https://github.com/ValeriyTitov/MiceDB

*/

CREATE TABLE [dbo].[AppDialogDetailTables]
(
	[AppDialogDetailTablesId] [int] NOT NULL PRIMARY KEY,
	[AppDialogsId] [int] NOT NULL FOREIGN KEY (AppDialogsId) REFERENCES AppDialogs(AppDialogsId) ON DELETE CASCADE INDEX idx_AppDialogsId,
	[TableName] [varchar](32) NOT NULL,
	[ProviderPattern] [varchar](512) NULL,
	[DBName] [varchar](16) NULL,
	[ReadOnly] [bit] NULL,
	[Description] [varchar](80) NULL,
	[SequenceName] [varchar](80) NULL,
	[SequenceDBName] [varchar](32) NULL
)

GO


