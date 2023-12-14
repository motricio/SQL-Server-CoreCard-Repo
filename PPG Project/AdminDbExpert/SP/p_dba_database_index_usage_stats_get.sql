USE [Admin]
GO

/****** Object:  StoredProcedure [dbo].[p_dba_database_index_usage_stats_get]    Script Date: 12/14/2023 6:41:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		MRR
-- Create date: 20231102
-- Description:	Table get [t_dba_database_index_usage_stats]
-- =============================================
CREATE PROCEDURE [dbo].[p_dba_database_index_usage_stats_get]
(
	@ServerName varchar(1000)=null,
	@DataBaseName varchar(1000)=NULL,
	@TableName varchar(2000)=null,
	@IndexName varchar(2000)=null,
	@DateCaptureStart Datetime=null,
	@DateCaptureEnd Datetime=null
)
AS
BEGIN
SELECT [ServerName]
      ,[DataBaseName]
      ,[TableName]
      ,[IndexName]
      ,[UserSeeks]
      ,[USerScans]
      ,[UserLookups]
      ,[UserUpdates]
      ,[DateCapture]
  FROM [dbo].[t_dba_database_index_usage_stats]
  WHERE 
			([DataBaseName]= isnull(@DataBaseName,[DataBaseName]))
		AND	([ServerName]= isnull(@ServerName,[ServerName]))
		AND	([TableName] like isnull('%'+@TableName+'%',[TableName]))
		AND	([IndexName] like isnull('%'+@IndexName+'%',[IndexName]))
		AND	([DateCapture] >= isnull(@DateCaptureStart,[DateCapture]))
		AND	([DateCapture] <= isnull(@DateCaptureEnd,[DateCapture]))
END
GO
