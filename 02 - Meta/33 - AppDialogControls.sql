/*

Meta SQL Script for Mice 6 
This is used to create Meta(Main) part of Mice 6
Titov Valeriy, 2022

Мета скрипт для Майс 6
Используется для создания основной Мета-части Майс 6
Титов Валерий, 2022

https://github.com/ValeriyTitov/MiceDB

*/

CREATE TABLE [dbo].[AppDialogControls]
(
	[AppDialogControlsId] [int] NOT NULL PRIMARY KEY,
	[AppDialogsId] [int] NOT NULL FOREIGN KEY (AppDialogsId) REFERENCES AppDialogs(AppDialogsId) ON DELETE CASCADE INDEX idx_AppDialogsId,
	[ClassName] [varchar](80) NOT NULL,
	[ControlName] [varchar](80) NULL,
	[DataField] [varchar](80) NULL INDEX idx_DataField,
	[Caption] [varchar](80) NULL,
	[DBName] [varchar](32) NULL,
	[DefaultValue] [varchar](80) NULL,
	[InitString] [varchar](max) NULL,
	[IsReadOnly] [bit] NOT NULL
)


GO


