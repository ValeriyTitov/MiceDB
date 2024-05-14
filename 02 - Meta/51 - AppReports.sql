/*

Meta SQL Script for Mice 6 
This is used to create Meta(Main) part of Mice 6
Titov Valeriy, 2022

Мета скрипт для Майс 6
Используется для создания основной Мета-части Майс 6
Титов Валерий, 2022

https://github.com/ValeriyTitov/MiceDB

*/

CREATE TABLE [dbo].[AppReports]
(
	[AppReportsId] [int] NOT NULL PRIMARY KEY,
	[Caption] [varchar](80) NOT NULL,
	[Description] [varchar](MAX) NULL,
	[Active] [bit] NOT NULL,
	[ReportData] [varbinary](max) NULL,
	[CreateDate] [datetime] NULL
)
GO


