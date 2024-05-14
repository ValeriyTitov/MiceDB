/*

Meta SQL Script for Mice 6 
This is used to create Meta(Main) part of Mice 6
Titov Valeriy, 2022

Мета скрипт для Майс 6
Используется для создания основной Мета-части Майс 6
Титов Валерий, 2022

https://github.com/ValeriyTitov/MiceDB

*/

CREATE TABLE [dbo].[AppMainTree]
(
	[AppMainTreeId] [int] NOT NULL PRIMARY KEY,
	[ParentId] [int] NULL FOREIGN KEY (ParentId) REFERENCES AppMainTree(AppMainTreeId),
	[Description] [varchar](80) NULL,
	[ImageIndex] [int] NULL,
	[UseOnMainTree] [bit] NOT NULL,
	[iType] [int] NULL,
	[ObjectId] [int] NULL,
	[OrderId] [int] NULL,
	[CanExport] [bit] NOT NULL,
	[DBName] [varchar](16) NULL
)

GO

CREATE INDEX idx_iTypeObjectId
ON AppMainTree (iType, ObjectId);

GO

ALTER TABLE [dbo].[AppMainTree] ADD  DEFAULT ((1)) FOR [UseOnMainTree]
GO

ALTER TABLE [dbo].[AppMainTree] ADD  DEFAULT ((0)) FOR [iType]
GO

ALTER TABLE [dbo].[AppMainTree] ADD  DEFAULT ((1)) FOR [CanExport]
GO



