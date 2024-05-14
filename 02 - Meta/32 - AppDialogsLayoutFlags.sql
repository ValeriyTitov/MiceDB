/*

Meta SQL Script for Mice 6 
This is used to create Meta(Main) part of Mice 6
Titov Valeriy, 2022

Мета скрипт для Майс 6
Используется для создания основной Мета-части Майс 6
Титов Валерий, 2022

https://github.com/ValeriyTitov/MiceDB

*/

CREATE TABLE [dbo].[AppDialogsLayoutFlags]
(
	[AppDialogsLayoutFlagsId] [int] NOT NULL PRIMARY KEY,
	[AppDialogsLayoutId] [int] NOT NULL FOREIGN KEY (AppDialogsLayoutId) REFERENCES AppDialogsLayout(AppDialogsLayoutId) INDEX idx_AppDialogsLayoutId,
	[Name] [varchar](64) NOT NULL,
	[FieldName] [varchar](64) NOT NULL,
	[Equation] [int] NOT NULL,
	[ComparationValue] [varchar](255) NULL,
	[ItemName] [varchar](80) NOT NULL,
	[FlagType] [int] NOT NULL,
	[InitString] [varchar](MAX)
)

GO


