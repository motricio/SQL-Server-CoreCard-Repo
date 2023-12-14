USE [Admin]
GO

/****** Object:  Table [dbo].[t_dba_show_active_sessions_resource_usage]    Script Date: 12/14/2023 7:40:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[t_dba_show_active_sessions_resource_usage](
	[SessionID] [smallint] NOT NULL,
	[DatabaseName] [sysname] NULL,
	[LoginName] [nvarchar](128) NOT NULL,
	[HostName] [nvarchar](128) NULL,
	[ProgramName] [nvarchar](128) NULL,
	[status] [nvarchar](30) NOT NULL,
	[transaction_isolation_level] [varchar](14) NULL,
	[exec_time] [datetime] NOT NULL,
	[login_time] [datetime] NOT NULL,
	[last_request_start_time] [datetime] NOT NULL,
	[BlockedBySessionID] [smallint] NULL,
	[GrantedQueryMemoryKB] [int] NULL,
	[Cpu_Score] [bigint] NULL,
	[WaitType] [nvarchar](60) NULL,
	[Reads] [bigint] NOT NULL,
	[Writes] [bigint] NOT NULL,
	[LogicalReads] [bigint] NOT NULL,
	[PendingIOCount] [int] NULL,
	[RowCount] [bigint] NOT NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[t_dba_show_active_sessions_resource_usage] ADD  DEFAULT (getdate()) FOR [exec_time]
GO

