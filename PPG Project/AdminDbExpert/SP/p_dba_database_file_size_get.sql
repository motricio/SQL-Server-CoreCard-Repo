USE [Admin]
GO
/****** Object:  StoredProcedure [dbo].[p_dba_database_file_size_get]    Script Date: 12/14/2023 7:01:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		MRR
-- Create date: 20231102
-- Description:	Table get [t_dba_database_file_size]
-- =============================================
ALTER PROCEDURE [dbo].[p_dba_database_file_size_get]
(
	@ServerName varchar(1000)=null,
	@DataBaseName varchar(1000)=NULL,
	@FileName varchar(2000)=null,
	@FileGroup varchar(2000)=null,
	@Physical_name varchar(2000)=null,
	@DateCaptureStart Datetime=null,
	@DateCaptureEnd Datetime=null
)
AS
BEGIN
SELECT [ServerName]
	  ,[DateCapture]
      ,[DataBaseName]
      ,[FileName]
      ,[FileGroup]
      ,[Physical_name]
      ,[CurrentSizeMB]
      ,[FreeSpaceMB]
      ,[UsageMB]
      ,[Max_size]
      ,[%FreeSpace]
      ,[RecommendedReSizeMB]
      ,[RecoveredDiskSpaceMB]
      ,[ScriptCompactDBFile]
  FROM [dbo].[t_dba_database_file_size]
  WHERE 
			([DataBaseName]= isnull(@DataBaseName,[DataBaseName]))
		AND	([ServerName]= isnull(@ServerName,[ServerName]))
		AND	([FileName]= isnull(@FileName,[FileName]))
		AND	([FileGroup] like isnull('%'+@FileGroup+'%',[FileGroup]))
		AND	([Physical_name] like isnull('%'+@Physical_name+'%',[Physical_name]))
		AND	([DateCapture] >= isnull(@DateCaptureStart,[DateCapture]))
		AND	([DateCapture] <= isnull(@DateCaptureEnd,[DateCapture]))
	order by 
	[DateCapture] asc
END
