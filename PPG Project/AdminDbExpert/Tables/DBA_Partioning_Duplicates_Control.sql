USE [Admin]
GO

/****** Object:  Table [dbo].[DBA_Partioning_Duplicates_Control]    Script Date: 12/14/2023 6:51:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DBA_Partioning_Duplicates_Control](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TranId] [decimal](19, 0) NOT NULL,
	[table] [varchar](100) NOT NULL
) ON [PRIMARY]
GO

