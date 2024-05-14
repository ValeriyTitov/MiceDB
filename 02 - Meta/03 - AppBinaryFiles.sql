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


