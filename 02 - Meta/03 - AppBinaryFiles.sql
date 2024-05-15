/*

Meta SQL Script for Mice 6 
This is used to create Meta(Main) part of Mice 6
Titov Valeriy, 2022

Мета скрипт для Майс 6
Используется для создания основной Мета-части Майс 6
Титов Валерий, 2022

https://github.com/ValeriyTitov/MiceDB

*/

CREATE TABLE [dbo].[AppBinaryFiles]
(
	[AppBinaryFilesId] [int] NOT NULL PRIMARY KEY,
	[AData] [varbinary](max) NULL,
	[FileName] [varchar](64) NULL,
	[Description] [varchar](80) NULL,
	[CreateDate] [datetime] NULL,
	[CreateUser] [varchar](80)
)

GO


