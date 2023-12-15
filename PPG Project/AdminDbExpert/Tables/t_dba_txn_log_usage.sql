USE [Admin]
GO

/****** Object:  Table [dbo].[t_dba_txn_log_usage]    Script Date: 12/15/2023 8:11:52 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t_dba_txn_log_usage](
	[DataBaseName] [varchar](200) NULL,
	[Log Size(MB)] [decimal](32, 6) NULL,
	[Log Space used(%)] [decimal](32, 6) NULL,
	[Status] [varchar](5) NULL,
	[log_reuse_wait_desc] [nvarchar](60) NULL,
	[recovery_model_desc] [nvarchar](60) NULL,
	[DateCapture] [datetime] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[t_dba_txn_log_usage] ADD  DEFAULT (getdate()) FOR [DateCapture]
GO

