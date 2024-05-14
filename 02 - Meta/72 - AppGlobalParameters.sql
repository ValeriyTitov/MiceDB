/*

Meta SQL Script for Mice 6 
This is used to create Meta(Main) part of Mice 6
Titov Valeriy, 2022

Мета скрипт для Майс 6
Используется для создания основной Мета-части Майс 6
Титов Валерий, 2022

https://github.com/ValeriyTitov/MiceDB

*/

CREATE TABLE [dbo].[AppGlobalParameters]
(
	[AppGlobalParametersId] [int] NOT NULL PRIMARY KEY,
	[ParentId] [int] NULL,
	[ItemType] [int] NOT NULL,
	[ParameterName] [varchar](80) NOT NULL,
	[ParameterValue] [varchar](80) NULL,
	[ParameterDescription] [varchar](1024) NULL
)
GO


